<?php
class PointsController extends BaseController {
	/*
	**$amount_fee is fee of trade
	** $wallet_id wallet of amount_fee (BTC or LTC)
	*/
    public function addPointsTrade($user_id,$amount_fee,$trade_id,$wallet_init){
    	$logFile = 'points.log';
        Log::useDailyFiles(storage_path().'/logs/points/'.$logFile);
    	$setting= new Setting();
    	$balance=new Balance(); 
    	$wallet=wallet::where('type','POINTS')->first();
    	$user=User::find($user_id);
    	Log::info("\n".'------------------------- Add Point Trade -----------------------------');
    	Log::info("\n".'amount_fee '.$amount_fee.' . trade_id: '.$trade_id." -- wallet_init: ".$wallet_init);
    	if(isset($wallet->id)){
    		$point_per_btc=$setting->getSetting('point_per_btc',1);
	        $percent_point_reward_trade=$setting->getSetting('percent_point_reward_trade',0);
			$percent_point_reward_referred_trade=$setting->getSetting('percent_point_reward_referred_trade',0);
			Log::info("\n".'Setting -- point_per_btc: '.$point_per_btc.' . percent_point_reward_trade: '.$percent_point_reward_trade." % -- percent_point_reward_referred_trade: ".$percent_point_reward_referred_trade." %");
			//cong point cho $user_id
			if($percent_point_reward_trade>0){
				$amount_reward=($amount_fee*$percent_point_reward_trade)/100;
				$point_reward=$amount_reward/$point_per_btc;
				
					Log::info("\n".'Add point for '.$user->username.' . amount_reward: '.$amount_reward." BTC -- point_reward: ".$point_reward." POINTS");
				if($point_reward > 0){
					$balance->addMoney($point_reward,$wallet->id,$user->id);
					$deposit=new Deposit();
					$deposit->user_id=$user->id;
					$deposit->wallet_id=$wallet->id;
					$deposit->amount=$point_reward;
					$deposit->paid=1;
					$deposit->transaction_id= "Points earned from trade ".$trade_id;
					$deposit->save();
				}				
			}
			//cong point cho nguoi da gioi thieu $user_id nay neu co
			if(!empty($user->referral) && $percent_point_reward_referred_trade>0){
				$user_referred=User::where('username',$user->referral)->first();
				if(!empty($user_referred)){
					$amount_reward=($amount_fee*$percent_point_reward_referred_trade)/100;
					$point_reward=$amount_reward/$point_per_btc;	
					Log::info("user_referred AAAAAAAAA: ",$user_referred);		
					Log::info("\n".'Add point for user referred: '.$user_referred->username.' . amount_reward: '.$amount_reward." BTC -- point_reward: ".$point_reward." POINTS");
					if($point_reward > 0){
						$balance->addMoney($point_reward,$wallet->id,$user_referred->id);

						$deposit=new Deposit();
						$deposit->user_id=$user_referred->id;
						$deposit->wallet_id=$wallet->id;
						$deposit->amount=$point_reward;
						$deposit->paid=1;
						$deposit->transaction_id= "Points earned from User ".$user->username. "( Trade: ".$trade_id.")";
						$deposit->save();
					}
				}				
			}			
    	} else{
    		Log::info("\n".'No wallet POINTS');
    	} 
		
    }   
}
