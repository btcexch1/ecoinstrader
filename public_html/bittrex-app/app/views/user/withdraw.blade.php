<!-- Security -->
@section('title')
{{{ trans('texts.withdraw')}}}
@stop
<div id="form_deposit">	
	<div class="panel">
	    <div class="panel-header bg-lightBlue fg-white">{{{ trans('texts.withdraw')}}} - {{$current_coin}}</div>
	    <div class="panel-content">
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
		    @if($wallet->enable_withdraw)
		    	@if(!$wallet->is_moneypaper)
			    	<form id="wihtdrawForm" class="form-horizontal" method="POST" action="{{{ Confide::checkAction('UserController@doWithdraw') ?: URL::to('/user/withdraw') }}}">
				    	<div style="color:red">@if(isset($error_message)) {{$error_message}} @endif</div>	    
					    <!-- <div class="warning box">Once submitted, all requests <strong>MUST</strong> be confirmed via email. Please only contact support if you have not received the confirmation email.</div> -->
					    <p>{{Lang::get('user_texts.your_current_available')}} {{$current_coin}} {{Lang::get('user_texts.balance')}}: <strong>{{$balance}}</strong></p> 				    
				    	<table class="table striped noborder">
				    		<tr>
				    			<td>{{$current_coin}} {{Lang::get('user_texts.amount')}}</td>
				    			<td>
				    				<div class="input-control text input-sm">
									    <input type="text" class="form-control" id="amount" name="amount" required="">
									    <button class="btn-clear"></button>
									</div>
									</td>
				    		</tr>
				    		<tr>
				    			<td>{{Lang::get('user_texts.withdraw_fee')}} Withdraw Fee</td><td><b id="withdraw_fee" class="control-label">{{$fee_withdraw}}</b> <b>{{{ $current_coin }}}</b></td>
				    		</tr>
				    		<tr>
				    			<td>{{{ trans('texts.net_total')}}}</td><td><b id="net_total" class="control-label">0.00</b> <b>{{{ $current_coin }}}</b></td>
				    		</tr>
				    		<tr>
				    			<td>{{{ trans('user_texts.receive_address')}}}</td>
				    			<td>
				    				<div class="input-control text">
									    <input type="text" id="address" name="address" required="">
									    <button class="btn-clear"></button>
									</div>
				    			
				    		</td></tr>
				    		<tr><td>{{{ trans('user_texts.confirm_pass')}}}</td>
				    			<td>    				
				    				<div class="input-control text input-sm">
									    <input type="password" class="form-control" id="inputPassword" name="password" required="">	
									    <button class="btn-clear"></button>
									</div>
				    			</td></tr>
				    		<tr><td colspan="2">
							  	<strong>{{{ trans('user_texts.note_withdraw_1')}}}</strong>{{{ trans('user_texts.note_withdraw_2')}}} 
							    <div class="col-lg-10">	 
							      <input type="hidden" name="fee_withdraw" id="fee_withdraw" value="{{$fee_withdraw}}"> 	      
							      <input type="hidden" name="wallet_id" id="wallet_id" value="{{$wallet_id}}">		      
							  </div>
							</td></tr>
				    	</table>
						  <button type="submit" class="button btn-primary">{{trans('texts.withdraw')}}</button>
					</form>	
					@section('script.footer')
					@parent
					{{ HTML::script('assets/js/jquery.validate.min.js') }}
					   	<script type="text/javascript">	
					   		$(document).ready(function() { 
					   		$('#amount').keyup(function(event) {
							    var amount =parseFloat( $('#amount').val());		    
							    var fee = parseFloat($('#fee_withdraw').val());
							    var total = amount-fee;		   
							    $('#net_total').html(total.toFixed(8));
							});           
					            $("#wihtdrawForm").validate({
					                rules: {				                	
					                	amount: {
									      required: true,
									      number: true
									    }                   
					                },
					                messages: {
					                    amount: {
					                        required: "Please enter amount.",
					                        number: "Please enter a number."
					                    },
					                    address: "Please enter receive address.",
					                    password: {
					                        required: "Please provide a password.",                        
					                    }
					                },
					                submitHandler: function(form) {
					                    $('button[type=submit]').hide();
					                    form.submit();
					                }
					             }); 
					       });
					</script>
					@stop
				@else
					<div style="color:red" id="message_errors"></div>				
				 	<form id="wihtdrawFormUSD" class="form-horizontal" method="POST" action="{{{URL::to('/user/notify-withdraw') }}}">
				 		<p>{{Lang::get('user_texts.your_current_available')}} {{$current_coin}} {{Lang::get('user_texts.balance')}}: <strong>{{$balance}}</strong></p>
				 		<label>{{Lang::get('user_texts.method_payment')}}</label>
						<div class="input-control select size3">
							<select name="transaction_id" id="method_deposit">
								@foreach($method_withdraws as $method)
								<option data-id="{{$method->id}}" data-min="{{$method->wmin}}" data-des="{{$method->wdes}}" data-fee="{{$method->wfee}}"  data-minfee="{{$method->wminfee}}" value="{{$method->wname}} - fee {{$method->wfee}}%">{{$method->wname}}</option>
								@endforeach
							</select>
						</div>
						<label></label>
						<div class="input-control text">
							<div id="method-desc" style="font-style: italic;"></div>
						</div>
						<label>{{Lang::get('user_texts.your_info_account')}}</label>
						<div class="input-control text">
						    <textarea id="to_address" name="to_address" required="" cols="60" rows="5"></textarea>
						    <p class="text-small"><em>{{Lang::get('user_texts.note_your_account_withdraw')}}</em></p>
						</div>	
						<label>{{Lang::get('user_texts.method_fee')}}: <span id="show_fee_withdraw"></span> %</label>					
						<label>{{Lang::get('user_texts.method_min_fee')}}: <span id="show_min_fee_withdraw"></span> {{$current_coin}}</label>
										
						<label>{{$current_coin}} {{Lang::get('user_texts.amount')}}</label>
						<div class="input-control text size3">
							<input type="text" id="amount" name="amount" required="">
						</div>
						<label>{{$current_coin}} {{Lang::get('user_texts.you_will_recieve')}}</label>
						<div class="input-control text size3">
							<input type="text" id="receive_amount" name="receive_amount" readonly> 
						</div>
						<label>{{{ trans('user_texts.confirm_pass')}}}</label>
						<div class="input-control text size3">
						    <input type="password" id="inputPassword" name="password" required="">	
						    <button class="btn-clear"></button>
						</div><br>
						<div class="input-control text size3">						
							<input type="hidden" name="method_id" id="method_id" value="0" readonly>
							<input type="hidden" name="wallet_id" id="wallet_id" value="{{$wallet_id}}">
							<button id="checkamount" type="submit" class="button btn-primary">{{trans('texts.withdraw')}}</button>
						 </div>
					</form>
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
							    console.log('amount_min: ', amount_min);						    
							    if(amount<amount_min){
							    	$('#message_errors').html("Amount must be greater than "+amount_min);
							    	return false;
							    }else {
							    	var fee = parseFloat(method.getAttribute('data-fee'));
							    	var min_fee = parseFloat(method.getAttribute('data-minfee'));
							    	var amount_fee = parseFloat((fee*amount)/100);
								    if(amount_fee<min_fee) amount_fee=min_fee;
								    if(amount<amount_fee){
								    	$('#message_errors').html("Amount must be greater than fee (fee: "+amount_fee+")");
							    		return false;
								    }
							    }
							    return true;
					   		}

					   		function initData(){
					   			var method_deposit = document.getElementById("method_deposit");
								var method = method_deposit.options[method_deposit.selectedIndex];	
								var amount_min = parseFloat(method.getAttribute('data-min'));
								var min_fee = parseFloat(method.getAttribute('data-minfee'));
								var fee = parseFloat(method.getAttribute('data-fee'));
								var description = method.getAttribute('data-des');
								var method_id = method.getAttribute('data-id');
							    
							    $('#show_fee_withdraw').html(fee);						    
							    $('#show_min_fee_withdraw').html(min_fee);
							    $('#method-desc').html(description);	
							    $('#method_id').val(method_id);			    
					   		}
					   		$(document).ready(function() {
					   			initData(); 			   		
								$('#amount, #method_deposit').change(function(event) {
									checkAmount();
								});
								$('#method_deposit').change(function(event) {
									initData();
								});  
								$('#amount').keyup(function(event) {
								    var amount =parseFloat( $('#amount').val());
								    var method_deposit = document.getElementById("method_deposit");
									var method = method_deposit.options[method_deposit.selectedIndex];		    
								    var fee = parseFloat(method.getAttribute('data-fee'));
								    var min_fee = parseFloat(method.getAttribute('data-minfee'));
								    var amount_fee = parseFloat((fee*amount)/100);
								    if(amount_fee<min_fee) amount_fee=min_fee;
								    var total = amount-amount_fee;		   
								    $('#receive_amount').val(total);
								});         
					            $("#wihtdrawFormUSD").validate({
					                rules: {
					                	transaction_id: "required",
					                	to_address: "required",
					                	password: "required",
					                	amount: {
									      required: true,
									      number: true,						      
									    },

					                },
					                messages: {
					                    amount: {
					                        required: "Please enter amount.",
					                        number: "Please enter a number."
					                    },
					                    transaction_id: "Please choose a method.",
					                    to_address: "Please enter your account information.",
					                    password: {
					                        required: "Please provide a password.",                        
					                    }
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
		            {{Lang::get('user_texts.notify_withdraw_disable',array('coin'=>$wallet->name))}}
		        </div>
			@endif		
	    </div>
	</div>    
</div>