@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/bootstrap-paginator.js') }}
<h2>{{trans('admin_texts.manage_users')}}</h2>
<a href="javascript:void()" id="add_user_link">{{trans('admin_texts.add_user')}}</a>
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
<form class="form-horizontal" role="form" id="add_new_user" method="POST" action="{{{ Confide::checkAction('Admin_SettingController@addNewUser') ?: URL::to('/admin/add-user') }}}">
	<input type="hidden" name="_token" value="{{{ Session::getToken() }}}">
	<div class="form-group">
	    <label for="inputEmail3" class="col-sm-2 control-label">{{trans('admin_texts.firstname')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" class="form-control" name="firstname" id="firstname" value="{{{ Input::old('firstname') }}}">
			</div>	      	      
	    </div>
	</div>	
	<div class="form-group">
	    <label for="inputEmail3" class="col-sm-2 control-label">{{trans('admin_texts.lastname')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" class="form-control" name="lastname" id="lastname" value="{{{ Input::old('lastname') }}}">
			</div>	      	      
	    </div>
	</div>	
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{{ Lang::get('confide::confide.e_mail') }}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" name="email" id="email" required="" class="form-control" placeholder="{{{ Lang::get('confide::confide.e_mail') }}}" value="{{{ Input::old('email') }}}">
			</div>	      
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{{ Lang::get('confide::confide.username') }}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input minlength="2" type="text" required="" class="form-control" placeholder="{{{ Lang::get('confide::confide.username') }}}" name="username" id="username" value="{{{ Input::old('username') }}}">			  
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
	    <label for="inputPassword3" class="col-sm-2 control-label">{{{ Lang::get('confide::confide.password_confirmation') }}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input class="form-control" placeholder="{{{ Lang::get('confide::confide.password_confirmation') }}}" type="password" name="password_confirmation" id="password_confirmation">		  
			</div>
	    </div>
	</div>
	<h3>Roles</h3>
	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	    	@foreach($roles as $role)
		      <div class="checkbox">
		        <label>
		          <input type="checkbox" id="site_mode" name="roles[]" value="{{$role->name}}"> {{$role->name}}
		        </label>
		      </div>
		    @endforeach	       
	    </div>
  	</div>
	<div class="form-group">
		<input type="hidden" class="form-control" id="market_id" name="market_id">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-primary" id="do_edit">Add</button>
	    </div>
	</div>
</form>
<div id="messages"></div>
<table class="table table-striped" id="list-fees">
	<tr>
	 	<th>ID</th>
	 	<th>{{trans('admin_texts.name')}}</th>
	 	<th>Username</th>
	 	<th>{{trans('admin_texts.email')}}</th>	
	 	<th>{{trans('admin_texts.role')}}</th>
	 	<th>{{trans('admin_texts.banned')}}</th>
	 	<th>{{trans('admin_texts.verify')}}</th>
	 	<th>{{trans('admin_texts.confirm')}}</th>	 	
	 	<th>{{trans('admin_texts.action')}}</th>
	</tr> 	
	@foreach($users as $user)
	<tr><td>{{$user['id']}}</td><td>{{$user['firstname']}} {{$user['lastname']}}</td><td>{{$user['username']}}</td><td>{{$user['email']}}</td>
		<td>
			<?php $i=1; ?>
			@foreach($user['roles'] as $role)
				@if($i==1)
				{{$role['name']}}
				@else
					, {{$role['name']}}
				@endif
				<?php $i++; ?>
			@endforeach
		</td>		
		@if($user['banned'])
			<td class="status">
				{{Lang::get('admin_texts.banned')}}
				<button id="do_edit" class="btn btn-primary ban_user" type="button" onclick="banUser({{$user['id']}},0)">{{trans('admin_texts.remove_ban_user')}}</button>
			</td>
		@else
			<td>
				{{Lang::get('admin_texts.active')}}
				<button id="do_edit" class="btn btn-primary ban_user" type="button" onclick="banUser({{$user['id']}},1)">{{trans('admin_texts.ban_user')}}</button>				
			</td>
		@endif
		
		@if($user['verified'])
			<td>{{Lang::get('admin_texts.verified')}}
		@else
			<td class="status">{{Lang::get('admin_texts.unverified')}}
		@endif
			<a href="{{URL::to('admin/verify-user')}}/{{$user['id']}}" class="edit_page"><button id="do_edit" class="btn btn-primary" type="button">{{trans('admin_texts.verify_user')}}</button></a>
		</td>
		@if($user['confirmed'])
			<td>{{Lang::get('admin_texts.confirmed')}}</td>
		@else
			<td class="status">{{Lang::get('admin_texts.unconfirmed')}}</td>
		@endif		
		<td><a href="{{URL::to('admin/edit-user')}}/{{$user['id']}}" class="edit_page">{{trans('admin_texts.edit')}}</a>  | <a href="javascript:void();" onclick="deleteUser({{$user['id']}})" class="delete_page">{{trans('admin_texts.delete')}}</a></td>
	</tr>
	@endforeach
	
</table>
<div id="pager"></div>
<div id="messageModal" class="modal hide fade" tabindex="-1" role="dialog">		
	<div class="modal-body">		
	</div>
	<div class="modal-footer">
		<button class="btn close-popup" data-dismiss="modal">{{{ trans('texts.close')}}}</button>
	</div>
</div>
{{ HTML::script('assets/js/jquery.validate.min.js') }}
<script type="text/javascript">
function deleteUser(user_id){
	var r = confirm("<?php echo Lang::get('admin_texts.warning_delete_user') ?>");
	if (r == true) {
		$.post('<?php echo action('Admin_SettingController@deleteUSer')?>', {isAjax: 1, user_id: user_id }, function(response){
	       	var obj = $.parseJSON(response);
		    console.log('obj: ',obj);
		    if(obj.status == 'success'){
	            $('#messageModal .modal-body').html('<p style="color:#008B5D; font-weight:bold;text-align:center;">'+obj.message+'</p>');            
	            $('#messageModal').on('hidden.bs.modal', function (e) {              
	              location.reload();
	            });
	        }else{
	            $('#messageModal .modal-body').html('<p style="color:red; font-weight:bold;text-align:center;">'+obj.message+'</p>');
	        }
	        $('#messageModal').modal({show:true, keyboard:false}); 
	    });
	}
    return false;
}
function banUser(user_id,status){
	$.post('<?php echo action('Admin_SettingController@banUSer')?>', {isAjax: 1, user_id: user_id, status:status }, function(response){
       	var obj = $.parseJSON(response);
	    console.log('obj: ',obj);
	    if(obj.status == 'success'){
            $('#messageModal .modal-body').html('<p style="color:#008B5D; font-weight:bold;text-align:center;">'+obj.message+'</p>');            
            $('#messageModal').on('hidden.bs.modal', function (e) {              
              location.reload();
            });
        }else{
            $('#messageModal .modal-body').html('<p style="color:red; font-weight:bold;text-align:center;">'+obj.message+'</p>');
        }
        $('#messageModal').modal({show:true, keyboard:false}); 
    });
    return false;
}
    $(document).ready(function() {
    	$('#add_new_user').hide();
        $('#add_user_link').click(function(event) {
        	$('#add_new_user').toggle("slow");
        });
        $("#add_new_user").validate({
            rules: {
                firstname: "required",  
                lastname: "required",                
                password: {
                    required: true,
                    minlength: 8
                },
                password_confirmation: {
                    required: true,
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
<script type='text/javascript'>
    var options = {
        currentPage: <?php echo $cur_page ?>,
        totalPages: <?php echo $total_pages ?>,
        alignment:'right',
        pageUrl: function(type, page, current){
        	return "<?php echo URL::to('admin/manage/users'); ?>"+'/'+page;
        }
    }
    $('#pager').bootstrapPaginator(options);
</script>
@stop