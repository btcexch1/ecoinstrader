<!-- Edit Profile -->
@section('title')
{{{ trans('texts.account_balances') }}}
@stop
<div id="balances">
    <h2>{{{ trans('texts.account_balances') }}}</h2>
    <p>Use the actions button to deposit, withdraw or view orders/trades for that specific coin.</p>
    <table class="table hovered">
        <tbody>
            <tr>
                <th>Coin Name</th>
                <th>Code</th>
                <th>Available Balance</th>
                <th>Pending Deposits</th>
                <th>Pending Withdrawals</th>
                <th>Held for Orders</th>
                <th></th>
            </tr>
            @foreach($balances as $balance)
                @if(strtoupper($balance['type'])==strtoupper('points') && $disable_points)
                    {{-- do nothing --}}
                @else            
                <tr>
                    <td>
                        <div class="button-dropdown">
                          <button type="button" class="button success dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-arrow-down-4 on-left"></i>
                            {{$balance['name']}}                            
                          </button>
                          <ul class="dropdown-menu" data-role="dropdown">
                            @if(!empty($balance['logo_coin']))                        
                                <li><span class="logo"><img width="32" height="32" src="{{asset('')}}/{{$balance['logo_coin']}}" /> <strong>{{$balance['name']}}</strong></span></li>
                            @endif
                            @if(strtoupper($balance['type'])!=strtoupper('points'))
                                <li><a href="{{{ URL::to('/user/deposit') }}}/{{$balance['id']}}">{{trans('texts.deposit')}} {{$balance['type']}}</a></li>
                                <li><a href="{{{ URL::to('/user/withdraw') }}}/{{$balance['id']}}">{{trans('texts.withdraw')}} {{$balance['type']}}</a></li>
                            @endif
                            <li><a href="{{{ URL::to('/user/transfer-coin') }}}/{{$balance['id']}}">{{trans('texts.transfer_coin',array('coin'=>$balance['type']))}}</a></li>
                            <li><a href="{{{ URL::to('/user/profile/deposits') }}}/{{$balance['id']}}">{{trans('texts.view_deposits_coin',array('coin'=>$balance['type']))}}</a></li>
                            <li><a href="{{{ URL::to('/user/profile/withdrawals') }}}/{{$balance['id']}}">{{trans('texts.view_withdrawals_coin',array('coin'=>$balance['type']))}}</a></li>
                            <li><a href="{{{ URL::to('/user/profile/orders') }}}/{{$balance['id']}}">{{trans('texts.view_orders_coin',array('coin'=>$balance['type']))}}</a></li>
                            <li><a href="{{{ URL::to('/user/profile/trade-history') }}}/{{$balance['id']}}">{{trans('texts.view_trades_coin',array('coin'=>$balance['type']))}}</a></li>
                            <li><a href="{{{ URL::to('user/profile/viewtranferout') }}}/{{$balance['id']}}">{{trans('texts.view_transfer_out',array('coin'=>$balance['type']))}}</a></li>
                            <li><a href="{{{ URL::to('user/profile/viewtranferin') }}}/{{$balance['id']}}">{{trans('texts.view_transfer_in',array('coin'=>$balance['type']))}}</a></li>   
                            @if(strtoupper($balance['type'])!=strtoupper('points'))                        
                                <li><a href="{{{ $balance['download_wallet_client'] }}}" target="_blank">{{trans('texts.download_wallet',array('coin'=>$balance['type']))}}</a></li>
                            @endif
                            @if(strtoupper($balance['type'])==strtoupper('points'))                        
                                <li><a href="{{{ URL::to('user/profile/ecoinstraderpoint') }}}">{{trans('texts.information_point')}}</a></li>
                            @endif
                          </ul>
                        </div>
                    </td>
                    <td>{{$balance['type']}}</td>
                    <td @if($balance['balance']>0) class="has_amount" @endif>{{$balance['balance']}}</td>
                    <td @if($balance['deposit_pendding']>0) class="has_amount" @endif>{{$balance['deposit_pendding']}}</td>
                    <td @if($balance['withdraw_pendding']>0) class="has_amount" @endif>{{$balance['withdraw_pendding']}}</td>
                    <td @if($balance['held_order']>0) class="has_amount" @endif>{{$balance['held_order']}}</td>                    
                </tr>
                @endif
            @endforeach
        </tbody>
    </table>
    
</div>