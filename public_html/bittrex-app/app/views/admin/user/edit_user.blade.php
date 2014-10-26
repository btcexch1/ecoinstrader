@extends('admin.layouts.master')
@section('content')
<h2>Edit user</h2>
	@if ( is_array(Session::get('error')) )
        <div class="alert alert-error">{{ head(Session::get('error')) }}</div>
	@elseif ( Session::get('error') )
      <div class="alert alert-error">{{{ Session::get('error') }}}</div>
	@endif
	@if ( Session::get('success') )
      <div class="alert alert-success">{{{ Session::get('success') }}}</div>
	@endif

	@if ( Session::get('notice') )
	      <div class="alert">{{{ Session::get('notice') }}}</div>
	@endif
<form class="form-horizontal" role="form" id="edit_user" method="POST" action="{{{ Confide::checkAction('Admin_SettingController@doEditUSer') ?: URL::to('/admin/edit-user') }}}" autocomplete=off>
	<input type="hidden" name="_token" value="{{{ Session::getToken() }}}">
	<div class="form-group">
	    <label for="inputEmail3" class="col-sm-2 control-label">{{trans('admin_texts.firstname')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" class="form-control" name="firstname" id="firstname" value="{{{ $user->firstname }}}">
			</div>	      	      
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputEmail3" class="col-sm-2 control-label">{{trans('admin_texts.lastname')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" class="form-control" name="lastname" id="lastname" value="{{{ $user->lastname }}}">
			</div>	      	      
	    </div>
	</div>	
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{{ Lang::get('confide::confide.e_mail') }}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" name="email" id="email" required="" class="form-control" placeholder="{{{ Lang::get('confide::confide.e_mail') }}}" value="{{{ $user->email }}}">
			</div>	      
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{{ Lang::get('confide::confide.username') }}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input minlength="2" type="text" required="" class="form-control" placeholder="{{{ Lang::get('confide::confide.username') }}}" name="username" id="username" value="{{{ $user->username }}}" readonly>			  
			</div>
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{{ Lang::get('confide::confide.password') }}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			 <input type="password" name="password" id="password" class="form-control" placeholder="{{{ Lang::get('confide::confide.password') }}}">		  
			</div>
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">Authy</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input minlength="2" type="text" class="form-control" placeholder="Authy" name="username" id="username" value="{{{ $user->authy }}}">			  
			</div>
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{{ Lang::get('confide::confide.password_confirmation') }}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input class="form-control" placeholder="{{{ Lang::get('confide::confide.password_confirmation') }}}" type="password" name="password_confirmation" id="password_confirmation">		  
			</div>
	    </div>
	</div>
	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">	    	
		      <div class="checkbox">
		        <label>
		          <input type="checkbox" id="confirmed" name="confirmed" value="1" @if($user->confirmed) checked @endif> Confirmed
		        </label>
		      </div>		        
	    </div>
  	</div>
  	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">	    	
		      <div class="checkbox">
		        <label>
		          <input type="checkbox" id="banned" name="banned" value="1" @if($user->banned) checked @endif> Banned
		        </label>
		      </div>		        
	    </div>
  	</div>
	<h3>Roles</h3>
	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	    	@foreach($roles as $role)
		      <div class="checkbox">
		        <label>
		          <input type="checkbox" id="site_mode" name="roles[]" value="{{$role['name']}}" @if($user->hasRole($role['name'])) checked @endif> {{$role['name']}}
		        </label>
		      </div>
		    @endforeach	       
	    </div>
  	</div>
	<div class="form-group">
		<input type="hidden" class="form-control" id="user_id" value="{{$user->id}}" name="user_id">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-primary" id="do_edit">{{trans('admin_texts.save')}}</button>
	      <a href="{{URL::previous()}}"><button type="button" class="btn btn-default">{{trans('admin_texts.back')}}</button></a>
	    </div>
	</div>
</form>
<div id="messages"></div>
<div id="messageModal" class="modal hide fade" tabindex="-1" role="dialog">		
	<div class="modal-body">		
	</div>
	<div class="modal-footer">
		<button class="btn close-popup" data-dismiss="modal">{{{ trans('texts.close')}}}</button>
	</div>
</div>
{{ HTML::script('assets/js/jquery.validate.min.js') }}
<script type="text/javascript">
    $(document).ready(function() {    	
        $("#edit_user").validate({
            rules: {
                firstname: "required",  
                lastname: "required",                
                password: {
                    minlength: 8
                },
                password_confirmation: {
                    minlength: 8,
                    equalTo: "#password"
                },
                email: {
                    required: true,
                    email: true
                },
            },
            messages: {
                firstname: "Please enter your first name.", 
                lastname: "Please enter your last name.",               
                password: {
                    required: "Please provide a password.",
                    minlength: "Your password must be at least 8 characters long."
                },
                confirm_password: {
                    required: "Please provide a password.",
                    minlength: "Your password must be at least 8 characters long.",
                    equalTo: "Please enter the same password as above."
                },
                email: "Please enter a valid email address.",
            }
	});

   });
</script>
@stop