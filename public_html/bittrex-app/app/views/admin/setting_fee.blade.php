@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/colorPicker.js') }}
<h2>{{trans('admin_texts.fee_buy_sell')}}</h2>
@if ( Session::get('error') )
      <div class="alert alert-error">{{{ Session::get('error') }}}</div>
	@endif
	@if ( Session::get('success') )
      <div class="alert alert-success">{{{ Session::get('success') }}}</div>
	@endif

	@if ( Session::get('notice') )
	      <div class="alert">{{{ Session::get('notice') }}}</div>
	@endif
<form class="form-horizontal" role="form" id="edit_fee_trade" method="POST" action="{{{ Confide::checkAction('Admin_SettingController@setFeeTrade') ?: URL::to('/admin/set-fee-trade') }}}">	
	<label>{{trans('admin_texts.market')}}: <strong><span class="market_edit">PENG/BTC</span></strong></label> 
	<div class="form-group">
	    <label for="inputEmail3" class="col-sm-2 control-label">{{trans('admin_texts.buy_fee')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" class="form-control" name="buy_fee" id="buy_fee">
			  <span class="add-on">%</span>
			</div>	      	      
	    </div>
	</div>	
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.sell_fee')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" class="form-control" id="sell_fee" name="sell_fee">
			  <span class="add-on">%</span>
			</div>	      
	    </div>
	</div>
	  
	<div class="form-group">
		<input type="hidden" class="form-control" id="market_id" name="market_id">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-primary" id="do_edit">{{trans('admin_texts.save')}}</button>
	    </div>
	</div>
</form>
<div id="messages"></div>
<table class="table table-striped" id="list-fees">
	<tr>
	 	<th>{{trans('admin_texts.market')}}</th>
	 	<th>{{trans('admin_texts.buy_fee')}}</th>
	 	<th>{{trans('admin_texts.sell_fee')}}</th>
	 	<th>{{trans('admin_texts.action')}}</th>
	</tr> 
	@foreach($fee_trades as $fee_trade)
		@if(isset($markets[$fee_trade->market_id]))
		<tr>
			<td><strong>{{$markets[$fee_trade->market_id]['wallet_from'].'/'.$markets[$fee_trade->market_id]['wallet_to']}}</strong></td>
			<td>{{$fee_trade->fee_buy}}%</td>
			<td>{{$fee_trade->fee_sell}}%</td>
			<td><a href="#" class="edit_fee" data-market-id="{{$fee_trade->market_id}}" data-market="{{$markets[$fee_trade->market_id]['wallet_from'].'/'.$markets[$fee_trade->market_id]['wallet_to']}}" data-fee-sell="{{$fee_trade->fee_sell}}" data-fee-buy="{{$fee_trade->fee_buy}}">{{trans('admin_texts.edit')}}</a></td>
		</tr>
		@endif
	@endforeach 
</table>
{{ HTML::script('assets/js/jquery.validate.min.js') }}
<script type="text/javascript">
(function($){ 
	$(document).ready(function(){
		$("#edit_fee_trade").validate({
                rules: {
                	sell_fee: {
				      required: true,
				      number: true
				    },
				    buy_fee: {
				      required: true,
				      number: true
				    }                   
                },
                messages: {
                    sell_fee: {
                        required: "Please enter sell fee.",
                        number: "Please enter a number."
                    },
                    buy_fee: {
                        required: "Please enter buy fee.",
                        number: "Please enter a number."
                    }                    
                }
             });   
		$('#edit_fee_trade').hide();
		$('#list-fees .edit_fee').click(function(e) {
			$('body,html').animate({scrollTop:0},800);
			$('#edit_fee_trade').show();
			var market = $(this).attr('data-market');
			var sell_fee = $(this).attr('data-fee-sell');
			var buy_fee = $(this).attr('data-fee-buy');
			var market_id = $(this).attr('data-market-id');
			$('#edit_fee_trade .market_edit').html(market);
			$('#edit_fee_trade #sell_fee').val(sell_fee);
			$('#edit_fee_trade #buy_fee').val(buy_fee);
			$('#edit_fee_trade #market_id').val(market_id);
		});
		/*$('#edit_fee_trade #do_edit').click(function(e) {
			$('#edit_fee_trade').hide();
			$('#messages').html("<p class='success'>Save successfully!</p>");
		});*/
	});
})(jQuery);
</script>
@stop