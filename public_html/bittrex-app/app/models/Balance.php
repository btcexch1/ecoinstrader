<?php

class Balance extends Eloquent
{
    protected $table = 'balance';
    public $timestamps = false;
    public function getBalance($wallet_id){
    	$balance = 0;
        if ( !Auth::guest() ){
            $user = Confide::user();            
            $balanceCoin = Balance::where('user_id', '=', $user->id)
                        ->where('wallet_id', '=', $wallet_id)
                        ->first();            
            if(isset($balanceCoin->amount)) $balance = $balanceCoin->amount;            
        }
        return $balance;
    } 

    public function addMoney($amount,$wallet_id,$user_id){
        $balanceCoin = Balance::where('user_id', '=', $user_id)
                        ->where('wallet_id', '=', $wallet_id)->first(); 
        if(isset($balanceCoin->amount)){//update balance
            //echo "<pre>balanceCoin"; var_dump($balanceCoin->toArray()); echo "</pre>";            
            $new_amount = $balanceCoin->amount + $amount;
            Log::info("Add Money ".$wallet_id." -- User: ".$user_id.": ".$new_amount.' -- amount: '.$amount);
            //echo "Add New ".$wallet_id.": ".$new_amount.' -- amount: '.$amount;
            Balance::where('id', $balanceCoin->id)->update(array('amount' => $new_amount));
        }else{ //insert balance
            Balance::insert(array('user_id' => $user_id, 'wallet_id' => $wallet_id, 'amount'=>$amount));
        } 
    }

    public function takeMoney($amount,$wallet_id,$user_id){
        $balanceCoin = Balance::where('user_id', '=', $user_id)
                        ->where('wallet_id', '=', $wallet_id)->first(); 
        if($amount==0){
            return true;
        }
        if(isset($balanceCoin->amount)){//update balance            
            $old_amount = $balanceCoin->amount;
            if($old_amount < $amount) return false;
            else{
                $new_amount = $old_amount - $amount;
                Log::info("Take Money ".$wallet_id." -- User: ".$user_id.": ".$new_amount.' -- amount: '.$amount);
                //echo "<br>Take New ".$wallet_id.": ".$new_amount.' -- amount: '.$amount;
                Balance::where('id', $balanceCoin->id)->update(array('amount' => $new_amount));
                return true;
            }            
        }else{ //insert balance
            return false;
        } 
    }
}