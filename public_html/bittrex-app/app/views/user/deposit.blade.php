<!-- Security -->
@section('title')
{{{ trans('texts.deposit')}}}
@stop
<div id="form_deposit">
	<div style="color:red">@if(isset($error_message)) {{$error_message}} @endif</div>
    <h2>{{{ trans('texts.deposit')}}} - {{$current_coin}}</h2> 
    {{Lang::get('user_texts.your_current_available')}} {{$current_coin}} {{Lang::get('user_texts.balance')}}: <strong>{{$balance}}</strong>
    @if($wallet->enable_deposit)
    	@if(!$wallet->is_moneypaper)
	    	<?php 
			function generateQRwithGoogle($url,$widthHeight ='150',$EC_level='L',$margin='0') {
				$url = urlencode($url); 
				echo '<img src="http://chart.apis.google.com/chart?chs='.$widthHeight.
				'x'.$widthHeight.'&cht=qr&chld='.$EC_level.'|'.$margin.
				'&chl='.$url.'" alt="QR code" widthHeight="'.$widthHeight.
				'" widthHeight="'.$widthHeight.'"/>';
			}
			?>
		    <h3>{{Lang::get('user_texts.your_address_deposit')}}</h3>
		    <div class="addressSection">
		    	<div class="options box" style="display: inline-block;"><span id="address">{{$address_deposit}}</span> &nbsp; <input type="button" id="copy-button" class="inline" data-clipboard-target="address" value="Copy"></div>
		    	<?php
		    	$urlToEncode=$address_deposit;
				generateQRwithGoogle($urlToEncode);			
		    	?>
		    	<p>{{Lang::get('user_texts.note_generate_new_address')}}</p>
		    	<br><span id="s_message"></span> 
		    	<br><input class="generateAddress inverse" type="button"  value="{{Lang::get('user_texts.generate_new_address')}}" onclick="generateNewAddrDeposit()">

		    </div>
		    <input type="hidden" name="wallet_id" id="wallet_id" value="{{$wallet_id}}">
		    {{ HTML::script('assets/zeroclipboard/ZeroClipboard.min.js') }}
		   	<script type="text/javascript">
			 	var client = new ZeroClipboard(document.getElementById("copy-button"), {
			    	moviePath: "{{asset('assets/js/zeroclipboard/zeroclipboard.swf')}}"
			  	});

			  	client.on( "load", function(client) {

				    client.on( "complete", function(client, args) {
				      // `this` is the element that was clicked
				      $(this).css("background", "#666");
				      $(this).val("Copied");
				    });
			  	});
			  	function generateNewAddrDeposit(){
			  		$('input.generateAddress').hide();
			      	var wallet_id = $('#wallet_id').val();    
			      	$.post('<?php echo action('DepositController@generateNewAddrDeposit')?>', {isAjax: 1, wallet_id: wallet_id}, function(response){
			          var obj = $.parseJSON(response);
			          //console.log('ajVerifyToken: ',obj);
			          $('input.generateAddress').show();
			          if(obj.status == 'success'){                  
			             $('#address').html(obj.address);  
			          }else {
			          	$('#s_message').html('<p style="color:red; font-weight:bold;text-align:center;">'+obj.message+'</p>');
			          }
			      	});
			      return false;
			    }
			</script>
		@else
			<div class="panel">
			    <div class="panel-header bg-lightBlue fg-white">{{{ trans('user_texts.create_deposit')}}}</div>
			    <div class="panel-content">
			    	<form id="notifyDeposit" class="form-horizontal" method="POST" action="{{{ URL::to('/user/notify-deposit') }}}">
						<p>{{Lang::get('user_texts.note_deposit_currency')}}</p> 
						<div style="color:red" id="message_errors"></div>
					    @if ( Session::get('error') )
					        <div class="notice marker-on-bottom bg-darkRed fg-white">        	
					            @if ( is_array(Session::get('error')) )
					                {{ head(Session::get('error')) }}
					            @else
					            	{{ Session::get('error') }}
					            @endif
					        </div>
					    @endif
					    @if ( Session::get('success') )
					        <div class="notice marker-on-bottom fg-white">            
					            {{ Session::get('success') }}
					        </div>
					    @endif  
					    @if ( Session::get('notice') )
					        <div class="notice marker-on-bottom bg-amber fg-white">            
					            {{ Session::get('notice') }}
					        </div>
					    @endif 
					    <label>{{Lang::get('user_texts.your_info_account')}}</label>
					    <div class="input-control text">
						    <textarea id="address" name="address" required="" cols="60" rows="5"></textarea>
						    <p class="text-small"><em>{{Lang::get('user_texts.note_your_account')}}</em></p>
						</div>
						<label>{{Lang::get('user_texts.method_payment')}}</label>
						<div class="input-control select size3">
							<select name="transaction_id" id="method_deposit">
								@foreach($method_deposits as $method)
								<option data-min="{{$method->dmin}}" value="{{$method->dname}} - fee {{$method->dfee}}%">{{$method->dname}}</option>
								@endforeach
							</select>
						</div>
						<label>{{Lang::get('user_texts.amount')}} {{$current_coin}}</label>
						<div class="input-control text size3">						
						    <input type="text" class="form-control" id="amount" name="amount" required>
						</div>
						<div class="input-control text">	
							<input type="hidden" name="wallet_id" value="{{$wallet->id}}">
							<button type="submit" class="button btn-primary">{{trans('user_texts.create_deposit')}}</button>	
						</div>
						
					</form>
			    </div>
			</div>
			<br>
			<h3>{{Lang::get('user_texts.our_account')}}</h3>
			<table class="table striped hovered">
				<thead>	
					<tr> 	
					 	<th>{{Lang::get('user_texts.method_name')}}</th>
					 	<th>{{Lang::get('user_texts.method_fee')}} (%)</th>	 	
					 	<th>{{Lang::get('user_texts.method_min_value')}}</th>
					 	<th>{{Lang::get('user_texts.method_description')}}</th>	 	
					 	<th>{{Lang::get('user_texts.method_min_fee')}}</th>
					 </tr>
				</thead>
				<tbody>
					@foreach($method_deposits as $method)
					<tr><td>{{$method->dname}}</td><td>{{$method->dfee}}</td><td>{{$method->dmin}}</td><td>{{$method->ddes}}</td><td>{{$method->dminfee}}</td></tr>
					@endforeach	
				</tbody>	
				
			</table>
			@section('script.footer')
			@parent
			{{ HTML::script('assets/js/jquery.validate.min.js') }}
			   	<script type="text/javascript">	
			   		function checkAmount(){
			   			$('#message_errors').html('');
			   			var amount =parseFloat( $('#amount').val());
			   			var method_deposit = document.getElementById("method_deposit");
						var method = method_deposit.options[method_deposit.selectedIndex];	
						var amount_min = parseFloat(method.getAttribute('data-min'));				    	   
					    //console.log('amount_min: ', amount_min);				    
					    if(amount<amount_min){
					    	$('#message_errors').html("Amount must be greater than "+amount_min);
					    	return false;
					    }else return true;
			   		}
			   		$(document).ready(function() { 			   		
						$('#amount, #method_deposit').change(function(event) {
							checkAmount();
						});          
			            $("#notifyDeposit").validate({
			                rules: {
			                	amount: {
							      required: true,
							      number: true,						      
							    }                   
			                },
			                messages: {
			                    amount: {
			                        required: "Please enter amount.",
			                        number: "Please enter a number."
			                    },
			                    address: "Please enter your account information."
			                },
			                submitHandler: function(form) {
			                	if(checkAmount()){
			                		$('button[type=submit]').hide();
			                    	form.submit();
			                	}
			                    
			                }
			             });           
			       });
			</script>
			@stop
		@endif
    @else
    	<div class="notice marker-on-bottom bg-amber fg-white">            
            {{Lang::get('user_texts.notify_deposit_disable',array('coin'=>$wallet->name))}}
        </div>
    @endif    
</div>