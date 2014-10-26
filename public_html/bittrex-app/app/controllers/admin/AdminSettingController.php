<?php

class Admin_SettingController extends BaseController {

	/*
	|--------------------------------------------------------------------------
	| Default Home Controller
	|--------------------------------------------------------------------------
	|
	| You may wish to use controllers instead of, or in addition to, Closure
	| based routes. That's great! Here is an example controller method to
	| get you started. To route to this controller, just add the route:
	|
	|	Route::get('/', 'HomeController@showWelcome');
	|
	*/

	public function routePage($page='',$pager_page='')
	{
		$markets = Market::where('active',1)->get();
        $market_wallet = array();
        foreach ($markets as $market) {
            $market_wallet[$market->id] = $market->getWalletType($market->id);
        }
        $data['markets'] = $market_wallet;        
		switch ($page) {
			case 'fee':
				$data['fee_trades'] = FeeTrade::leftJoin('market', 'fee_trade.market_id', '=', 'market.id')
					->leftJoin('wallets', 'market.wallet_from', '=', 'wallets.id')
            		->select('fee_trade.*', 'market.wallet_from','wallets.name','wallets.type')->orderby('wallets.name','asc')->get();
            	//echo "<pre>fee_trades: "; print_r($fee_trades); echo "</pre>";
            	//echo "<pre>markets: "; print_r($markets); echo "</pre>";exit;
				return View::make('admin.setting_fee',$data);
				break;			
			case 'fee-withdraw':
				$data['fee_withdraws'] = FeeWithdraw::leftjoin('wallets','fee_withdraw.wallet_id','=','wallets.id')->select('fee_withdraw.*','wallets.type','wallets.name')->orderby('wallets.type')->get();
				return View::make('admin.setting_fee_withdraw',$data);
				break;	
			case 'limit-trade':
				$record_per_page = 15;
				$total = WalletLimitTrade::count();
				if($pager_page=='') $pager_page = 1;
				$data['total_pages'] = ceil($total/$record_per_page);//15 user per page
				$data['cur_page'] = $pager_page;
				$offset_start = ($pager_page-1)*$record_per_page;
				$data['wallets'] = Wallet::orderby('type')->get();
				$data['limit_trades'] = WalletLimitTrade::leftjoin('wallets','wallet_limittrade.wallet_id','=','wallets.id')->select('wallet_limittrade.*','wallets.type as wallet_type','wallets.name as wallet_name')->skip($offset_start)->take($record_per_page)->orderby('wallet_type')->get();
				return View::make('admin.limittrade.setting_limittrade',$data);
				break;
			//add newbie
			case 'time-limit-trade':
				$record_per_page = 15;
				$total = WalletTimeLimitTrade::count();
				if($pager_page=='') $pager_page = 1;
				$data['total_pages'] = ceil($total/$record_per_page);//15 user per page
				$data['cur_page'] = $pager_page;
				$offset_start = ($pager_page-1)*$record_per_page;
				$data['wallets'] = Wallet::orderby('type')->get();
				$data['limit_trades'] = WalletTimeLimitTrade::leftjoin('wallets','wallet_timelimittrade.wallet_id','=','wallets.id')->select('wallet_timelimittrade.*','wallets.type as wallet_type','wallets.name as wallet_name')->skip($offset_start)->take($record_per_page)->orderby('wallet_type')->get();
				return View::make('admin.limittrade.setting_timelimittrade',$data);
				break;
			case 'statistic-coin-exchanged':
				$select = "SELECT mk.wallet_from, mk.wallet_to, sum(amount) as total_amount from trade_history a left join market mk on a.market_id=mk.id";
				$select_maincoin = "SELECT mk.wallet_from, mk.wallet_to, sum(amount*price) as total_amount from trade_history a left join market mk on a.market_id=mk.id";
				$where = '';
				if(isset($_GET['filter_time']) && $_GET['filter_time']!=''){
                	switch ($_GET['filter_time']) {
                		case 'hourly':
                			$hourly=date('Y-m-d H:i:s',strtotime('-1 hour'));
                			$where = $where==''? " Where a.created_at>='".$hourly."'": $where." Where a.created_at>='".$hourly."'";
                			break;
                		case 'daily':
                			$daily=date('Y-m-d H:i:s',strtotime('-24 hour'));	
                			$where = $where==''? " Where a.created_at>='".$daily."'": $where." Where a.created_at>='".$daily."'";
                			break;
                		case 'weekly':
                			$thisweek=date('Y-m-d',strtotime('-7 day'));
                			$where = $where==''? " Where a.created_at>='".$thisweek."'": $where." Where a.created_at>='".$thisweek."'";
                			break;
                		case 'monthly':                    			
                			$thismonth=date('Y-m-1',strtotime('-1 month'));
                			$where = $where==''? " Where a.created_at>='".$thismonth."'": $where." Where a.created_at>='".$thismonth."'";
                			break;
                	}
                }
				   
				$select .= " ".$where." group by mk.wallet_from";
                $coins_exchanged = DB::select($select);  
				$data['coins_exchanged'] = $coins_exchanged;
				$select_maincoin .= " ".$where." group by mk.wallet_to";
                $maincoins_exchanged = DB::select($select_maincoin);  
				$data['maincoins_exchanged'] = $maincoins_exchanged;
				// echo "<pre>"; print_r($fees); echo "</pre>";
				 $wallets_temp = Wallet::get();
				$wallets = array();
				foreach ($wallets_temp as $wallet) {
					$wallets[$wallet->id] = $wallet;
				}
				$data['wallets'] = $wallets;
				return View::make('admin.statistics.statistic_coin_exchanged',$data);
				break;
			case 'statistic-fees':
				$select = "SELECT mk.wallet_from, mk.wallet_to, sum(fee_sell) as fee_sell, sum(fee_buy) as fee_buy from trade_history a left join market mk on a.market_id=mk.id";
				$where = '';
				if(isset($_GET['filter_time']) && $_GET['filter_time']!=''){
                	switch ($_GET['filter_time']) {
                		case 'hourly':
                			$hourly=date('Y-m-d H:i:s',strtotime('-1 hour'));
                			$where = $where==''? " Where a.created_at>='".$hourly."'": $where." Where a.created_at>='".$hourly."'";
                			break;
                		case 'daily':
                			$daily=date('Y-m-d H:i:s',strtotime('-24 hour'));	
                			$where = $where==''? " Where a.created_at>='".$daily."'": $where." Where a.created_at>='".$daily."'";
                			break;
                		case 'weekly':
                			$thisweek=date('Y-m-d',strtotime('-7 day'));
                			$where = $where==''? " Where a.created_at>='".$thisweek."'": $where." Where a.created_at>='".$thisweek."'";
                			break;
                		case 'monthly':                    			
                			$thismonth=date('Y-m-1',strtotime('-1 month'));
                			$where = $where==''? " Where a.created_at>='".$thismonth."'": $where." Where a.created_at>='".$thismonth."'";
                			break;
                	}
                }
				   
				$select .= " ".$where." group by a.market_id order by `created_at` desc";
                $fees = DB::select($select);  
				 $data['fees'] = $fees;
				// echo "<pre>"; print_r($fees); echo "</pre>";
				 $wallets_temp = Wallet::get();
				$wallets = array();
				foreach ($wallets_temp as $wallet) {
					$wallets[$wallet->id] = $wallet;
				}
				$data['wallets'] = $wallets;
				return View::make('admin.statistics.statistic_fees',$data);
				break;
			case 'statistic-fee-withdraw':
				$select = "SELECT w.type, w.name, sum(fee_amount) as total_fee from withdraws a left join wallets w on a.wallet_id=w.id";
				$where = '';
				if(isset($_GET['filter_time']) && $_GET['filter_time']!=''){
                	switch ($_GET['filter_time']) {
                		case 'hourly':
                			$hourly=date('Y-m-d H:i:s',strtotime('-1 hour'));
                			$where = $where==''? " Where a.created_at>='".$hourly."'": $where." Where a.created_at>='".$hourly."'";
                			break;
                		case 'daily':
                			$daily=date('Y-m-d H:i:s',strtotime('-24 hour'));	
                			$where = $where==''? " Where a.created_at>='".$daily."'": $where." Where a.created_at>='".$daily."'";
                			break;
                		case 'weekly':
                			$thisweek=date('Y-m-d',strtotime('-7 day'));
                			$where = $where==''? " Where a.created_at>='".$thisweek."'": $where." Where a.created_at>='".$thisweek."'";
                			break;
                		case 'monthly':                    			
                			$thismonth=date('Y-m-1',strtotime('-1 month'));
                			$where = $where==''? " Where a.created_at>='".$thismonth."'": $where." Where a.created_at>='".$thismonth."'";
                			break;
                	}
                }
				   
				$select .= " ".$where." group by a.wallet_id";
                $withdraw_fees = DB::select($select);  
				$data['withdraw_fees'] = $withdraw_fees;
				return View::make('admin.statistics.statistic_fee_withdraw',$data);
				break;
			case 'add-page':
				$data['type'] = 'page';
				return View::make('admin.pages.add_post',$data);
				break;			
			case 'add-news':
				$data['type'] = 'news';
				return View::make('admin.pages.add_post', $data);
				break;
			case 'all-page':
				$data['type'] = 'page';
				$record_per_page = 15;
				$total = Post::where('type',$data['type'])->count();
				if($pager_page=='') $pager_page = 1;
				$data['total_pages'] = ceil($total/$record_per_page);//15 user per page
				$data['cur_page'] = $pager_page;
				$offset_start = ($pager_page-1)*$record_per_page;
				$posts = Post::where('type',$data['type'])->skip($offset_start)->take($record_per_page)->get();
				$data['posts'] = $posts;
				return View::make('admin.pages.all_posts',$data);
				break;
			case 'all-news':
				$data['type'] = 'news';				
				$record_per_page = 15;
				$total = Post::where('type',$data['type'])->count();
				if($pager_page=='') $pager_page = 1;
				$data['total_pages'] = ceil($total/$record_per_page);//15 user per page
				$data['cur_page'] = $pager_page;
				$offset_start = ($pager_page-1)*$record_per_page;
				$posts = Post::where('type',$data['type'])->skip($offset_start)->take($record_per_page)->get();
				$data['posts'] = $posts;
				return View::make('admin.pages.all_posts',$data);
				break;
			case 'users':
				$record_per_page = 15;
				$total_users = User::count();
				if($pager_page=='') $pager_page = 1;
				$data['total_pages'] = ceil($total_users/$record_per_page);//15 user per page
				$data['cur_page'] = $pager_page;
				$offset_start = ($pager_page-1)*$record_per_page;
				//$offset_end = ($pager_page*$record_per_page)-1;

				$users = User::skip($offset_start)->take($record_per_page)->get()->toArray();

				foreach ($users as $key => $value) {
					
					$user = USer::find($value['id']);
					$users[$key]['roles'] = $user->roles->toArray();
					//echo "<pre>roles:"; print_r($user->roles->toArray()); echo "</pre>";
				}
				//echo "<pre>"; print_r($users); echo "</pre>";
				$roles = Role::get();
				$data['users'] = $users;
				$data['roles'] = $roles;
				return View::make('admin.user.manage_users',$data);
				break;
			case 'orders':
				$record_per_page = 15;				
				if($pager_page=='') $pager_page = 1;
				$data['cur_page'] = $pager_page;
				$offset_start = ($pager_page-1)*$record_per_page;
				//$offset_end = ($pager_page*$record_per_page)-1;
				
				$select = "select a.*, b.wallet_from as `from`, b.wallet_to as `to`, c.username from orders a left join market b on a.market_id=b.id left join users c on a.user_id=c.id";
				$select_count = "select count(*) as total from orders a";
                $where = '';
                if(isset($_GET['do_filter'])){
                	if($where=='') 
                    if(!empty($_GET['market'])) {
                    	$where = $where==''? " Where a.market_id='".$_GET['market']."'": $where." AND a.market_id='".$_GET['market']."'";                    	
                    }
                    if($_GET['status']!=''){
                    	$where = $where==''? " Where a.status='".$_GET['status']."'": $where." AND a.status='".$_GET['status']."'";
                    }
                    if($_GET['type']!='') $where = $where==''? " Where a.type='".$_GET['type']."'": $where." AND a.type='".$_GET['type']."'";

                }
                $select_count = $select_count." ".$where." order by `created_at` desc";
                $total_records = DB::select($select_count);
                //echo "<pre>total_records: "; print_r($total_records); echo "</pre>"; exit;
               
                $data['total_pages'] = ceil($total_records[0]->total/$record_per_page);
                
                $select .= " ".$where." order by `created_at` desc limit ".$offset_start.",".$record_per_page;
                $ordershistory = DB::select($select);                
                $data['ordershistories'] = $ordershistory;
                
				return View::make('admin.orders',$data);
				break;
			case 'trade-histories':
				$record_per_page = 15;				
				if($pager_page=='') $pager_page = 1;
				$data['cur_page'] = $pager_page;
				$offset_start = ($pager_page-1)*$record_per_page;
				$select = "select a.*, b.wallet_from as `from`, b.wallet_to as `to`,c.username as seller, d.username as buyer from trade_history a left join market b on a.market_id=b.id left join users c on a.seller_id=c.id left join users d on a.buyer_id=d.id";
                $select_count = "select count(*) as total from trade_history a";
				$where = '';
                if(isset($_GET['do_filter'])){
                	if($where=='') 
                    if(!empty($_GET['market'])) {
                    	$where = $where==''? " Where a.market_id='".$_GET['market']."'": $where." AND a.market_id='".$_GET['market']."'";                    	
                    }                    
                    if($_GET['type']!='') $where = $where==''? " Where a.type='".$_GET['type']."'": $where." AND a.type='".$_GET['type']."'";
                    if($_GET['time']!=''){
                    	switch ($_GET['time']) {
                    		case 'today':
                    			$where = $where==''? " Where a.created_at>='".date("Y-m-d")."'": $where." Where a.created_at>='".date("Y-m-d")."'";
                    			break;
                    		case 'thisweek':
                    			$thisweek=date('Y-m-d',strtotime('this week'));
                    			$where = $where==''? " Where a.created_at>='".$thisweek."'": $where." Where a.created_at>='".$thisweek."'";
                    			break;
                    		case 'thismonth':                    			
                    			$thismonth=date('Y-m-1',strtotime('this month'));
                    			$where = $where==''? " Where a.created_at>='".$thismonth."'": $where." Where a.created_at>='".$thismonth."'";
                    			break;
                    	}
                    }

                }
                $select_count = $select_count." ".$where." order by `created_at` desc";
                $total_records = DB::select($select_count);
                //echo "<pre>total_records: "; print_r($total_records); echo "</pre>"; exit;
               
                $data['total_pages'] = ceil($total_records[0]->total/$record_per_page);
                
                $select .= " ".$where." order by `created_at` desc limit ".$offset_start.",".$record_per_page;
                $trades = DB::select($select);               
                $data['tradehistories'] = $trades;                
				return View::make('admin.trade_histories',$data);
				break;
			case 'coins-voting':
				$coinvotes = DB::table('coin_votes')->get();
				$wallet = Wallet::where('type','BTC')->first();
				if(isset($wallet->id)){					
					try{		            
		                $wallet->connectJsonRPCclient($wallet->wallet_username,$wallet->wallet_password,$wallet->wallet_ip,$wallet->port);	         
		                foreach ($coinvotes as $key => $value) {
		                 	$num_vote = Vote::where('coinvote_id','=', $value->id)->count();		                 	
		                 	//echo "<pre>getreceivedbyaccount"; print_r($wallet->getReceivedByAddress($value->btc_address)); echo "</pre>";//$value->label_address
		                 	$btc_payment = $wallet->getReceivedByAddress($value->btc_address);//'12X9jVe4S8pAqJ7EoKN7B4YwMQpzfgArtX'
		                 	$num_payment = floor($btc_payment/0.0001);
		                 	//echo "btc_payment: ".$btc_payment;
		                 	//echo "<br>num_payment: ".$num_payment;
		                 	$coinvotes[$key]->balance = $num_payment;
		                 	$coinvotes[$key]->num_vote = $num_vote + $num_payment;
		                }
		            }catch (Exception $e) {
		                $data['error_message']= "Not connect to this" ;//'Caught exception: '.$e->getMessage()."\n";  //      
		            }
	                 
	                 //echo "<pre>coinvotes"; print_r($coinvotes); echo "</pre>";
	                $data['coinvotes'] = $coinvotes;
				}
                else $data['not_wallet'] = "Please add BTC wallet before add the vote coin.";
				return View::make('admin.coins_voting',$data);
				break;
			case 'funds':
				$wallets = Wallet::leftjoin('fee_withdraw','fee_withdraw.wallet_id','=','wallets.id')->orderby('type')->get();
				$balances = array();
				$fee_withdraws = array();
				foreach ($wallets as $wallet) {
					try{
		                $wallet->connectJsonRPCclient($wallet->wallet_username,$wallet->wallet_password,$wallet->wallet_ip,$wallet->port);                
		                $balances[$wallet->id] = $wallet->getBalance();
		                $fee_withdraws[$wallet->id] = $wallet->getTxFee();
		                UserAddressDeposit::insert(array('user_id' => $user->id, 'wallet_id' => $wallet->id, 'addr_deposit'=>$address));
		            }catch (Exception $e) {
		                $data['error_message']= 'Caught exception: '.$e->getMessage()."\n";  //"Not connect to this wallet";//'Caught exception: '.$e->getMessage()."\n";                
		            }
				}
				$data['wallets'] = $wallets;
				$data['balances'] = $balances;
				$data['fee_withdraws'] = $fee_withdraws;
				//echo "<pre>fee_withdraws"; print_r($fee_withdraws); echo "</pre>";
				return View::make('admin.funds',$data);
				break;
			case 'withdraws-queue':
				$record_per_page = 20;				
				if($pager_page=='') $pager_page = 1;
				$data['cur_page'] = $pager_page;
				$offset_start = ($pager_page-1)*$record_per_page;

				if(isset($_GET['do_filter'])){
                    $withdraws = Withdraw::leftjoin('users','users.id','=','withdraws.user_id');
					if($_GET['wallet_id']!=''){
						$withdraws->where('wallet_id',$_GET['wallet_id']);
					}              	                
                    if($_GET['status']!=''){
						$withdraws->where('status',$_GET['status']);
					}    
					if($_GET['username']!=''){
						$withdraws->where('users.username',$_GET['username']);
					}     
					$withdraws->select('withdraws.*','users.username','users.id as user_id');   
                }else{
                	$withdraws = Withdraw::leftjoin('users','users.id','=','withdraws.user_id')->select('withdraws.*','users.username');
                }
                $total_records = $withdraws->get();
                //echo "<br>total_records: ".count($total_records);
                $data['total_pages'] = ceil(count($total_records)/$record_per_page);
                //echo "<br>total_records: ".$data['total_pages'];
                $withdraws= $withdraws->skip($offset_start)->take($record_per_page)->orderby("created_at","desc")->get();
                $wallets = Wallet::orderby('type')->get()->toArray();
                $new_wallet = array();
                foreach ($wallets as $key => $value) {
                	$new_wallet[$value['id']] = $value;
                }
                $data['wallets'] = $new_wallet;
				$data['withdraws'] = $withdraws;
				$data['users'] = User::orderBy('username')->get();
				return View::make('admin.withdraws_queue',$data);
				break;
			case 'deposits-queue':
				$record_per_page = 20;				
				if($pager_page=='') $pager_page = 1;
				$data['cur_page'] = $pager_page;
				$offset_start = ($pager_page-1)*$record_per_page;

				if(isset($_GET['do_filter'])){ 
					$deposits = Deposit::leftjoin('users','users.id','=','deposits.user_id');
					if($_GET['wallet_id']!=''){
						$deposits->where('wallet_id',$_GET['wallet_id']);
					}              	                
                    if($_GET['status']!=''){
						$deposits->where('paid',$_GET['status']);
					}  
					if($_GET['username']!=''){
						$deposits->where('users.username',$_GET['username']);
					}        
					$deposits->select('deposits.*','users.username','users.id as user_id');              
                }else{
                	$deposits = Deposit::leftjoin('users','users.id','=','deposits.user_id')->select('deposits.*','users.username');
                }
                $total_records = $deposits->get();
                //echo "<br>total_records: ".count($total_records);
                $data['total_pages'] = ceil(count($total_records)/$record_per_page);
                //echo "<br>total_records: ".$data['total_pages'];
                $deposits= $deposits->skip($offset_start)->take($record_per_page)->orderby("created_at","desc")->get();
                $wallets = Wallet::orderby('type')->get()->toArray();
                $new_wallet = array();
                foreach ($wallets as $key => $value) {
                	$new_wallet[$value['id']] = $value;
                }
                $data['wallets'] = $new_wallet;
				$data['deposits'] = $deposits;
				$data['users'] = User::orderBy('username')->get();
				return View::make('admin.deposits_queue',$data);
				break;
			case 'wallets':
				$record_per_page = 15;
				$total_users = Wallet::count();
				if($pager_page=='') $pager_page = 1;
				$data['total_pages'] = ceil($total_users/$record_per_page);//15 user per page
				$data['cur_page'] = $pager_page;
				$offset_start = ($pager_page-1)*$record_per_page;

				$wallets = Wallet::skip($offset_start)->take($record_per_page)->orderby('name')->get();				
				$data['wallets'] = $wallets;
				return View::make('admin.wallet.manage_wallets',$data);
				break;
			case 'markets':
				$record_per_page = 15;
				$total_users = Market::count();
				if($pager_page=='') $pager_page = 1;
				$data['total_pages'] = ceil($total_users/$record_per_page);//15 user per page
				$data['cur_page'] = $pager_page;
				$offset_start = ($pager_page-1)*$record_per_page;

				$markets = Market::skip($offset_start)->take($record_per_page)->get();				
				$data['markets'] = $markets;
				$wallets_temp = Wallet::orderby('type')->get();
				$wallets = array();
				foreach ($wallets_temp as $wallet) {
					$wallets[$wallet->id] = $wallet;
				}
				$data['wallets'] = $wallets;				
				
				return View::make('admin.manage_markets',$data);
				break;
			case 'balance-wallets':
				$record_per_page = 15;
				$total_users = Wallet::count();
				if($pager_page=='') $pager_page = 1;
				$data['total_pages'] = ceil($total_users/$record_per_page);//15 user per page
				$data['cur_page'] = $pager_page;
				$offset_start = ($pager_page-1)*$record_per_page;

				$wallets = Wallet::skip($offset_start)->take($record_per_page)->orderby('name')->get();	
				$amount_transaction=array();
				$balances=array();
				foreach ($wallets as $wallet) {
					//get total deposit
					$total_deposit=Deposit::where('wallet_id',$wallet->id)->where('paid',1)->sum('amount');
					$total_withdraw=Withdraw::where('wallet_id',$wallet->id)->where('status',1)->sum('receive_amount');
					$amount_transaction[$wallet->id]=array(
						'total_amount_deposit' => $total_deposit,
						'total_amount_withdraw' => $total_withdraw
						);
					try{
						$wallet->connectJsonRPCclient($wallet->wallet_username,$wallet->wallet_password,$wallet->wallet_ip,$wallet->port);
						$balances[$wallet->id]=$wallet->getBalance();
					}catch (Exception $e) {  
						$balances[$wallet->id]= Lang::get('messages.cannot_connect');      
                    	
                	} 
				}			
				$data['wallets'] = $wallets;
				$data['amount_transaction']=$amount_transaction;
				$data['balances']=$balances;
				return View::make('admin.wallet.manage_wallets_balance',$data);
				break;
			case "login-histories":
				$record_per_page = 15;				
				if($pager_page=='') $pager_page = 1;
				$data['cur_page'] = $pager_page;
				$offset_start = ($pager_page-1)*$record_per_page;
				//$offset_end = ($pager_page*$record_per_page)-1;
				
				$select = "select a.*, b.username from login_history a left join users b on a.user_id=b.id";
				$select_count = "select count(*) as total from login_history as a";
                $where = '';
                if(isset($_GET['do_filter'])){
                	if($where=='') 
                    if(!empty($_GET['user'])) {
                    	$where = $where==''? " Where a.user_id='".$_GET['user']."'": $where." AND a.user='".$_GET['user']."'";                    	
                    }
                }
                $select_count = $select_count." ".$where;
                $total_records = DB::select($select_count);
                //echo "<pre>total_records: "; print_r($total_records); echo "</pre>"; exit;
               
                $data['total_pages'] = ceil($total_records[0]->total/$record_per_page);
                
                $select .= " ".$where." order by `date` desc limit ".$offset_start.",".$record_per_page;
                $login_histories = DB::select($select);                
                $data['login_histories'] = $login_histories;

                $users = User::orderby('username')->get();
                $data['users'] =$users;
				return View::make('admin.user.login_histories',$data);
				break;
			case 'method-deposit':
				$record_per_page = 15;
				$total_users = MethodDepositCurrency::count();
				if($pager_page=='') $pager_page = 1;
				$data['total_pages'] = ceil($total_users/$record_per_page);//15 user per page
				$data['cur_page'] = $pager_page;
				$offset_start = ($pager_page-1)*$record_per_page;

				$MethodDepositCurrency = MethodDepositCurrency::skip($offset_start)->take($record_per_page)->get();				
				$data['MethodDepositCurrency'] = $MethodDepositCurrency;
				return View::make('admin.method-deposit-currency.manage_method_deposit',$data);
				break;
			case 'method-withdraw':
				$record_per_page = 15;
				$total_users = MethodWithdrawCurrency::count();
				if($pager_page=='') $pager_page = 1;
				$data['total_pages'] = ceil($total_users/$record_per_page);//15 user per page
				$data['cur_page'] = $pager_page;
				$offset_start = ($pager_page-1)*$record_per_page;

				$MethodWithdrawCurrency = MethodWithdrawCurrency::skip($offset_start)->take($record_per_page)->get();				
				$data['MethodWithdrawCurrency'] = $MethodWithdrawCurrency;
				return View::make('admin.method-withdraw-currency.manage_method_withdraw',$data);
				break;
			default:
				$setting = new Setting();
				//$data['bg_color']=$setting->getSetting('bg_color','');
        		$data['site_mode']=$setting->getSetting('site_mode',0);
        		//$data['bg_file']=$setting->getSetting('bg_file','');
        		$data['disable_withdraw']=$setting->getSetting('disable_withdraw',0);        		
        		$data['recaptcha_publickey']=$setting->getSetting('recaptcha_publickey','');
				$data['recaptcha_privatekey']=$setting->getSetting('recaptcha_privatekey','');
				$data['amount_btc_per_vote']=$setting->getSetting('amount_btc_per_vote',0.0001);

				//pusher app
				$data['pusher_app_id']=$setting->getSetting('pusher_app_id','');
        		$data['pusher_app_key']=$setting->getSetting('pusher_app_key','');
				$data['pusher_app_secret']=$setting->getSetting('pusher_app_secret','');

				//default_market
				$m_default = Market::where('active',1)->orderBy('id')->first();
				$market_default_id = isset($m_default->id)? $m_default->id:0;
				$data['default_market']=$setting->getSetting('default_market',$market_default_id);

				//setting points
				$data['disable_points']=$setting->getSetting('disable_points',0);
				$data['point_per_btc']=$setting->getSetting('point_per_btc',1);
        		$data['percent_point_reward_trade']=$setting->getSetting('percent_point_reward_trade',0);
				$data['percent_point_reward_referred_trade']=$setting->getSetting('percent_point_reward_referred_trade',0);

				$data['max_amount_funds']= $setting->getSetting('max_amount_funds',1000);
				//echo "<pre>data: "; print_r($data); echo "</pre>"; exit;
				return View::make('admin.setting',$data);
				break;
		}
	}

	public function updateSetting(){		
		$setting = new Setting();
		$site_mode = Input::get('site_mode');
		//$bg_color = Input::get('bg_color');
		//$bg_file = Input::file('bg_file');   
		$disable_withdraw = Input::get('disable_withdraw');
		$disable_points = Input::get('disable_points');    
        
        //$setting->putSetting('bg_color',$bg_color);
        $setting->putSetting('site_mode',$site_mode);
        $setting->putSetting('disable_withdraw',$disable_withdraw);
        $setting->putSetting('disable_points',$disable_points);

        $recaptcha_publickey = Input::get('recaptcha_publickey');
		$recaptcha_privatekey = Input::get('recaptcha_privatekey');
		$setting->putSetting('recaptcha_publickey',$recaptcha_publickey);
		$setting->putSetting('recaptcha_privatekey',$recaptcha_privatekey);

		$amount_btc_per_vote = is_numeric(Input::get('amount_btc_per_vote'))? Input::get('amount_btc_per_vote'):0.0001;
		$setting->putSetting('amount_btc_per_vote',$amount_btc_per_vote);

		$pusher_app_id = Input::get('pusher_app_id');
		$pusher_app_key = Input::get('pusher_app_key');
		$pusher_app_secret = Input::get('pusher_app_secret');
		//echo "pusher_app_id: ".$pusher_app_id." -- pusher_app_key: ".$pusher_app_key." -- pusher_app_secret: ".$pusher_app_secret;
		//exit;
		$setting->putSetting('pusher_app_id',$pusher_app_id);
		$setting->putSetting('pusher_app_key',$pusher_app_key);
		$setting->putSetting('pusher_app_secret',$pusher_app_secret);

		//points
		$point_per_btc = Input::get('point_per_btc');
		$percent_point_reward_trade = Input::get('percent_point_reward_trade');
		$percent_point_reward_referred_trade = Input::get('percent_point_reward_referred_trade');		
		$setting->putSetting('point_per_btc',$point_per_btc);
		$setting->putSetting('percent_point_reward_trade',$percent_point_reward_trade);
		$setting->putSetting('percent_point_reward_referred_trade',$percent_point_reward_referred_trade);

		$setting->putSetting('default_market',Input::get('default_market'));

		$max_amount_funds = Input::get('max_amount_funds');
		$setting->putSetting('max_amount_funds',$max_amount_funds);
        /*if(!empty($bg_file)){
        	$extension = $bg_file->getClientOriginalExtension();
	        $destinationPath = 'upload/images/';
	        $fileName = time().'.'.$extension;
	        if(in_array($extension, array('jpg','png','gif'))) {
	            if($bg_file->move($destinationPath, $fileName)) {
	            	$setting->putSetting('bg_file',$destinationPath.$fileName,'');
	            }
	        } else {
	            return Redirect::to('admin')->with('notice', 'The extension of image invalid');
	        }
        }*/
        
        return Redirect::to('admin')->with('success', Lang::get('admin_messages.update_success'));
	}
	public function setFeeTrade(){
		$fee_buy = Input::get('buy_fee');
		$fee_sell = Input::get('sell_fee');
		$market_id = Input::get('market_id');
		FeeTrade::where('market_id',$market_id)->update(array('fee_buy'=>$fee_buy,'fee_sell'=>$fee_sell));
		return Redirect::to('admin/setting/fee')->with('success', Lang::get('admin_messages.update_success'));
	}
	public function setFeeWithdraw(){
		$fee_withdraw = Input::get('fee_withdraw');
		$coin = Input::get('coin');
		FeeWithdraw::where('wallet_id',$coin)->update(array('percent_fee'=>$fee_withdraw));
		return Redirect::to('admin/setting/fee-withdraw')->with('success', Lang::get('admin_messages.update_success'));
	}

	public function addNewCoinVote(){
		$code = strtoupper(Input::get('code'));
		$name = Input::get('name');
		//$btc_address = Input::get('btc_address');
		//$check_coinvote = CoinVote::where('code',$code)->orwhere('btc_address',$btc_address)->first();
		$check_coinvote = CoinVote::where('code',$code)->first();		
		if(isset($check_coinvote->id)){
			return Redirect::to('admin/manage/coins-voting')->with('error', Lang::get('admin_messages.not_exist_coin_vote') );
		}else{
			$wallet = Wallet::where('type','BTC')->first();
			if(isset($wallet->id)){
				try{
	                $wallet->connectJsonRPCclient($wallet->wallet_username,$wallet->wallet_password,$wallet->wallet_ip,$wallet->port);                
	                $address = $wallet->getNewDepositReceiveAddress('cryptocoin_btc_payment_vote');
	                $coin = new CoinVote();
					$coin->code = $code;
					$coin->name = $name;
					$coin->btc_address = $address;
					$coin->save();
					return Redirect::to('admin/manage/coins-voting')->with('success', Lang::get('admin_messages.add_coin_vote_success') );
	            }catch (Exception $e) {                    
	                return Redirect::to('admin/manage/coins-voting')->with('error', 'Caught exception: '.$e->getMessage()."\n");         
	            }	
			}else return Redirect::to('admin/manage/coins-voting')->with('error', Lang::get('admin_messages.not_found_btc_wallet') );			
		}
	} 

	public function deleteCoinVote(){
		$coinvote_id = $_POST['coinvote_id'];
		$coin = CoinVote::find($coinvote_id);
		$coin->delete();		
		echo json_encode(array('status'=>'success','message'=> Lang::get('admin_messages.delete_success') ));
		exit;
	}

	public function addNewUser(){
		$user = new User;

        $user->firstname = Input::get( 'firstname' );
        $user->lastname = Input::get( 'lastname' );
        $user->username = Input::get( 'username' );
        $user->email = Input::get( 'email' );
        $user->password = Input::get( 'password' );
        $user->banned = 0;
        $user->confirmed = 1;
        $roles = Input::get('roles');
        //echo "<pre>roles"; print_r($roles); echo "</pre>"; exit;
        // The password confirmation will be removed from model
        // before saving. This field will be used in Ardent's
        // auto validation.
        $user->password_confirmation = Input::get( 'password_confirmation' );
		$user_email = User::where('email',$user->email)->first();
        if(isset($user_email->id)) 
        	return Redirect::to('admin/manage/users')->with( 'error', Lang::get('admin_messages.email_exist') ); 
        $user_username = User::where('username',$user->username)->first();
        if(isset($user_username->id)) 
        	return Redirect::to('admin/manage/users')->with( 'error', Lang::get('admin_messages.username_exist') ); 
        // Save if valid. Password field will be hashed before save
        $user->save();

        if ( $user->id )
        {
        	if($roles){
        		foreach ($roles as $role) {
	        		$user->addRole($role);
	        	}
        	}else{
        		$user->addRole('User');
        	}
        	
            
            $notice = Lang::get('confide::confide.alerts.account_created');
            // Redirect with success message, You may replace "Lang::get(..." for your custom message.            
            return Redirect::to('admin/manage/users')->with( 'success', $notice );
        }
        else
        {
            // Get validation errors (see Ardent package)
            $error = $user->errors()->all(':message');		
            return Redirect::to('admin/manage/users')->withInput(Input::except('password'))->with( 'error', $error );
        }
	}

	public function editUSer($user_id=''){
		if($user_id=='') return Redirect::to('admin/manage/users');
		$user = User::find($user_id);
		if(!isset($user->id)) return Redirect::to('admin/manage/users')->with( 'error', Lang::get('admin_messages.user_not_exist') );
		$data['user_roles'] = $user->roles->toArray();
		$data['user'] = $user;
		$roles = Role::get()->toArray();
		$data['roles'] = $roles;
		//echo "<pre>roles: "; print_r($data['roles']); echo "</pre>";
		//echo "<pre>user_roles: "; print_r($data['user_roles']); echo "</pre>";
		return View::make('admin.user.edit_user',$data);
	}

	public function doEditUSer(){
        $update= array('updated_at'=>date("Y-m-d H:i:s"));
        $firstname = Input::get('firstname');
        $lastname = Input::get('lastname');
        //$username = Input::get( 'username' );
        $email = Input::get( 'email' );
        $password = Input::get('password');
        $confirmed = Input::get('confirmed');
        $banned = Input::get('banned');
        $user_id = Input::get('user_id');
        $user_email = User::where('email',$email)->where('id','!=',$user_id)->first();
        if(isset($user_email->id)) 
        	return Redirect::to('admin/edit-user/'.$user_id)->with( 'error', Lang::get('admin_messages.email_exist') ); 
        $user = User::find($user_id);
        if($password!='' && !Hash::check($password, $user->password)) {
            $update['password'] = Hash::make($password);
        } 
        $update['firstname'] = $firstname;
        $update['lastname'] = $lastname;
        $update['email'] = $email;
        $update['confirmed'] = $confirmed;
        $update['banned'] = $banned;
        $update['authy'] = Input::get('authy');
        User::where('id', $user_id)->update($update); 
        $roles = Input::get('roles');
        DB::table('users_roles')->where('user_id',$user_id)->delete();
        foreach ($roles as $role) {
    		$user->addRole($role);
    	}
    	//echo "confirmed: ".var_dump($confirmed);
        return Redirect::to('admin/manage/users')->with( 'success', $user->username." ".Lang::get('admin_messages.update_success') );              
    }

    public function verifyUSer($user_id=''){
		$userinfo=UserInformation::where('user_id',$user_id)->first();
		$user = User::find($user_id);
        //echo "<pre>userinfo: "; print_r($userinfo); echo "</pre>";
        $data['userinfo'] = $userinfo;
        $data['user']	=$user;
		return View::make('admin.user.verify_user',$data);
	}

    public function doVerifyUSer(){
    	$user_id = Input::get('user_id');
    	$verified = Input::get('verified');
    	$user = User::where('id', $user_id)->update(array('verified' => $verified));
    	return Redirect::to('admin/manage/users')->with( 'success', Lang::get('admin_messages.verify_user_success'));     	
    }
    
    public function deleteUSer(){
    	$user_id = Input::get('user_id');
    	$user = User::find($user_id);
    	if(isset($user->id)){
    		DB::table('users_roles')->where('user_id',$user_id)->delete();
    		UserInformation::where("user_id", $user_id)->delete();
    		UserAddressDeposit::where("user_id", $user_id)->delete();

    		Balance::where("user_id", $user_id)->delete();
    		LoginHistory::where("user_id", $user_id)->delete();    		
    		Deposit::where("user_id", $user_id)->delete();
    		Withdraw::where("user_id", $user_id)->delete();
    		Order::where('user_id', $user_id)->delete();

    		//ko nen xoa transfer va trade vi no gan voi 1 user nhan/user mua(ban), nen neu xoa thi se xoa luon lich su cua nguoi khac
    		User::where('id',$user_id)->delete();
    		$message = $user->username." ".Lang::get('admin_messages.delete_success');
    		if(Input::get('isAjax')){
	            echo json_encode(array('status'=>'success', 'message'=>$message ));
	            exit;
	        } else {
	            return Redirect::to('admin/manage/users')->with( 'success', $message ); 
	        }  
    	}else{
    		$message = Lang::get('admin_messages.user_not_exist');
    		if(Input::get('isAjax')){
	            echo json_encode(array('status'=>'error', 'message'=>$message ));
	            exit;
	        } else {
	            return Redirect::to('admin/manage/users')->with( 'error', $message ); 
	        }    		
    	}
    	
    }

    public function banUSer(){
    	$user_id = Input::get('user_id');
    	$status = Input::get('status');
    	$user = User::find($user_id);
    	if(isset($user->id)){    		
    		User::where('id',$user_id)->update(array('banned'=>$status));
    		if($status)
    			$message = Lang::get('admin_messages.banned_success') ." ".$user->username.".";
    		else $message = Lang::get('admin_messages.remove_banned_success') ." ".$user->username.".";
    		if(Input::get('isAjax')){
	            echo json_encode(array('status'=>'success', 'message'=>$message ));
	            exit;
	        } else {
	            return Redirect::to('admin/manage/users')->with( 'success', $message ); 
	        }  
    	}else{
    		$message = Lang::get('admin_messages.user_not_exist');
    		if(Input::get('isAjax')){
	            echo json_encode(array('status'=>'error', 'message'=>$message ));
	            exit;
	        } else {
	            return Redirect::to('admin/manage/users')->with( 'error', $message ); 
	        }    		
    	}
    	
    }

    public function addNewWallet(){
    	$type = strtoupper(Input::get('type'));
    	$name = Input::get('name');
    	$wallet_username = Input::get('wallet_username');
    	$password = Input::get('password');
    	$ip = Input::get('ip');
    	$port = Input::get('port');
    	$limit_confirmations = Input::get('limit_confirmations');
    	$is_moneypaper = Input::get('is_moneypaper');
    	$enable_deposit = Input::get('enable_deposit');
    	$enable_withdraw = Input::get('enable_withdraw');
    	$download_wallet_client = Input::get('download_wallet_client');
    	$check_wallet = Wallet::where('type','=',$type)->first();
    	if(isset($check_wallet->id)){
    		return Redirect::to('admin/manage/wallets')->with( 'error', Lang::get('admin_messages.wallet_exist') ); 
    	}

    	$logo_coin=Input::file('logo_coin');
    	$logo='';
    	if(!empty($logo_coin)){
        	$extension = $logo_coin->getClientOriginalExtension();
	        $destinationPath = 'upload/images/';
	        $fileName = time().'.'.$extension;
	        if(in_array($extension, array('jpg','png','gif'))) {
	            if($logo_coin->move($destinationPath, $fileName)) {	            	
	            	$logo=$destinationPath.$fileName;
	            }
	        } else {
	            return Redirect::to('admin')->with('notice', 'The extension of image invalid');
	        }
        }

    	$wallet = new Wallet();
    	$wallet->type = $type;
    	$wallet->name = $name;
    	$wallet->wallet_username = $wallet_username;
    	$wallet->wallet_password = $password;
    	$wallet->wallet_ip = $ip;
    	$wallet->port = $port;
    	$wallet->limit_confirmations= $limit_confirmations;
    	$wallet->download_wallet_client=$download_wallet_client;
    	$wallet->logo_coin=$logo;
    	$wallet->is_moneypaper=!empty($is_moneypaper)? $is_moneypaper:0;
    	$wallet->enable_deposit=!empty($enable_deposit)? $enable_deposit:0;
    	$wallet->enable_withdraw=!empty($enable_withdraw)? $enable_withdraw:0;
    	$wallet->save();
    	if ( $wallet->id ){  
    		$fee_withdraw = new FeeWithdraw();
    		$fee_withdraw->wallet_id = $wallet->id;
    		$fee_withdraw->percent_fee = 0;
    		$fee_withdraw->save();
            return Redirect::to('admin/manage/wallets')->with( 'success', Lang::get('admin_messages.created_success_param', array('object'=>$wallet->name)));
    	}else{    		
            return Redirect::to('admin/manage/wallets')->with( 'error', Lang::get('admin_messages.not_create_wallet') );
    	}
    }

    public function editWallet($wallet_id=''){
		if($wallet_id=='') return Redirect::to('admin/manage/wallets');
		$wallet = Wallet::find($wallet_id);
		if(!isset($wallet->id)) return Redirect::to('admin/manage/wallets')->with( 'error', Lang::get('admin_messages.wallet_not_exist') );		
		$data['wallet'] = $wallet;
		return View::make('admin.wallet.edit_wallet',$data);
	}

	public function doEditWallet(){
		$logo_coin=Input::file('logo_coin');
    	$logo='';
    	if(!empty($logo_coin)){
        	$extension = $logo_coin->getClientOriginalExtension();
	        $destinationPath = 'upload/images/';
	        $fileName = time().'.'.$extension;
	        if(in_array($extension, array('jpg','png','gif'))) {
	            if($logo_coin->move($destinationPath, $fileName)) {	            	
	            	$logo=$destinationPath.$fileName;
	            }
	        } else {
	            return Redirect::to('admin')->with('notice', 'The extension of image invalid');
	        }
        }
        $is_moneypaper=Input::get('is_moneypaper');
        $enable_deposit = Input::get('enable_deposit');
    	$enable_withdraw = Input::get('enable_withdraw');
		$wallet_id = Input::get('wallet_id');		
        $wallet = Wallet::find($wallet_id);
        $wallet->name = Input::get('name');
        $wallet->wallet_username = Input::get('wallet_username');
        $wallet->wallet_password = Input::get('password');
        $wallet->wallet_ip = Input::get('ip');
        $wallet->port = Input::get('port');
        $wallet->limit_confirmations = Input::get('limit_confirmations');
        $wallet->download_wallet_client=Input::get('download_wallet_client');
        $wallet->logo_coin=$logo;
        $wallet->is_moneypaper = !empty($is_moneypaper)? $is_moneypaper:0;
        $wallet->enable_deposit=!empty($enable_deposit)? $enable_deposit:0;
    	$wallet->enable_withdraw=!empty($enable_withdraw)? $enable_withdraw:0;
        $wallet->save();
        return Redirect::to('admin/manage/wallets')->with( 'success', Lang::get('admin_messages.update_success'));
	}

	public function deleteWallet(){
    	$wallet_id = Input::get('wallet_id');
    	$wallet = Wallet::find($wallet_id);
    	if(isset($wallet->id)){
    		$markets = Market::where("wallet_from", $wallet_id)->orwhere("wallet_to", $wallet_id)->get();
    		$arr_markets=array(0);
    		foreach ($markets as $market) {
    			$arr_markets[]=$market->id;
    		}
    		FeeWithdraw::where("wallet_id", $wallet_id)->delete();
    		WalletLimitTrade::where("wallet_id", $wallet_id)->delete();
    		UserAddressDeposit::where("wallet_id", $wallet_id)->delete();

    		Balance::where("wallet_id", $wallet_id)->delete();
    		Transfer::where("wallet_id", $wallet_id)->delete();
    		Deposit::where("wallet_id", $wallet_id)->delete();
    		Withdraw::where("wallet_id", $wallet_id)->delete();

    		Order::whereIn('market_id', $arr_markets)->delete();
    		Trade::whereIn('market_id', $arr_markets)->delete();    		
    		FeeTrade::whereIn('market_id', $arr_markets)->delete();

    		Market::where("wallet_from", $wallet_id)->orwhere("wallet_to", $wallet_id)->delete();
    		Wallet::where('id',$wallet_id)->delete();
    		$message = $wallet->type." ".Lang::get('admin_messages.delete_success');
    		if(Input::get('isAjax')){
	            echo json_encode(array('status'=>'success', 'message'=>$message ));
	            exit;
	        } else {
	            return Redirect::to('admin/manage/wallets')->with( 'success', $message ); 
	        }  
    	}else{
    		$message = Lang::get('admin_messages.wallet_not_exist');
    		if(Input::get('isAjax')){
	            echo json_encode(array('status'=>'error', 'message'=>$message ));
	            exit;
	        } else {
	            return Redirect::to('admin/manage/wallets')->with( 'error', $message ); 
	        }    		
    	}
    	
    }

    public function addNewMarket(){ 
    	$wallet_from = Input::get('wallet_from');
    	$wallet_to = Input::get('wallet_to');
    	if($wallet_from == $wallet_to) return Redirect::to('admin/manage/markets')->with( 'error', Lang::get('admin_messages.walletfrom_different_walletto') );
    	$check_market = Market::where('wallet_from','=',$wallet_from)->where('wallet_to','=',$wallet_to)->first();
    	if(isset($check_market->id)){
    		return Redirect::to('admin/manage/markets')->with( 'error', Lang::get('admin_messages.market_exist') ); 
    	}
    	$market = new Market();
    	$market->wallet_from = $wallet_from;
    	$market->wallet_to = $wallet_to;    	
    	$market->save();
    	if ( $market->id ){ 
    		//add fee   
    		$fee_trade = new FeeTrade();
    		$fee_trade->market_id = $market->id;
    		$fee_trade->fee_sell = 0;
    		$fee_trade->fee_buy = 0;
    		$fee_trade->save();
            return Redirect::to('admin/manage/markets')->with( 'success', Lang::get('admin_messages.market_created_success') );
    	}else{
    		$error = $user->errors()->all(':message');		
            return Redirect::to('admin/manage/markets')->with( 'error', $error );
    	}
    }
	public function deleteMarket(){
    	$market_id = Input::get('market_id');
    	$market = Market::find($market_id);
    	if(isset($market->id)){
    		FeeTrade::where('market_id',$market_id)->delete();
    		Order::where('market_id', $market_id)->delete();
    		Trade::where('market_id', $market_id)->delete();

    		Market::where('id',$market_id)->delete();
    		$message = Lang::get('admin_messages.delete_success');
    		if(Input::get('isAjax')){
	            echo json_encode(array('status'=>'success', 'message'=>$message ));
	            exit;
	        } else {
	            return Redirect::to('admin/manage/markets')->with( 'success', $message ); 
	        }  
    	}else{
    		$message = Lang::get('admin_messages.market_not_exist');
    		if(Input::get('isAjax')){
	            echo json_encode(array('status'=>'error', 'message'=>$message ));
	            exit;
	        } else {
	            return Redirect::to('admin/manage/markets')->with( 'error', $message ); 
	        }    		
    	}
    	
    }

    public function disableMarket(){
    	$status = Input::get('status');
    	$market_id = Input::get('market_id');
    	$market = Market::find($market_id);
    	if(isset($market->id)){    		
    		Market::where('id',$market_id)->update(array('active' =>$status));
    		$message = Lang::get('admin_messages.disable_success');
    		if(Input::get('isAjax')){
	            echo json_encode(array('status'=>'success', 'message'=>$message ));
	            exit;
	        } else {
	            return Redirect::to('admin/manage/markets')->with( 'success', $message ); 
	        }  
    	}else{
    		$message = Lang::get('admin_messages.market_not_exist');
    		if(Input::get('isAjax')){
	            echo json_encode(array('status'=>'error', 'message'=>$message ));
	            exit;
	        } else {
	            return Redirect::to('admin/manage/markets')->with( 'error', $message ); 
	        }    		
    	}
    }

    public function addNewPost(){ 
    	$type = Input::get('type');
    	$title = Input::get('title');
    	$body = Input::get('body');
    	$show_menu = Input::get('show_menu');
    	if(!empty($type) && !empty($title) && !empty($body)){    		
    		$post = new Post();
	    	$post->title = $title;
	    	$post->permalink = $post->createPermalink($title);
	    	$post->body = $body;
	    	$post->type = $type;
	    	$post->show_menu = $show_menu;    	
	    	$post->save();
	    	if ( $post->id ){    		        
	            return Redirect::to('admin/content/all-'.$post->type)->with( 'success', Lang::get('admin_messages.created_success_param', array('object'=>$type)) );
	    	}else{
	    		$error = $user->errors()->all(':message');		
	            return Redirect::to('admin/content/add-'.$post->type)->with( 'error', $error );
	    	}
    	}else return Redirect::to('admin/content/add-'.$post->type)->with( 'error', Lang::get('admin_messages.fill_all_fields') );   	
    }

    public function editPost($post_id){
    	$data['post'] = Post::find($post_id);
    	return View::make('admin.pages.edit_post',$data);
    }
    public function doEditPost(){
    	$type = Input::get('type');
    	$title = Input::get('title');
    	$body = Input::get('body');
    	$post_id = Input::get('post_id');
    	$show_menu = Input::get('show_menu');
    	if(!empty($type) && !empty($title) && !empty($body)){    		
    		$post = Post::find($post_id);
	    	$post->title = $title;
	    	$post->permalink = $post->createPermalink($title);
	    	$post->body = $body;
	    	$post->type = $type;
	    	$post->show_menu = $show_menu;    	
	    	$post->save();
	    	if ( $post->id ){    		        
	            return Redirect::to('admin/content/all-'.$type)->with( 'success', Lang::get('admin_messages.updated_success_param',array('object'=>$type)));
	    	}else{
	    		$error = $user->errors()->all(':message');		
	            return Redirect::to('admin/content/add-news')->with( 'error', $error );
	    	}
    	}else return Redirect::to('admin/content/add-news')->with( 'error', Lang::get('admin_messages.fill_all_fields')  ); 
    }

    public function deletePost(){
    	$post_id = Input::get('post_id');
    	$post = Post::find($post_id);
    	if(isset($post->id)){    		
    		Post::where('id',$post_id)->delete();
    		$message = $post->type." ".$post->title." ".Lang::get('admin_messages.delete_success');
    		if(Input::get('isAjax')){
	            echo json_encode(array('status'=>'success', 'message'=>$message ));
	            exit;
	        } else {
	            return Redirect::to('admin/content/all-'.$post->type)->with( 'success', $message ); 
	        }  
    	}else{
    		$message =Lang::get('admin_messages.article_not_exist');
    		if(Input::get('isAjax')){
	            echo json_encode(array('status'=>'error', 'message'=>$message ));
	            exit;
	        } else {
	            return Redirect::to('admin/content')->with( 'error', $message ); 
	        }    		
    	}
    	
    }

    public function doSendCoin(){        
        $amount = Input::get('amount');
        $address = Input::get('address');
        $wallet_type =Input::get('wallet_type');        
        $wallet = Wallet::where('type',$wallet_type)->first();
		//echo "<pre>wallet: "; print_r($wallet->toArray()); echo "</pre>";
        
       	$user = Confide::user();
       	if($user->hasRole('Admin')){
       		try{
	            $wallet->connectJsonRPCclient($wallet->wallet_username,$wallet->wallet_password,$wallet->wallet_ip,$wallet->port);
	            $txid=$wallet->sendToAddress($address,$amount);
	            $fee = $wallet->getTxFee();
	            $net_total = $amount-$fee;
	            if($txid){                
	                Withdraw::insert(array('user_id' => $user->id, 'wallet_id' => $wallet->id, 'to_address'=>$address, 'amount'=>$amount, 'fee_amount'=>$fee,'receive_amount'=>$net_total,'created_at'=>date('Y-m-d H:i:s'),'status'=>1,'transaction_id'=>$txid));
	                return Redirect::to('admin/manage/funds')
	                    ->with( 'success', Lang::get('admin_messages.withdraw_success',array('amount'=>sprintf('%.8f',$net_total),'coin'=>$wallet->type, 'address'=>$address, 'fee'=>$fee) ) );
	            }else{
	                return Redirect::to('admin/manage/funds')
	                    ->with( 'notice', Lang::get('admin_messages.cannot_send_coin', array('name'=>$wallet->name)));
	            }
	            
	        }catch (Exception $e) {                    
	            return Redirect::to('admin/manage/funds')
	                    ->with( 'notice', Lang::get('admin_messages.cannot_connect_wallet', array('name'=>$wallet->name)) ); //'Caught exception: '.$e->getMessage()            
	        } 
       	}
        
    }

    public function formRestore(){
		require app_path().'/libraries/bigdump.php';
		$data['version'] = '0.35b';
		$error = false;
		$file  = false;
		$message_error='';
		// Check PHP version

		if (!$error && !function_exists('version_compare'))
		{  $message_error .= "<p class=\"error\">PHP version 4.1.0 is required for BigDump to proceed. You have PHP ".phpversion()." installed. Sorry!</p>\n";
		  $error=true;
		}
		// Check if mysql extension is available

		if (!$error && !function_exists('mysql_connect'))
		{ $message_error .="<p class=\"error\">There is no mySQL extension available in your PHP installation. Sorry!</p>\n";
		  $error=true;
		}
		if($error){
			$data['message_error'] = $message_error;
			return View::make('admin.backup_restore.form_restore',$data);
		}
		else
		{ $upload_max_filesize=ini_get("upload_max_filesize");
		  if (preg_match("/([0-9]+)K/i",$upload_max_filesize,$tempregs)) $upload_max_filesize=$tempregs[1]*1024;
		  if (preg_match("/([0-9]+)M/i",$upload_max_filesize,$tempregs)) $upload_max_filesize=$tempregs[1]*1024*1024;
		  if (preg_match("/([0-9]+)G/i",$upload_max_filesize,$tempregs)) $upload_max_filesize=$tempregs[1]*1024*1024*1024;
		  $data['upload_max_filesize'] = $upload_max_filesize;

		  $charset = DB::select("SHOW VARIABLES LIKE 'character_set_connection'");
		  $data['charset'] = $charset[0]->Value;
		  //echo "<pre>charset: "; print_r($charset); echo "</pre>";
		}
		return View::make('admin.backup_restore.form_restore',$data);
	}

   	public function doRestore(){
   		
   	}

   	public function formBackup(){
		require app_path().'/libraries/bigdump.php';
		$data['version'] = '0.35b';
		return View::make('admin.backup_restore.backup',$data);
	}

   	public function doBackup(){
   		
   	}

   	public function addNewLimitTrade(){
   		$wallet_id = strtoupper(Input::get('wallet_id'));
    	$min_amount = Input::get('min_amount');
    	$max_amount = Input::get('max_amount');
    	$find_record=WalletLimitTrade::where('wallet_id',$wallet_id)->first();
    	if(!isset($find_record->wallet_id)){
    		$limitTrade=new WalletLimitTrade();
    		$limitTrade->wallet_id=$wallet_id;
    		$limitTrade->min_amount=$min_amount;
    		$limitTrade->max_amount=$max_amount;  
    		$limitTrade->save();
    		if ( $limitTrade->id ){
	            return Redirect::to('admin/setting/limit-trade')->with( 'success', Lang::get('admin_messages.limit_trade_created') );
	    	}else{	    		
	            return Redirect::to('admin/setting/limit-trade')->with( 'error', Lang::get('admin_messages.cannot_create_limit_trade') );
	    	}
    	}else{
    		return Redirect::to('admin/setting/limit-trade')->with( 'error',Lang::get('admin_messages.limit_trade_already_set') );
    	}
   	}
	public function addNewTimeLimitTrade(){
   		$wallet_id = strtoupper(Input::get('wallet_id'));
    	$limit_amount = Input::get('limit_amount');
    	$time_limit = Input::get('time_limit');
    	$find_record=WalletTimeLimitTrade::where('wallet_id',$wallet_id)->first();
    	if(!isset($find_record->wallet_id)){
    		$limitTrade=new WalletTimeLimitTrade();
    		$limitTrade->wallet_id=$wallet_id;
    		$limitTrade->limit_amount=$limit_amount;
    		$limitTrade->time_limit=$time_limit;  
    		$limitTrade->save();
    		if ( $limitTrade->id ){
	            return Redirect::to('admin/setting/time-limit-trade')->with( 'success', Lang::get('admin_messages.limit_trade_created') );
	    	}else{	    		
	            return Redirect::to('admin/setting/time-limit-trade')->with( 'error', Lang::get('admin_messages.cannot_create_limit_trade') );
	    	}
    	}else{
    		return Redirect::to('admin/setting/time-limit-trade')->with( 'error',Lang::get('admin_messages.limit_trade_already_set') );
    	}
   	}

   	public function editLimitTrade($wallet_id=''){
		if($wallet_id=='') return Redirect::to('admin/setting/limit-trade');
		$limit_trade = WalletLimitTrade::leftjoin('wallets','wallet_limittrade.wallet_id','=','wallets.id')->select('wallet_limittrade.*','wallets.type as wallet_type','wallets.name as wallet_name')->where('wallet_id',$wallet_id)->first();
		if(!isset($limit_trade->id)) return Redirect::to('admin/setting/limit-trade')->with( 'error', Lang::get('admin_messages.limit_trade_not_exist') );			
		$data['limit_trade'] = $limit_trade;
		return View::make('admin.limittrade.edit_limittrade',$data);
	}
	public function editTimeLimitTrade($wallet_id=''){
		if($wallet_id=='') return Redirect::to('admin/setting/time-limit-trade');
		$limit_trade = WalletTimeLimitTrade::leftjoin('wallets','wallet_timelimittrade.wallet_id','=','wallets.id')->select('wallet_timelimittrade.*','wallets.type as wallet_type','wallets.name as wallet_name')->where('wallet_id',$wallet_id)->first();
		if(!isset($limit_trade->id)) return Redirect::to('admin/setting/time-limit-trade')->with( 'error', Lang::get('admin_messages.limit_trade_not_exist') );			
		$data['limit_trade'] = $limit_trade;
		return View::make('admin.limittrade.edit_timelimittrade',$data);
	}
   	public function doEditLimitTrade(){
   		$wallet_id = strtoupper(Input::get('wallet_id'));
    	$min_amount = Input::get('min_amount');
    	$max_amount = Input::get('max_amount');
    	$limitTrade=WalletLimitTrade::where('wallet_id',$wallet_id)->first();
    	if(isset($limitTrade->wallet_id)){
    		$limitTrade->min_amount=$min_amount;
    		$limitTrade->max_amount=$max_amount;  
    		$limitTrade->save();
    		if ( $limitTrade->id ){
	            return Redirect::to('admin/setting/limit-trade')->with( 'success', Lang::get('admin_messages.limit_trade_updated') );
	    	}else{	    		
	            return Redirect::to('admin/setting/limit-trade')->with( 'error', Lang::get('admin_messages.cannot_update_limit_trade') );
	    	}
    	}else{
    		return Redirect::to('admin/setting/limit-trade')->with( 'error', Lang::get('admin_messages.limit_trade_not_exist') );
    	} 
   	}
	public function doEditTimeLimitTrade(){
   		$wallet_id = strtoupper(Input::get('wallet_id'));
    	$limit_amount = Input::get('limit_amount');
    	$time_limit = Input::get('time_limit');
    	$limitTrade=WalletTimeLimitTrade::where('wallet_id',$wallet_id)->first();
    	if(isset($limitTrade->wallet_id)){
    		$limitTrade->limit_amount=$limit_amount;
    		$limitTrade->time_limit=$time_limit;  
    		$limitTrade->save();
    		if ( $limitTrade->id ){
	            return Redirect::to('admin/setting/time-limit-trade')->with( 'success', Lang::get('admin_messages.limit_trade_updated') );
	    	}else{	    		
	            return Redirect::to('admin/setting/time-limit-trade')->with( 'error', Lang::get('admin_messages.cannot_update_limit_trade') );
	    	}
    	}else{
    		return Redirect::to('admin/setting/time-limit-trade')->with( 'error', Lang::get('admin_messages.limit_trade_not_exist') );
    	} 
   	}
   	public function addNewMethodDeposit(){
    	$dname = strtoupper(Input::get('dname'));
    	$dfee = Input::get('dfee');
    	$dmin = Input::get('dmin');
    	$ddes = Input::get('ddes');
    	$dminfee = Input::get('dminfee');
		
    	$depositUSD = new MethodDepositCurrency();
    	$depositUSD->dname = $dname;
    	$depositUSD->dfee = $dfee;
    	$depositUSD->dmin = $dmin;
    	$depositUSD->ddes = $ddes;
    	$depositUSD->dminfee = $dminfee;
    	$depositUSD->save();
    	if ( $depositUSD->id ){    		        
            return Redirect::to('admin/manage/method-deposit')->with( 'success', Lang::get('admin_messages.method_deposit_success') );
    	}else{
    		$error = Lang::get('admin_messages.error_database');		
            return Redirect::to('admin/manage/method-deposit')->with( 'error', $error );
    	}
    }
	public function editMethodDeposit($method_id=''){
		if($method_id=='') return Redirect::to('admin/manage/method-deposit');
		$MethodDepositCurrency = MethodDepositCurrency::find($method_id);
		if(!isset($MethodDepositCurrency->id)) return Redirect::to('admin/manage/method-deposit')->with( 'error', Lang::get('admin_messages.method_deposit_not_exist'));		
		$data['MethodDepositCurrency'] = $MethodDepositCurrency;
		return View::make('admin.method-deposit-currency.edit_method_deposit',$data);
	}
	
	public function doEditMethodDeposit(){
		$id = Input::get('id');		
        $depositUSD = MethodDepositCurrency::find($id);
        $depositUSD->dname = Input::get('dname');
        $depositUSD->dfee = Input::get('dfee');
        $depositUSD->dmin = Input::get('dmin');
        $depositUSD->ddes = Input::get('ddes');
        $depositUSD->dminfee = Input::get('dminfee');
        $depositUSD->save();
        return Redirect::to('admin/manage/method-deposit')->with( 'success', Lang::get('admin_messages.update_success') );
	}
	public function deleteMethodDeposit(){
    	$wallet_id = Input::get('wallet_id');
    	$wallet = MethodDepositCurrency::find($wallet_id);
    	if(isset($wallet->id)){    		
    		MethodDepositCurrency::where('id',$wallet_id)->delete();
    		$message = Lang::get('admin_messages.delete_success');
    		if(Input::get('isAjax')){
	            echo json_encode(array('status'=>'success', 'message'=>$message ));
	            exit;
	        } else {
	            return Redirect::to('admin/manage/method-deposit')->with( 'success', $message ); 
	        }  
    	}else{
    		$message = Lang::get('admin_messages.method_deposit_not_exist');
    		if(Input::get('isAjax')){
	            echo json_encode(array('status'=>'error', 'message'=>$message ));
	            exit;
	        } else {
	            return Redirect::to('admin/manage/method-deposit')->with( 'error', $message ); 
	        }    		
    	}
    	
    }

    public function doUpdateSendDeposit(){
    	$username = Input::get('username');
    	$amount = Input::get('amount');
    	$transaction_id = Input::get('transaction_id');
    	$paid = Input::get('paid');
    	if(empty($paid)) $paid=0;
    	$deposit_id = Input::get('deposit_id');
    	$redirect = Input::get('redirect');
    	$user = User::where('username',$username)->first();
    	//echo "<pre>Input: "; print_r(Input::all()); echo "</pre>"; exit;
    	if(!isset($user->id)){
    		return Redirect::to($redirect)->with('error',Lang::get('admin_messages.user_not_exist'));
    	}else{
    		$deposit = Deposit::find($deposit_id);
    		if(isset($deposit->id)){
    			$deposit->amount=$amount;
    			$deposit->transaction_id=$transaction_id;
    			$deposit->paid = $paid;
    			$deposit->save();
    			$message='';
    			if($paid){
    				$balance = new Balance();
    				$wallet = new Wallet();
    				$balance->addMoney($amount,$deposit->wallet_id,$user->id);
    				$message = ". ".Lang::get('admin_messages.send_money_user',array('amount'=>$amount,'coin'=>$wallet->getType($deposit->wallet_id), 'username'=>$user->username));
    			}
    			return Redirect::to($redirect)->with('success',Lang::get('admin_messages.update_success').$message);
    		}else{
    			return Redirect::to($redirect)->with('error',Lang::get('admin_messages.deposit_not_exist'));
    		}
    	}
    }

    public function addNewMethodWithdraw(){
    	$wname = strtoupper(Input::get('wname'));
    	$wfee = Input::get('wfee');
    	$wmin = Input::get('wmin');
    	$wdes = Input::get('wdes');
    	$wminfee = Input::get('wminfee');
		
    	$withdrawUSD = new MethodWithdrawCurrency();
    	$withdrawUSD->wname = $wname;
    	$withdrawUSD->wfee = $wfee;
    	$withdrawUSD->wmin = $wmin;
    	$withdrawUSD->wdes = $wdes;
    	$withdrawUSD->wminfee = $wminfee;
    	$withdrawUSD->save();
    	if ( $withdrawUSD->id ){    		        
            return Redirect::to('admin/manage/method-withdraw')->with( 'success', Lang::get('admin_messages.method_withdraw_success') );
    	}else{
    		$error = Lang::get('admin_messages.error_database');		
            return Redirect::to('admin/manage/method-withdraw')->with( 'error', $error );
    	}
    }
	public function editMethodWithdraw($wallet_id=''){
		if($wallet_id=='') return Redirect::to('admin/manage/method-withdraw');
		$withdrawUSD = MethodWithdrawCurrency::find($wallet_id);
		if(!isset($withdrawUSD->id)) return Redirect::to('admin/manage/withdraw-USD')->with( 'error', Lang::get('admin_messages.method_withdraw_not_exist') );		
		$data['withdrawUSD'] = $withdrawUSD;
		return View::make('admin.method-withdraw-currency.edit_method_withdraw',$data);
	}
	
	public function doEditMethodWithdraw(){
		$id = Input::get('method_id');		
        $withdrawUSD = MethodWithdrawCurrency::find($id);
        $withdrawUSD->wname = Input::get('wname');
        $withdrawUSD->wfee = Input::get('wfee');
        $withdrawUSD->wmin = Input::get('wmin');
        $withdrawUSD->wdes = Input::get('wdes');
        $withdrawUSD->wminfee = Input::get('wminfee');
        $withdrawUSD->save();
        return Redirect::to('admin/manage/method-withdraw')->with( 'success', Lang::get('admin_messages.update_success'));
	}
	public function deleteMethodWithdraw(){
    	$wallet_id = Input::get('wallet_id');
    	$wallet = MethodWithdrawCurrency::find($wallet_id);
    	if(isset($wallet->id)){    		
    		MethodWithdrawCurrency::where('id',$wallet_id)->delete();
    		$message = Lang::get('admin_messages.delete_success');
    		if(Input::get('isAjax')){
	            echo json_encode(array('status'=>'success', 'message'=>$message ));
	            exit;
	        } else {
	            return Redirect::to('admin/manage/method-withdraw')->with( 'success', $message ); 
	        }  
    	}else{
    		$message = Lang::get('admin_messages.method_withdraw_not_exist');
    		if(Input::get('isAjax')){
	            echo json_encode(array('status'=>'error', 'message'=>$message ));
	            exit;
	        } else {
	            return Redirect::to('admin/manage/method-withdraw')->with( 'error', $message ); 
	        }    		
    	}    	
    }

    public function doUpdateTakeMoneyWithdraw(){
    	$username = Input::get('username');
    	$amount = Input::get('amount');
    	$transaction_id = Input::get('transaction_id');
    	$take_money = Input::get('take_money');
    	if(empty($take_money)) $take_money=0;
    	$withdraw_id = Input::get('withdraw_id');
    	$redirect = Input::get('redirect');
    	$fee = Input::get('fee');
    	$receive_amount = $amount-$fee;
    	$user = User::where('username',$username)->first();
    	//echo "<pre>Input: "; print_r(Input::all()); echo "</pre>"; exit;
    	if(!isset($user->id)){
    		return Redirect::to($redirect)->with('error',Lang::get('admin_messages.user_not_exist'));
    	}else{
    		$withdraw = Withdraw::find($withdraw_id);
    		if(isset($withdraw->id)){
    			$withdraw->amount=$amount;
    			$withdraw->transaction_id=$transaction_id;
    			$withdraw->status = $take_money;
    			$withdraw->save();
    			$message='';
    			if($take_money){
    				$balance = new Balance();
    				$wallet = new Wallet();
    				$balance->takeMoney($amount,$withdraw->wallet_id,$user->id);
    				$message = ". ".Lang::get('admin_messages.take_money_user',array('amount'=>$amount,'coin'=>$wallet->getType($withdraw->wallet_id), 'username'=>$user->username));
    			}
    			return Redirect::to($redirect)->with('success',Lang::get('admin_messages.update_success').$message);
    		}else{
    			return Redirect::to($redirect)->with('error',Lang::get('admin_messages.withdraw_not_exist'));
    		}
    	}
    }
}