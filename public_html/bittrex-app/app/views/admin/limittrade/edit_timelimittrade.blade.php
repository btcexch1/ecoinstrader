@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/bootstrap-paginator.js') }}
<h2>{{trans('admin_texts.time_limit_trade')}}</h2>
@if ( Session::get('error') )
      <div class="alert alert-error">{{{ Session::get('error') }}}</div>
	@endif
	@if ( Session::get('success') )
      <div class="alert alert-success">{{{ Session::get('success') }}}</div>
	@endif

	@if ( Session::get('notice') )
	      <div class="alert">{{{ Session::get('notice') }}}</div>
	@endif
<form class="form-horizontal" role="form" id="edit_limit_trade" method="POST" action="{{{ Confide::checkAction('Admin_SettingController@doEditTimeLimitTrade') ?: URL::to('/admin/edit-time-limit-trade') }}}">	
	<input type="hidden" name="_token" value="{{{ Session::getToken() }}}">
	<div class="form-group">
	    <label for="inputEmail3" class="col-sm-2 control-label">{{trans('admin_texts.wallet')}}</label>
	    <div class="col-sm-10">
	    	<strong>{{$limit_trade->wallet_name}}</strong>
			<input name="wallet_id" type="hidden" value="{{$limit_trade->wallet_id}}">	
	    </div>
	</div>		 
	<div class="form-group">
	    <label for="inputEmail3" class="col-sm-2 control-label">{{trans('admin_texts.limit_amount')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" class="form-control" name="limit_amount" id="min_amount" value="{{{ $limit_trade->limit_amount }}}">
			</div>	      	      
	    </div>
	</div>	
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.time_limit')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" class="form-control" id="max_amount" name="time_limit" value="{{{ $limit_trade->time_limit }}}">
			</div>	      
	    </div>
	</div>
	  
	<div class="form-group">
		<input type="hidden" class="form-control" id="market_id" name="market_id">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-primary" id="do_edit">{{trans('admin_texts.save')}}</button>	      
	      <a href="{{URL::previous()}}"><button type="button" class="btn btn-default">{{trans('admin_texts.back')}}</button></a>
	    </div>
	</div>
</form>
{{ HTML::script('assets/js/jquery.validate.min.js') }}
<script type="text/javascript">
(function($){ 
	$(document).ready(function(){		
		$("#edit_limit_trade").validate({
                rules: {
                	min_amount: {
				      required: true,
				      number: true
				    },
				    max_amount: {
				      required: true,
				      number: true
				    }                   
                },
                messages: {
                    min_amount: {
                        required: "Please enter minimal amount.",
                        number: "Please enter a number."
                    },
                    max_amount: {
                        required: "Please enter maximum amount.",
                        number: "Please enter a number."
                    }                    
                }
             });
	});
})(jQuery);
</script>
@stop