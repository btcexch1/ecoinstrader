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
        <form id="registerForm" method="POST" action="{{{ Confide::checkAction('UserController@do_login') ?: URL::to('/user/login') }}}" >      
          <input type="hidden" name="_token" value="{{{ Session::getToken() }}}">
          <div class="input-control text">
              <input type="text" name="email" id="email" value="{{{ Input::old('email') }}}" placeholder="{{{ Lang::get('confide::confide.username_e_mail') }}}"/>
              <button class="btn-clear"></button>
          </div>
          <div class="input-control text">
            <input type="password" name="password" id="password" value="" placeholder="{{{ Lang::get('confide::confide.password') }}}" autocomplete="off"/>
            <button class="btn-reveal"></button>
          </div>  
          <div class="input-control checkbox">
            <label>
              <input type="hidden" name="remember" value="0" >
              <input type="checkbox" name="remember" id="remember" value="1"/>
              <span class="check"></span>
              {{{ Lang::get('confide::confide.login.remember') }}}
            </label>
          </div>
          <button type="button" class="button primary" onclick="_tryLogin()">{{Lang::get('frontend_texts.login')}}</button>           
        </form>
        <form id="login_verify_1" onsubmit="return _tryVerify()" action="{{{ Confide::checkAction('AuthController@ajVerifyToken') ?: URL::to('/user/verify_token') }}}" method="post" style="margin-bottom:4px;display:none;">
            <div class="input-control text">
              <input type="text" id="token" name="token" placeholder="{{trans('user_texts.token')}}">
              <button class="btn-clear"></button>
            </div>
            <input type="hidden" id="authy_id" name="authy_id">  
            <button type="button" class="button primary" id="do_verify" onclick="_tryVerify()">{{trans('user_texts.verify')}}</button>
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
      $.post('<?php echo action('AuthController@ajVerifyToken')?>', {isAjax: 1, token: token,authy_id:authy_id }, function(response){
          var obj = $.parseJSON(response);
          console.log('ajVerifyToken: ',obj);
          if(obj.status == 'success'){                  
            document.getElementById("registerForm").submit();               
          }else {
            alert(obj.message);
          }
      });
      return false;
    }
    function _tryLogin(){
        var email = $('#registerForm #email').val();
        var password = $('#registerForm #password').val();            
        $.post('<?php echo action('UserController@firstAuth')?>', {isAjax: 1, email: email, password: password }, function(response){
            console.log('befor Obj: ',obj);
            var obj = $.parseJSON(response);
            console.log('Obj: ',obj);
            if(obj.status == 'one_login_success'){                  
              document.getElementById("registerForm").submit();  
              return true;              
            }else if(obj.status == 'two_login'){
              $('#registerForm').hide();
              $('#login_verify_1').show();
              $('#login_verify_1 #authy_id').val(obj.authy_id);
            }else {
              alert(obj.message);
            }
        });
        return false;
    }
</script>
@stop
