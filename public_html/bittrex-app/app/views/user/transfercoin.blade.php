<!-- Security -->
<script type="text/javascript">
 var RecaptchaOptions = {
    theme : 'clean'
 };
 </script>
<div id="form_transfer">
	<div class="panel">
	    <div class="panel-header bg-lightBlue fg-white">{{trans('texts.transfer_coin',array('coin'=>$current_coin))}}</div>
	    <div class="panel-content">
	       <div style="color:red">@if(isset($error_message)) {{$error_message}} @endif</div>
		    <!-- <div class="warning box">Once submitted, all requests <strong>MUST</strong> be confirmed via email. Please only contact support if you have not received the confirmation email.</div> -->
		    <p>Your current available {{$current_coin}} balance: <strong>{{$balance}}</strong></p>	    
		    @if ( Session::get('error') )
		        <div class="notice marker-on-bottom bg-darkRed fg-white">	        
				  <button type="button" class="close" data-dismiss="alert">×</button>
		            @if ( is_array(Session::get('error')) )
		                {{ head(Session::get('error')) }}
		            @else
		            	{{ Session::get('error') }}
		            @endif
		        </div>
		    @endif

		    @if ( Session::get('notice') )
		        <div class="notice marker-on-bottom bg-amber">{{ Session::get('notice') }}</div>
		    @endif  
		    @if ( Session::get('success') )
		        <div class="notice marker-on-bottom">
				  <button type="button" class="close" data-dismiss="alert">×</button>
				  {{Session::get('success')}}
				</div>
		    @endif  
		    <form id="transferForm" class="form-horizontal" method="POST" action="{{{ URL::action('UserController@doTransfer') }}}">
		    	<table class="table striped noborder">
		    		<tr>
		    			<td>{{$current_coin}} Amount</td>
		    			<td>
		    				<div class="input-control text input-sm">
							    <input type="text" class="form-control" id="amount" name="amount" required="">
							    <button class="btn-clear"></button>
							</div>
							</td>
		    		</tr>
		    		<tr>
		    			<td>Receive Trade Key</td>
		    			<td>
		    				<div class="input-control text">
							    <input type="text" id="trade_key" class="form-control" name="trade_key" required="">
							    <button class="btn-clear"></button>
							</div>
							</td>
		    		</tr>
		    		<tr>
		    			<td>Confirm Password</td>
		    			<td>
		    				<div class="input-control text input-sm">
							    <input type="password" class="form-control" id="inputPassword" name="password" required="">
							    <button class="btn-clear"></button>
							</div>
							</td>
		    		</tr>
		    		<tr>
		    			<td>Enter Captcha Code</td>
		    			<td>
		    				<div class="control-group">
							    <script type="text/javascript" src="https://www.google.com/recaptcha/api/challenge?k={{$recaptcha_publickey}}"></script>
						        <script type="text/javascript" src="https://www.google.com/recaptcha/api/js/recaptcha.js"></script>
						        <noscript>
						        &lt;iframe src="https://www.google.com/recaptcha/api/noscript?k={{$recaptcha_publickey}}" height="300" width="500" frameborder="0"&gt;&lt;/iframe&gt;&lt;br/&gt;
						        &lt;textarea name="recaptcha_challenge_field" rows="3" cols="40"&gt;&lt;/textarea&gt;
						        &lt;input type="hidden" name="recaptcha_response_field" value="manual_challenge"/&gt;
						        </noscript>
						        <div id="captchaStatus"></div>
							</div>
						</td>
		    		</tr>
		    		<tr><td colspan="2" align="center">		    			
			    		<input type="hidden" name="wallet_id" id="wallet_id" value="{{$wallet_id}}">
			      		<button type="submit" class="btn btn-primary">{{trans('texts.transfer')}}</button>	
					    </td>
					</tr>
		    	</table>
			</form>
	    </div>
	</div> 
</div>
@section('script.footer')
@parent
{{ HTML::script('assets/js/jquery.validate.min.js') }}
   	<script type="text/javascript">
   		$(document).ready(function() { 
            $("#transferForm").validate({
                rules: {
                	amount: {
				      required: true,
				      number: true
				    },
				    trade_key: "required",
				    password: "required"
                },
                messages: {
                    amount: {
                        required: "Please enter amount.",
                        number: "Please enter a number."
                    },
                    trade_key: "Please enter receive address.",
                    password: {
                        required: "Please provide a password.",                        
                    }
                },
                submitHandler: function(form) {
                    var challengeField = $("input#recaptcha_challenge_field").val();
		            var responseField = $("input#recaptcha_response_field").val(); 
		            console.log('responseField',responseField);         
		            $.post('<?php echo action('UserController@checkCaptcha')?>', {recaptcha_challenge_field: challengeField, recaptcha_response_field: responseField }, function(response){
		                if(response == 1)
		                {   
		                	$('button[type=submit]').hide();
		                    document.getElementById("transferForm").submit();                  
		                    //return true;
		                }
		                else
		                {
		                    $("#captchaStatus").html("<label class='error'>Your captcha is incorrect. Please try again</label>");
		                    Recaptcha.reload();
		                    //return false;
		                }
		            });
                }
            });
        }); 
	  	
</script>
@stop