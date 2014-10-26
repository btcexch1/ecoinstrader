<nav class="navigation-bar dark fixed-top nav-header">
    <div class="navigation-bar-content container">
        <a href="<?=url('/', $parameters = array(), $secure = null);?>" class="element"><img class="img-logo" src="{{asset('assets/img/bitcoin-logo.png')}}"/><span class="bold blue">Ecoins</span><span class="bold">Trader</span></a>
        <span class="element-divider"></span>

        <a class="pull-menu" href="#"></a>
        @if ( Auth::guest() ) 
        <ul class="element-menu place-right small-menu-header"> 
            @if(!empty($locales))            
            <li>
                <a href="#" class="dropdown-toggle text-small" data-toggle="dropdown">{{trans('frontend_texts.select_language')}}</a>                
                <ul class="dropdown-menu" data-role="dropdown">
                  @foreach($locales as $locale)
                    <li @if(Session::get( 'locale' )==$locale) {{'class="active"'}} @endif>{{ HTML::link('locale/'.$locale, trans('frontend_texts.'.$locale),array('class' => 'text-small')) }}</li>
                  @endforeach
                </ul>
            </li>
            @endif                 
            <li @if(Request::is('register')) {{'class="active"'}} @endif><a href="<?=url('/', $parameters = array(), $secure = null);?>/user/register" class="navitem text-small {{Request::is('register')?'active':''}}">{{trans('user_texts.register')}}</a></li>
            <li @if(Request::is('login')) {{'class="active"'}} @endif><a href="<?=url('/', $parameters = array(), $secure = null);?>/login" class="navitem text-small {{Request::is('login')?'active':''}}">{{trans('user_texts.login')}}</a></li>
            <li><a href="<?=url('/social/facebook', $parameters = array(), $secure = null);?>" class="navitem text-small"><img width="20px" src="{{asset('assets/img/face_login.png')}}"></a></li>
            <li><a href="<?=url('/social/google', $parameters = array(), $secure = null);?>" class="navitem text-small"><img width="20px" src="{{asset('assets/img/google_login.png')}}"></a></li>
            <li><a href="" class="text-small"><i class="icon-help-2"></i> {{Lang::get('frontend_texts.help')}}</a></li>
        </ul>
        @else
        <ul class="element-menu place-right small-menu-header button-dropdown">
            <li>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{trans('user_texts.hello')}} {{Confide::user()->firstname.' '.Confide::user()->lastname}} </a>
                <ul class="dropdown-menu" data-role="dropdown">
                  <li @if(Request::is('user/profile/dashboard')) {{'class="active"'}} @endif>{{ HTML::link('user/profile/dashboard', trans('user_texts.dashboard')) }}</li>
                  <li @if(Request::is('user/profile/verify')) {{'class="active"'}} @endif>{{ HTML::link('user/profile/verify', trans('user_texts.verify_account')) }}</li>
                  <li @if(Request::is('user/profile')) {{'class="active"'}} @endif>{{ HTML::link('user/profile', trans('user_texts.profile')) }}</li>
                  <li @if(Request::is('user/profile/two-factor-auth')) {{'class="active"'}} @endif>{{ HTML::link('user/profile/two-factor-auth', trans('user_texts.security')) }}</li>
                  <li @if(Request::is('user/profile/balances')) {{'class="active"'}} @endif>{{ HTML::link('user/profile/balances', trans('user_texts.balance')) }}</li>
                  <li @if(Request::is('user/profile/deposits')) {{'class="active"'}} @endif>{{ HTML::link('user/profile/deposits', trans('user_texts.deposits')) }}</li>
                  <li @if(Request::is('user/profile/withdrawals')) {{'class="active"'}} @endif>{{ HTML::link('user/profile/withdrawals', trans('user_texts.withdrawals')) }}</li>
                  <li @if(Request::is('user/profile/orders')) {{'class="active"'}} @endif>{{ HTML::link('user/profile/orders', trans('user_texts.orders')) }}</li>
                  <li @if(Request::is('user/profile/trade-history')) {{'class="active"'}} @endif>{{ HTML::link('user/profile/trade-history', trans('user_texts.trade_history')) }}</li>
                  <li>{{ HTML::link('user/logout', trans('user_texts.logout')) }}</li>
                </ul>
            </li> 
            @if(!empty($locales))            
            <li>
                <a href="#" class="dropdown-toggle text-small" data-toggle="dropdown">{{trans('frontend_texts.select_language')}}</a>                
                <ul class="dropdown-menu" data-role="dropdown">
                  @foreach($locales as $locale)
                    <li @if(Session::get( 'locale' )==$locale) {{'class="active"'}} @endif>{{ HTML::link('locale/'.$locale, trans('frontend_texts.'.$locale),array('class' => 'text-small')) }}</li>
                  @endforeach
                </ul>
            </li>
            @endif   
            <li @if(Request::is('help')) {{'class="active"'}} @endif ><a href="" class="text-small"><i class="icon-help-2"></i> {{Lang::get('frontend_texts.help')}}</a></li>            
        </ul>
        @endif
        <ul class="element-menu place-right meta-menu">
            <li><a href="#" class="text-small">Bitcoin: <span class="text-small blue">${{$btc_usd}}</span></a></li>
            <li><a href="#" class="text-small">Litecoin: <span class="blue">${{$ltc_usd}}</span></a></li>
        </ul>
        <ul class="element-menu place-right">
            <li @if(Request::is('/')) {{'class="active"'}} @endif ><a href="<?=url('/', $parameters = array(), $secure = null);?>">{{Lang::get('frontend_texts.home')}}</a></li>
            <li @if(Request::is('page/voting')) {{'class="active"'}} @endif>{{ HTML::link('page/voting', trans('user_texts.voting'), array('class' => Request::is('page/voting')?'active':'')) }}</li>
            <li @if(Request::is('page/fees')) {{'class="active"'}} @endif>{{ HTML::link('page/fees', trans('user_texts.fees'), array('class' => Request::is('page/fees')?'active':'')) }}</li>            
            @if(isset($menu_pages))
              @foreach($menu_pages as $menu_page)
              <li @if(Request::is('post/'.$menu_page->permalink)) {{'class="active"'}} @endif>{{ HTML::link('post/'.$menu_page->permalink, $menu_page->title, array('class' => Request::is('post/'.$menu_page->permalink)?'active':'')) }}</li>
              @endforeach
            @endif                
        </ul>  
   
    </div>
</nav>