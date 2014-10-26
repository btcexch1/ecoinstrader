<?php

class BaseController extends Controller {

	/**
	 * Setup the layout used by the controller.
	 *
	 * @return void
	 */
	protected function setupLayout()
	{
		if ( ! is_null($this->layout))
		{
			$this->layout = View::make($this->layout);
		}
	}

	public function __construct()
    {
        $this -> configureLocale();
    }

    /**
     * Action used to set the application locale.
     * 
     */
    public function setLocale()
    {
        $mLocale = Request::segment( 2, Config::get( 'app.locale' ) ); // Get parameter from URL.
        if ( in_array( $mLocale , Config::get( 'app.locales' ) ) )
        {
           App::setLocale( $mLocale );
           Session::put( 'locale', $mLocale );
           Cookie::forever( 'locale', $mLocale );
        }        
        return Redirect::to(URL::previous());
        //return Redirect::back();//loi neu ko co link back
    }
    

    /**
     * Detect and set application localization environment (language).
     * NOTE: Don't foreget to ADD/SET/UPDATE the locales array in app/config/app.php!
     *
     */
    private function configureLocale()
    {
        $mLocale = Config::get( 'app.locale' );
        if ( !Session::has( 'locale' ) )
        {
            $mFromCookie = Cookie::get( 'locale', null );
            if ( $mFromCookie != null && in_array( $mFromCookie, Config::get( 'app.locales' ) ) )
            {                
                $mLocale = $mFromCookie;
            }
            else
            {                
                $mFromURI = Request::segment( 1 );
                if ( $mFromURI != null && in_array( $mFromURI, Config::get( 'app.locales' ) ) )
                {                    
                    $mLocale = $mFromURI;
                }
                else
                {
                    $mFromBrowser = substr( Request::server( 'http_accept_language' ), 0, 2 );
                    if ( $mFromBrowser != null && in_array( $mFromBrowser, Config::get( 'app.locales' ) ) )
                    {
                        $mLocale = $mFromBrowser;
                    } 
                } 
            } 

            Session::put( 'locale', $mLocale );
            Cookie::forever( 'locale', $mLocale );
        }
        else
        {
            $mLocale = Session::get( 'locale' );
        } 
        App::setLocale( $mLocale );
    }
}