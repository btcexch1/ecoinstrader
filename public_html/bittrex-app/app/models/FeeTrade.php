<?php

class FeeTrade extends Eloquent
{
    protected $table = 'fee_trade';
    public $timestamps = false;

    public function getFeeTrade($market_id){
    	$fee_trade = FeeTrade::where('market_id', '=', $market_id)->first();
        if(isset($fee_trade->fee_buy))
            return array('fee_buy'=> $fee_trade->fee_buy, "fee_sell"=>$fee_trade->fee_sell);
        else return array('fee_buy'=> 0, "fee_sell"=>0);
    }
}