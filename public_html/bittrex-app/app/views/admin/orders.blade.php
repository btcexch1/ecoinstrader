@extends('admin.layouts.master')
@section('content')
{{ HTML::script('assets/js/bootstrap-paginator.js') }}
<h2>{{trans('admin_texts.orders_queue')}}</h2>
<?php
$query_string = '';
foreach (Request::query() as $key => $value) {
    $query_string .= $key."=".$value."&";
}
$query_string = trim($query_string,'&');
?>
<form class="form-inline" method="get" action="{{{URL::to('/admin/manage/orders')}}}">
    <label>{{{ trans('texts.market')}}}</label>        
    <select id="pair" style="margin-right: 20px;" name="market">
        <option value="" @if(isset($_GET['market']) == '') selected @endif>{{trans('texts.all')}}</option>
        @foreach($markets as $key=> $market)
            <option value="{{$market['id']}}" @if(isset($_GET['market']) && $_GET['market']==$market['id']) selected @endif>{{ strtoupper($market['wallet_from'].'/'.$market['wallet_to'])}}</option>
        @endforeach
    </select>
	<label>{{{ trans('texts.type')}}}</label>
	<select id="type" name="type" style="margin-right: 20px;">
	    <option value="" @if(isset($_GET['type']) == '') selected @endif>{{trans('texts.all')}}</option>
	    <option value="sell" @if(isset($_GET['type']) && $_GET['type'] == 'sell') selected @endif>{{trans('texts.sell')}}</option>
	    <option value="buy" @if(isset($_GET['type']) && $_GET['type'] == 'buy') selected @endif>{{trans('texts.buy')}}</option>
	</select>
	<label>{{{ trans('texts.show')}}}</label>
	<select id="view" name="status">
	    <option value="" @if(isset($_GET['status']) == '') selected @endif>{{trans('texts.all')}}</option>
	    <option value="active" @if(isset($_GET['status']) && $_GET['status'] == 'active') selected @endif>{{trans('texts.active')}}</option>
	    <option value="filled" @if(isset($_GET['status']) && $_GET['status'] == 'filled') selected @endif>{{trans('texts.filled')}}</option>
	    <option value="partly filled" @if(isset($_GET['status']) && $_GET['status'] == 'partly filled') selected @endif>{{trans('texts.partly_filled')}}</option>            
	</select>
	<button type="submit" class="btn btn-primary" name="do_filter">{{trans('texts.filter')}}</button>
</form>
<div id="messages"></div>
<table class="table table-striped" id="list-fees">
	<tr>
	 	<th>{{trans('admin_texts.order_id')}}</th>
	 	<th>{{trans('admin_texts.user_id')}}</th>
	 	<th>{{{ trans('texts.market')}}}</th>
	 	<th>{{trans('admin_texts.type')}}</th>	 	
	 	<th>{{trans('admin_texts.date')}}</th>
	 	<th>{{trans('admin_texts.price')}}</th>
	 	<th>{{trans('admin_texts.amount')}}</th>
	 	<th>{{trans('admin_texts.total')}}</th>
	 	<th>{{{ trans('texts.status')}}}</th>
	</tr> 
	<?php $active = array('active','partly filled'); ?>
        @foreach($ordershistories as $ordershistory)
            @if(isset($markets[$ordershistory->market_id]))
                <tr>
                	<td>{{$ordershistory->id}}</td>
                	<td>{{$ordershistory->username}}</td>
                    <td>{{$markets[$ordershistory->market_id]['wallet_from'].'/'.$markets[$ordershistory->market_id]['wallet_to']}}</td>
                    @if($ordershistory->type == 'sell')          
                        <td><b style="color:red">{{ ucwords($ordershistory->type) }}</b></td>            
                    @else          
                        <td><b style="color:green">{{ ucwords($ordershistory->type) }}</b></td>            
                     @endif
                     <td>{{$ordershistory->created_at}}</td>
                    <td>{{sprintf('%.8f',$ordershistory->price)}}</td>
                    <td>{{sprintf('%.8f',$ordershistory->from_value)}}</td>
                    <td>{{sprintf('%.8f',$ordershistory->to_value)}}</td>
                    <td><strong>{{$ordershistory->status}}</strong></td>
                    <!-- <td>@if(in_array($ordershistory->status,$active)) <a href="javascript:cancelOrder({{{$ordershistory->id}}});">{{trans('texts.cancel')}}</a> @endif</td> -->
                </tr>
            @endif
        @endforeach 
</table>
<div id="pager"></div>
<script type='text/javascript'>
    var options = {
        currentPage: <?php echo $cur_page ?>,
        totalPages: <?php echo $total_pages ?>,
        alignment:'right',
        pageUrl: function(type, page, current){
        	return "<?php echo URL::to('admin/manage/orders'); ?>"+'/'+page+'<?php echo "?".$query_string ?>'; 
        }
    }
    $('#pager').bootstrapPaginator(options);
</script>
@stop