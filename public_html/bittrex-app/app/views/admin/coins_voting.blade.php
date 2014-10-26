@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/colorPicker.js') }}
<h2>Coin Voting</h2>
	@if ( Session::get('error') )
      <div class="alert alert-error">{{{ Session::get('error') }}}</div>
	@endif
	@if ( Session::get('success') )
      <div class="alert alert-success">{{{ Session::get('success') }}}</div>
	@endif

	@if ( Session::get('notice') )
	      <div class="alert">{{{ Session::get('notice') }}}</div>
	@endif
@if(isset($error_message))
<div class="alert alert-error">{{{ $error_message }}}</div>
@endif
@if(!isset($not_wallet))
<form class="form-horizontal" role="form" id="add_new_coin_vote" method="POST" action="{{{ Confide::checkAction('Admin_SettingController@addNewCoinVote') ?: URL::to('/admin/add-coin-vote') }}}">
	<input type="hidden" name="_token" value="{{{ Session::getToken() }}}">
	<div class="form-group">
	    <label for="inputEmail3" class="col-sm-2 control-label">{{trans('texts.coin_code')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" class="form-control" name="code" id="code" value="{{{ Input::old('code') }}}">
			</div>	      	      
	    </div>
	</div>	
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{trans('texts.coin_name')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" class="form-control" id="name" name="name" value="{{{ Input::old('name') }}}">
			</div>	      
	    </div>
	</div>
	<!-- <div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{trans('texts.btc_payment_address')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" class="form-control" id="btc_address" name="btc_address" value="{{{ Input::old('btc_address') }}}">			  
			</div>	      
			<br><em>Please enter a address is dedicated to this coin to check vote by payment</em>
	    </div>
	</div> -->
	  
	<div class="form-group">
		<input type="hidden" class="form-control" id="market_id" name="market_id">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-primary" id="do_edit">Add</button>
	    </div>
	</div>
</form>
<div id="messages"></div>
<div class="add_new"><a href="javascript:void()">Add new Coin</a></div>
<table class="table table-striped">
    <tbody>
        <tr>
            <th>{{{ trans('texts.coin_code')}}}</th>
            <th>{{{ trans('texts.coin_name')}}}</th>            
            <th>{{{ trans('texts.btc_payment_address')}}}</th>
            <th>{{{ trans('texts.balance')}}}</th>
            <th>Votes</th>
            <th>Action</th>	            
        </tr>
        @foreach($coinvotes as $coinvote)
        <tr>
        	<td>{{$coinvote->code}}</td>
        	<td>{{$coinvote->name}}</td>
        	<td>{{$coinvote->btc_address}}</td>
        	<td>@if(isset($coinvote->balance)) {{$coinvote->balance}} @else 0 @endif</td>
        	<td><span id="numvote_{{$coinvote->id}}">@if(isset($coinvote->num_vote)) {{$coinvote->num_vote}} @else 0 @endif</span></td>
        	<td><a href="javascript:void()" onclick="deleteCoin({{$coinvote->id}})">Delete</a></td>
        </tr>
        @endforeach
    </tbody>
</table>
<div id="messageModal" class="modal hide fade" tabindex="-1" role="dialog">		
	<div class="modal-body">		
	</div>
	<div class="modal-footer">
		<button class="btn close-popup" data-dismiss="modal">{{{ trans('texts.close')}}}</button>
	</div>
</div>
{{ HTML::script('assets/js/jquery.validate.min.js') }}
<script type="text/javascript">
function deleteCoin(coinvote_id){         
      $.post('<?php echo action('Admin_SettingController@deleteCoinVote')?>', {isAjax: 1, coinvote_id: coinvote_id}, function(response){
          var obj = $.parseJSON(response);
          console.log('obj: ',obj);
          if(obj.status == 'success'){
            $('#messageModal .modal-body').html('<p style="color:#008B5D; font-weight:bold;text-align:center;">'+obj.message+'</p>');            
            $('#messageModal').on('hidden.bs.modal', function (e) {              
              location.reload();
            });
          }else{
            $('#messageModal .modal-body').html('<p style="color:red; font-weight:bold;text-align:center;">'+obj.message+'</p>');
          }
          $('#messageModal').modal({show:true, keyboard:false}); 
      });
      return false;
    }
(function($){ 	
	$(document).ready(function(){
		$("#add_new_coin_vote").validate({
                rules: {
                	code: {
				      required: true
				    },
				    name: {
				      required: true
				    },
				    btc_address: {
				      required: true
				    }                   
                },
                messages: {
                    code: {
                        required: "Please enter code."
                    },
                    name: {
                        required: "Please enter name."
                    },
                    btc_address: {
                        required: "Please enter a btc address."
                    }                    
                }
             });   
		$('#add_new_coin_vote').hide();
		$('.add_new').click(function(e) {
			$('body,html').animate({scrollTop:0},800);
			$('#add_new_coin_vote').show();
			$(this).hide();
		});
	});
})(jQuery);
</script>
@else
<div class="alert">{{{ $not_wallet }}}</div>
@endif
@stop