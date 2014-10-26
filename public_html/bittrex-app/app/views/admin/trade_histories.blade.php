@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/bootstrap-paginator.js') }}
<h2>{{trans('admin_texts.trade_histories')}}</h2>
<?php
$query_string = '';
foreach (Request::query() as $key => $value) {
    $query_string .= $key."=".$value."&";
}
$query_string = trim($query_string,'&');
?>
<form class="form-inline" method="get" action="{{{URL::to('/admin/manage/trade-histories')}}}">        
    <label>{{{ trans('texts.market')}}}</label>        
    <select id="pair" style="margin-right: 20px;" name="market">
        <option value="" @if(isset($_GET['market'])  && $_GET['market'] == '') selected @endif>{{trans('texts.all')}}</option>
        @foreach($markets as $key=> $market)
            <option value="{{$market['id']}}" @if(isset($_GET['market']) && $_GET['market']==$market['id']) selected @endif>{{ strtoupper($market['wallet_from'].'/'.$market['wallet_to'])}}</option>
        @endforeach
    </select>        
    <label>{{{ trans('texts.type')}}}</label>
    <select id="type" name="type" style="margin-right: 20px;">
        <option value="" @if(isset($_GET['type'])  && $_GET['type'] == '') selected @endif>{{trans('texts.all')}}</option>
        <option value="sell" @if(isset($_GET['type']) && $_GET['type'] == 'sell') selected @endif>{{trans('texts.sell')}}</option>
        <option value="buy" @if(isset($_GET['type']) && $_GET['type'] == 'buy') selected @endif>{{trans('texts.buy')}}</option>
    </select>  
    <label>{{{ trans('admin_texts.view_in')}}}</label>
    <select id="type" name="time" style="margin-right: 20px;">
        <option value="" @if(isset($_GET['time'])  && $_GET['time'] == '') selected @endif>{{trans('texts.all')}}</option>
        <option value="today" @if(isset($_GET['time']) && $_GET['time'] == 'today') selected @endif>{{trans('admin_texts.today')}}</option>
        <option value="thisweek" @if(isset($_GET['time']) && $_GET['time'] == 'thisweek') selected @endif>{{trans('admin_texts.thisweek')}}</option>
        <option value="thismonth" @if(isset($_GET['time']) && $_GET['time'] == 'thismonth') selected @endif>{{trans('admin_texts.thismonth')}}</option>
    </select>       
    <button type="submit" class="btn btn-primary" name="do_filter">{{trans('texts.filter')}}</button>
    <!-- <a href=""><button type="button" class="btn btn-default" name="do_filter" >Reset</button></a> -->
</form>
<div id="messages"></div>
<table class="table table-striped" id="list-fees">
	<tr>
	 	<th>{{trans('admin_texts.trade_id')}}</th>
	 	<th>{{{ trans('texts.market')}}}</th>
	 	<th>{{trans('admin_texts.seller_id')}}</th>
	 	<th>{{trans('admin_texts.buyer_id')}}</th>
	 	<th>{{trans('admin_texts.type')}}</th>	 	
	 	<th>{{trans('admin_texts.date')}}</th>
	 	<th>{{trans('admin_texts.price')}}</th>
	 	<th>{{trans('admin_texts.amount')}}</th>
	 	<th>{{trans('admin_texts.total')}}</th>
	 	<th>{{trans('admin_texts.sell_fee')}}</th>
	 	<th>{{trans('admin_texts.buy_fee')}}</th>
	</tr> 	

	@foreach($tradehistories as $trade_history)
        @if(isset($markets[$trade_history->market_id]))
            <tr>
            	<td>{{$trade_history->id}}</td>
                <td>{{$markets[$trade_history->market_id]['wallet_from'].'/'.$markets[$trade_history->market_id]['wallet_to']}}</td>
                <td>@if(empty($trade_history->seller)) <i class="icon-remove icon-white user_removed" title="{{Lang::get('admin_texts.user_was_deleted')}}"></i> @else{{$trade_history->seller}} @endif</td>
                <td>@if(empty($trade_history->buyer)) <i class="icon-remove icon-white user_removed" title="{{Lang::get('admin_texts.user_was_deleted')}}"></i> @else{{$trade_history->buyer}} @endif</td>
                @if($trade_history->type == 'sell')          
                    <td><b style="color:red">{{ ucwords($trade_history->type) }}</b></td>            
                @else          
                    <td><b style="color:green">{{ ucwords($trade_history->type) }}</b></td>            
                 @endif
                 <td>{{$trade_history->created_at}}</td>
                <td>{{sprintf('%.8f',$trade_history->price)}}</td>
                <td>{{sprintf('%.8f',$trade_history->amount)}}</td>
                <td>{{sprintf('%.8f',$trade_history->amount*$trade_history->price)}}</td>
                <td>{{sprintf('%.8f',$trade_history->fee_sell)}}</td>
                <td>{{sprintf('%.8f',$trade_history->fee_buy)}}</td>
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
            return "<?php echo URL::to('admin/manage/trade-histories'); ?>"+'/'+page+'<?php echo "?".$query_string ?>'; 
        }
    }
    $('#pager').bootstrapPaginator(options);
</script>
@stop