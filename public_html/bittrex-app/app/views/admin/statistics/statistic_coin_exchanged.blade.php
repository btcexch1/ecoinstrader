@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/colorPicker.js') }}
<h2>{{trans('admin_texts.coin_exchanged')}}</h2>
@if ( Session::get('error') )
  <div class="alert alert-error">{{{ Session::get('error') }}}</div>
@endif
@if ( Session::get('success') )
  <div class="alert alert-success">{{{ Session::get('success') }}}</div>
@endif

@if ( Session::get('notice') )
      <div class="alert">{{{ Session::get('notice') }}}</div>
@endif
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
<h3>Main Coins</h3>
<table class="table table-striped list-coin hourly-fees">
	<tr>
	 	<th>{{trans('admin_texts.coin_code')}}</th>
	 	<th>{{trans('admin_texts.coin_name')}}</th>
	 	<th>{{trans('admin_texts.total_exchanged')}}</th>
	</tr> 		
	@foreach($maincoins_exchanged as $maincoin_exchanged)
	<tr><td><strong>{{$wallets[$maincoin_exchanged->wallet_to]->type}}</strong></td><td colspan>{{$wallets[$maincoin_exchanged->wallet_to]->name}}</td><td><strong>{{$maincoin_exchanged->total_amount}} {{$wallets[$maincoin_exchanged->wallet_to]->type}}</strong></td></tr>
	@endforeach
</table>
<h3>Other Coin</h3>
<table class="table table-striped list-coin hourly-fees">
	<tr>
	 	<th>{{trans('admin_texts.coin_code')}}</th>
	 	<th>{{trans('admin_texts.coin_name')}}</th>
	 	<th>{{trans('admin_texts.total_exchanged')}}</th>
	</tr> 		
	@foreach($coins_exchanged as $coin_exchanged)
	<tr><td><strong>{{$wallets[$coin_exchanged->wallet_from]->type}}</strong></td><td colspan>{{$wallets[$coin_exchanged->wallet_from]->name}}</td><td><strong>{{$coin_exchanged->total_amount}} {{$wallets[$coin_exchanged->wallet_from]->type}}</strong></td></tr>
	@endforeach
</table>
@stop