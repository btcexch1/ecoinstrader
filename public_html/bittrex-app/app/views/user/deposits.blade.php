<!-- Security -->
@section('title')
{{{ trans('texts.coin_deposits')}}}
@stop
<div id="coin_deposits">
    <h2>{{{ trans('texts.coin_deposits')}}} @if(isset($current_coin)) {{' - '.$current_coin}} @endif</h2>    
	Below is a list of deposits that you have made.
	<br><br>
	<span class="text-high">To make a new deposit, please visit the {{ HTML::link('user/profile/balances', trans('user_texts.balance')) }} page and select the Deposit option under the actions menu for the coin.</span>
	<br><br>
	<form class="form-inline" method="POST" action="{{Request::url()}}">
        @if($filter=='')
        <div class="input-control text size1">
		    <label>{{{ trans('texts.coin')}}}</label>
		</div>
		<div class="input-control text size2">
		    <select id="pair" style="margin-right: 20px;" name="wallet">
                <option value="" selected="selected">{{trans('texts.all')}}</option>
                @foreach($wallets as $key=> $wallet)
                    <option value="{{$wallet['id']}}">{{$wallet->type}}</option>
                @endforeach
            </select>
		</div>
                    
            
        @endif
        <div class="input-control text size1">
		    <label>{{{ trans('texts.type')}}}</label>
		</div>
		<div class="input-control text size2">
		    <select id="type" name="status" style="margin-right: 20px;">
	            <option value="" selected="selected">{{trans('texts.all')}}</option>
	            <option value="0">{{trans('texts.pending')}}</option>
	            <option value="1">{{trans('texts.complete')}}</option>
	        </select>  
		</div>
        <div class="input-control text size1">
		    <button type="submit" class="btn btn-primary" name="do_filter">{{trans('texts.filter')}}</button>
		</div>
    </form>
    <br>
	<table class="table striped hovered">
        <thead>
        	<tr>
	            <th>{{{ trans('texts.date')}}}</th>
	            <th>{{{ trans('texts.coin')}}}</th>
	            <th>{{{ trans('texts.amount')}}}</th>
	            <th>{{{ trans('texts.sending_address')}}}</th>
	            <th>{{{ trans('texts.confirmations')}}}</th>
	            <th>{{{ trans('texts.status')}}}</th>	            
	        </tr>
        </thead>	
        <tbody>
	        @foreach($deposits as $deposit)
	        	<tr>
	        		<td>{{$deposit->created_at}}</td>
	        		<td>{{$deposit->type}}</td>
	        		<td>{{$deposit->amount}}</td>
	        		<td>{{$deposit->address}}</td>
	        		<td>{{$deposit->confirmations}}</td>
	        		@if($deposit->paid)          
                        <td><b style="color:green">{{ ucwords(trans('texts.complete')) }}</b></td>  
	                @else  
	                	<td><b style="color:red">{{ ucwords(trans('texts.pending')) }}</b></td> 
	                @endif	        		
	        	</tr>
	        	<tr><td align="center" colspan="6">TrxID: {{$deposit->transaction_id}}</td></tr>
	        @endforeach
	    </tbody>
	</table>
</div>