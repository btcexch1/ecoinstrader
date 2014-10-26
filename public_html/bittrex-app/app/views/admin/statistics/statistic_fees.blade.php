@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/colorPicker.js') }}
<h2>{{trans('admin_texts.statistic_trade_fees')}}</h2>
<form class="form-inline" role="form" id="filter_time_fee" method="get" action="{{Request::url()}}">
	<label>{{{ trans('admin_texts.view_in')}}}</label>
	<select name="filter_time">
		<option value="" @if(isset($_GET['filter_time'])  && $_GET['filter_time'] == '') selected @endif>{{trans('texts.all')}}</option>
	  	<option value="hourly" @if(isset($_GET['filter_time'])  && $_GET['filter_time'] == 'hourly') selected @endif>{{trans('admin_texts.hourly')}}</option>
	  	<option value="daily" @if(isset($_GET['filter_time'])  && $_GET['filter_time'] == 'daily') selected @endif>{{trans('admin_texts.daily')}}</option>
	  	<option value="weekly" @if(isset($_GET['filter_time'])  && $_GET['filter_time'] == 'weekly') selected @endif>{{trans('admin_texts.weekly')}}</option>
	  	<option value="monthly" @if(isset($_GET['filter_time'])  && $_GET['filter_time'] == 'monthly') selected @endif>{{trans('admin_texts.monthly')}}</option>
	</select>
	<button type="submit" class="btn btn-primary" name="do_filter">{{trans('texts.filter')}}</button>
</form>
<table class="table table-striped hourly-fees list-fees">
	<tr>
	 	<th>{{trans('admin_texts.coin_code')}}</th>
	 	<th>{{trans('admin_texts.coin_name')}}</th>
	 	<th>{{trans('admin_texts.sell_fee')}}</th>
	 	<th>{{trans('admin_texts.buy_fee')}}</th>	 	
	 	<th>{{trans('admin_texts.total_fees')}}</th>
	</tr> 	
	@foreach($fees as $fee)
	<tr><td><strong>{{$wallets[$fee->wallet_from]->type}}</strong></td><td>{{$wallets[$fee->wallet_from]->name}}</td><td>{{$fee->fee_sell}}</td><td>{{$fee->fee_buy}}</td><td><strong>{{$fee->fee_sell+$fee->fee_buy}} {{$wallets[$fee->wallet_to]->type}}</strong></td></tr>
	@endforeach	
</table>
<script type="text/javascript">
(function($){ 
	$(document).ready(function(){	
		$('table.list-fees').hide();
		$('table.hourly-fees').show();
		$('select[name=filter_time]').change(function(e) {
			$('.list-fees').hide();
			var filter = $(this).val();
			console.log('filter: ',filter);
			switch(filter)
			{
				case "daily":
				  $('.daily-fees').show();
				  break;
				case "weekly":
				  $('.weekly-fees').show();
				  console.log('gfhfhjg: ',filter);
				  break;
				case "monthly":
				  $('.monthly-fees').show();
				  break;
				default:
				  $('.hourly-fees').show();
			}
		});		
	});
})(jQuery);
</script>
@stop