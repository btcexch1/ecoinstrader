@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/colorPicker.js') }}
<h2>{{trans('admin_texts.fee_withdraw')}}</h2>
@if ( Session::get('error') )
  <div class="alert alert-error">{{{ Session::get('error') }}}</div>
@endif
@if ( Session::get('success') )
  <div class="alert alert-success">{{{ Session::get('success') }}}</div>
@endif

@if ( Session::get('notice') )
      <div class="alert">{{{ Session::get('notice') }}}</div>
@endif
<form class="form-horizontal" role="form" id="edit_fee_withdraw" method="POST" action="{{{ Confide::checkAction('Admin_SettingController@setFeeWithdraw') ?: URL::to('/admin/set-fee-withdraw') }}}">	
	<label>{{trans('admin_texts.market')}}: <strong><span class="coin_edit"></span></strong></label> 
	<div class="form-group">
	    <label for="inputEmail3" class="col-sm-2 control-label">{{trans('admin_texts.fee_withdraw')}}</label>
	    <div class="col-sm-10">	       
	      	<div class="input-append">
			  <input type="text" class="form-control" name="fee_withdraw" id="fee_withdraw">	
			  <span class="add-on coincode"></span>
			</div>     
	    </div>	    
	</div>	
	
	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	    	<input type="hidden" name="coin" id="coin">
	      <button type="submit" class="btn btn-primary" id="do_edit">{{trans('admin_texts.save')}}</button>
	    </div>
	</div>
</form>
<div id="messages"></div>
<table class="table table-striped" id="list-fees">
	<tr>
	 	<th>{{trans('admin_texts.coin_code')}}</th>
	 	<th>{{trans('admin_texts.coin_name')}}</th>
	 	<th>{{trans('admin_texts.fee_withdraw')}}</th>
	 	<th>{{trans('admin_texts.action')}}</th>
	</tr> 	
	@foreach($fee_withdraws as $fee_withdraw)
	<tr><td><strong>{{$fee_withdraw->type}}</strong></td><td>{{$fee_withdraw->name}}</td><td>{{sprintf('%.8f',$fee_withdraw->percent_fee)}} {{$fee_withdraw->type}}</td><td><a href="#" class="edit_fee" data-coin-id="{{$fee_withdraw->wallet_id}}" data-coin="{{$fee_withdraw->type}}" data-fee-withdraw="{{sprintf('%.8f',$fee_withdraw->percent_fee)}}">{{trans('admin_texts.edit')}}</a></td></tr>
	@endforeach
</table>
{{ HTML::script('assets/js/jquery.validate.min.js') }}
<script type="text/javascript">
(function($){ 
	$(document).ready(function(){
		$("#edit_fee_withdraw").validate({
                rules: {
                	fee_withdraw: {
				      required: true,
				      number: true
				    }             
                },
                messages: {
                    fee_withdraw: {
                        required: "Please enter withdraw fee.",
                        number: "Please enter a number."
                    }                
                }
             });   
		$('#edit_fee_withdraw').hide();
		$('#list-fees .edit_fee').click(function(e) {
			$('body,html').animate({scrollTop:0},800);
			$('#edit_fee_withdraw').show();
			var coin = $(this).attr('data-coin');
			var fee_withdraw = $(this).attr('data-fee-withdraw');
			var coin_id = $(this).attr('data-coin-id');
			$('#edit_fee_withdraw .coincode').html(coin);	
			$('#edit_fee_withdraw .coin_edit').html(coin);
			$('#edit_fee_withdraw #coin').val(coin_id);			
			$('#edit_fee_withdraw #fee_withdraw').val(fee_withdraw);
		});
		
	});
})(jQuery);
</script>
@stop