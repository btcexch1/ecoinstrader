@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/bootstrap-paginator.js') }}
<h2>{{trans('admin_texts.withdraws_queue')}}</h2>
<?php
$query_string = '';
foreach (Request::query() as $key => $value) {
    $query_string .= $key."=".$value."&";
}
$query_string = trim($query_string,'&');
?>
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
<form class="form-inline"  role="form" id="filter_market" method="get" action="{{{URL::to('/admin/manage/withdraws-queue')}}}">
	<label>{{{ trans('admin_texts.wallet')}}}</label>        
    <select name="wallet_id">
	  	<option value="" @if(isset($_GET['wallet_id']) && $_GET['wallet_id']=='') selected @endif>--{{trans('admin_texts.all')}}--</option>
	  	@foreach($wallets as $wallet)
	  		<option value="{{$wallet['id']}}" @if(isset($_GET['wallet_id']) && $_GET['wallet_id']==$wallet['id']) selected @endif>{{$wallet['type']}}</option>
	  	@endforeach
    </select>
    <label>{{{ trans('admin_texts.status')}}}</label>
    <select id="type" name="status" style="margin-right: 20px;">
        <option value="" selected="selected">{{trans('admin_texts.all')}}</option>
        <option value="0">{{trans('admin_texts.pending')}}</option>
        <option value="1">{{trans('admin_texts.complete')}}</option>
    </select> 
    <label>{{{ trans('admin_texts.username')}}}</label>        
    <select name="username">
	  	<option value="" @if(isset($_GET['username']) && $_GET['username']=='') selected @endif>--{{trans('admin_texts.all')}}--</option>
	  	@foreach($users as $user)
	  		<option value="{{$user['username']}}" @if(isset($_GET['username']) && $_GET['username']==$user['username']) selected @endif>{{$user['username']}}</option>
	  	@endforeach
    </select>
    <button type="submit" class="btn btn-primary" name="do_filter">{{trans('texts.filter')}}</button>
</form>
<div id="messages"></div>
<table class="table table-striped" id="list-fees">
	<tr>
	 	<th>{{trans('admin_texts.coin')}}</th>
	 	<th>{{trans('admin_texts.username')}}</th>
	 	<th>{{trans('admin_texts.address')}}</th> 
	 	<th>{{trans('admin_texts.amount')}}</th>
	 	<th>{{trans('admin_texts.fee')}}</th>
	 	<th>{{trans('admin_texts.receive_amount')}}</th>	 	
	 	<th>{{trans('admin_texts.date')}}</th>	 	
	 	<th>{{trans('admin_texts.status')}}</th>
	 	<th>{{trans('admin_texts.action')}}</th>
	</tr> 	
	@foreach($withdraws as $withdraw)
		@if(isset($wallets[$withdraw->wallet_id]))
			<tr><td>{{$wallets[$withdraw->wallet_id]['type']}}</td><td>{{$withdraw->username}}</td><td>{{$withdraw->to_address}}</td><td>{{sprintf('%.8f',$withdraw->amount)}}</td><td>{{sprintf('%.8f',$withdraw->fee_amount)}}</td><td>{{sprintf('%.8f',$withdraw->receive_amount)}}</td><td>{{$withdraw->created_at}}</td>
			@if($withdraw->status)
			<td class="status">Approved</td>
			<td><a href="#"></a></td>
			@else
			<td class="status"><b style="color:red">Wait approve</b>
				<?php 
    			if($wallets[$withdraw->wallet_id]['is_moneypaper']){
    			?>
    				<br> <button type="button" class="btn btn-danger" onclick="showUpdate('{{$withdraw->username}}','{{$withdraw->amount}}','{{$withdraw->transaction_id}}','{{$withdraw->id}}','{{$withdraw->fee_amount}}');">{{Lang::get('admin_texts.update')}}</button>
    			<?php } ?>
			</td>
			<td><a href="#">{{trans('admin_texts.approve')}}</a></td>
			@endif
			</tr>
		@endif
	@endforeach	
</table>
<div id="pager"></div>
<div id="messageModal" class="modal hide fade" tabindex="-1" role="dialog">	
	<div class="modal-header"><h2>{{Lang::get('admin_texts.update')}}</h2></div>	
	<div class="modal-body">	
		<form id="updateDeposit" action="{{URL::to('admin/update-takemoney-withdraw')}}" method="POST">
			<div class="form-group">
		      <label>{{Lang::get('admin_texts.username')}}</label>
		      <input type="text" class="form-control" name="username" id="username" readonly>	      
		    </div>
		    <div class="form-group">
		      <label for="name">{{Lang::get('admin_texts.method_withdraw')}}</label>
		      <input type="text" class="form-control"  name="transaction_id" id="transaction_id">
		    </div>
			<div class="form-group">
		      <label for="name">{{Lang::get('admin_texts.amount')}}</label>
		      <input type="text" class="form-control"  name="amount" id="amount">
		    </div>	
		    <div class="form-group">
		      <label for="name">{{Lang::get('admin_texts.fee')}}</label>
		      <input type="text" class="form-control"  name="fee" id="fee">
		    </div>	
		    <div class="form-group">
		      <label for="name">{{Lang::get('admin_texts.receive_amount')}}</label>
		      <input type="text" class="form-control"  name="receive_amount" id="receive_amount" readonly>
		    </div>		    
		    <div class="checkbox">
		      <label>
		      <input type="checkbox" name="take_money" value="1"> {{Lang::get('admin_texts.take_money')}}
		      </label>
		    </div> 
		    <p><b>{{Lang::get('admin_texts.note_update_withdraw')}}</b></p>
	</div>
	<div class="modal-footer">
		<input type="hidden" name="redirect" value="{{URL::current()}}">
		<input type="hidden" name="withdraw_id" id="withdraw_id">
		<button type="submit" class="btn btn-primary">Submit</button>
		</form>
		<button class="btn close-popup" data-dismiss="modal">{{{ trans('texts.close')}}}</button>
	</div>
</div>
<script type='text/javascript'>
    var options = {
        currentPage: <?php echo $cur_page ?>,
        totalPages: <?php echo $total_pages ?>,
        alignment:'right',
        pageUrl: function(type, page, current){
        	return "<?php echo URL::to('admin/manage/withdraws-queue'); ?>"+'/'+page+'<?php echo "?".$query_string ?>'; 
        }
    }
    $('#pager').bootstrapPaginator(options);

    function showUpdate(username, amount, method_deposit,id,fee_amount){    	
        //$('#messageModal .modal-body').html('<p style="color:#008B5D; font-weight:bold;text-align:center;">'+obj.message+'</p>');            
        /*$('#messageModal').on('hidden.bs.modal', function (e) {              
          location.reload();
        });*/
		$('#messageModal #amount').val(amount);
		$('#messageModal #username').val(username);
		$('#messageModal #transaction_id').val(method_deposit);
		$('#messageModal #withdraw_id').val(id);
		$('#fee').val(fee_amount);
		$('#messageModal').modal({show:true, keyboard:false}); 
	    return false;	}
	$(document).ready(function() { 
   		$('#amount,#fee').keyup(function(event) {
		    var amount =parseFloat( $('#amount').val());		    
		    var fee = parseFloat($('#fee').val());
		    var total = amount-fee;		   
		    $('#receive_amount').val(total);
		});           
	});
</script>
@stop