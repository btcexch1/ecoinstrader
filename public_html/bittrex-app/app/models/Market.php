<?php

class Market extends Eloquent
{
    protected $table = 'market';
    public $timestamps = false;    

    public function getWalletType($market_id){
    	//get info market
		$market_default = Market::find($market_id);	
		if(isset($market_default->id)){
			$wallet_from = $market_default->wallet_from;
			$wallet_to = $market_default->wallet_to;

			$wallet = new Wallet();
			$from = $wallet->getType($wallet_from);
			$to = $wallet->getType($wallet_to);
			return array('id'=>$market_id,'wallet_from'=> $from, 'wallet_to'=> $to);
		}
		return array();
    }
}

