<div id="statistic">
	<div class="container">
		<div class="inbox">
			<div class="content-inbox">
				<h3>BTC Markets</h3>			
				<hr>
				<div id="scrollbox1" data-role="scrollbox1" data-scroll="vertical" class="tablescroll">
					<table class="table striped hovered">
						<thead>
							<tr>
								<td>Coin</td>
								<td>Price</td>
								<td>Change</td>	
							</tr>	
						</thead>
						<tbody>
							@foreach($btc_markets as $btc_market)
							<?php 
								$total_btc = isset($btc_datainfo[$btc_market->id]['total'])? $btc_datainfo[$btc_market->id]['total']:0; 
								$curr_price = isset($btc_datainfo[$btc_market->id][0]['price'])? $btc_datainfo[$btc_market->id][0]['price']:0;
								$pre_price = isset($btc_datainfo[$btc_market->id][1]['price'])? $btc_datainfo[$btc_market->id][1]['price']:0;
								$change = ($pre_price!=0)? sprintf('%.2f',(($curr_price-$pre_price)/$pre_price)*100):100;
								//echo "Cur: ".$curr_price." -- Pre: ".$pre_price;
								//if($change>0) $change = '+'.$change;
							?>
								<tr id="volume-{{$btc_market->id}}" data-hint="Vol: {{sprintf('%.8f',$total_btc)}} BTC" data-hint-position="right">
									<td><a href="{{{ URL::to('/market/') }}}/{{$btc_market->id}}"><span class="name">{{$btc_market->type}}</span></a></td>
									<td><span class="price" yesterdayPrice="{{sprintf('%.8f',$pre_price)}}" id="spanPrice-{{$btc_market->id}}">{{sprintf('%.8f',$curr_price)}}</span></td>
									<td>
										@if($change>=0)
										<span class="change up" id="spanChange-{{$btc_market->id}}">+{{$change}}%</span>
										@else
										<span class="change down" id="spanChange-{{$btc_market->id}}">{{$change}}%</span>
										@endif										
									</td>
								</tr>
							@endforeach							
						</tbody>		
					</table>
				</div>
			</div>
		</div>	
		
		<div class="inbox">
			<div class="content-inbox">
				<h3>LTC Markets</h3>			
				<hr>
				<div id="scrollbox2" data-role="scrollbox2" data-scroll="vertical" class="tablescroll">
					<table class="table striped hovered">
						<thead>
							<tr>
								<td>Coin</td>
								<td>Price</td>
								<td>Change</td>	
							</tr>	
						</thead>
						<tbody>
							@foreach($ltc_markets as $ltc_market)
							<?php 
								$total_ltc = isset($ltc_datainfo[$ltc_market->id]['total'])? $ltc_datainfo[$ltc_market->id]['total']:0; 
								$curr_price = isset($ltc_datainfo[$ltc_market->id][0]['price'])? $ltc_datainfo[$ltc_market->id][0]['price']:0;
								$pre_price = isset($ltc_datainfo[$ltc_market->id][1]['price'])? $ltc_datainfo[$ltc_market->id][1]['price']:0;
								$change = ($pre_price!=0)? sprintf('%.2f',(($curr_price-$pre_price)/$pre_price)*100):0;
							?>
								<tr id="volume-{{$ltc_market->id}}" data-hint="Vol: {{sprintf('%.8f',$total_ltc)}} BTC" data-hint-position="right">
									<td><a href="{{{ URL::to('/market/') }}}/{{$ltc_market->id}}"><span class="name">{{$ltc_market->type}}</span></a></td>
									<td><span class="price" yesterdayPrice="{{sprintf('%.8f',$pre_price)}}" id="spanPrice-{{$ltc_market->id}}">{{sprintf('%.8f',$curr_price)}}</span></td>
									<td>
										@if($change>=0)
										<span class="change up" id="spanChange-{{$ltc_market->id}}">+{{$change}}%</span>
										@else
										<span class="change down" id="spanChange-{{$ltc_market->id}}">{{$change}}%</span>
										@endif										
									</td>
								</tr>
							@endforeach								
						</tbody>		
					</table>
				</div>
			</div>
		</div>
		
		<div class="inbox">
			<div class="content-inbox">
				<h3>24 Hours Statistics</h3>			
				<hr>
				<?php
				$number_btc = isset($statistic_btc->number_trade)? $statistic_btc->number_trade:0;
				$volumn_btc = (isset($statistic_btc->total) && !empty($statistic_btc->total))? sprintf('%.8f',$statistic_btc->total):0;
				$number_ltc = isset($statistic_ltc->number_trade)? sprintf('%.8f',$statistic_ltc->number_trade):0;
				$volumn_ltc = (isset($statistic_ltc->total) && !empty($statistic_ltc->total))? sprintf('%.8f',$statistic_ltc->total):0;
				?>
				<div data-role="scrollbox3" id="scrollbox3" data-scroll="vertical" class="tablescroll">
					<table class="table striped hovered">						
						<tbody>
							<tr><td><span class="name">BTC Volume</span></td><td><span class="change">{{$volumn_btc}} BTC</span></td></tr>
							<tr><td><span class="name">LTC Volume</span></td><td><span class="change">{{$volumn_ltc}} BTC</span></td></tr>
							<tr><td><span class="name">Number of Trades</span></td><td><span class="change">{{$number_ltc+$number_btc}}</span></td></tr>
						</tbody>		
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
@section('script.footer')
@parent
<script>
    /*$(function(){
        $("#scrollbox1").scrollbar({
            height: 335,
            axis: 'y'
        });
        $("#scrollbox2").scrollbar({
            axis: 'y',
            height: 335
        });
        $("#scrollbox3").scrollbar({
            height: 335,
            axis: 'y'
        });
    });*/
</script>
@stop