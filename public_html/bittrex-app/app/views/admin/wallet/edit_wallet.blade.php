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
<form class="form-horizontal" role="form" id="edit_wallet" method="POST" action="{{{ Confide::checkAction('Admin_SettingController@doEditWallet') ?: URL::to('/admin/edit-wallet') }}}" enctype="multipart/form-data">
	<input type="hidden" name="_token" value="{{{ Session::getToken() }}}">
	<div class="form-group">
	    <label for="inputEmail3" class="col-sm-2 control-label">{{trans('admin_texts.coin_code')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" class="form-control" required="" name="type" id="type" value="{{{ $wallet->type }}}" readonly>
			</div>	      	      
	    </div>
	</div>	
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.coin_name')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" name="name" id="name" required="" class="form-control" value="{{{ $wallet->name }}}">
			</div>	      
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.wallet_username')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input minlength="2" type="text" required="" class="form-control" name="wallet_username" id="wallet_username" value="{{{ $wallet->wallet_username }}}">			  
			</div>
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{{ Lang::get('confide::confide.password') }}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			 <input type="text" name="password" id="password" class="form-control" required="" value="{{{ $wallet->wallet_password }}}">		  
			</div>
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.ip')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input class="form-control" type="text" name="ip" id="ip" required="" value="{{{ $wallet->wallet_ip }}}">		  
			</div>
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.port')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input class="form-control" type="text" name="port" id="port" required="" value="{{{ $wallet->port }}}">		  
			</div>
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.limit_confirmations')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input class="form-control" type="text" name="limit_confirmations" id="limit_confirmations" required="" value="{{{ $wallet->limit_confirmations }}}">		  
			</div>
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.download_wallet_client')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input class="form-control" type="text" name="download_wallet_client" id="download_wallet_client"  value="{{{ $wallet->download_wallet_client }}}">		  
			</div>
	    </div>
	</div>
	<div class="form-group">
	    <label class="col-sm-2 control-label">{{trans('admin_texts.logo_coin')}}</label>
	    <div class="col-sm-10">
	      <input type="file" class="form-control" id="logo_coin" name="logo_coin">
	      @if($wallet->logo_coin!='')
	      <img src="{{asset('')}}/{{$wallet->logo_coin}}"  style="height:50px; width:50px">
	      @endif
	    </div>
	</div>
	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <div class="checkbox">
	        <label>
	          <input type="checkbox" <?php if($wallet->is_moneypaper) echo 'checked'; ?> id="is_moneypaper" name="is_moneypaper" value="1"> {{trans('admin_texts.is_moneypaper')}}
	        </label>
	      </div>
	    </div>
  	</div>
  	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <div class="checkbox">
	        <label>	         
	          <input type="checkbox" id="enable_deposit" name="enable_deposit" value="1" @if($wallet->enable_deposit) checked @endif> {{trans('admin_texts.enable_deposit')}}
	        </label>
	      </div>
	    </div>
  	</div>	
  	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <div class="checkbox">
	        <label>	         
	          <input type="checkbox" id="enable_withdraw" name="enable_withdraw" value="1"  @if($wallet->enable_withdraw) checked @endif> {{trans('admin_texts.enable_withdraw')}}
	        </label>
	      </div>
	    </div>
  	</div>
	<div class="form-group">		
	    <div class="col-sm-offset-2 col-sm-10">
	    	<input type="hidden" class="form-control" id="wallet_id" name="wallet_id" value="{{$wallet->id}}">
	      <button type="submit" class="btn btn-primary" id="do_add">{{trans('admin_texts.save')}}</button>
	      <a href="{{URL::previous()}}"><button type="button" class="btn btn-default">{{trans('admin_texts.back')}}</button></a>
	    </div>
	</div>
</form>
{{ HTML::script('assets/js/jquery.validate.min.js') }}
<script type="text/javascript">
    $(document).ready(function() {    	
        $("#edit_wallet").validate({
            rules: {
                type: "required",
                name: "required",
                ip: "required",
                port: {
                    required: true,
                    number: true
                },                
                password: "required",
            },
            messages: {
                type: "Please provide a type of wallet.", 
                name: "Please provide a name of wallet.", 
                ip: "Please provide a ip.",  
                port: {
                    required: "Please provide a port.",
                    number: "Port must be a number."
                },              
                password: "Please provide a password.",
            }
	});

   });
</script>
@stop