@extends('layouts.main')
@section('body')
<div class="container">
    <div class="content">
        <div id="content-profile" class="content-body">  
            <ul class="tabs">
                {{--<li @if($page == 'dashboard') class="active" @endif>{{ HTML::link('user/profile/dashboard', trans('user_texts.dashboard')) }}</li>
                <li @if($page == '') class="active" @endif>{{ HTML::link('user/profile', trans('user_texts.profile')) }}</li>
                <li @if($page == 'two-factor-auth') class="active" @endif>{{ HTML::link('user/profile/two-factor-auth', trans('user_texts.security')) }}</li> --}}
                <li @if($page == 'balances') class="active" @endif>{{ HTML::link('user/profile/balances', trans('user_texts.balance')) }}</li>
                <li @if($page == 'deposit' || $page == 'deposits') class="active" @endif>{{ HTML::link('user/profile/deposits', trans('user_texts.deposits')) }}</li>
                <li @if($page == 'withdrawals' || $page=='withdraw') class="active" @endif>{{ HTML::link('user/profile/withdrawals', trans('user_texts.withdrawals')) }}</li>
                <li @if($page == 'orders') class="active" @endif>{{ HTML::link('user/profile/orders', trans('user_texts.orders')) }}</li>
                <li @if($page == 'trade-history') class="active" @endif>{{ HTML::link('user/profile/trade-history', trans('user_texts.trade_history')) }}</li>
                <li @if($page == 'viewtranferout') class="active" @endif>{{ HTML::link('user/profile/viewtranferout', trans('user_texts.view_transfer_out')) }}</li>
                <li @if($page == 'viewtranferin') class="active" @endif>{{ HTML::link('user/profile/viewtranferin', trans('user_texts.view_transfer_in')) }}</li>        
            </ul>      
           
            <div id='profile-content' class="tab-content">
                <!-- Information -->
                @if($page == '')
                    @include('user.edit_profile')
                @elseif($page == 'two-factor-auth')
                    @include('user.formtwofactor')
                @elseif($page == 'balances')
                    @include('user.balances')
                @elseif($page == 'deposits')
                    @include('user.deposits')
                @elseif($page == 'withdrawals')
                    @include('user.withdrawals')
                @elseif($page == 'orders')
                    @include('user.orders')
                @elseif($page == 'trade-history')
                    @include('user.tradehistory')
                @elseif($page == 'deposit')
                    @include('user.deposit')
                @elseif($page == 'withdraw')
                    @include('user.withdraw')
                @elseif($page == 'dashboard')
                    @include('user.dashboard')
                @elseif($page == 'transfercoin')
                    @include('user.transfercoin')
                @elseif($page == 'viewtranferout')
                    @include('user.transfers_out')
                @elseif($page == 'viewtranferin')
                    @include('user.transfers_in')
                @elseif($page == 'ecoinstraderpoint')
                    @include('user.info_points')
                @elseif($page == 'verify')
                    @include('user.verify_account')
                @endif
                </div>
        </div>
    </div>
</div>
@stop
@section('script.footer')
@parent
<script src="{{ asset('assets/vendors/metro-ui/js/metro-dropdown.js') }}"></script>
@stop
