<!DOCTYPE html>
<html>
	<head>
		<title> 
			@section('title')
				ECoinsTrader
			@show
		</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<!-- CSS are placed here -->
		{{HTML::style('assets/css/bootstrap.min.css')}}
		{{HTML::style('assets/css/bootstrap-responsive.css')}}  
		{{HTML::style('assets/css/base.css')}}  
		{{HTML::style('assets/css/main.css')}}	
		{{HTML::style('assets/css/style.css')}}	

		<!-- Scripts are placed here -->
	{{ HTML::script('assets/js/jquery-1.10.2.min.js') }} 
	{{ HTML::script('assets/js/bootstrap.min.js') }}
	
	</head>
<body>
	<!-- Header -->
    @include('blocks.header')
    <!-- End Header -->
    <!-- Content -->
	<div id="content">		
		<div id="contentinner">
			<div class="alert alert-dismissable alert-danger">
				We are currently under maintenance. Please come back later. Apologies for the inconvenience.
			</div>
		</div>
		<div class="clear"></div>
	</div> 
	<div id="freeow" class="freeow freeow-bottom-left"></div>
	</body>
</html>