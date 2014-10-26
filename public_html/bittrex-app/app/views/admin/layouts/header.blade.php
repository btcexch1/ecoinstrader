<!-- variable-->  
<div id="header">
  <div id="header-content">
    <div id="header-logo"><a href="/"></a></div>  
    <ul class="sf-menu" id="main-menu">
    	<li><a href="<?=url('/', $parameters = array(), $secure = null);?>"><i class="icon-home icon-white"></i></a></li>
		<li class="current">
			{{ HTML::link('admin/setting', trans('admin_texts.settings')) }}
			<ul>
				<li>
					{{ HTML::link('admin/setting', trans('admin_texts.general')) }}
				</li>
				<li>
					{{ HTML::link('admin/setting/limit-trade', trans('admin_texts.limit_trade')) }}
				</li>	
				<li>
					{{ HTML::link('admin/setting/time-limit-trade', trans('admin_texts.time_limit_trade')) }}
				</li>				
				<li class="current">
					{{ HTML::link('admin/setting/fee', trans('admin_texts.fee')) }}
					<ul>
						<li class="current">{{ HTML::link('admin/setting/fee', trans('admin_texts.fee_buy_sell')) }}</li>
						<li>{{ HTML::link('admin/setting/fee-withdraw', trans('admin_texts.fee_withdraw')) }}</li>	
					</ul>
				</li>
			</ul>
		</li>
		<li>
			{{ HTML::link('admin/statistic/statistic-coin-exchanged', trans('admin_texts.statistic')) }}
			<ul>
				<li class="current">{{ HTML::link('admin/statistic/statistic-coin-exchanged', trans('admin_texts.coin_exchanged')) }}</li>
				<li>
					{{ HTML::link('admin/statistic/statistic-fees', trans('admin_texts.fee')) }}
					<ul>
						<li class="current">{{ HTML::link('admin/statistic/statistic-fees', trans('admin_texts.fee_buy_sell')) }}</li>
						<li>{{ HTML::link('admin/statistic/statistic-fee-withdraw', trans('admin_texts.fee_withdraw')) }}</li>	
					</ul>
				</li>							
			</ul>
		</li>
		<li>
			{{ HTML::link('admin/manage/users', trans('admin_texts.manage')) }}
			<ul>
				<li>
					{{ HTML::link('admin/manage/users', trans('admin_texts.users')) }}					
				</li>
				<li>
					{{ HTML::link('admin/manage/login-histories', trans('admin_texts.login_histories')) }}
				</li>
				<li>
					{{ HTML::link('admin/manage/orders', trans('admin_texts.orders')) }}					
				</li>
				<li>
					{{ HTML::link('admin/manage/trade-histories', trans('admin_texts.trade_histories')) }}
				</li>
				<li>
					{{ HTML::link('admin/manage/funds', trans('admin_texts.finances')) }}
					<ul>
						<li>{{ HTML::link('admin/manage/withdraws-queue', trans('admin_texts.withdraws_queue')) }}</li>
						<li>{{ HTML::link('admin/manage/deposits-queue', trans('admin_texts.deposits_queue')) }}</li>
						<li>{{ HTML::link('admin/manage/funds', trans('admin_texts.funds')) }}</li>						
					</ul>					
				</li>
				<li>
					{{ HTML::link('admin/manage/markets', trans('admin_texts.markets')) }}					
				</li>
				<li>
					{{ HTML::link('admin/manage/wallets', trans('admin_texts.wallets')) }}
				</li>
				<li>
					{{ HTML::link('admin/manage/balance-wallets', trans('admin_texts.balance_wallets')) }}
				</li>
				<li>
					{{ HTML::link('admin/manage/coins-voting', 'Coin Voting') }}					
				</li>
				<li>
					{{ HTML::link('admin/manage/method-deposit', trans('admin_texts.method_deposit')) }}					
				</li>
				<li>
					{{ HTML::link('admin/manage/method-withdraw', trans('admin_texts.method_withdraw')) }}					
				</li>
			</ul>
		</li>
		<li>
			<a href="#">{{trans('admin_texts.content')}}</a>
			<ul>
				<li>
					{{ HTML::link('admin/content/all-page', trans('admin_texts.page')) }}
					<ul>
						<li>{{ HTML::link('admin/content/add-page', trans('admin_texts.add_page')) }}</li>
						<li>{{ HTML::link('admin/content/all-page', trans('admin_texts.all_pages')) }}</li>					
					</ul>
				</li>
				<li>
					<a href="#">{{trans('admin_texts.news')}}</a>
					<ul>
						<li>{{ HTML::link('admin/content/add-news', trans('admin_texts.add_news')) }}</li>
						<li>{{ HTML::link('admin/content/all-news', trans('admin_texts.all_news')) }}</li>
					</ul>
				</li>					
			</ul>	
		</li>			
	</ul> 
	    
  </div>
  <script>
	(function($){ //create closure so we can safely use $ as alias for jQuery
		$(document).ready(function(){
			// initialise plugin
			var example = $('#main-menu').superfish({
				//add options here if required
			});
		});
	})(jQuery);
</script>
</div>