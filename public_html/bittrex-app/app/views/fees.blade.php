@extends('layouts.main')
@section('title')
{{{trans('texts.fees')}}}
@stop
@section('body')
<div class="container">
    <div class="content">
        <h1>{{{ trans('texts.fees')}}}</h1>  
        <h2 style="text-align: center;">{{{ trans('texts.trding_fees')}}}</h2>
        <p style="text-align: center;">All trading fees are collected in BTC/LTC. The buy order fee is added to the BTC/LTC order value, whereas the sell order fee is taken away from the BTC/LTC order value.<br><br></p>
        <div id="fees_trade">
          <table class="table striped hovered">
            <thead>
              <tr class="header-tb"><th>{{{ trans('texts.market')}}}</th><th>{{{ trans('texts.buy_fee')}}}</th><th>{{{ trans('texts.sell_fee')}}}</th></tr>
            </thead>
            <tbody>       
              @foreach($fees_trade as $fee)  
                @if(isset($fee['wallet_from']))  
                <tr class="order">
                  <td><span>{{$fee['wallet_from'].'/'.$fee['wallet_to']}}</span></td>              
                  <td>{{$fee['fee_buy']}}%</td>
                  <td>{{$fee['fee_sell']}}%</td>
                </tr> 
                @endif
              @endforeach  
            </tbody>
          </table>
        </div>
        <h2 style="text-align: center;">{{{ trans('texts.fee_withdraw')}}}</h2>
        <p style="text-align: center;">Withdraw fees are taken from the requested withdrawal amount.<br><br></p>
        <div id="fees_trade">
          <table class="table striped hovered">
            <thead>
              <tr class="header-tb"><th>{{{ trans('texts.coin_code')}}}</th><th>{{{ trans('texts.coin_name')}}}</th><th>{{{ trans('texts.fee_withdraw')}}}</th></tr> 
            </thead>
            <tbody>      
              @foreach($fees_withdraw as $fee_)     
                <tr class="order">
                  <td><span>{{$fee_->type}}</span></td>              
                  <td>{{$fee_->name}}</td>
                  <td>{{sprintf('%.8f',$fee_->percent_fee)}} {{$fee_->type}}</td>
                </tr> 
              @endforeach  
            </tbody>
          </table>
        </div>
    </div>
</div>
@stop