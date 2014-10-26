@extends('layouts.main')
@section('title')
{{Lang::get('frontend_texts.member_login')}}
@stop
@section('body')
<div class="container">
    <div class="content">
      <div id="loginfrom" class="formuser">
        <h2>{{Lang::get('frontend_texts.member_login')}}</h2>
        <hr>
        {{ HTML::link('/user/forgot_password', trans('frontend_texts.lost_id_pass'), array('class' => Request::is('/')?'active':'' )) }}

        @if ( Session::get('error') )
            <div class="notice marker-on-bottom bg-darkRed fg-white">{{{ Session::get('error') }}}</div>
        @endif

        @if ( Session::get('notice') )
            <div class="notice marker-on-bottom bg-amber fg-white">{{{ Session::get('notice') }}}</div>
        @endif       
        <form id="login_verify_1" action="{{{ Confide::checkAction('AuthController@socialAjVerifyToken') ?: URL::to('/user/social_verify_token') }}}" method="post">
            <div class="input-control text">
              <input type="text" id="token" name="token" placeholder="{{trans('user_texts.token')}}">
              <button class="btn-clear"></button>
            </div>
            <input type="hidden" id="authy_id" name="authy_id" value="{{Session::get('authy_id')}}"> 
            <input type="hidden" id="user_login" name="user_login" value="{{Session::get('user_login')}}">   
            <button type="submit" class="button primary" id="do_verify">{{trans('user_texts.verify')}}</button>
        </form>
      </div>
    </div>
</div>
@stop
@section('script.footer')
@parent
<script type="text/javascript"> 
  $('#password').keypress(function(e) {
      if (e.keyCode == '13') {
          _tryLogin();
      }
  }); 
    function _tryVerify(){
      var token = $('#login_verify_1').find('#token').val();   
      var authy_id = $('#login_verify_1 #authy_id').val(); 
      var user_login = $('#login_verify_1 #user_login').val();        
      $.post('<?php echo action('AuthController@ajVerifyToken')?>', {isAjax: 1, token: token,authy_id:authy_id ,sociallogin: user_login}, function(response){
          var obj = $.parseJSON(response);
          console.log('ajVerifyToken: ',obj);
          if(obj.status == 'success'){                    
            //location.reload();       
            //document.getElementById("registerForm").submit();               
          }else {
            alert(obj.message);
          }
      });
      return false;
    }
    
</script>
@stop
