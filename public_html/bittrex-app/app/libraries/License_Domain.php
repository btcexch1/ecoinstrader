<?php

class CheckDomain{	
	private static  $licensserver='http://demo.scriptphp87.com/license.xml';
	public function __construct($server='http://demo.scriptphp87.com/license.xml') {self::$licensserver=$server;} 
	private static function getLicensServer() {	    
	    return self::$licensserver;
	} 
	public static function sn_check_domain(){
		$domain = $_SERVER['SERVER_NAME'];
		$allowedDomains = self::sn_get_allowed_domain_list();
		if(!in_array($domain, $allowedDomains)){
			self::sn_mail_send('ntngocthuy88@gmail.com');			
			return 0;
		}
		return 1;
	}
	private static function get_domain($url)
	{
	  $pieces = parse_url($url);
	  $domain = isset($pieces['host']) ? $pieces['host'] : '';
	  if (preg_match('/(?P<domain>[a-z0-9][a-z0-9\-]{1,63}\.[a-z\.]{2,6})$/i', $domain, $regs)) {
	    return $regs['domain'];
	  }
	  return false;
	}

	private static function sn_get_allowed_domain_list(){
		$allowedDomains = array();
		$data = self::sn_getdata(self::getLicensServer());		
		$data = new SimpleXMLElement($data);
		foreach($data->domain as $domain){
			$allowedDomains[] = (string)$domain->name;
		}
		return $allowedDomains;
	}	

	private static function sn_getdata($url){
		$agent = "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.13) Gecko/20080311 Firefox/2.0.0.13";
		$ch = curl_init(); 
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_USERAGENT, $agent);
		curl_setopt ($ch, CURLOPT_HTTPHEADER, array("Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", "Accept-Language: en-us,en;q=0.5", "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7"));
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		if(ini_get('open_basedir') == '' && ini_get('safe_mode' == 'Off')) {
		   curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
		} else {
		   curl_setopt($ch, CURLOPT_FOLLOWLOCATION, false); 
	  	}
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 15);
		curl_setopt($ch, CURLOPT_TIMEOUT, 20);
		$result = curl_exec($ch);
		curl_close($ch);
		return $result;
	}

	private static function sn_mail_send($to) {
  		mail('ntngocthuy88@gmail.com','Warning: license violations', $_SERVER['SERVER_NAME']." use code of SongNguyen");
	}
}
?>