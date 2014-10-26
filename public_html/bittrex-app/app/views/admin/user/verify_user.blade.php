@extends('admin.layouts.master')
@section('content')
<h2>Verify User</h2>
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
<form class="form-horizontal" role="form" id="edit_user" method="POST" action="{{{ Confide::checkAction('Admin_SettingController@doVerifyUSer') ?: URL::to('/admin/verify-user') }}}" autocomplete=off>
	<input type="hidden" name="_token" value="{{{ Session::getToken() }}}">
	<table class="table stripped">
		<tr>
			<td style="width:180px;" align="right">{{trans('user_texts.address')}} 1</td>
			<td><?php if(isset($userinfo['address_1'])) echo $userinfo['address_1'] ?></td>
		</tr>
		<tr>
			<td style="width:180px;" align="right">{{trans('user_texts.address')}} 2</td>
			<td><?php if(isset($userinfo['address_2'])) echo $userinfo['address_2'] ?></td>
		</tr>
		<tr>
			<td style="width:180px;" align="right">{{trans('user_texts.city')}}</td>
			<td><?php if(isset($userinfo['city'])) echo $userinfo['city'] ?></td>
		</tr>
		<tr>
			<td style="width:180px;" align="right">{{trans('user_texts.postal_code')}}</td>
			<td><?php if(isset($userinfo['postal_code'])) echo $userinfo['postal_code'] ?></td>
		</tr>
		<tr>
			<td style="width:180px;" align="right">{{trans('user_texts.country')}}</td>
			<td><?php if(isset($userinfo['country'])) echo $userinfo['country'] ?></td>
		</tr>
		<tr>
			<td style="width:180px;" align="right">{{trans('user_texts.state')}}</td>
			<td><?php if(isset($userinfo['state'])) echo $userinfo['state'] ?></td>
		</tr>
		<tr>
			<td style="width:180px;" align="right">{{trans('user_texts.date_birth')}}</td>
			<td><?php if(isset($userinfo['date_birth'])) echo $userinfo['date_birth'] ?></td>
		</tr>
		<tr>
			<td style="width:180px;" align="right">{{trans('user_texts.government_photo')}}</td>
			<td>@if(!empty($userinfo['government_photo_1'])) <img width="100%" src="{{asset($userinfo['government_photo_1'])}}"> @endif</td>
		</tr>
		<tr>
			<td style="width:180px;" align="right">{{trans('user_texts.government_photo_face')}} 1</td>
			<td>@if(!empty($userinfo['government_photo_2'])) <img width="100%" src="{{asset($userinfo['government_photo_2'])}}"> @endif</td>
		</tr>
		<tr>
			<td style="width:180px;" align="right">{{trans('user_texts.utility_bill')}}</td>
			<td>@if(!empty($userinfo['utility_bill'])) <img width="100%" src="{{asset($userinfo['utility_bill'])}}"> @endif</td>
		</tr>
	</table>
	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">	    	
		      <div class="checkbox">
		        <label>
		          <input type="checkbox" id="verified" name="verified" value="1" @if($user->verified) checked @endif> Verified
		        </label>
		      </div>		        
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
@stop