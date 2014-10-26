<?php

class Order extends Eloquent
{
    protected $table = 'orders';
    protected $status_active = array('active', 'partly filled');

    public function getStatusActive()
    {
        return $this->status_active;
    }
    /*
    ** getting the price lowest of sell orders
    */
    public function getSellLowest($market_id){    	    	 
    	$order_sell = Order::leftJoin('market', $this->table.'.market_id', '=', 'market.id')
            		->select($this->table.'.*', 'market.wallet_from', 'market.wallet_to')
            		->where('market.id', '=', $market_id)
            		->where('type', '=', 'sell')
					->whereIn('status', $this->status_active)
					->orderBy('price', 'asc')
					->first();		
		return $order_sell;
    }

    /*
    ** getting the price highest of sell orders
    */
    public function getBuyHighest($market_id){
    	$order_buy = Order::leftJoin('market', $this->table.'.market_id', '=', 'market.id')
            		->select($this->table.'.*', 'market.wallet_from', 'market.wallet_to')
            		->where('market.id', '=', $market_id)
            		->where('type', '=', 'buy')
					->whereIn('status', $this->status_active)
					->orderBy('price', 'desc')
					->first();
		return $order_buy;
    }

    /*
    ** get list of the active buy/sell orders
    ** $type: 'sell' / 'buy'
    */
    public function getOrders($market_id,$type='sell',$limit=0){
        if($type == 'sell') $desc = 'asc';
        else $desc = 'desc';
        $str_limit = '';
        if($limit > 0) $str_limit = " limit ".$limit;       
        $status = "'".implode("','", $this->status_active)."'";        
        $orders = DB::select("select * ,sum(`from_value`) as total_from_value, sum(`to_value`) as total_to_value from `".$this->table."` where `market_id` = '".$market_id."' and `type` = '".$type."' and `status` in (".$status.") group by `price` order by `price` ".$desc.$str_limit);              
        return $orders;
    }

    public function getTotalCoin($market_id,$type='sell'){
        $status = "'".implode("','", $this->status_active)."'"; 
        if($type=='sell')
            $total = DB::select("select sum(`from_value`) as total_from_value from `".$this->table."` where `market_id` = '".$market_id."' and `type` = 'sell' and `status` in (".$status.")"); 
        else $total= DB::select("select sum(`to_value`) as total_to_value from `".$this->table."` where `market_id` = '".$market_id."' and `type` = 'buy' and `status` in (".$status.")");
        if(isset($total[0])){
            if($type=='sell')
                $total = $total[0]->total_from_value;
            else $total = $total[0]->total_to_value;
        }else $total = 0;
        return $total;
    }

    /*
    ** get list of the active buy/sell orders of a user
    */
    public function getCurrentOrdersUser($market_id,$user_id=''){
        if ( Auth::guest() ) return false;
        $user = Confide::user(); 
        if($user_id == '') $user_id = $user->id;
        $orders = Order::where('market_id', '=', $market_id)
            ->where('user_id', '=', $user_id)
            ->whereIn('status', $this->status_active)   
            ->orderBy('created_at', 'desc')                 
            ->get();        
        return $orders;
    }

    /*
    ** get list of the active sell orders matching
    */
    public function getSellOrdersMatching($market_id,$price){        
        $sell_orders = Order::where('market_id', '=', $market_id)
            ->where('price', '<=', $price)
            ->where('type', '=', 'sell')
            ->whereIn('status', $this->status_active)
            ->orderBy('price', 'asc')
            ->orderBy('created_at','asc')
            ->get();  
        /*echo "<pre>sell_orders"; print_r($sell_orders); echo "</pre>";
        echo "<pre>getQueryLog: ".dd(DB::getQueryLog())."</pre>";*/        
        return $sell_orders;
    }

    /*
    ** get list of the active sell orders matching
    */
    public function getBuyOrdersMatching($market_id,$price){        
        $buy_orders = Order::where('market_id', '=', $market_id)
            ->where('price', '>=', $price)
            ->where('type', '=', 'buy')
            ->whereIn('status', $this->status_active)
            ->orderBy('price', 'desc')
            ->orderBy('created_at','asc')
            ->get();
        //echo "<pre>buy_orders"; print_r($buy_orders->toArray()); echo "</pre>";
        //echo "<pre>getQueryLog: ".dd(DB::getQueryLog())."</pre>";             
        return $buy_orders;
    }
}

