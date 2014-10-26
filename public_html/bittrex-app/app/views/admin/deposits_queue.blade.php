@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/bootstrap-paginator.js') }}
<h2>{{trans('admin_texts.deposits_queue')}}</h2>
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
<form class="form-inline"  role="form" id="filter_market" method="get" action="{{{URL::to('/admin/manage/deposits-queue')}}}">
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
	 	<th>{{trans('admin_texts.confirmations')}}</th>
	 	<th>{{{ trans('admin_texts.status')}}}</th>
	 	<th>{{trans('admin_texts.date')}}</th>
	</tr> 	
	@foreach($deposits as $deposit)
		@if(isset($wallets[$deposit->wallet_id]))
			<tr>
				<td>{{$wallets[$deposit->wallet_id]['type']}}</td>
				<td>{{$deposit->username}}</td>
				<td>
				@if($wallets[$deposit->wallet_id]['type']=='POINTS') {{$deposit->transaction_id}}
				@else
					{{$deposit->address}}
				@endif
				</td>
				<td>{{$deposit->amount}} {{-- {{sprintf('%.8f',$deposit->amount)}} --}}</td>
				<td>{{$deposit->confirmations}}</td>			
				@if($deposit->paid)          
	                <td><b style="color:green">{{ ucwords(trans('admin_texts.complete')) }}</b></td>  
	            @else  
	            	<td><b style="color:red">{{ ucwords(trans('admin_texts.pending')) }}</b>
	            		<?php 
	            			if($wallets[$deposit->wallet_id]['is_moneypaper']){
	            			?>
	            				<br> <button type="button" class="btn btn-danger" onclick="showUpdate('{{$deposit->username}}','{{$deposit->amount}}','{{$deposit->transaction_id}}','{{$deposit->id}}');">{{Lang::get('admin_texts.update')}}</button>
	            			<?php } ?>
	            	</td> 
	            @endif	 
				<td>{{$deposit->created_at}}</td>			
			</tr>
		@endif
	@endforeach
</table>
<div id="pager"></div>
<div id="messageModal" class="modal hide fade" tabindex="-1" role="dialog">	
	<div class="modal-header"><h2>{{Lang::get('admin_texts.update_send_money_deposit')}}</h2></div>	
	<div class="modal-body">	
		<form id="updateDeposit" action="{{URL::to('admin/update-send-deposit')}}" method="POST">
			<div class="form-group">
		      <label>{{Lang::get('admin_texts.username')}}</label>
		      <input type="text" class="form-control" name="username" id="username" readonly>	      
		    </div>
		    <div class="form-group">
		      <label for="name">{{Lang::get('admin_texts.method_deposit')}}</label>
		      <input type="text" class="form-control"  name="transaction_id" id="transaction_id">
		    </div>
			<div class="form-group">
		      <label for="name">{{Lang::get('admin_texts.amount')}}</label>
		      <input type="text" class="form-control"  name="amount" id="amount">
		    </div>		    
		    <div class="checkbox">
		      <label>
		      <input type="checkbox" name="paid" value="1"> {{Lang::get('admin_texts.paid')}}
		      </label>
		    </div> 
		    <p><b>{{Lang::get('admin_texts.note_update_deposit')}}</b></p>
	</div>
	<div class="modal-footer">
		<input type="hidden" name="redirect" value="{{URL::current()}}">
		<input type="hidden" name="deposit_id" id="deposit_id">
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
        	return "<?php echo URL::to('admin/manage/deposits-queue'); ?>"+'/'+page+'<?php echo "?".$query_string ?>'; 
        }
    }
    $('#pager').bootstrapPaginator(options);


    function showUpdate(username, amount, method_deposit,id){    	
        //$('#messageModal .modal-body').html('<p style="color:#008B5D; font-weight:bold;text-align:center;">'+obj.message+'</p>');            
        /*$('#messageModal').on('hidden.bs.modal', function (e) {              
          location.reload();
        });*/
		$('#messageModal #amount').val(amount);
		$('#messageModal #username').val(username);
		$('#messageModal #transaction_id').val(method_deposit);
		$('#messageModal #deposit_id').val(id);
		$('#messageModal').modal({show:true, keyboard:false}); 
	    return false;	}
</script>
@stop