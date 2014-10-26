@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/colorPicker.js') }}
<h2>{{trans('admin_texts.general')}}</h2>
<form class="form-horizontal" role="form" method="POST" action="{{{ Confide::checkAction('Admin_SettingController@updateSetting') ?: URL::to('/admin/update-setting') }}}" enctype="multipart/form-data" id="setting_general">
	@if ( Session::get('error') )
      <div class="alert alert-error">{{{ Session::get('error') }}}</div>
	@endif
	@if ( Session::get('success') )
      <div class="alert alert-success">{{{ Session::get('success') }}}</div>
	@endif

	@if ( Session::get('notice') )
	    <div class="alert">{{{ Session::get('notice') }}}</div>
	@endif
	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <div class="checkbox">
	        <label>
	          <input type="checkbox" @if($site_mode) {{'checked'}} @endif id="site_mode" name="site_mode" value="1"> {{trans('admin_texts.site_maintenance_mode')}}
	        </label>
	      </div>
	    </div>
  	</div>	
	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <div class="checkbox">
	        <label>
	          <input type="checkbox" @if($disable_withdraw) {{'checked'}} @endif id="disable_withdraw" name="disable_withdraw" value="1"> {{trans('admin_texts.disable_withdraw')}}
	        </label>
	      </div>
	    </div>
  	</div>
  	
  	<div class="form-group">
		<label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.amount_btc_per_vote')}}</label>
		<div class="col-lg-10">
			<input type="text" class="form-control" id="amount_btc_per_vote" name="amount_btc_per_vote" value="{{$amount_btc_per_vote}}">
		</div>
	</div>
	<div class="form-group">
		<label for="inputPassword3" class="col-sm-2 control-label">{{{ trans('admin_texts.market_default')}}}</label>
		<div class="col-lg-10">
			<select id="pair" class="form-control" name="default_market">		        
		        @foreach($markets as $key=> $market)
		            <option value="{{$market['id']}}" @if($default_market==$market['id']) selected @endif>{{ strtoupper($market['wallet_from'].'/'.$market['wallet_to'])}}</option>
		        @endforeach
		    </select>
		</div>
	</div>	
	<div class="form-group">
		<label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.max_amount_funds')}}</label>
		<div class="col-lg-10">
			<div class="input-append">					
			  <input type="text" class="form-control" id="max_amount_funds" name="max_amount_funds" value="{{$max_amount_funds}}">
			  <span class="add-on">USD</span>
			</div>				
			<p><em>{{Lang::get('admin_texts.note_max_amount_funds')}}</em></p>
		</div>
	</div>
	<!-- Point -->
	<h3>{{trans('admin_texts.site_points')}}</h3>
	<div>
		<div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <div class="checkbox">
		        <label>
		          <input type="checkbox" @if($disable_points) {{'checked'}} @endif id="disable_points" name="disable_points" value="1"> {{trans('admin_texts.disable_points')}}
		        </label>
		      </div>
		    </div>
	  	</div>
	  	<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.each_points')}} <span>=</span></label>
			<div class="col-lg-10">				
				<div class="input-append">					
				  <input type="text" class="form-control" id="point_per_btc" name="point_per_btc" value="{{$point_per_btc}}">
				  <span class="add-on">BTC</span>
				</div>			
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.percent_point_reward_trade')}}</label>
			<div class="col-lg-10">
				<div class="input-append">
					<input type="text" class="form-control" id="percent_point_reward_trade" name="percent_point_reward_trade" value="{{$percent_point_reward_trade}}">
					<span class="add-on">%</span>
				</div>
			</div>
		</div>
		<div class="form-group clear">
			<label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.percent_point_reward_referred_trade')}}</label>
			<div class="col-lg-10">
				<div class="input-append">
					<input type="text" class="form-control" id="percent_point_reward_referred_trade" name="percent_point_reward_referred_trade" value="{{$percent_point_reward_referred_trade}}">
					<span class="add-on">%</span>
				</div>
			</div>
		</div>
	</div>
	
  	<!-- End point -->

  	<h3 class="clear">Google Captcha</h3>
	<div class="form-group">
		<label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.publuckey')}}</label>
		<div class="col-lg-10">
			<input type="text" class="form-control" id="recaptcha_publickey" name="recaptcha_publickey" value="{{$recaptcha_publickey}}" required>
		</div>
	</div>
	<div class="form-group">
		<label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.privatekey')}}</label>
		<div class="col-lg-10">
			<input type="text" class="form-control" id="recaptcha_privatekey" name="recaptcha_privatekey" value="{{$recaptcha_privatekey}}" required>
		</div>
	</div>
	<h3>App Credentials of Pusher</h3>
	<div class="form-group">
		<label class="col-sm-2 control-label">{{trans('admin_texts.app_id')}}</label>
		<div class="col-lg-10">
			<input type="text" class="form-control" id="pusher_app_id" name="pusher_app_id" value="{{$pusher_app_id}}" required>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">{{trans('admin_texts.key')}}</label>
		<div class="col-lg-10">
			<input type="text" class="form-control" id="pusher_app_key" name="pusher_app_key" value="{{$pusher_app_key}}" required>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">{{trans('admin_texts.secret')}}</label>
		<div class="col-lg-10">
			<input type="text" class="form-control" id="pusher_app_secret" name="pusher_app_secret" value="{{$pusher_app_secret}}" required>
		</div>
	</div>
	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-primary">{{trans('admin_texts.save_settings')}}</button>
	    </div>
	</div>
</form>
{{ HTML::script('assets/js/jquery.validate.min.js') }}
<script type="text/javascript">
(function($){ 
	$(document).ready(function(){
		$("#setting_general").validate({
            rules: {
            	amount_btc_per_vote: {			      
			      number: true
			    },
			    point_per_btc: {
			      required: true,
			      number: true
			    },
			    max_amount_funds:{			      
			      number: true
			    },
			    percent_point_reward_trade: {
			      required: true,
			      number: true
			    },
			    percent_point_reward_referred_trade: {
			      required: true,
			      number: true
			    }                   
            },
            messages: {
                amount_btc_per_vote: {                    
                    number: "Please enter a number."
                },
                point_per_btc: {
                    required: "Please enter a value.",
                    number: "Please enter a number."
                },
                percent_point_reward_trade: {
                    required: "Please enter a value.",
                    number: "Please enter a number."
                }, 
                percent_point_reward_referred_trade: {
                    required: "Please enter a value.",
                    number: "Please enter a number."
                },
                max_amount_funds: {                    
                    number: "Please enter a number."
                }
            }
        });
	});
})(jQuery);
</script>
@stop