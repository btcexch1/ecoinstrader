@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/bootstrap-paginator.js') }}
<h2>{{trans('admin_texts.wallets')}}</h2>
<table class="table table-striped">
	<tr>	 	
	 	<th>{{trans('admin_texts.coin_code')}}</th>
	 	<th>{{trans('admin_texts.coin_name')}}</th>	 	
	 	<th>{{trans('admin_texts.balance')}}</th>
	 	<th>{{trans('admin_texts.total_deposit')}}</th>	 	
	 	<th>{{trans('admin_texts.total_withdraw')}}</th>
	</tr> 	
	@foreach($wallets as $wallet)
	<tr><td>{{$wallet->type}}</td><td>{{$wallet->name}}</td><td>{{$balances[$wallet->id]}}</td><td>{{$amount_transaction[$wallet->id]['total_amount_deposit']}}</td><td>{{$amount_transaction[$wallet->id]['total_amount_withdraw']}}</td></tr>
	@endforeach	
</table>
<div id="pager"></div>
<script type='text/javascript'>
    var options = {
        currentPage: <?php echo $cur_page ?>,
        totalPages: <?php echo $total_pages ?>,
        alignment:'right',
        pageUrl: function(type, page, current){
        	return "<?php echo URL::to('admin/manage/balance-wallets'); ?>"+'/'+page; 
        }
    }
    $('#pager').bootstrapPaginator(options);
</script>
@stop