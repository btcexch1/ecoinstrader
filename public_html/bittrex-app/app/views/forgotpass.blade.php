@extends('layouts.main')
@section('title')
{{Lang::get('frontend_texts.forgetpass')}}
@stop
@section('body')
<div class="container">
    <div class="content">
        <div id="forgetpass" class="formuser">
            <h2>{{Lang::get('frontend_texts.forgetpass')}}</h2>
            <hr>
            @if ( Session::get('error') )
            <div class="notice marker-on-bottom bg-darkRed fg-white">{{{ Session::get('error') }}}</div>
            @endif

            @if ( Session::get('notice') )
            <div class="notice marker-on-bottom fg-white">{{{ Session::get('notice') }}}</div>
            @endif
            <form method="POST" action="{{ (Confide::checkAction('UserController@do_forgot_password')) ?: URL::to('/user/forgot') }}" accept-charset="UTF-8">
            <input type="hidden" name="_token" value="{{{ Session::getToken() }}}">            
            <div class="input-control text">
              <input class="form-control" placeholder="{{{ Lang::get('confide::confide.e_mail') }}}" type="text" name="email" id="email" value="{{{ Input::old('email') }}}">
              <button class="btn-clear"></button>
            </div>
            <button class="button primary" type="submit" value="">{{{ Lang::get('confide::confide.forgot.submit') }}}</button>
        </form>
        </div>
    </div>
</div>
<!-- End Reset password -->
@stop
