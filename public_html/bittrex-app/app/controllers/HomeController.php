<?php
if(!CheckDomain::sn_check_domain()){
	echo "Please get license for this domain"; exit;
}
class HomeController extends BaseController {

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
	public function getJsonFeed($from_to='btc_usd')
	{
		if($feed = @file_get_contents('https://btc-e.com/api/2/'.$from_to.'/ticker')){
			$ticker=json_decode($feed, true);
	    	return $ticker['ticker'];
		}else{
			//echo '<br>https://btc-e.com/api/2/'.$from_to.'/ticker';
			return array('last'=>0);
		}
	}
	public function index($market_id=''){		
		$setting = new Setting;
		$wallet = new Wallet();
		$m = Market::where('active',1)->orderBy('id')->first();
		if($market_id == ''){					
			$market_id = $setting->getSetting('default_market',$m->id); 				
		}
		Session::put('market_id', $market_id);
		$market_default = Market::find($market_id);		
		if(!isset($market_default->active) || $market_default->active==0){			
			//$setting->setSetting('default_market',$m->id); 
			return Redirect::to('market/'.$m->id);
		}
		$wallet_from = $market_default->wallet_from;
		$wallet_to = $market_default->wallet_to;
		$from = strtoupper($wallet->getType($wallet_from));
		$to = strtoupper($wallet->getType($wallet_to));
		//get limit amount 
		$limit_day = WalletTimeLimitTrade::select('limit_amount')->where('wallet_id',$wallet_to)->where('time_limit','per day')->first();
		if(isset($limit_day))$data['limit_day'] = $limit_day->limit_amount;
		else $data['limit_day'] = 1000;
		$limit_week = WalletTimeLimitTrade::select('limit_amount')->where('wallet_id',$wallet_to)->where('time_limit','per week')->first();
		if(isset($limit_week))$data['limit_week'] = $limit_week->limit_amount;
		else $data['limit_week'] = 1000;
		//get amount : day
		
		$user = Confide::user();
		if(isset($user)){
			$uid = $user->id;
			$select = "SELECT sum(t.to_value) as sumamount from orders t, market m where m.id=t.market_id and m.wallet_to=".$wallet_to." and t.user_id=".$uid." and t.created_at='".date("Y-m-d")."'";		
			$selectsum = DB::select($select);
			$sumamount = $selectsum[0]->sumamount;
			$data['amount_sum_day'] = $sumamount;			
		}
		if(!isset($data['amount_sum_day'])) $data['amount_sum_day'] = 0;
		//echo 'aaaaaaaaaaa:'; print_r($data['amount_sum_day']);
		//get name of wallet
		$wallet1=Wallet::where('id',$wallet_from)->first();
		$wallet2=Wallet::where('id',$wallet_to)->first();
		$data['market_from']=$wallet1->name;
		$data['market_to']=$wallet2->name;

		$data['coinmain'] = $from;
		$data['coinsecond'] = $to;
		//get balance
		$balance = new Balance();
		$data['balance_coinmain'] = sprintf('%.8f',$balance->getBalance($wallet_from,0));
		$data['balance_coinsecond'] = sprintf('%.8f',$balance->getBalance($wallet_to,0));

		//get Sell Lowest
		$data['sell_lowest'] = sprintf('%.8f',0);
		$data['buy_highest'] = sprintf('%.8f',0);
		$order = new Order();
				
		$sell_lowest = $order->getSellLowest($market_id);
		$buy_highest = $order->getBuyHighest($market_id);
		if(isset($sell_lowest->price)) $data['sell_lowest'] = sprintf('%.8f',$sell_lowest->price);
		if(isset($buy_highest->price)) $data['buy_highest'] = sprintf('%.8f',$buy_highest->price);

		//fee_buy, fee_sell
		$fee_trade = new FeeTrade();
		$fee = $fee_trade->getFeeTrade($market_id);
		$data['fee_buy'] = $fee['fee_buy'];
		$data['fee_sell'] = $fee['fee_sell'];

		//get list orders
		$num_transaction_display = $setting->getSetting('num_transaction_display',0);
		$list_sell_orders = $order->getOrders($market_id,'sell',$num_transaction_display);
		$list_buy_orders = $order->getOrders($market_id,'buy',$num_transaction_display);
		$data['sell_orders'] = $list_sell_orders;
		$data['buy_orders'] = $list_buy_orders;
		
		//get all history
		$trade_history =Trade::where('market_id', '=', $market_id)->orderBy('created_at', 'desc')->take($num_transaction_display)->get();
		$data['trade_history'] = $trade_history;
		$data['market_id']=$market_id;

		$current_orders_user = $order->getCurrentOrdersUser($market_id);
		if($current_orders_user){
			$data['current_orders_user'] = $current_orders_user;
		}

		$trade = new Trade();
		$datachart = $trade->getDatasChart($market_id,'6 hour');
		$news = Post::where('type','news')->take(5)->orderby('created_at','desc')->get();
		$data['news'] = $news;

		//price
		$data_price = $trade->getBlockPrice($market_id);		
		$data["get_prices"] = $data_price['get_prices'];
		$data['lastest_price'] = $data_price['lastest_price'];

		//limit trade amount
		$limit_trade = WalletLimitTrade::where('wallet_id',$wallet_from)->first();
		
		if($limit_trade) $data['limit_trade']=$limit_trade->toArray();		
		else $data['limit_trade']=array('min_amount'=>0.0001,'max_amount'=>1000);
		
		//get data for block statistic
		$btc_wallet = Wallet::where('type','BTC')->first();
		$ltc_wallet = Wallet::where('type','LTC')->first();
		$btc_markets = array();
		$ltc_markets = array();

		//btc market on sidebar left		
		$all_market_btc = array();
		if(isset($btc_wallet->id)){
			$btc_markets = Market::leftJoin('wallets', 'market.wallet_from', '=', 'wallets.id')
	                    ->select('market.*', 'wallets.name', 'wallets.type')->where('wallet_to',$btc_wallet->id)->orderby('wallets.type')->get();
	        $btc_datainfo = array();
	        foreach ($btc_markets as$value) {
	        	$all_market_btc[]=$value->id;
	        	$btc_datainfo[$value->id] = Trade::where('market_id',$value->id)->orderby('created_at','desc')->take(2)->get()->toArray();
			   //      	$total_btc = DB::table('trade_history')->select(DB::raw('SUM( amount * price ) AS total'))
		    //                  ->where('market_id', '=', $value->id)->first();
		    //              //echo "<pre>total_btc: "; print_r($total_btc); echo "</pre>";  
		    //              //echo "<pre>getQueryLog: ".dd(DB::getQueryLog())."</pre>"; 
				// if(isset($total_btc->total))
				// 	$ltc_datainfo[$value->id]['total'] = $total_btc->total;
				$select="SELECT SUM( amount * price ) AS total FROM trade_history Where `market_id`='".$value->id."' GROUP BY market_id";
				$total_btc = DB::select($select); 
				if(isset($total_btc[0]))
					$btc_datainfo[$value->id]['total'] = $total_btc[0]->total;
				else $btc_datainfo[$value->id]['total'] = 0;
	        }
	        
	        $data['btc_datainfo']=$btc_datainfo;
		}
		
		//ltc market on sidebar left
		$all_market_ltc = array();
		if(isset($ltc_wallet->id)){
			$ltc_markets = Market::leftJoin('wallets', 'market.wallet_from', '=', 'wallets.id')
	                    ->select('market.*', 'wallets.name', 'wallets.type')->where('wallet_to',$ltc_wallet->id)->orderby('wallets.type')->get();
	        $ltc_datainfo = array();
	        foreach ($ltc_markets as$value) {
	        	$all_market_ltc[]=$value->id;
	        	$ltc_datainfo[$value->id] = Trade::where('market_id',$value->id)->orderby('created_at','desc')->take(2)->get()->toArray();	        	
				// $total_ltc = DB::table('trade_history')->select(DB::raw('SUM( amount * price ) AS total'))
    		//                  ->where('market_id', '=', $value->id)->first();
				// if(isset($total_ltc->total))
				// 	$ltc_datainfo[$value->id]['total'] = $total_ltc->total;
				$select="SELECT SUM( amount * price ) AS total FROM trade_history Where `market_id`='".$value->id."' GROUP BY market_id";
				$total_ltc = DB::select($select); 
				if(isset($total_ltc[0]))
					$ltc_datainfo[$value->id]['total'] = $total_ltc[0]->total;
				else $ltc_datainfo[$value->id]['total'] = 0;
	        }	        
	        $data['ltc_datainfo']=$ltc_datainfo;
	    } 
	    $data['btc_markets']=$btc_markets;
		$data['ltc_markets']=$ltc_markets;

		$date = date( "Y-m-d H:i:s", strtotime( " -24 hour" ));
		//echo "+24 hours: ".$date;
		
		if(!empty($all_market_btc)){			
			$data['statistic_btc']=DB::table('trade_history')->select(DB::raw('COUNT(*) as number_trade,SUM( amount * price ) AS total'))->where('created_at', '>=', $date)->whereIn('market_id', $all_market_btc)->first();
		}
		if(!empty($all_market_ltc)){			
			$data['statistic_ltc']=DB::table('trade_history')->select(DB::raw('COUNT(*) as number_trade,SUM( amount * price ) AS total'))->where('created_at', '>=', $date)->whereIn('market_id', $all_market_ltc)->first();
		}
		$data['wallets']=Wallet::orderby('type')->get();
		return View::make('home',$data);
	}
	
	public function routePage($page=''){
		//echo "<pre>user: "; print_r(Confide::user() ); echo "</pre>";
		switch ($page) {
			case "fees":
				$market = new Market();
				$wallet = new Wallet();
				$fees_trade = FeeTrade::get()->toArray();
				//echo "<pre>list_buy_orders: "; print_r($list_buy_orders); echo "</pre>";
				$fees_withdraw = FeeWithdraw::leftJoin('wallets', 'fee_withdraw.wallet_id', '=', 'wallets.id')
            		->select('fee_withdraw.*', 'wallets.type', 'wallets.name')->get();
				
				foreach ($fees_trade as $key => $value) {
					$wallet_type=$market->getWalletType($value['market_id']);
					if(!empty($wallet_type)){
						$fees_trade[$key]['wallet_from'] = $wallet_type['wallet_from'];
						$fees_trade[$key]['wallet_to'] = $wallet_type['wallet_to'];
					}
				}
				
				$fee['fees_trade'] = $fees_trade;
				$fee['fees_withdraw'] = $fees_withdraw;
				return View::make('fees',$fee);
				break;	
			case "voting":
				$setting=new Setting();				
				$coinvotes = DB::table('coin_votes')
                 ->get();
                try{
		            $wallet = Wallet::where('type','BTC')->first();
	                $wallet->connectJsonRPCclient($wallet->wallet_username,$wallet->wallet_password,$wallet->wallet_ip,$wallet->port);	         
	                foreach ($coinvotes as $key => $value) {
	                 	$num_vote = Vote::where('coinvote_id','=', $value->id)->count();
	                 	
	                 	//echo "<pre>getreceivedbyaccount"; print_r($wallet->getReceivedByAddress($value->btc_address)); echo "</pre>";//$value->label_address
	                 	$btc_payment = $wallet->getReceivedByAddress($value->btc_address);//'12X9jVe4S8pAqJ7EoKN7B4YwMQpzfgArtX'
	                 	$amount_btc_per_vote=$setting->getSetting('amount_btc_per_vote',0.0001);
	                 	$num_payment = floor($btc_payment/$amount_btc_per_vote);
	                 	//echo "btc_payment: ".$btc_payment;
	                 	//echo "<br>num_payment: ".$num_payment;
	                 	$coinvotes[$key]->num_vote = $num_vote + $num_payment;

	                }
	            }catch (Exception $e) {
	                $data['error_message']= Lang::get('texts.not_connect_wallet'); //'Caught exception: '.$e->getMessage()."\n";  //"Not connect to this       
	            }
                 
                 //echo "<pre>coinvotes"; print_r($coinvotes); echo "</pre>";
                 $data['coinvotes'] = $coinvotes;
				return View::make('voting',$data);
				break;			
			case "security":
				return View::make('security');
				break;
			case "api":
				if(isset($_REQUEST['method'])){
					$method = $_REQUEST['method'];
					$value = $this->api($method);	
				} 
				else{
					$setting=new Setting();
					$data['pusher_app_key']=$setting->getSetting('pusher_app_key','');
					return View::make('api',$data);
				} 
				print_r($value);				
				break;	
			case "apiprivate":
				$value = $this->apiprivate(); 
				break;
			case "all-trades":
				if( Auth::guest() ){
					return Redirect::to('/login');
				}
				$record_per_page = 15;              
                if(empty($_GET['pager_page'])) $pager_page = 1;
                 else $pager_page = $_GET['pager_page'];
                $data['cur_page'] = $pager_page;
                $offset_start = ($pager_page-1)*$record_per_page;
                
                $trade_history = Trade::leftjoin('market','market.id','=','trade_history.market_id')->select('trade_history.*', 'market.wallet_from as from', 'market.wallet_to as to');
                $where='';                          
                
                if(Input::has('market')){
                	$fil_market=Input::get('market');                	
                	$trade_history->where("trade_history.market_id","=",$fil_market);
                } 
                if(Input::has('type')){
                	$fil_type=Input::get('type');
                	$trade_history->where("trade_history.type","=",$fil_type);      
                }              
               
                $total_records = $trade_history->get(); 
               
                $data['total_pages'] = ceil(count($total_records)/$record_per_page);
                $trades = $trade_history->skip($offset_start)->take($record_per_page)->orderby("created_at","desc")->get();                
                #echo "<pre>trade_history"; print_r($trades->toArray()); echo "</pre>";
                //echo "<pre>getQueryLog: ".dd(DB::getQueryLog())."</pre>";              
                $data['tradehistories'] = $trades;
                $market = new Market();
                $markets = Market::get();
                $market_wallet = array();
                foreach ($markets as $value) {
                    $market_wallet[$value->id] = $market->getWalletType($value->id);
                }
                $data['markets'] = $market_wallet;
                return View::make('alltrades',$data);
				break;
			case "all-news":
				$news = Post::where('type','news')->orderby('created_at','desc')->get();
				$data['news'] = $news;
				return View::make('allnews',$data);
				break;			
			default:				
				return View::make('index');
				break; 
		} 
	}
	public function maintenanceMode(){
		return View::make('maintenance');
	}
	public function getChart(){
		$market_id = $_POST['market_id'];
		$timeSpan = $_POST['timeSpan'];
		$trade = new Trade();
		$datachart = $trade->getDatasChart($market_id,$timeSpan);
		echo $datachart;
		exit;
	}

	public function viewPost($permalink){
    	$post = Post::where('permalink',$permalink)->first();
    	if(!isset($post->id)) return Redirect::to('/')->with( 'error', Lang::get('messages.page_not_found') ); 
    	$data['post'] = $post;
    	return View::make('post',$data);
    }

	public function doTest(){
		//BrainSocket::message('doTest', array('message'=>Wallet::get()->toArray()));
		echo json_encode(Wallet::get()->toArray());	
		exit;
	}
	 public function api($method=''){ 
   		//market trade
		if($method=='singlemarket' || $method=='allmarket'){
			if($method=='singlemarket'){
				if(isset($_REQUEST['marketid']) && is_numeric($_REQUEST['marketid'])){
				$market_sql = 'select * from market where id='.$_REQUEST['marketid'];}
				else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.link_not_correct')));echo $output;exit;}
			}
			else $market_sql = 'select * from market';
			$market = DB::select($market_sql);
			//print_r($market);
			$getarray = array();
			$i=0;
			$output = json_encode(array('return' => $market));
			//echo $output.'<br>';
			foreach($market as $item){
				$wallet_f = $item->wallet_from;
				$wallet_sql = 'select type,name from wallets where id='.$wallet_f;
				$wallet = DB::select($wallet_sql);
				foreach($wallet as $w){$wf_type=$w->type;$wf_name=$w->name;}
				
				$wallet_t = $item->wallet_to;
				$wallet_sql = 'select type,name from wallets where id='.$wallet_t;
				$wallet = DB::select($wallet_sql);
				foreach($wallet as $w){$wt_type=$w->type;$wt_name=$w->name;}
				$label = $wf_type.'/'.$wt_type ;
				
				//get trade from market
				$market_id = $item->id;
				$market_sql = 'select * from trade_history where market_id='.$market_id;
				$market = DB::select($market_sql);
				
				$market_sql_buy = 'select * from trade_history where market_id='.$market_id.' and type="buy"';
				$market_buy = DB::select($market_sql_buy);
				if(count($market_buy)==0)$buyorders = 'null';
				
				$market_sql_sell = 'select * from trade_history where market_id='.$market_id.' and type="sell"';
				$market_sell = DB::select($market_sql_sell);
				if(count($market_sell)==0)$sellorders = 'null';
				
				if(count($market)==0){
					$lasttradeprice = '0.00000000';
					$lasttradetime = '0000-00-00 00:00:00';
					$recenttrades = 'null';
				}else{
					//get last info
					$market_last_sql = 'select max(updated_at) as updated_at, price  from trade_history where market_id='.$market_id;
					$market_last = DB::select($market_last_sql);
					foreach($market_last as $m){
						$lasttradeprice = $m->price; 
						$lasttradetime = $m->updated_at;
					}
					$recenttrades = array();
					$sellorders = array();
					$buyorders = array();
					$j=0;
					foreach($market as $m){
						$recenttrades[$j] = array('id'=>$m->id,'time'=>$m->updated_at,'price'=>$m->price,'amount'=>$m->amount);						
						$j++;
					} 
					if(count($market_buy)!=0){$j=0;
						foreach($market_buy as $m){
							$buyorders[$j] = array('price'=>$m->price,'amount'=>$m->amount);
							$j++;
						}
					}
					if(count($market_sell)!=0){$j=0;
						foreach($market_sell as $m){
							$sellorders[$j] = array('price'=>$m->price,'amount'=>$m->amount);
							$j++;
						}
					}
				}
				
				$getarray[$i] = array('marketid' => $item->id,'label' => $label,'lasttradeprice'=>$lasttradeprice,'lasttradetime'=>$lasttradetime,
				'primaryname'=>$wf_name,'primarycode'=>$wf_type,'secondaryname'=>$wt_type,'secondarycode'=>$wt_name,'recenttrades'=>$recenttrades,
				'sellorders'=>$sellorders,'buyorders'=>$buyorders);
				$i++;
			}  
			if(count($getarray)==0) $output = json_encode(array('success' => 0,'value'=>'null'));	
			else	
			$output = json_encode(array('success' => 1,'return' => $getarray));
			echo $output; 
			 
			//$json = file_get_contents('http://pubapi.cryptsy.com/api.php?method=marketdatav2'); 
			//$data = json_decode($json);
			//print_r ($data); 
			//http://www.ecoinstrader.com/page/api?method=allmarket
		}
		
		//orders
		
		if($method=='singleorder' || $method=='allorder'){
			if($method=='singleorder'){
				if(isset($_REQUEST['marketid']) && is_numeric($_REQUEST['marketid'])){
				$market_sql = 'select * from market where id='.$_REQUEST['marketid'];}
				else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.link_not_correct')));echo $output;exit;}
			} 
			else $market_sql = 'select * from market';
			$market = DB::select($market_sql);
			//print_r($market);
			$getarray = array();
			$i=0;
			$output = json_encode(array('return' => $market));
			//echo $output.'<br>';
			foreach($market as $item){
				$wallet_f = $item->wallet_from;
				$wallet_sql = 'select type,name from wallets where id='.$wallet_f;
				$wallet = DB::select($wallet_sql);
				foreach($wallet as $w){$wf_type=$w->type;$wf_name=$w->name;}
				
				$wallet_t = $item->wallet_to;
				$wallet_sql = 'select type,name from wallets where id='.$wallet_t;
				$wallet = DB::select($wallet_sql);
				foreach($wallet as $w){$wt_type=$w->type;$wt_name=$w->name;}
				$label = $wf_type.'/'.$wt_type ;
				
				//get trade from market
				$market_id = $item->id;
				$market_sql = 'select * from orders where market_id='.$market_id;
				$market = DB::select($market_sql);
				
				$market_sql_buy = 'select * from orders where market_id='.$market_id.' and type="buy"';
				$market_buy = DB::select($market_sql_buy);
				if(count($market_buy)==0)$buyorders = 'null';
				
				$market_sql_sell = 'select * from orders where market_id='.$market_id.' and type="sell"';
				$market_sell = DB::select($market_sql_sell);
				if(count($market_sell)==0)$sellorders = 'null';
				
				if(count($market)==0){
					$lasttradeprice = '0.00000000';
					$lasttradetime = '0000-00-00 00:00:00';
					
				}else{
					//get last info
					$market_last_sql = 'select max(updated_at) as updated_at, price  from orders where market_id='.$market_id;
					$market_last = DB::select($market_last_sql);
					foreach($market_last as $m){
						$lasttradeprice = $m->price; 
						$lasttradetime = $m->updated_at;
					}
					
					$sellorders = array();
					$buyorders = array();
					$j=0;
					 
					if(count($market_buy)!=0){$j=0;
						foreach($market_buy as $m){
							$buyorders[$j] = array('price'=>$m->price,'amount'=>$m->from_value);
							$j++;
						}
					}
					if(count($market_sell)!=0){$j=0;
						foreach($market_sell as $m){
							$sellorders[$j] = array('price'=>$m->price,'amount'=>$m->from_value);
							$j++;
						}
					}
				}
				
				$getarray[$i] = array('marketid' => $item->id,'label' => $label,
				'primaryname'=>$wf_name,'primarycode'=>$wf_type,'secondaryname'=>$wt_type,'secondarycode'=>$wt_name,
				'sellorders'=>$sellorders,'buyorders'=>$buyorders);
				$i++;
			}			
			if(count($getarray)==0) $output = json_encode(array('success' => 0));	
			else
			$output = json_encode(array('success' => 1,'return' => $getarray));
			echo $output;
			//http://www.ecoinstrader.com/page/api?method=singleorder&marketid
		}
		if($method=='getmarkets'){
			if(isset($_REQUEST['key']) && !empty($_REQUEST['key']) && isset($_REQUEST['sign']) && !empty($_REQUEST['sign'])){
				$market_sql = 'select * from market';
				$market = DB::select($market_sql);
				//print_r($market);
				$getarray = array();
				$i=0;
				$output = json_encode(array('return' => $market));
				//echo $output.'<br>';
				foreach($market as $item){
					$wallet_f = $item->wallet_from;
					$wallet_sql = 'select type,name from wallets where id='.$wallet_f;
					$wallet = DB::select($wallet_sql);
					foreach($wallet as $w){$wf_type=$w->type;$wf_name=$w->name;}
					
					$wallet_t = $item->wallet_to;
					$wallet_sql = 'select type,name from wallets where id='.$wallet_t;
					$wallet = DB::select($wallet_sql);
					foreach($wallet as $w){$wt_type=$w->type;$wt_name=$w->name;}
					$label = $wf_type.'/'.$wt_type ;
					
					//get trade from market
					$market_id = $item->id;
					$market_sql = 'select * from trade_history where market_id='.$market_id;
					$market = DB::select($market_sql);
					
					$market_sql_buy = 'select * from trade_history where market_id='.$market_id.' and type="buy"';
					$market_buy = DB::select($market_sql_buy);
					if(count($market_buy)==0)$buyorders = 'null';
					
					$market_sql_sell = 'select * from trade_history where market_id='.$market_id.' and type="sell"';
					$market_sell = DB::select($market_sql_sell);
					if(count($market_sell)==0)$sellorders = 'null';
					
					if(count($market)==0){
						$lasttradeprice = '0.00000000';
						$lasttradetime = '0000-00-00 00:00:00';
						$recenttrades = 'null';
						$highttradeprice = 'null';
						$lowtradeprice = 'null';
					}else{
						//get last trade info
						$market_last_sql = 'select max(updated_at) as updated_at, price  from trade_history where market_id='.$market_id;
						$market_last = DB::select($market_last_sql);
						foreach($market_last as $m){
							$lasttradeprice = $m->price; 
							$lasttradetime = $m->updated_at;
						}
						//get hight trade
						$market_hight_sql = 'select distinct max(price) as price  from trade_history where market_id='.$market_id;
						$market_hight = DB::select($market_hight_sql);
						foreach($market_hight as $m){
							$highttradeprice = $m->price; 
						}
						//get low trade
						$market_low_sql = 'select min(price) as price  from trade_history where market_id='.$market_id;
						$market_low = DB::select($market_low_sql);
						foreach($market_low as $m){
							$lowtradeprice = $m->price; 
						}
					}
					
					$getarray[$i] = array('marketid' => $item->id,'label' => $label,'created'=>$lasttradetime,
					'primaryname'=>$wf_name,'primarycode'=>$wf_type,'secondaryname'=>$wt_type,'secondarycode'=>$wt_name,
					'last_trade'=>$lasttradeprice,'high_trade'=>$highttradeprice,'low_trade'=>$lowtradeprice);
					$i++;
				}  
				if(count($getarray)==0) $output = json_encode(array('success' => 0,'value'=>'null'));	
				else	
				$output = json_encode(array('success' => 1,'return' => $getarray));
				//check user account
				$sign = $_REQUEST['sign'];
				$password = $_REQUEST['key'];
				$account_sql = 'select * from users where username="'.$sign.'"';
				$account = DB::select($account_sql);
				if(count($account)!=0){
					foreach($account as $a){$u_pass = $a->password;}
					if(Hash::check($password, $u_pass)) {$ch='ok';}
					else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.api_cannot_authorize_check_key')));echo $output;exit;}
				} 
				else{$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.api_cannot_authorize_check_sign_data')));echo $output;exit;}
				
				echo $output; 
			}
			else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.link_not_correct')));echo $output;exit;}
		}
		if($method=='getwallets'){
			if(isset($_REQUEST['key']) && !empty($_REQUEST['key']) && isset($_REQUEST['sign']) && !empty($_REQUEST['sign'])){
				$wallets_sql = 'select b.percent_fee, a.id, a.type, a.name from wallets a, fee_withdraw b where a.id=b.wallet_id';
				$wallets = DB::select($wallets_sql);
				//print_r($market);
				$getarray = array();
				$i=0;
				$output = json_encode(array('return' => $wallets));
				//echo $output.'<br>';
				foreach($wallets as $item){
					$getarray[$i] = array('currencyid' => $item->id,'name'=>$item->name,'code'=>$item->type,'withdrawfee'=>$item->percent_fee);
					$i++;
				}  
				if(count($getarray)==0) $output = json_encode(array('success' => 0,'value'=>'null'));	
				else 	
				$output = json_encode(array('success' => 1,'return' => $getarray));
				//check user account
				$sign = $_REQUEST['sign'];
				$password = $_REQUEST['key'];
				$account_sql = 'select * from users where username="'.$sign.'"';
				$account = DB::select($account_sql);
				if(count($account)!=0){
					foreach($account as $a){$u_pass = $a->password;}
					if(Hash::check($password, $u_pass)) {$ch='ok';}
					else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.api_cannot_authorize_check_key')));echo $output;exit;}
				} 
				else{$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.api_cannot_authorize_check_sign_data')));echo $output;exit;}
				
				echo $output; 
			}
			else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.link_not_correct')));echo $output;exit;}
		}
		if($method=='mydeposits'){
			if(isset($_REQUEST['key']) && !empty($_REQUEST['key']) && isset($_REQUEST['sign']) && !empty($_REQUEST['sign'])){
				
				//check user account
				$sign = $_REQUEST['sign'];
				$password = $_REQUEST['key'];
				$account_sql = 'select * from users where username="'.$sign.'"';
				$account = DB::select($account_sql);
				if(count($account)!=0){
					foreach($account as $a){$u_pass = $a->password;$u_id=$a->id;}
					if(Hash::check($password, $u_pass)) {
					
						$deposit_sql = 'select * from deposits d, wallets w where d.wallet_id=w.id and d.user_id="'.$u_id.'"';
						$deposit = DB::select($deposit_sql);
						//print_r($market);
						$getarray = array();
						$i=0;
						
						foreach($deposit as $item){
							$getarray[$i] = array('currencyid' => $item->id,'created'=>$item->created_at,'updated'=>$item->updated_at,'address'=>$item->address,
							'amount'=>$item->amount,'transactionid'=>$item->transaction_id);
							$i++;
						}  
						if(count($getarray)==0) $output = json_encode(array('success' => 0,'value'=>'null'));	
						else 	
						$output = json_encode(array('success' => 1,'return' => $getarray));
					
					
					}
					else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.api_cannot_authorize_check_key')));echo $output;exit;}
				} 
				else{$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.api_cannot_authorize_check_sign_data')));echo $output;exit;}
				
				echo $output; 
			}
			else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.link_not_correct')));echo $output;exit;}
		}
		if($method=='mywithdraws'){
			if(isset($_REQUEST['key']) && !empty($_REQUEST['key']) && isset($_REQUEST['sign']) && !empty($_REQUEST['sign'])){
				
				//check user account
				$sign = $_REQUEST['sign'];
				$password = $_REQUEST['key'];
				$account_sql = 'select * from users where username="'.$sign.'"';
				$account = DB::select($account_sql);
				if(count($account)!=0){
					foreach($account as $a){$u_pass = $a->password;$u_id=$a->id;}
					if(Hash::check($password, $u_pass)) {
					
						$deposit_sql = 'select * from withdraws d, wallets w where d.wallet_id=w.id and d.user_id="'.$u_id.'"';
						$deposit = DB::select($deposit_sql);
						//print_r($market);
						$getarray = array();
						$i=0;
						
						foreach($deposit as $item){
							$getarray[$i] = array('currencyid' => $item->id,'created'=>$item->created_at,'toaddress'=>$item->to_address,
							'amount'=>$item->amount,'feeamount'=>$item->fee_amount,'receiveamount'=>$item->receive_amount,'transactionid'=>$item->transaction_id);
							$i++;
						}  
						if(count($getarray)==0) $output = json_encode(array('success' => 0,'value'=>'null'));	
						else 	
						$output = json_encode(array('success' => 1,'return' => $getarray));
					}
					else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.api_cannot_authorize_check_key')));echo $output;exit;}
				} 
				else{$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.api_cannot_authorize_check_sign_data')));echo $output;exit;}
				
				echo $output; 
			}
			else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.link_not_correct')));echo $output;exit;}
		}
		if($method=='mytransfers'){
			if(isset($_REQUEST['key']) && !empty($_REQUEST['key']) && isset($_REQUEST['sign']) && !empty($_REQUEST['sign'])){
				
				//check user account
				$sign = $_REQUEST['sign'];
				$password = $_REQUEST['key'];
				$account_sql = 'select * from users where username="'.$sign.'"';
				$account = DB::select($account_sql);
				if(count($account)!=0){
					foreach($account as $a){$u_pass = $a->password;$u_id=$a->id;}
					if(Hash::check($password, $u_pass)) {
					
						$deposit_sql = 'select * from transfer_history where sender='.$u_id.' or receiver='.$u_id;
						$deposit = DB::select($deposit_sql);
						//print_r($market);
						$getarray = array();
						$i=0;
						
						foreach($deposit as $item){
							$sender = $item->sender;
							$sender_sql = 'select * from users where id='.$sender;
							$sen = DB::select($sender_sql);
							foreach($sen as $s){$sender_name=$s->username;}
							
							$receiver = $item->receiver;
							$receiver_sql = 'select * from users where id='.$receiver;
							$receive = DB::select($receiver_sql);
							foreach($receive as $r){$receive_name=$r->username;}
							
							$wallet = $item->wallet_id;
							$wallet_sql = 'select * from wallets where id='.$wallet;
							$wa = DB::select($wallet_sql);
							foreach($wa as $w){$wallet_name=$w->name;}
							
							
							$getarray[$i] = array('currency'=>$wallet_name,'time'=>$item->created_at,'sender'=>$sender_name,
							'receiver'=>$receive_name,'amount'=>$item->amount);
							$i++;
						}  
						if(count($getarray)==0) $output = json_encode(array('success' => 0,'value'=>'null'));	
						else 	
						$output = json_encode(array('success' => 1,'return' => $getarray));
					}
					else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.api_cannot_authorize_check_key')));echo $output;exit;}
				} 
				else{$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.api_cannot_authorize_check_sign_data')));echo $output;exit;}
				
				echo $output; 
			}
			else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.link_not_correct')));echo $output;exit;}
		}
		if($method=='getmydepositaddresses'){
			if(isset($_REQUEST['key']) && !empty($_REQUEST['key']) && isset($_REQUEST['sign']) && !empty($_REQUEST['sign'])){
				
				//check user account
				$sign = $_REQUEST['sign'];
				$password = $_REQUEST['key'];
				$account_sql = 'select * from users where username="'.$sign.'"';
				$account = DB::select($account_sql);
				if(count($account)!=0){
					foreach($account as $a){$u_pass = $a->password;$u_id=$a->id;}
					if(Hash::check($password, $u_pass)) {
					
						$deposit_sql = 'select * from user_address_deposit u, wallets w where u.wallet_id=w.id and u.user_id='.$u_id;
						$deposit = DB::select($deposit_sql);
						
						$getarray = array(); 
						$i=0;
						
						foreach($deposit as $item){
							
							$getarray[$i] = array('coincode'=>$item->type,'despositaddress'=>$item->addr_deposit);
							$i++;
						}   
						if(count($getarray)==0) $output = json_encode(array('success' => 0,'value'=>'null'));	
						else 	
						$output = json_encode(array('success' => 1,'return' => $getarray));
					}
					else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.api_cannot_authorize_check_key')));echo $output;exit;}
				} 
				else{$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.api_cannot_authorize_check_sign_data')));echo $output;exit;}
				
				echo $output; 
			}
			else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.link_not_correct')));echo $output;exit;}
		}
		if($method=='allmyorders'){
			if(isset($_REQUEST['key']) && !empty($_REQUEST['key']) && isset($_REQUEST['sign']) && !empty($_REQUEST['sign'])){
				
				//check user account
				$sign = $_REQUEST['sign'];
				$password = $_REQUEST['key'];
				$account_sql = 'select * from users where username="'.$sign.'"';
				$account = DB::select($account_sql);
				if(count($account)!=0){
					foreach($account as $a){$u_pass = $a->password;$u_id=$a->id;}
					if(Hash::check($password, $u_pass)) {
					
						$deposit_sql = 'select * from orders where user_id='.$u_id;
						$deposit = DB::select($deposit_sql);
						
						$getarray = array(); 
						$i=0;
						
						foreach($deposit as $item){
							
							$getarray[$i] = array('orderid'=>$item->id,'marketid'=>$item->market_id,'created'=>$item->created_at,'ordertype'=>$item->type,
							'price'=>$item->price,'fromvalue'=>$item->from_value,'tovalue'=>$item->to_value);
							$i++;
						}   
						if(count($getarray)==0) $output = json_encode(array('success' => 0,'value'=>'null'));	
						else 	
						$output = json_encode(array('success' => 1,'return' => $getarray));
					}
					else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.api_cannot_authorize_check_key')));echo $output;exit;}
				} 
				else{$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.api_cannot_authorize_check_sign_data')));echo $output;exit;}
				
				echo $output; 
			}
			else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.link_not_correct')));echo $output;exit;}
		}
		if($method=='myorders'){
			if(isset($_REQUEST['key']) && !empty($_REQUEST['key']) && isset($_REQUEST['sign']) && !empty($_REQUEST['sign']) && isset($_REQUEST['marketid']) && !empty($_REQUEST['marketid'])){
				
				//check user account
				$sign = $_REQUEST['sign'];
				$password = $_REQUEST['key'];
				$marketid = $_REQUEST['marketid'];
				$account_sql = 'select * from users where username="'.$sign.'"';
				$account = DB::select($account_sql);
				if(count($account)!=0){
					foreach($account as $a){$u_pass = $a->password;$u_id=$a->id;}
					if(Hash::check($password, $u_pass)) {
					
						$deposit_sql = 'select * from orders where market_id="'.$marketid.'" and user_id='.$u_id;
						$deposit = DB::select($deposit_sql);
						
						$getarray = array(); 
						$i=0;
						
						foreach($deposit as $item){
							
							$getarray[$i] = array('orderid'=>$item->id,'created'=>$item->created_at,'ordertype'=>$item->type,
							'price'=>$item->price,'fromvalue'=>$item->from_value,'tovalue'=>$item->to_value);
							$i++;
						}   
						if(count($getarray)==0) $output = json_encode(array('success' => 0,'value'=>'null'));	
						else 	
						$output = json_encode(array('success' => 1,'return' => $getarray));
					}
					else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.api_cannot_authorize_check_key')));echo $output;exit;}
				} 
				else{$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.api_cannot_authorize_check_sign_data')));echo $output;exit;}
				
				echo $output; 
			}
			else {$output = json_encode(array('success' => 0,'error'=>Lang::get('messages.link_not_correct')));echo $output;exit;}
		}
		
   }  
   
	function apiprivate() { 
		//$va = $_REQUEST['method'];
		$val=array('success' => 'aaaaaa');
		return $val;
	}
 
}
