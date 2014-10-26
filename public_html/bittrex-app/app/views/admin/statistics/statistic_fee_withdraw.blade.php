@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/colorPicker.js') }}
<h2>{{trans('admin_texts.fee_withdraw')}}</h2>
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
<table class="table table-striped" id="list-fees">
	<tr>
	 	<th>{{trans('admin_texts.coin_code')}}</th>
	 	<th>{{trans('admin_texts.coin_name')}}</th>
	 	<th>{{trans('admin_texts.total_fees')}}</th>
	</tr> 	
	@foreach($withdraw_fees as $withdraw_fee)
	<tr><td><strong>{{$withdraw_fee->type}}</strong></td><td>{{$withdraw_fee->name}}</td><td>{{sprintf('%.8f',$withdraw_fee->total_fee)}} {{$withdraw_fee->type}}</td></tr>
	@endforeach
</table>
@stop