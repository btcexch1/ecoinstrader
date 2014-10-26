<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/
#################################################################################
// Config route site frontent

Route::get('/', 'HomeController@index'); // call index page
Route::get('market/{market}', 'HomeController@index');
Route::get('page/{page}', 'HomeController@routePage'); 
Route::post('get-chart', 'HomeController@getChart');
Route::post('voting', 'VoteCoinController@doVoting');
Route::get('maintenance', 'HomeController@maintenanceMode');
Route::get( '/locale/{locale}', 'BaseController@setLocale' ); //link guide: http://laravel-vsjr.blogspot.com/2013/08/managing-laravel-4-localization-language.html
//pages , news
Route::get('post/{post}', 'HomeController@viewPost');
#################################################################################
Route::group(array('before' => array('auth','admin'),'prefix' => 'admin'), function()
{
    Route::get('/', 'Admin_SettingController@routePage');
    Route::get('setting', 'Admin_SettingController@routePage');
    Route::get('setting/{page}', 'Admin_SettingController@routePage');
    Route::get('setting/{page}/{pager_page}', 'Admin_SettingController@routePage');
    
    Route::get('statistic/{page}', 'Admin_SettingController@routePage');

    //content
    Route::get('content/{page}', 'Admin_SettingController@routePage');
    Route::get('content/{page}/{pager_page}', 'Admin_SettingController@routePage');

    //manage
    Route::get('manage/{page}', 'Admin_SettingController@routePage');
    Route::post('manage/{page}', 'Admin_SettingController@routePage');
    Route::post('manage/{page}/{pager_page}', 'Admin_SettingController@routePage');
    Route::get('manage/{page}/{pager_page}', 'Admin_SettingController@routePage');

    Route::post('update-setting', 'Admin_SettingController@updateSetting');
    Route::post('set-fee-trade', 'Admin_SettingController@setFeeTrade');
    Route::post('set-fee-withdraw', 'Admin_SettingController@setFeeWithdraw');

    Route::post('add-coin-vote', 'Admin_SettingController@addNewCoinVote');
    Route::post('delete-coin-vote', 'Admin_SettingController@deleteCoinVote');
    //user
    Route::post('add-user', 'Admin_SettingController@addNewUser');
    Route::get('edit-user/{user}', 'Admin_SettingController@editUSer');
    Route::post('edit-user', 'Admin_SettingController@doEditUSer');
    Route::post('delete-user', 'Admin_SettingController@deleteUSer');
    Route::post('ban-user', 'Admin_SettingController@banUSer');

    //wallet
    Route::post('add-wallet', 'Admin_SettingController@addNewWallet');
    Route::get('edit-wallet/{wallet}', 'Admin_SettingController@editWallet');
    Route::post('edit-wallet', 'Admin_SettingController@doEditWallet');
    Route::post('delete-wallet', 'Admin_SettingController@deleteWallet');

    //market
    Route::post('add-market', 'Admin_SettingController@addNewMarket');
    Route::post('delete-market', 'Admin_SettingController@deleteMarket');
    Route::post('disable-market', 'Admin_SettingController@disableMarket');

    //pages , news
    Route::post('add-post', 'Admin_SettingController@addNewPost');
    Route::get('edit-post/{post}', 'Admin_SettingController@editPost');
    Route::post('edit-post', 'Admin_SettingController@doEditPost');
    Route::post('delete-post', 'Admin_SettingController@deletePost');

    Route::post('send-coin', 'Admin_SettingController@doSendCoin');

    Route::get('backup', 'Admin_SettingController@formBackup');
    Route::post('restore', 'Admin_SettingController@doBackup');
    Route::get('restore', 'Admin_SettingController@formRestore');
    Route::post('restore', 'Admin_SettingController@doRestore');

    //limit trade
    Route::post('add-limit-trade', 'Admin_SettingController@addNewLimitTrade');
    Route::get('edit-limit-trade/{wallet}', 'Admin_SettingController@editLimitTrade');
    Route::post('edit-limit-trade', 'Admin_SettingController@doEditLimitTrade');
    Route::post('delete-limit-trade', 'Admin_SettingController@deleteLimitTrade');
	
	//time limit trade
    Route::post('add-time-limit-trade', 'Admin_SettingController@addNewTimeLimitTrade');
    Route::get('edit-time-limit-trade/{wallet}', 'Admin_SettingController@editTimeLimitTrade');
    Route::post('edit-time-limit-trade', 'Admin_SettingController@doEditTimeLimitTrade');
    Route::post('delete-time-limit-trade', 'Admin_SettingController@deleteTimeLimitTrade');

    Route::get('verify-user/{user}', 'Admin_SettingController@verifyUSer');
    Route::post('verify-user', 'Admin_SettingController@doVerifyUSer');

    //method deposit currency
    Route::post('add-method-deposit', 'Admin_SettingController@addNewMethodDeposit');
    Route::get('edit-method-deposit/{method}', 'Admin_SettingController@editMethodDeposit');
    Route::post('edit-method-deposit', 'Admin_SettingController@doEditMethodDeposit');
    Route::post('delete-method-deposit', 'Admin_SettingController@deleteMethodDeposit');
    Route::post('update-send-deposit', 'Admin_SettingController@doUpdateSendDeposit');  

    //method withdraw currency
    Route::post('add-method-withdraw', 'Admin_SettingController@addNewMethodWithdraw');
    Route::get('edit-method-withdraw/{method}', 'Admin_SettingController@editMethodWithdraw');
    Route::post('edit-method-withdraw', 'Admin_SettingController@doEditMethodWithdraw');
    Route::post('delete-method-withdraw', 'Admin_SettingController@deleteMethodWithdraw');
    Route::post('update-takemoney-withdraw', 'Admin_SettingController@doUpdateTakeMoneyWithdraw');    
});
// Confide routes
Route::get( 'referral/{referral}',                 'UserController@create');
Route::get( 'user/register',                 'UserController@create');
Route::post('user',                        'UserController@store');
Route::get( 'login',                        'UserController@login');
Route::post('user/login',                  'UserController@do_login');
Route::get( 'user/confirm/{code}',         'UserController@confirm');
Route::get( 'user/forgot_password',        'UserController@forgot_password');
Route::post('user/forgot_password',        'UserController@do_forgot_password');
Route::get( 'user/reset_password/{token}', 'UserController@reset_password');
Route::post('user/reset_password',         'UserController@do_reset_password');
Route::get( 'user/logout',                 'UserController@logout');
Route::post( 'check-captcha',               'UserController@checkCaptcha');
Route::post( 'user/update-setting',         'UserController@updateSetting');
Route::post( 'user/add-infoverify',         'UserController@addInfoVerify');
//user profile
Route::group(array('before' => 'auth', 'prefix' => 'user'), function () {
    //Normal route
    Route::get('profile', 'UserController@viewProfile');
    Route::get('profile/{page}', 'UserController@viewProfile');
    Route::post('profile/{page}', 'UserController@viewProfile');
    Route::get('profile/{page}/{filter}', 'UserController@viewProfile');
    Route::post('profile/{page}/{filter}', 'UserController@viewProfile');
    Route::get('deposit/{wallet_id}', 'UserController@formDeposit');
    Route::get('withdraw/{wallet_id}', 'UserController@formWithdraw');
    Route::post('withdraw', 'UserController@doWithdraw');
    Route::get('withdraw-comfirm/{withdraw_id}/{confirmation_code}', 'UserController@comfirmWithdraw');
    Route::post('referrer-tradekey', 'UserController@referreredTradeKey'); 
    Route::post('cancel-withdraw', 'UserController@cancelWithdraw');
    //transfer
    Route::get('transfer-coin/{wallet_id}', 'UserController@formTransfer');
    Route::post('transfer-coin', 'UserController@doTransfer');
   /* Route::post('viewtranfer/{type}', 'UserController@viewTransferOut');*/

   Route::post('notify-deposit', 'UserController@addDepositCurrency');
   Route::post('notify-withdraw', 'UserController@addWithdrawCurrency');
});

//authy two-factor auth
Route::post( '/postrequestauth', 'AuthController@ajaxRequestInstallation' );
Route::post( '/first_auth', 'UserController@firstAuth' );
Route::post( 'user/verify_token', 'AuthController@ajVerifyToken' );
Route::post( '/postuninstalltwoauth', 'AuthController@ajaxUninstallation' );

//trading
Route::post('dobuy', 'OrderController@doBuy'); 
Route::post('dosell', 'OrderController@doSell');
Route::post('docancel', 'OrderController@doCancel');
Route::post('dotest', 'HomeController@doTest');
Route::post('get-orderdepth-chart', 'OrderController@getOrderDepthChart');

//deposit
Route::post('generate-addr-deposit', 'DepositController@generateNewAddrDeposit');
Route::get('cron-update-deposit', 'DepositController@cronUpdateDeposit');
Route::get('callback-update-deposit/{wallet_type}', 'DepositController@callbackUpdateDeposit');
Route::get('callback-update-deposit-test/{wallet_type}', 'DepositController@callbackUpdateDeposit_test');
Route::get('blocknotify-update-deposit/{wallet_type}', 'DepositController@blocknotifyUpdateDeposit');

//HybridAuth
//http://www.mrcasual.com/on/coding/laravel4-package-management-with-composer/
Route::get('social/{action?}', array("as" => "hybridauth",'uses' => 'UserController@socialLogin'));
Route::get('sms-verify', 'UserController@formSMSVerify');
Route::post( 'user/social_verify_token', 'AuthController@socialAjVerifyToken' );
