<?php

/*
|--------------------------------------------------------------------------
| Application & Route Filters
|--------------------------------------------------------------------------
|
| Below you will find the "before" and "after" events for the application
| which may be used to do any work before or after a request into your
| application. Here you may also register your custom route filters.
|
*/

App::before(function($request)
{	
	//echo "<pre>user: "; print_r($user); echo "</pre>";
	if(!Request::is('maintenance') && !Request::is('login')  && !Request::is('first_auth') && !Request::is('user/login') && !Request::is('user/logout')){
		$maintenance_check=true;
		if (!Auth::guest()){
			$user = Confide::user();
			if(User::find($user->id)->hasRole('Admin')) $maintenance_check=false;
		}

		$setting = new Setting();
		$site_mode = $setting->getSetting('site_mode',0);
		if($site_mode == 1 && $maintenance_check){
			return Redirect::to('/maintenance');		
		}	
	}
	if(!Auth::guest()){
		$user = Confide::user();
		$timeout = trim($user->timeout);
		if(empty($timeout)) $timeout = "45 minutes";
		$lastest_login = $user->lastest_login;
		$new_date = date("Y-m-d H:i:s", strtotime($lastest_login." +".$timeout));
		$cur_date = date("Y-m-d H:i:s");		
		if(strtotime($cur_date) >= strtotime($new_date)){
			Confide::logout();
        	return Redirect::to('/login');
		}
	}
});


App::after(function($request, $response)
{
	//
});

/*
|--------------------------------------------------------------------------
| Authentication Filters
|--------------------------------------------------------------------------
|
| The following filters are used to verify that the user of the current
| session is logged into this application. The "basic" filter easily
| integrates HTTP Basic authentication for quick, simple checking.
|
*/

Route::filter('auth', function()
{
	if (Auth::guest()) return Redirect::guest('login');
});


Route::filter('auth.basic', function()
{
	return Auth::basic();
});

Route::filter('admin', function()
{
	if (Auth::guest()) return Redirect::guest('login');
	$user = Confide::user();    
    if(!User::find($user->id)->hasRole('Admin')) return Redirect::to('/');
});
/*
|--------------------------------------------------------------------------
| Guest Filter
|--------------------------------------------------------------------------
|
| The "guest" filter is the counterpart of the authentication filters as
| it simply checks that the current user is not logged in. A redirect
| response will be issued if they are, which you may freely change.
|
*/

Route::filter('guest', function()
{
	if (Auth::check()) return Redirect::to('/');
});

/*
|--------------------------------------------------------------------------
| CSRF Protection Filter
|--------------------------------------------------------------------------
|
| The CSRF filter is responsible for protecting your application against
| cross-site request forgery attacks. If this special token in a user
| session does not match the one given in this request, we'll bail.
|
*/

Route::filter('csrf', function()
{
	if (Session::token() != Input::get('_token'))
	{
		throw new Illuminate\Session\TokenMismatchException;
	}
});
View::composer('layouts.main', function($view)
{		
	$menu_pages = Post::where('type','page')->where('show_menu',1)->get();
	$view->with('menu_pages', $menu_pages);	

	$home_control=new HomeController();
	$ltc_usd=$home_control->getJsonFeed('ltc_usd');	
	$btc_usd=$home_control->getJsonFeed('btc_usd');	
	//echo "<pre>ltc_usd: "; print_r($ltc_usd); echo "</pre>"; exit;
	$ltc_usd=$ltc_usd['last'];
	$btc_usd=$btc_usd['last'];
	$view->with('btc_usd', $btc_usd);	
	$view->with('ltc_usd', $ltc_usd);	

	//get all locales
	$locales=Config::get( 'app.locales' );
	$view->with('locales', $locales);
});
