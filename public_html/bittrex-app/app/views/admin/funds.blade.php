@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/colorPicker.js') }}
<h2>{{trans('admin_texts.funds')}}</h2>
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
@foreach($wallets as $wallet)
<?php 
if(isset($balances[$wallet->id])) 
	$balance = sprintf('%.8f',$balances[$wallet->id]); 
else $balance = sprintf('%.8f',0);
if(isset($fee_withdraws[$wallet->id])) 
	$fee_withdraw = sprintf('%.8f',$fee_withdraws[$wallet->id]); 
else $fee_withdraw = sprintf('%.8f',0);
?>
<table class="table table-bordered noboder-td">
    <tbody>
       	<tr>
            <td> <h3 style="margin-bottom: 2px;">{{$wallet->type}}</h3> <p>Balance: <b>{{$balance}}</b> {{$wallet->type}}</p></td>
            <td>                
                <button class="btn btn-primary" onclick="do_withdraw('{{$wallet->type}}',{{$balance}},{{$fee_withdraw}})">{{trans('admin_texts.withdraw')}}</button>
            </td>
        </tr>
    </tbody>
</table>
@endforeach

<div id="form-withdraw">
	<form class="form-horizontal" role="form" autocomplete=off id="form-send-coin" method="POST" action="{{{ Confide::checkAction('Admin_SettingController@doSendCoin') ?: URL::to('/admin/send-coin') }}}">	
		<label class="blue"><strong>{{trans('admin_texts.withdrawal')}} <span class="coin_code"></span></strong></label> 
		<label>{{trans('admin_texts.available_funds')}}<strong> <span class="coin_available blue"></span> <span class="coin_code"></span></strong></label>
		<div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">{{trans('admin_texts.address')}}</label>
		    <div class="col-sm-10">	       
		      	<div class="input-append">
				  <input type="text" class="form-control" required name="address" id="address">
				</div>     
		    </div>	    
		</div>	
		<div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">{{trans('admin_texts.amount')}}</label>
		    <div class="col-sm-10">	       
		      	<div class="input-append">
				  <input type="text" class="form-control" required name="amount" id="amount">	
				  <span class="add-on coin_code"></span>
				</div>     
		    </div>	    
		</div>	
		<div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">{{trans('admin_texts.will_receive')}}</label>
		    <div class="col-sm-10">	       
		      	<div class="input-append">
		      		<input type="hidden" name="wallet_type" id="wallet_type" value="">
				  <input type="text" class="form-control" name="receive_amount" id="receive_amount" readonly>	
				  <span class="add-on coin_code"></span>
				</div>     
		    </div>	    
		</div>
		
		<div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-primary" id="do_edit">{{trans('admin_texts.withdraw')}}</button>
		    </div>
		</div>
	</form>
	<div class="info">
		<p class="gray">* Min amount for withdrawal - <span id="coin_min">0.001</span> <span class="coin_code">BTC</span>.</p>
		<p class="gray">* Be patient, transfer of funds will be before the first confirmation.</p>	
		<p class="gray">* Fee for withdrawal is <span id="coin_fee">0.001</span> <span class="coin_code"></span>.</p>		
	</div>
</div>
<div id="messageModal" class="modal hide fade" tabindex="-1" role="dialog">		
	<div class="modal-body">		
	</div>
	<div class="modal-footer">
		<button class="btn close-popup" data-dismiss="modal">{{{ trans('texts.close')}}}</button>
	</div>
</div>
{{ HTML::script('assets/js/jquery.validate.min.js') }}
<script type="text/javascript">
function do_withdraw(coin,coin_available,fee_withdraw){
	$("html, body").animate({ scrollTop: $(document).height() }, 1000);
	$('#form-withdraw').show();
	$('#form-withdraw .coin_code').html(coin);
	$('#form-withdraw .coin_available').html(coin_available);
	$('#coin_fee').html(fee_withdraw.toFixed(8));
	$('#coin_min').html((0.0001+fee_withdraw).toFixed(8));
	$('#wallet_type').val(coin);
}
(function($){ 
	$('#form-withdraw').hide();
	$('#amount').keyup(function(event) {
		    var amount =parseFloat( $('#amount').val());		    
		    var fee = parseFloat($('#coin_fee').html());
		    var total = amount-fee;		   
		    $('#receive_amount').val(total.toFixed(8));
		});

	$("#form-send-coin").validate({
            rules: {
                address: {required: true},                
                amount: {
                    required: true,
                    number: true
                }
            },
            messages: {
                address: "Please enter receive address.",               
                amount: {
                    required: "Please provide amount.",
                    number: "Amount must be a number."
                }
            }
	});  
})(jQuery);
</script>
@stop