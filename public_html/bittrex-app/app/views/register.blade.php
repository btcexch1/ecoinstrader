@extends('layouts.main')
@section('title')
{{Lang::get('frontend_texts.open_account')}}
@stop
@section('body')
<div class="container">
    <div class="content">
        <div id="signupfrom" class="formuser">
            <script type="text/javascript">
             var RecaptchaOptions = {
                theme : 'clean'
             };
             </script>
            <h2>{{Lang::get('frontend_texts.open_account')}}</h2>
            <p>Open your <span style="color:green;text-transform: uppercase">Free</span> account</p>
            @if ( Session::get('error') )
                <div class="notice marker-on-bottom bg-darkRed fg-white">
                    @if ( is_array(Session::get('error')) )
                        {{ head(Session::get('error')) }}
                    @endif
                </div>
            @endif

            @if ( Session::get('notice') )
                <div class="notice marker-on-bottom bg-amber fg-white">{{ Session::get('notice') }}</div>
            @endif
            <form id="registerForm" method="POST" action="{{{ (Confide::checkAction('UserController@store')) ?: URL::to('user')  }}}" accept-charset="UTF-8">
                <input type="hidden" name="_token" value="{{{ Session::getToken() }}}">
                <div class="input-control text">
                    <input minlength="2" type="text" required="" name="firstname" id="firstname" value="{{{ Input::old('firstname') }}}"  placeholder="{{trans('frontend_texts.firstname')}}">
                    <button class="btn-clear"></button>
                </div>
                <div class="input-control text">
                    <input type="text" required="" name="lastname" id="lastname" value="{{{ Input::old('lastname') }}}" placeholder="{{Lang::get('frontend_texts.lastname')}}"/>
                    <button class="btn-clear"></button>
                </div>
                <div class="input-control text">
                    <input type="text" name="email" id="email" required="" class="form-control" placeholder="{{{ Lang::get('confide::confide.e_mail') }}}" value="{{{ Input::old('email') }}}">
                    <button class="btn-clear"></button>
                </div>
                <div class="input-control text">
                    <input minlength="2" type="text" required="" class="form-control" placeholder="{{{ Lang::get('confide::confide.username') }}}" name="username" id="username" value="{{{ Input::old('username') }}}">
                    <button class="btn-clear"></button>
                </div >               
                <input type="hidden" value="@if(isset($referral)){{$referral}}@else{{{Input::old('referral')}}}@endif" name="referral">
                <p>{{Lang::get('frontend_texts.id_pass_send_to_mail')}}</p>
                <button type="submit" class="button primary">{{Lang::get('frontend_texts.register')}}</button>                
            </form>
        </div>        
    </div>
</div>
@stop
@section('script.footer')
@parent
{{ HTML::script('assets/js/jquery.validate.min.js') }}
<script type="text/javascript">
    $(document).ready(function() {
        
        $("#registerForm").validate({
            rules: {
                firstname: "required",
                lastname: "required",
                email: {
                    required: true,
                    email: true
                },                
                termsofservice: "required"
            },
            messages: {
                firstname: "Please enter your first name.",
                lastname: "Please enter your last name.",                
                email: "Please enter a valid email address.",
                termsofservice: "Please accept our TOS."
            }
	    });
    });
</script>
@stop