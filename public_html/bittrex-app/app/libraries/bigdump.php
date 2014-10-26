<?php
error_reporting(E_ALL);
// BigDump ver. 0.35b from 2012-12-26
// Staggered import of an large MySQL Dump (like phpMyAdmin 2.x Dump)
// Even through the webservers with hard runtime limit and those in safe mode
// Works fine with Internet Explorer 7.0 and Firefox 2.x

// Author:       Alexey Ozerov (alexey at ozerov dot de) 
//               AJAX & CSV functionalities: Krzysiek Herod (kr81uni at wp dot pl) 
// Copyright:    GPL (C) 2003-2013
// More Infos:   http://www.ozerov.de/bigdump

// This program is free software; you can redistribute it and/or modify it under the
// terms of the GNU General Public License as published by the Free Software Foundation;
// either version 2 of the License, or (at your option) any later version.

// THIS SCRIPT IS PROVIDED AS IS, WITHOUT ANY WARRANTY OR GUARANTEE OF ANY KIND

// USAGE

// 1. Adjust the database configuration and charset in this file
// 2. Remove the old tables on the target database if your dump doesn't contain "DROP TABLE"
// 3. Create the working directory (e.g. dump) on your web server
// 4. Upload bigdump.php and your dump files (.sql, .gz) via FTP to the working directory
// 5. Run the bigdump.php from your browser via URL like http://www.yourdomain.com/dump/bigdump.php
// 6. BigDump can start the next import session automatically if you enable the JavaScript
// 7. Wait for the script to finish, do not close the browser window
// 8. IMPORTANT: Remove bigdump.php and your dump files from the web server

// If Timeout errors still occure you may need to adjust the $linepersession setting in this file

// LAST CHANGES

// *** First ideas about adding plugin interface
// *** Fix // delimiter bug
// *** Minor fix to avoid Undefined variable curfilename notice
// *** Handle empty delimiter setting
// *** New way to determine the upload directory
// *** Set UTF8 as default connection charset

// Database configuration

$db_server   = 'localhost';
$db_name     = 'import_restore';
$db_username = 'root';
$db_password = ''; 

// Connection charset should be the same as the dump file charset (utf8, latin1, cp1251, koi8r etc.)
// See http://dev.mysql.com/doc/refman/5.0/en/charset-charsets.html for the full list
// Change this if you have problems with non-latin letters

$db_connection_charset = 'utf8';

// OPTIONAL SETTINGS 

$filename           = '';     // Specify the dump filename to suppress the file selection dialog
$ajax               = true;   // AJAX mode: import will be done without refreshing the website
$linespersession    = 3000;   // Lines to be executed per one import session
$delaypersession    = 0;      // You can specify a sleep time in milliseconds after each session
                              // Works only if JavaScript is activated. Use to reduce server overrun

// CSV related settings (only if you use a CSV dump)

$csv_insert_table   = '';     // Destination table for CSV files
$csv_preempty_table = false;  // true: delete all entries from table specified in $csv_insert_table before processing
$csv_delimiter      = ',';    // Field delimiter in CSV file
$csv_add_quotes     = true;   // If your CSV data already have quotes around each field set it to false
$csv_add_slashes    = true;   // If your CSV data already have slashes in front of ' and " set it to false

// Allowed comment markers: lines starting with these strings will be ignored by BigDump

$comment[]='#';                       // Standard comment lines are dropped by default
$comment[]='-- ';
$comment[]='DELIMITER';               // Ignore DELIMITER switch as it's not a valid SQL statement
// $comment[]='---';                  // Uncomment this line if using proprietary dump created by outdated mysqldump
// $comment[]='CREATE DATABASE';      // Uncomment this line if your dump contains create database queries in order to ignore them
$comment[]='/*!';                     // Or add your own string to leave out other proprietary things

// Pre-queries: SQL queries to be executed at the beginning of each import session

// $pre_query[]='SET foreign_key_checks = 0';
// $pre_query[]='Add additional queries if you want here';

// Default query delimiter: this character at the line end tells Bigdump where a SQL statement ends
// Can be changed by DELIMITER statement in the dump file (normally used when defining procedures/functions)

$delimiter = ';';

// String quotes character

$string_quotes = '\'';                  // Change to '"' if your dump file uses double qoutes for strings

// How many lines may be considered to be one query (except text lines)

$max_query_lines = 300;


// *******************************************************************************************
// If not familiar with PHP please don't change anything below this line
// *******************************************************************************************

if ($ajax)
  ob_start();

define ('VERSION','0.35b');
define ('DATA_CHUNK_LENGTH',16384);  // How many chars are read per time
define ('TESTMODE',false);           // Set to true to process the file without actually accessing the database
define ('BIGDUMP_DIR',dirname(__FILE__));

header("Expires: Mon, 1 Dec 2003 01:00:00 GMT");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");

@ini_set('auto_detect_line_endings', true);
@set_time_limit(0);

if (function_exists("date_default_timezone_set") && function_exists("date_default_timezone_get"))
  @date_default_timezone_set(@date_default_timezone_get());

// Clean and strip anything we don't want from user's input [0.27b]

foreach ($_REQUEST as $key => $val) 
{
  $val = preg_replace("/[^_A-Za-z0-9-\.&= ;\$]/i",'', $val);
  $_REQUEST[$key] = $val;
}

?>

<center>

<table width="780" cellspacing="0" cellpadding="0">
<tr><td class="transparent">

<!-- <h1>BigDump: Staggered MySQL Dump Importer ver. <?php echo (VERSION); ?></h1> -->

<?php

function skin_open() 
{
  echo ('<div class="skin1">');
}

function skin_close() 
{
  echo ('</div>');
}


$error = false;
$file  = false;




// Print statistics

/*skin_open();

// echo ("<p class=\"centr\"><b>Statistics</b></p>\n");

  if (!$error)
  { 
    $lines_this   = $linenumber-$_REQUEST["start"];
    $lines_done   = $linenumber-1;
    $lines_togo   = ' ? ';
    $lines_tota   = ' ? ';
    
    $queries_this = $queries;
    $queries_done = $totalqueries;
    $queries_togo = ' ? ';
    $queries_tota = ' ? ';

    $bytes_this   = $foffset-$_REQUEST["foffset"];
    $bytes_done   = $foffset;
    $kbytes_this  = round($bytes_this/1024,2);
    $kbytes_done  = round($bytes_done/1024,2);
    $mbytes_this  = round($kbytes_this/1024,2);
    $mbytes_done  = round($kbytes_done/1024,2);
   
    if (!$gzipmode)
    {
      $bytes_togo  = $filesize-$foffset;
      $bytes_tota  = $filesize;
      $kbytes_togo = round($bytes_togo/1024,2);
      $kbytes_tota = round($bytes_tota/1024,2);
      $mbytes_togo = round($kbytes_togo/1024,2);
      $mbytes_tota = round($kbytes_tota/1024,2);
      
      $pct_this   = ceil($bytes_this/$filesize*100);
      $pct_done   = ceil($foffset/$filesize*100);
      $pct_togo   = 100 - $pct_done;
      $pct_tota   = 100;

      if ($bytes_togo==0) 
      { $lines_togo   = '0'; 
        $lines_tota   = $linenumber-1; 
        $queries_togo = '0'; 
        $queries_tota = $totalqueries; 
      }

      $pct_bar    = "<div style=\"height:15px;width:$pct_done%;background-color:#000080;margin:0px;\"></div>";
    }
    else
    {
      $bytes_togo  = ' ? ';
      $bytes_tota  = ' ? ';
      $kbytes_togo = ' ? ';
      $kbytes_tota = ' ? ';
      $mbytes_togo = ' ? ';
      $mbytes_tota = ' ? ';
      
      $pct_this    = ' ? ';
      $pct_done    = ' ? ';
      $pct_togo    = ' ? ';
      $pct_tota    = 100;
      $pct_bar     = str_replace(' ','&nbsp;','<tt>[         Not available for gzipped files          ]</tt>');
    }
    
    echo ("
    <center>
    <table width=\"520\" border=\"0\" cellpadding=\"3\" cellspacing=\"1\">
    <tr><th class=\"bg4\"> </th><th class=\"bg4\">Session</th><th class=\"bg4\">Done</th><th class=\"bg4\">To go</th><th class=\"bg4\">Total</th></tr>
    <tr><th class=\"bg4\">Lines</th><td class=\"bg3\">$lines_this</td><td class=\"bg3\">$lines_done</td><td class=\"bg3\">$lines_togo</td><td class=\"bg3\">$lines_tota</td></tr>
    <tr><th class=\"bg4\">Queries</th><td class=\"bg3\">$queries_this</td><td class=\"bg3\">$queries_done</td><td class=\"bg3\">$queries_togo</td><td class=\"bg3\">$queries_tota</td></tr>
    <tr><th class=\"bg4\">Bytes</th><td class=\"bg3\">$bytes_this</td><td class=\"bg3\">$bytes_done</td><td class=\"bg3\">$bytes_togo</td><td class=\"bg3\">$bytes_tota</td></tr>
    <tr><th class=\"bg4\">KB</th><td class=\"bg3\">$kbytes_this</td><td class=\"bg3\">$kbytes_done</td><td class=\"bg3\">$kbytes_togo</td><td class=\"bg3\">$kbytes_tota</td></tr>
    <tr><th class=\"bg4\">MB</th><td class=\"bg3\">$mbytes_this</td><td class=\"bg3\">$mbytes_done</td><td class=\"bg3\">$mbytes_togo</td><td class=\"bg3\">$mbytes_tota</td></tr>
    <tr><th class=\"bg4\">%</th><td class=\"bg3\">$pct_this</td><td class=\"bg3\">$pct_done</td><td class=\"bg3\">$pct_togo</td><td class=\"bg3\">$pct_tota</td></tr>
    <tr><th class=\"bg4\">% bar</th><td class=\"bgpctbar\" colspan=\"4\">$pct_bar</td></tr>
    </table>
    </center>
    \n");

// Finish message and restart the script

    if ($linenumber<$_REQUEST["start"]+$linespersession)
    { echo ("<p class=\"successcentr\">Congratulations: End of file reached, assuming OK</p>\n");
      echo ("<p class=\"successcentr\">IMPORTANT: REMOVE YOUR DUMP FILE and BIGDUMP SCRIPT FROM SERVER NOW!</p>\n");
      echo ("<p class=\"centr\">Thank you for using this tool! Please rate <a href=\"http://www.hotscripts.com/listing/bigdump/?RID=403\" target=\"_blank\">Bigdump at Hotscripts.com</a></p>\n");
      echo ("<p class=\"centr\">You can send me some bucks or euros as appreciation via PayPal. Thank you!</p>\n");
  
      do_action('script_finished');
      $error=true; // This is a semi-error telling the script is finished
    }
    else
    { if ($delaypersession!=0)
        echo ("<p class=\"centr\">Now I'm <b>waiting $delaypersession milliseconds</b> before starting next session...</p>\n");
      if (!$ajax) 
        echo ("<script language=\"JavaScript\" type=\"text/javascript\">window.setTimeout('location.href=\"".$_SERVER["PHP_SELF"]."?start=$linenumber&fn=".urlencode($curfilename)."&foffset=$foffset&totalqueries=$totalqueries&delimiter=".urlencode($delimiter)."\";',500+$delaypersession);</script>\n");

      echo ("<noscript>\n");
      echo ("<p class=\"centr\"><a href=\"".$_SERVER["PHP_SELF"]."?start=$linenumber&amp;fn=".urlencode($curfilename)."&amp;foffset=$foffset&amp;totalqueries=$totalqueries&amp;delimiter=".urlencode($delimiter)."\">Continue from the line $linenumber</a> (Enable JavaScript to do it automatically)</p>\n");
      echo ("</noscript>\n");
   
      echo ("<p class=\"centr\">Press <b><a href=\"".$_SERVER["PHP_SELF"]."\">STOP</a></b> to abort the import <b>OR WAIT!</b></p>\n");
    }
  }
  else 
    echo ("<p class=\"error\">Stopped on error</p>\n");

skin_close();

}*/

/*if ($error)
  echo ("<p class=\"centr\"><a href=\"".$_SERVER["PHP_SELF"]."\">Start from the beginning</a> (DROP the old tables before restarting)</p>\n");

if ($dbconnection) mysql_close($dbconnection);
if ($file && !$gzipmode) fclose($file);
else if ($file && $gzipmode) gzclose($file);*/

?>


</td></tr></table>

</center>
<?php do_action('end_of_body'); ?>
</body>
</html>

<?php

// If error or finished put out the whole output from above and stop

/*if ($error) 
{
  $out1 = ob_get_contents();
  ob_end_clean();
  echo $out1;
  die;
}

// If Ajax enabled and in import progress creates responses  (XML response or script for the initial page)

if ($ajax && isset($_REQUEST['start']))
{
  if (isset($_REQUEST['ajaxrequest'])) 
  {	ob_end_clean();
	  create_xml_response();
	  die;
  } 
  else 
    create_ajax_script();	  
}

// Anyway put out the output from above

ob_flush();
*/
// THE MAIN SCRIPT ENDS HERE

// *******************************************************************************************
// Plugin handling (EXPERIMENTAL)
// *******************************************************************************************

function do_action($tag)
{ global $plugin_actions;
  
  if (isset($plugin_actions[$tag]))
  { reset ($plugin_actions[$tag]);
    foreach ($plugin_actions[$tag] as $action)
      call_user_func_array($action, array());
  }
}

function add_action($tag, $function)
{
	global $plugin_actions;
	$plugin_actions[$tag][] = $function;
}

// *******************************************************************************************
// 				AJAX utilities
// *******************************************************************************************

function create_xml_response() 
{
  global $linenumber, $foffset, $totalqueries, $curfilename, $delimiter,
				 $lines_this, $lines_done, $lines_togo, $lines_tota,
				 $queries_this, $queries_done, $queries_togo, $queries_tota,
				 $bytes_this, $bytes_done, $bytes_togo, $bytes_tota,
				 $kbytes_this, $kbytes_done, $kbytes_togo, $kbytes_tota,
				 $mbytes_this, $mbytes_done, $mbytes_togo, $mbytes_tota,
				 $pct_this, $pct_done, $pct_togo, $pct_tota,$pct_bar;

	header('Content-Type: application/xml');
	header('Cache-Control: no-cache');
	
	echo '<?xml version="1.0" encoding="ISO-8859-1"?>';
	echo "<root>";

// data - for calculations

	echo "<linenumber>$linenumber</linenumber>";
	echo "<foffset>$foffset</foffset>";
	echo "<fn>$curfilename</fn>";
	echo "<totalqueries>$totalqueries</totalqueries>";
	echo "<delimiter>$delimiter</delimiter>";

// results - for page update

	echo "<elem1>$lines_this</elem1>";
	echo "<elem2>$lines_done</elem2>";
	echo "<elem3>$lines_togo</elem3>";
	echo "<elem4>$lines_tota</elem4>";
	
	echo "<elem5>$queries_this</elem5>";
	echo "<elem6>$queries_done</elem6>";
	echo "<elem7>$queries_togo</elem7>";
	echo "<elem8>$queries_tota</elem8>";
	
	echo "<elem9>$bytes_this</elem9>";
	echo "<elem10>$bytes_done</elem10>";
	echo "<elem11>$bytes_togo</elem11>";
	echo "<elem12>$bytes_tota</elem12>";
			
	echo "<elem13>$kbytes_this</elem13>";
	echo "<elem14>$kbytes_done</elem14>";
	echo "<elem15>$kbytes_togo</elem15>";
	echo "<elem16>$kbytes_tota</elem16>";
	
	echo "<elem17>$mbytes_this</elem17>";
	echo "<elem18>$mbytes_done</elem18>";
	echo "<elem19>$mbytes_togo</elem19>";
	echo "<elem20>$mbytes_tota</elem20>";
	
	echo "<elem21>$pct_this</elem21>";
	echo "<elem22>$pct_done</elem22>";
	echo "<elem23>$pct_togo</elem23>";
	echo "<elem24>$pct_tota</elem24>";
	echo "<elem_bar>".htmlentities($pct_bar)."</elem_bar>";
				
	echo "</root>";		
}


function create_ajax_script() 
{
  global $linenumber, $foffset, $totalqueries, $delaypersession, $curfilename, $delimiter;
?>

	<script type="text/javascript" language="javascript">			

	// creates next action url (upload page, or XML response)
	function get_url(linenumber,fn,foffset,totalqueries,delimiter) {
		return "<?php echo $_SERVER['PHP_SELF'] ?>?start="+linenumber+"&fn="+fn+"&foffset="+foffset+"&totalqueries="+totalqueries+"&delimiter="+delimiter+"&ajaxrequest=true";
	}
	
	// extracts text from XML element (itemname must be unique)
	function get_xml_data(itemname,xmld) {
		return xmld.getElementsByTagName(itemname).item(0).firstChild.data;
	}
	
	function makeRequest(url) {
		http_request = false;
		if (window.XMLHttpRequest) { 
		// Mozilla etc.
			http_request = new XMLHttpRequest();
			if (http_request.overrideMimeType) {
				http_request.overrideMimeType("text/xml");
			}
		} else if (window.ActiveXObject) { 
		// IE
			try {
				http_request = new ActiveXObject("Msxml2.XMLHTTP");
			} catch(e) {
				try {
					http_request = new ActiveXObject("Microsoft.XMLHTTP");
				} catch(e) {}
			}
		}
		if (!http_request) {
				alert("Cannot create an XMLHTTP instance");
				return false;
		}
		http_request.onreadystatechange = server_response;
		http_request.open("GET", url, true);
		http_request.send(null);
	}
	
	function server_response() 
	{

	  // waiting for correct response
	  if (http_request.readyState != 4)
		return;

	  if (http_request.status != 200) 
	  {
	    alert("Page unavailable, or wrong url!")
	    return;
	  }
		
		// r = xml response
		var r = http_request.responseXML;
		
		//if received not XML but HTML with new page to show
		if (!r || r.getElementsByTagName('root').length == 0) 
		{	var text = http_request.responseText;
			document.open();
			document.write(text);		
			document.close();	
			return;		
		}
		
		// update "Starting from line: "
		document.getElementsByTagName('p').item(1).innerHTML = 
			"Starting from line: " + 
			   r.getElementsByTagName('linenumber').item(0).firstChild.nodeValue;
		
		// update table with new values
		for(i = 1; i <= 24; i++)
			document.getElementsByTagName('td').item(i).firstChild.data = get_xml_data('elem'+i,r);
		
		// update color bar
		document.getElementsByTagName('td').item(25).innerHTML = 
			r.getElementsByTagName('elem_bar').item(0).firstChild.nodeValue;
			 
		// action url (XML response)	 
		url_request =  get_url(
			get_xml_data('linenumber',r),
			get_xml_data('fn',r),
			get_xml_data('foffset',r),
			get_xml_data('totalqueries',r),
			get_xml_data('delimiter',r));
		
		// ask for XML response	
		window.setTimeout("makeRequest(url_request)",500+<?php echo $delaypersession; ?>);
	}

	// First Ajax request from initial page

	var http_request = false;
	var url_request =  get_url(<?php echo ($linenumber.',"'.urlencode($curfilename).'",'.$foffset.','.$totalqueries.',"'.urlencode($delimiter).'"') ;?>);
	window.setTimeout("makeRequest(url_request)",500+<?php echo $delaypersession; ?>);
	</script>

<?php
}

?>
