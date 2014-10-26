<!-- Edit Profile -->
@section('title')
{{{ trans('user_texts.dashboard') }}}
@stop
<div id="dashboard">
    <h2>{{{ trans('user_texts.dashboard') }}}</h2>
    <div class="panel">
      <div class="panel-header bg-lightBlue fg-white">Trade Key</div>
      <div class="panel-content">
        <div class="form-group">
              <label for="">Your Trade Key: </label>
              <table style="border:1px solid #dddddd;" class="table table-striped">
              <tbody><tr><td align="center"><strong>{{$user->trade_key}}</strong></td></tr>
              </tbody></table> 
            </div>
        <p>Your trade key allows other users to send you funds for any available currency type. User to User transfers are free and require no waiting for confirmations. Trade keys are receive only addresses and thus you may give this key to anyone you wish.</p>
      </div>
    </div>
    <div class="panel">
      <div class="panel-header bg-lightBlue fg-white">Your Stats</div>
      <div class="panel-content">
        <table class="table striped hovered">
          <tbody>
            <tr><td width="50%" align="right">Total Trades</td><td width="50%">{{ HTML::link('user/profile/trade-history', $total_trades) }}</td></tr>
            <tr><td width="50%" align="right">Open Orders</td><td width="50%">{{ HTML::link('user/profile/orders', $total_openordes) }}</td></tr>
            <tr><td width="50%" align="right">Deposits Last 24 Hrs</td><td width="50%">{{ HTML::link('user/profile/deposits', $deposit_twentyfourhours) }}</td></tr>
            <tr><td width="50%" align="right">Withdrawals Last 24 Hrs</td><td width="50%">{{ HTML::link('user/profile/withdrawals', $withdraw_twentyfourhours) }}</td></tr>
            <tr><td width="50%" align="right">Pending Deposits</td><td width="50%">{{ HTML::link('user/profile/deposits', $deposit_pendings) }}</td></tr>
          </tbody>
        </table>
      </div>
    </div>    
    
    <div class="panel">
        <div class="panel-header bg-lightBlue fg-white"> 
          <span class="glyphicon"></span> Your Referrals 
        </div>
        <div class="panel-content">        
            <center><i></i></center>
            <h4>Referral Link Code:</h4>
            
            <table style="border:1px solid #dddddd;" class="table table-striped">
            <tbody><tr><td align="center">{{URL::to('/')}}/referral/{{$user->username}}</td></tr>
            </tbody></table>   
            
            <h4>Stats:</h4>
            
            <table style="border:1px solid #dddddd;" class="table table-striped">
            <tbody><tr><td align="center">Total Users Referred {{$total_referred}}</td></tr>
            </tbody></table>   

            <h4>I Was Referred By:</h4>
            @if ( Session::get('error') )
                  <div class="notice marker-on-bottom bg-darkRed fg-white">
                      @if ( is_array(Session::get('error')) )
                          {{ head(Session::get('error')) }}
                      @else
                         {{ Session::get('error') }}
                      @endif
                  </div>
              @endif

              @if ( Session::get('notice') )
                  <div class="notice marker-on-bottom fg-white">{{ Session::get('notice') }}</div>
              @endif
            @if(empty($user->referral))
              No referring user found. If you would like to tell us who referred you, then enter their trade key below.
              <form class="form-horizontal" method="POST" action="{{{ URL::action('UserController@referreredTradeKey')  }}}">
                <div class="form-group">
                  <label for="inputEmail" class="col-lg-2 control-label">Referrer Trade Key</label>
                  <div class="input-group">
                    <input type="text" class="form-control" name="trade_key" required>
                    <span class="input-group-btn">
                      <button class="btn btn-primary" type="submit">Submit Referrer Trade Key</button>
                    </span>
                  </div>
                </div>
              </form>            
            @else
            <table style="border:1px solid #dddddd;" class="table table-striped">
              <tbody>
                <tr><td align="center"><strong>{{$user->referral}}</strong></td></tr>
              </tbody>
            </table>
            @endif
        </div>
    </div> 
</div>