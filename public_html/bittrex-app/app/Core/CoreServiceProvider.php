<?php
namespace Core;

use \Illuminate\Support\ServiceProvider;

class CoreServiceProvider extends ServiceProvider {
    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind('Core/UserUserInterface','Core/USer/UserRepo');
    }

}
