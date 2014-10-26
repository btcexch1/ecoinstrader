@extends('layouts.main')
@section('title')
{{Lang::get('frontend_texts.reset_pass')}}
@stop
@section('body')
<div class="container">
    <div class="content">
      <div id="resetpassfrom" class="formuser">
        <h2>{{Lang::get('frontend_texts.reset_pass')}}</h2>
        <hr>
        @if ( Session::get('error') )
            <div class="notice marker-on-bottom bg-darkRed fg-white">{{{ Session::get('error') }}}</div>
        @endif

        @if ( Session::get('notice') )
            <div class="notice marker-on-bottom fg-white">{{{ Session::get('notice') }}}</div>
        @endif
        <form method="POST" action="{{{ (Confide::checkAction('UserController@do_reset_password'))    ?: URL::to('/user/reset') }}}" accept-charset="UTF-8" class="reset_pas">
          <input type="hidden" name="token" value="{{{ $token }}}">
          <input type="hidden" name="_token" value="{{{ Session::getToken() }}}">
          <div class="input-control text">
              <input type="password" name="password" id="password" value="{{{ Input::old('email') }}}" placeholder="{{{ Lang::get('confide::confide.password') }}}"/>
              <button class="btn-clear"></button>
          </div>
          <div class="input-control text">
              <input class="form-control" placeholder="{{{ Lang::get('confide::confide.password_confirmation') }}}" type="password" name="password_confirmation" id="password_confirmation">
              <button class="btn-clear"></button>
          </div> 
          <button tabindex="3" type="submit" class="button primary">{{{ Lang::get('confide::confide.forgot.submit') }}}</button>
      </form>
      </div>
    </div>
</div>
@stop