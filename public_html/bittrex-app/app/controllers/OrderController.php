<?php

class OrderController extends BaseController {
	public function doBuy(){
		if ( Auth::guest() ){
			echo json_encode(array('status'=>'error','message'=> Lang::get('messages.login_to_buy')));
			exit;
		}		

		$logFile = 'trades.log';
        Log::useDailyFiles(storage_path().'/logs/trades/'.$logFile);
		Log::info('------------------------- Do Buy -----------------------------');
		$user = Confide::user();
		$price_buy = sprintf('%.8f',$_POST['price']);
		$amount_buy = $amount_buy_temp = sprintf('%.8f',$_POST['amount']);
		$total_buy = $price_buy*$amount_buy;//sprintf('%.8f',$price_buy*$amount_buy);
		$market_id = $_POST['market_id'];//Session::get('market_id');

		//get info market
		$market_default = Market::find($market_id);
		if(!isset($market_default->active) || $market_default->active==0){			
			echo json_encode(array('status'=>'error','message'=> Lang::get('messages.market_not_active')));
			exit;
		}	
		$wallet_from = $market_default->wallet_from;
		$wallet_to = $market_default->wallet_to;

		$wallet = new Wallet();
		$from = $wallet->getType($wallet_from);
		$to = $wallet->getType($wallet_to);

		//cleck limit trade
		$limit_trade = WalletLimitTrade::where('wallet_id',$wallet_from)->first();
		if($limit_trade) $limit_trade=$limit_trade->toArray();		
		else $limit_trade=array('min_amount'=>0.0001,'max_amount'=>1000);
				
		if(sprintf('%.8f',$_POST['amount'])< $limit_trade['min_amount'] || sprintf('%.8f',$_POST['amount'])>$limit_trade['max_amount']){
			echo json_encode(array('status'=>'error','message'=> Lang::get('messages.message_limit_trade')));
			exit;
		}
		

		//set default return value
		$status = 'error';
		$message= Lang::get('messages.error_contact_admin');

		$balance = new Balance();
		$message_socket = array();
		$message_socket['market_id'] = $market_id;
		//sub $total_buy money
		if($balance->takeMoney($total_buy,$wallet_to,$user->id)){//tru tien mua chua tru phi (giam tien)
			$orders_buy = new Order();
			$orders_buy->price = $price_buy;
			$orders_buy->status = 'active';
			$orders_buy->from_value = $amount_buy;
			$orders_buy->to_value = $total_buy;
			$orders_buy->market_id = $market_id;
			$orders_buy->user_id = $user->id;
			$orders_buy->type = 'buy';

			$amount_real = 0;
			$amount_rest=0;
			$total_rest=0;

			//get list order sell matching
			$orders = new Order();
			$sell_orders_matching = $orders->getSellOrdersMatching($market_id,$price_buy);
			$sell_orders_matching = $sell_orders_matching->toArray();
			Log::info('sell_orders_matching: market_id: '.$market_id.' -- Price: '.$price_buy, $sell_orders_matching);
			if(count($sell_orders_matching)>0){				
				//fee_buy, fee_sell
				$fee_trade = new FeeTrade();
				$fee = $fee_trade->getFeeTrade($market_id);
				$per_fee_buy = $fee['fee_buy'];
				$per_fee_sell = $fee['fee_sell'];		
				$message='';
				
				foreach($sell_orders_matching as $sell_orders) {					
					$amount_rest=0;
					$total_rest=0;		
					$amount_bought=0;			
					if($amount_buy>0){
						$amount_real = $amount_buy;
						$trade_history = new Trade();
						Log::info("\n".'---*****-----BUY : amount_buy: '.$amount_buy.' -- Price: '.$price_buy);
						$sell_matching = $sell_orders;//$sell_orders_matching[0];
						$price_sell = $sell_matching['price'];
						$amount_sell = $sell_matching['from_value'];
						$total_sell = $sell_matching['to_value'];
						$user_sell = $sell_matching['user_id'];

						$class_price = str_replace(".", "-", $price_sell);
						$class_price = str_replace(",", "-", $price_sell);
						if($amount_buy == $amount_sell){							
							$fee_buy = ($total_sell*$per_fee_buy)/100;
							$fee_sell = ($total_sell*$per_fee_sell)/100;
							//add coin for seller/buyer
							if($balance->takeMoney($fee_buy,$wallet_to,$user->id)){//tru phi nguoi mua	
								$balance->addMoney($amount_buy,$wallet_from,$user->id);//cong tien nguoi mua
								$balance->addMoney($total_sell-$fee_sell,$wallet_to,$user_sell);//cong tien cho nguoi ban voi so tien da tru phi				

								Order::where('id', $sell_matching['id'])->update(array('status' => 'filled'));
								$status = 'success';
								$message1 = "\n".'<p>'.Lang::get('messages.filled').' : Bought '.$amount_buy .' '.$from.' at price '.$price_sell.' Fee buy: '.$fee_buy.' '.$to. ' - Total amount paid: '.($total_sell+$fee_buy).' '.$to.'</p>';
								$message .= $message1;
								Log::info($message1);
								$orders_buy->status = 'filled';
								//add history
								$trade_id=$trade_history->addTradeHistory(array('seller_id' => $user_sell,'buyer_id' => $user->id, 'amount' =>$amount_buy, 'price' => $price_sell,'market_id'=>$market_id,'type'=>'buy','fee_buy'=>$fee_buy,'fee_sell'=>$fee_sell));

								$message_socket['message_socket'][$class_price]['order_s'] = array('action'=>"delete",'id'=>$sell_matching['id'], 'price'=>$price_sell);
								$message_socket['message_socket'][$sell_matching['id']]['history_trade'] =array('id'=>$trade_id,'seller_id' => $user_sell,'buyer_id' => $user->id, 'amount' =>$amount_buy, 'price' => $price_sell,'market_id'=>$market_id,'type'=>'buy','fee_buy'=>$fee_buy,'fee_sell'=>$fee_sell, "created_at"=>date("Y-m-d H:i:s"),"order_id"=>$sell_matching['id']);								
							}else{
								$message.= Lang::get('messages.balance_not_enought_for_fee');
							}
							
						}elseif($amount_buy > $amount_sell){
							$fee_buy = ($total_sell*$per_fee_buy)/100;
							$fee_sell = ($total_sell*$per_fee_sell)/100;
							if($balance->takeMoney($fee_buy,$wallet_to,$user->id)){//tru phi nguoi mua
								//add coin for seller/buyer
								$balance->addMoney($amount_sell,$wallet_from,$user->id);
								$balance->addMoney($total_sell-$fee_sell,$wallet_to,$user_sell);

								$amount_rest = sprintf('%.8f',$amount_buy - $amount_sell);
								$total_rest = $amount_rest * $price_buy;//sprintf('%.8f',$amount_rest * $price_buy);

								Order::where('id', $sell_matching['id'])->update(array('status' => 'filled'));					
								$status = 'success';

								$message1 = "\n".'<p>'.Lang::get('messages.partly_filled').' : Bought '.$amount_sell .' '.$from.' at price '.$price_sell.' Fee buy: '.$fee_buy.' '.$to. ' - Total amount paid: : '.($total_sell+$fee_buy).' '.$to.'</p>';
								Log::info($message1);
								$message .= $message1;

								$orders_buy->status = 'partly filled';
								$orders_buy->from_value = $amount_rest;
								$orders_buy->to_value = $total_rest;
								$trade_id=$trade_history->addTradeHistory(array('seller_id' => $user_sell,'buyer_id' => $user->id, 'amount' =>$amount_sell, 'price' => $price_sell,'market_id'=>$market_id, 'type'=>'buy','fee_buy'=>$fee_buy,'fee_sell'=>$fee_sell));
								$amount_real = $amount_sell;

								//call socket								
								$message_socket['message_socket'][$class_price]['order_s'] = array("action"=>"delete","id"=>$sell_matching['id'], 'price'=>$price_sell);  
								$message_socket['message_socket'][$sell_matching['id']]['history_trade'] =array('id'=>$trade_id,'seller_id' => $user_sell,'buyer_id' => $user->id, 'amount' =>$amount_sell, 'price' => $price_sell,'market_id'=>$market_id, 'type'=>'buy', "created_at"=>date("Y-m-d H:i:s"),"order_id"=>$sell_matching['id']);  				
								
							}else{
								$message.= Lang::get('messages.balance_not_enought_for_fee');
							}					
						}else{
							$total_sell = $amount_buy*$price_sell;//sprintf('%.8f',$amount_buy*$price_sell);
							$fee_buy = ($total_buy*$per_fee_buy)/100;
							$fee_sell = ($total_sell*$per_fee_sell)/100;
							if($balance->takeMoney($fee_buy,$wallet_to,$user->id)){//tru phi nguoi mua
								if(isset($message_socket['message_socket'][$class_price]['order_s']['amount']))
									$amount_bought=$message_socket['message_socket'][$class_price]['order_s']['amount']+$amount_buy;
								else $amount_bought=$amount_buy;
								//add coin for seller/buyer
								$balance->addMoney($amount_buy,$wallet_from,$user->id);
								$balance->addMoney($total_sell-$fee_sell,$wallet_to,$user_sell);

								$amount_rest = sprintf('%.8f',$amount_sell - $amount_buy);
								$total_rest = $amount_rest * $price_sell;//sprintf('%.8f',$amount_rest * $price_sell);

								Order::where('id', $sell_matching['id'])->update(array('status' => 'partly filled', 'from_value'=>$amount_rest, 'to_value'=>$total_rest));
								$status = 'success';
								
								$message1 = "\n".'<p>'.Lang::get('messages.filled').' : Bought '.$amount_buy .' '.$from.' at price '.$price_sell.' Fee buy: '.$fee_buy.' '.$to. ' - Total amount paid: : '.($total_sell+$fee_buy).' '.$to.'</p>';
								
								Log::info($message1);
								$message .= $message1;
								$orders_buy->status = 'filled';					
								$trade_id=$trade_history->addTradeHistory(array('seller_id' => $user_sell,'buyer_id' => $user->id, 'amount' =>$amount_buy, 'price' => $price_sell,'market_id'=>$market_id, 'type'=> 'buy','fee_buy'=>$fee_buy,'fee_sell'=>$fee_sell));

								//call socket						
								$message_socket['message_socket'][$class_price]['order_s'] = array("action"=>"update","id"=>$sell_matching['id'], "amount"=>$amount_bought, "price"=>$price_sell,"total"=>($amount_bought*$price_sell),"type"=>"buy"); //tra ve so luong da ban de tru ra trne danh sach hien thi , ko phai  so luong con lai
								$message_socket['message_socket'][$sell_matching['id']]['history_trade'] =array('id'=>$trade_id,'seller_id' => $user_sell,'buyer_id' => $user->id, 'amount' =>$amount_buy, 'price' => $price_sell,'market_id'=>$market_id, 'type'=>'buy', "created_at"=>date("Y-m-d H:i:s"),"order_id"=>$sell_matching['id']); 
							}else{
								$message.= Lang::get('messages.balance_not_enought_for_fee');
							}					
						}	
						//refund money
						if($price_buy > $price_sell){					
							$total_refunds = ($amount_real*$price_buy) - ($amount_real*$price_sell);//sprintf('%.8f',($amount_real*$price_buy) - ($amount_real*$price_sell));
							Log::info('-------Refund: '.$total_refunds);
							$message.="<br>".'- Refund: '.$total_refunds;
							$balance->addMoney($total_refunds,$wallet_to,$user->id);
						}
						//update amount
						$amount_buy= sprintf('%.8f',$amount_buy-$amount_real);
					}
					
				}	
				Log::info('-------amount_buy final: '.$amount_buy);
				if($amount_buy>0) {
					$orders_buy->save();					
					$message_socket['message_socket'][$orders_buy->id]['order_b'] = array('action'=>"insert","amount"=>$amount_buy,"price"=>$price_buy,"total"=>$total_rest,"type"=>"buy");
					$message_socket['message_socket'][$orders_buy->id]['order_b']['id']=$orders_buy->id;
					$message_socket['message_socket'][$orders_buy->id]['order_b']['created_at']=$orders_buy->created_at;
				}

				$trade = new Trade();
 				$message_socket['data_price'] = $trade->getBlockPrice($market_id);
 				$balance = new Balance();
				$message_socket['data_price']['balance_coinmain'] = sprintf('%.8f',$balance->getBalance($wallet_from,0));
				$message_socket['data_price']['balance_coinsecond'] = sprintf('%.8f',$balance->getBalance($wallet_to,0));

 				$message_socket['change_price']['total_volume']=$trade->getVolume($market_id);	
 				$message_socket['change_price']['cur_price']=$price_buy;	
			}else{
				$orders_buy->save();
				$status = 'success';
				$message = Lang::get('messages.order_created');
				$message_socket['message_socket'][$orders_buy->id]['order_b'] = array('action'=>"insert","id"=>$orders_buy->id,"amount"=>$orders_buy->from_value,"price"=>$orders_buy->price,"total"=>$orders_buy->to_value,'type'=>'buy','created_at'=>$orders_buy->created_at);
				//BrainSocket::message('doTrade', array('message'=>$message_socket));
			}
			$this->triggerPusherTicket($market_id);
		}else{
			$message = Lang::get("messages.not_enough_purchase", array('type' => strtoupper($to)));
		}
		echo json_encode(array('status'=>$status,'message'=> $message,"message_socket"=>$message_socket));
		exit;
	}

	public function doSell(){
		if ( Auth::guest() ){
			echo json_encode(array('status'=>'error','message'=> Lang::get('messages.login_to_buy')));
			exit;
		}

		
		$logFile = 'trades.log';
        Log::useDailyFiles(storage_path().'/logs/trades/'.$logFile);
		Log::info('------------------------- Do Sell -----------------------------');	

		$user = Confide::user();
		$price_sell = sprintf('%.8f',$_POST['price']);
		$amount_sell = sprintf('%.8f',$_POST['amount']);
		$total_sell = $price_sell*$amount_sell;//sprintf('%.8f',$price_sell*$amount_sell);
		$market_id = $_POST['market_id'];//Session::get('market_id');

		//get info market
		$market_default = Market::find($market_id);	
		if(!isset($market_default->active) || $market_default->active==0){			
			echo json_encode(array('status'=>'error','message'=> Lang::get('messages.market_not_active')));
			exit;
		}
		$wallet_from = $market_default->wallet_from;
		$wallet_to = $market_default->wallet_to;

		$wallet = new Wallet();
		$from = $wallet->getType($wallet_from);
		$to = $wallet->getType($wallet_to);

		//cleck limit trade
		$limit_trade = WalletLimitTrade::where('wallet_id',$wallet_from)->first();
		if($limit_trade) $limit_trade=$limit_trade->toArray();		
		else $limit_trade=array('min_amount'=>0.0001,'max_amount'=>1000);
				
		if(sprintf('%.8f',$_POST['amount'])< $limit_trade['min_amount'] || sprintf('%.8f',$_POST['amount'])>$limit_trade['max_amount']){
			echo json_encode(array('status'=>'error','message'=> Lang::get('messages.message_limit_trade')));
			exit;
		}

		//set default return value
		$status = 'error';
		$message= Lang::get('messages.error_contact_admin');

		$balance = new Balance();
		$message_socket = array();
		$message_socket['market_id'] = $market_id;
		//sub $total_buy money
		if($balance->takeMoney($amount_sell,$wallet_from,$user->id)){
			$orders_sell = new Order();
			$orders_sell->price = $price_sell;
			$orders_sell->status = 'active';
			$orders_sell->from_value = $amount_sell;
			$orders_sell->to_value = $total_sell;
			$orders_sell->market_id = $market_id;
			$orders_sell->user_id = $user->id;
			$orders_sell->type = 'sell';

			$amount_real = 0;
			$amount_rest=0;
			$total_rest=0;
			//get list order sell matching
			$orders = new Order();
			$buy_orders_matching = $orders->getBuyOrdersMatching($market_id,$price_sell);
			$buy_orders_matching = $buy_orders_matching->toArray();
			Log::info('buy_orders_matching: market_id: '.$market_id.' -- Price: '.$price_sell, $buy_orders_matching);
			if(count($buy_orders_matching)>0){				
				//fee_buy, fee_sell
				$fee_trade = new FeeTrade();
				$fee = $fee_trade->getFeeTrade($market_id);
				$per_fee_buy = $fee['fee_buy'];
				$per_fee_sell = $fee['fee_sell'];		
				$message='';				
				foreach ($buy_orders_matching as $buy_order) {					
					$amount_rest=0;
					$total_rest=0;
					$amount_sold=0;		
					if($amount_sell>0){
						$amount_real = $amount_sell;
						$trade_history = new Trade();
						Log::info("\n".'---*****-----SELL : amount_sell: '.$amount_sell.' -- Price: '.$price_sell);
						$buy_matching = $buy_order;//$buy_orders_matching[0];
						$price_buy = $buy_matching['price'];
						$amount_buy = $buy_matching['from_value'];
						$total_buy = $buy_matching['to_value'];
						$user_buy = $buy_matching['user_id'];

						$class_price = str_replace(".", "-", $price_buy);
						$class_price = str_replace(",", "-", $price_buy);
						if($amount_buy == $amount_sell){
							$total_sell = $amount_sell*$price_buy;//sprintf('%.8f',$amount_sell*$price_buy);//really total sell;
							$fee_buy = ($total_buy*$per_fee_buy)/100;
							$fee_sell = ($total_sell*$per_fee_sell)/100;
							if($balance->takeMoney($fee_buy,$wallet_to,$user->id)){//tru phi nguoi mua
								//add coin for seller/buyer
								$balance->addMoney($amount_buy,$wallet_from,$user_buy);
								$balance->addMoney($total_sell-$fee_sell,$wallet_to,$user->id);				

								Order::where('id', $buy_matching['id'])->update(array('status' => 'filled'));
								$status = 'success';
								//$message .= "\n".Lang::get('messages.filled').' : Fee buy: '.sprintf('%.8f',$fee_buy).' - Fee Sell: '.sprintf('%.8f',$fee_sell).' - Total buy: '.(sprintf('%.8f',$amount_buy)) . ' - Total sell: '.sprintf('%.8f',($total_sell-$fee_sell));
								$message .= '<p>'.Lang::get('messages.filled').' Sold '.$amount_buy .' '.$from.' at price '.$price_buy.' Fee sell: '.$fee_sell.' '.$to. ' - Received: '.($total_sell-$fee_sell).' '.$to.'</p>';
								Log::info('amount_buy = amount_sell Update sell orders: ', array('status' => 'filled'));
								$orders_sell->status = 'filled';
								//add history
								$trade_id=$trade_history->addTradeHistory(array('seller_id' => $user->id,'buyer_id' => $user_buy, 'amount' =>$amount_buy, 'price' => $price_buy,'market_id'=>$market_id,'type'=>'sell','fee_buy'=>$fee_buy,'fee_sell'=>$fee_sell));	

								$message_socket['message_socket'][$class_price]['order_b'] = array('action'=>"delete",'id'=>$buy_matching['id'], 'price'=>$price_buy);
								$message_socket['message_socket'][$buy_matching['id']]['history_trade'] =array('id'=>$trade_id,'seller_id' => $user->id,'buyer_id' => $user_buy, 'amount' =>$amount_buy, 'price' => $price_buy,'market_id'=>$market_id,'type'=>'sell', "created_at"=>date("Y-m-d H:i:s"),"order_id"=>$buy_matching['id']);  
							}else{
								$message.= Lang::get('messages.balance_not_enought_for_fee');
							}									

						}elseif($amount_buy > $amount_sell){
							$total_sell = $amount_sell*$price_buy;//really total sell;
							$fee_buy = ($total_sell*$per_fee_buy)/100;
							$fee_sell = ($total_sell*$per_fee_sell)/100;
							if($balance->takeMoney($fee_buy,$wallet_to,$user->id)){//tru phi nguoi mua
								if(isset($message_socket['message_socket'][$class_price]['order_s']['amount']))
									$amount_sold=$message_socket['message_socket'][$class_price]['order_b']['amount']+$amount_sell;
								else $amount_sold=$amount_sell;
								
								//add coin for seller/buyer
								$balance->addMoney($amount_sell,$wallet_from,$user_buy);
								$balance->addMoney($total_sell-$fee_sell,$wallet_to,$user->id);

								$amount_rest = sprintf('%.8f',$amount_buy - $amount_sell);
								$total_rest = $amount_rest * $price_buy;//sprintf('%.8f',$amount_rest * $price_buy);

								Order::where('id', $buy_matching['id'])->update(array('status' => 'partly filled', 'from_value'=>$amount_rest, 'to_value'=>$total_rest));
								Log::info('amount_buy > amount_sell Update sell orders: ', array('status' => 'partly filled', 'from_value'=>$amount_rest, 'to_value'=>$total_rest));
								$status = 'success';

								//$message .= "\n".Lang::get('messages.partly_filled').' : Fee buy: '.sprintf('%.8f',$fee_buy).' - Fee Sell: '.sprintf('%.8f',$fee_sell).' - Total buy: '.(sprintf('%.8f',$amount_sell)) . ' - Total sell: '.sprintf('%.8f',($total_sell-$fee_sell));
								$message .= '<p>'.Lang::get('messages.filled').' Sold '.$amount_sell .' '.$from.' at price '.$price_buy.' Fee sell: '.$fee_sell.' '.$to. ' - Received: '.($total_sell-$fee_sell).' '.$to.'</p>';
								$orders_sell->status = 'filled';
								$trade_id=$trade_history->addTradeHistory(array('seller_id' => $user->id,'buyer_id' => $user_buy, 'amount' =>$amount_sell, 'price' => $price_buy,'market_id'=>$market_id, 'type'=>'sell','fee_buy'=>$fee_buy,'fee_sell'=>$fee_sell));

								//call socket						
								$message_socket['message_socket'][$class_price]['order_b'] = array("action"=>"update","id"=>$buy_matching['id'], "amount"=>$amount_sold, "price"=>$price_buy,"total"=>($amount_sold*$price_buy));  
								$message_socket['message_socket'][$buy_matching['id']]['history_trade'] =array('id'=>$trade_id,'seller_id' => $user->id,'buyer_id' => $user_buy, 'amount' =>$amount_sell, 'price' => $price_buy,'market_id'=>$market_id, 'type'=>'sell', "created_at"=>date("Y-m-d H:i:s"),"order_id"=>$buy_matching['id']); 
							}else{
								$message.= Lang::get('messages.balance_not_enought_for_fee');
							}
						}else{	
							$total_sell = $amount_buy*$price_buy;//sprintf('%.8f',$amount_buy*$price_buy);//really total sell;				
							$fee_buy = ($total_sell*$per_fee_buy)/100;
							$fee_sell = ($total_sell*$per_fee_sell)/100;
							if($balance->takeMoney($fee_buy,$wallet_to,$user->id)){//tru phi nguoi mua
								//add coin for seller/buyer
								$balance->addMoney($amount_buy,$wallet_from,$user_buy);
								$balance->addMoney($total_sell-$fee_sell,$wallet_to,$user->id);

								$amount_rest = sprintf('%.8f',$amount_sell - $amount_buy);
								$total_rest = $amount_rest * $price_sell;//sprintf('%.8f',$amount_rest * $price_sell);
								
								Order::where('id', $buy_matching['id'])->update(array('status' => 'filled'));					
								$status = 'success';
								
								//$message .= "\n".Lang::get('messages.partly_filled').' : Fee buy: '.sprintf('%.8f',$fee_buy).' - Fee Sell: '.sprintf('%.8f',$fee_sell).' - Total buy: '.(sprintf('%.8f',$amount_buy)) . ' - Total sell: '.sprintf('%.8f',($total_sell-$fee_sell));
								$message .= '<p>'.Lang::get('messages.partly_filled').' Sold '.$amount_buy .' '.$from.' at price '.$price_buy.' Fee sell: '.$fee_sell.' '.$to. ' - Received: '.($total_sell-$fee_sell).' '.$to.'</p>';

								Log::info('amount_buy < amount_sell Update sell orders: ', array('status' => 'filled'));

								$orders_sell->status = 'partly filled';
								$orders_sell->from_value = $amount_rest;
								$orders_sell->to_value = $total_rest;	
								$trade_id=$trade_history->addTradeHistory(array('seller_id' => $user->id,'buyer_id' => $user_buy, 'amount' =>$amount_buy, 'price' => $price_buy,'market_id'=>$market_id, 'type'=> 'sell','fee_buy'=>$fee_buy,'fee_sell'=>$fee_sell));
								$amount_real = $amount_buy;

								//call socket								
								$message_socket['message_socket'][$class_price]['order_b'] = array("action"=>"delete","id"=>$buy_matching['id'], 'price'=>$price_buy);  
								$message_socket['message_socket'][$buy_matching['id']]['history_trade'] =array('id'=>$trade_id,'seller_id' => $user->id,'buyer_id' => $user_buy, 'amount' =>$amount_buy, 'price' => $price_buy,'market_id'=>$market_id, 'type'=> 'sell', "created_at"=>date("Y-m-d H:i:s"),"order_id"=>$buy_matching['id']);  
							}else{
								$message.= Lang::get('messages.balance_not_enought_for_fee');
							}					
						}						

						//refund money
						/*if($price_buy > $price_sell){
							Log::info('-------Refund: ');
							$total_refunds = ($amount_real*$price_buy) - ($amount_real*$price_sell);
							$balance->addMoney($total_refunds,$from,$user->id);
						}*/
						//update amount
						$amount_sell= sprintf('%.8f',$amount_sell-$amount_real);
					}
					
				}
				Log::info('-------amount_sell final: '.$amount_sell);
				if($amount_sell>0) {
					$orders_sell->save();					
					$message_socket['message_socket'][$orders_sell['id']]['order_s'] = array('action'=>"insert","amount"=>$amount_sell,"price"=>$price_sell,"total"=>$total_rest,"type"=>"sell");
					$message_socket['message_socket'][$orders_sell['id']]['order_s']['id']=$orders_sell->id;
					$message_socket['message_socket'][$orders_sell['id']]['order_s']['created_at']=$orders_sell->created_at;
				}
					
				$trade = new Trade();
 				$message_socket['data_price'] = $trade->getBlockPrice($market_id);
 				$balance = new Balance();
				$message_socket['data_price']['balance_coinmain'] = sprintf('%.8f',$balance->getBalance($wallet_from,0));
				$message_socket['data_price']['balance_coinsecond'] = sprintf('%.8f',$balance->getBalance($wallet_to,0));
				
 				$message_socket['change_price']['total_volume']=$trade->getVolume($market_id);	
 				$message_socket['change_price']['cur_price']=$price_buy;
			}else{
				$orders_sell->save();								
				$status = 'success';
				$message = Lang::get('messages.order_created');
				$message_socket['message_socket'][$orders_sell['id']]['order_s'] = array('action'=>"insert","id"=>$orders_sell->id,"amount"=>$orders_sell->from_value,"price"=>$orders_sell->price,"total"=>$orders_sell->to_value,'type'=>'sell','created_at'=>$orders_sell->created_at);
			}
			$this->triggerPusherTicket($market_id);
		}else{
			$message = Lang::get("messages.not_enough_purchase", array('type' => strtoupper($from)));
		}
		echo json_encode(array('status'=>$status,'message'=> $message,"message_socket"=>$message_socket));
		exit;
	}

	public function doCancel(){		
		if ( Auth::guest() ){
			echo json_encode(array('status'=>'error','message'=> Lang::get('messages.login_to_buy')));
			exit;
		}
		$logFile = 'trades.log';
        Log::useDailyFiles(storage_path().'/logs/trades/'.$logFile);
		Log::info('------------------------- Do Cancel -----------------------------');
		$user = Confide::user();
		$balance = new Balance();
		$order_id = $_POST['order_id'];
		$orders = Order::find($order_id);
		if($orders->user_id == $user->id && in_array($orders->status, $orders->getStatusActive())){//this condition use to avoid case a user cancel order of other user 
			//message_socket for update data not f5
			$message_socket['market_id']=$orders->market_id;
			$message_socket_temp=array('id'=>$orders->id,'amount'=>$orders->from_value,'total'=>$orders->to_value,'action'=>"update",'price'=>$orders->price);
			//refund money for user
			//get info market
			$market_default = Market::find($orders->market_id);	
			$wallet_from = $market_default->wallet_from;
			$wallet_to = $market_default->wallet_to;

			$wallet = new Wallet();
			$from = $wallet->getType($wallet_from);
			$to = $wallet->getType($wallet_to);	
			$value_refund = 0;
			$type_money_refund = '';	
			if($orders->type=='buy'){//if buy: refund to_value to to_type_money (eg. Market BTC-> USD => refund to USD wallet)
				$value_refund = $orders->to_value;
				$type_money_refund = $wallet_to;
				$coin_code = $to;
				$message_socket['order_b']=$message_socket_temp;
				$message_socket['order_b']['type']='buy';				
			}else{//if sell: refund from_value to from_type_money (eg. Market BTC-> USD => refund to BTC wallet)
				$value_refund = $orders->from_value;
				$type_money_refund = $wallet_from;	
				$coin_code = $from;	
				$message_socket['order_s']=$message_socket_temp;
				$message_socket['order_s']['type']='sell';		
			}
			$balance->addMoney($value_refund,$type_money_refund,$user->id);
			//delete order
			$orders->delete();
			echo json_encode( array('status'=>'success','message_socket'=>$message_socket,'message'=> Lang::get('messages.cancel_successfull',array('value'=>$value_refund, 'coin'=>strtoupper($coin_code)) ) ) );
			exit;
		}else{
			echo json_encode(array('status'=>'error','message'=> Lang::get('messages.not_your_order')));
			exit;
		}
	}

	public function triggerPusherTicket($market_id){
		require_once app_path().'/libraries/Pusher.php';
        $setting = new Setting();
        $pusher_app_id=$setting->getSetting('pusher_app_id','');
        $pusher_app_key=$setting->getSetting('pusher_app_key','');
        $pusher_app_secret=$setting->getSetting('pusher_app_secret','');
        if($pusher_app_id!='' && $pusher_app_key!='' && $pusher_app_secret!=''){
            $pusher = new Pusher($pusher_app_key, $pusher_app_secret, $pusher_app_id);

            $wallet=new Wallet();
            $market=Market::where('id',$market_id)->first();
            $from = strtoupper($wallet->getType($market->wallet_from));
			$to = strtoupper($wallet->getType($market->wallet_to));

            $order=new Order();
            $buyHighest=$order->getBuyHighest($market_id);  
            $sellLowest=$order->getSellLowest($market_id);  
            $topsell=array('price'=>0,'amount'=>0);
            $topbuy=array('price'=>0,'amount'=>0);
            if(count($sellLowest)>0){
            	$topsell =array(
	                	'amount'=>sprintf("%.8f",$sellLowest->from_value),
	                	'price'=>sprintf("%.8f",$sellLowest->price)
	                );
            }
            if(count($buyHighest)>0){
            	$topbuy =array(
	                	'amount'=>sprintf("%.8f",$buyHighest->from_value),
	                	'price'=>sprintf("%.8f",$buyHighest->price)
	                );
            }	
            $message=array(
	            'channel' => 'ticker.'.$market_id,
	            'trade'=>array(
	                'timestamp'=>time(),
	                'datetime'=>date("Y-m-d H:i:s T",time()),
	                'marketid'=>$market_id,
	                'marketname'=>$from.'/'.$to,
	                'topsell'=>$topsell,
	                'topbuy'=>$topbuy,
                )
            );

            $pusher->trigger('ticker.'.$market_id, 'message', $message );
        }
	}

	public function getOrderDepthChart(){
		$market_id=Input::get('market_id');
		$order = new Order();
		$order_sell=$order->getOrders($market_id,'sell',100);		
		$total_amount=0;
		$rel_sells=array();
		foreach ($order_sell as $sell) {
			$total_amount+=$sell->total_to_value;
			$price = $sell->price;
			array_push($rel_sells,array('total'=>$total_amount,'price'=>$price));
		}	

		$order_buy=$order->getOrders($market_id,'buy',100);
		$total_amount=0;
		$rel_buys=array();
		foreach ($order_buy as $buy) {
			$total_amount+=$buy->total_to_value;
			$price = $buy->price;
			array_push($rel_buys,array('total'=>$total_amount,'price'=>$price));
		}
		echo json_encode(array('buy'=>$rel_buys,'sell'=>$rel_sells));
		//echo "The Order Depth Chart is Coming soon...";
		exit;
	}
} 