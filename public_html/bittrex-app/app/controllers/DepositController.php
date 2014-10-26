<?php
class DepositController extends BaseController {
    public function generateNewAddrDeposit()
    {       
        if( !Confide::user() ){
            return View::make(Config::get('confide::login_form'));
        }
        $user = Confide::user();
        $user_id = $user->id;
        $wallet_id = $_POST['wallet_id'];
        $wallet =Wallet::find($wallet_id);
        $deposit = new Deposit();
        $user_address_deposit = new UserAddressDeposit();
        $addr_deposit = UserAddressDeposit::where('wallet_id',$wallet->id)->where('user_id',$user_id)->first();
        if(isset($addr_deposit->addr_deposit) && $deposit->addressIsDesposited($addr_deposit->addr_deposit)){
            $wallet->connectJsonRPCclient($wallet->wallet_username,$wallet->wallet_password,$wallet->wallet_ip,$wallet->port);
            $new_addr_deposit = $wallet->getNewDepositReceiveAddress($user->username);
            $user_address_deposit->updateAddress($user_id, $wallet->id,$new_addr_deposit);
            echo json_encode(array('status'=>'success','address'=>$new_addr_deposit));
            exit;
        }else{
            echo json_encode(array('status'=>'error','message'=>'You cannot generate a new address, without using the old'));
            exit;
        }        
    }

    public function cronUpdateDeposit(){
        $wallets = Wallet::get();
        $balance = new Balance();
        //Log::info('buy_orders_matching: market_id: '.$market_id.' -- Price: '.$price_sell, $buy_orders_matching);
        Log::info('********************* Start cron *****************************');
        $message = '********************* Start cron *****************************';
        foreach ($wallets as $wallet) {
            try{
                $wallet->connectJsonRPCclient($wallet->wallet_username,$wallet->wallet_password,$wallet->wallet_ip,$wallet->port);
                $listtrans = $wallet->getListTransactions(); 
                foreach ($listtrans as $key => $value) {
                    $transaction_id = $value['txid'];
                    $trans = $wallet->getTransaction($transaction_id);
                    if($trans != null) {
                        $account = $trans["details"][0]["account"];
                        $category = $trans["details"][0]["category"];
                        $confirms = $trans["confirmations"];//send,receive
                        $address_ = $trans["details"][0]["address"];
                        $amount = $trans["amount"];
                        //$message.="<br>account: ".$account." -- category:".$category." --address: ".$address_;
                        Log::info( "\n"."transaction: ",$trans);
                        //mail("ntngocthuy88@gmail.com", 'Deposit Cron: ', var_export($trans, true)); 
                        $deposit = Deposit::where('transaction_id', $transaction_id)->first();
                        $user = User::where('username', $account)->first();
                        if(!empty($user)){
                            Log::info( "\n"."user---------: ",$user);
                        }
                        if(isset($deposit->id)){
                            //$message.="<br>user_id: ".$deposit->id;
                            if($deposit->paid == 0){
                                if($category == "receive" && $confirms > 2 && isset($user->id))
                                {                                
                                    Deposit::where('id',$deposit->id)->update(array('paid' => 1,'confirmations'=>$confirms));
                                    $balance->addMoney($amount,$wallet->id,$user->id);
                                    $message.="<br>".$amount." ".$wallet->type." was credited to your account";
                                    Log::info( "\n".$amount." ".$wallet->type." was credited to your account");
                                }
                            }else{
                                $message.="<br>".$amount." ".$wallet->type." was already credited to your account. contact support if you need further assistance.";
                                Log::info( "\n".$amount." ".$wallet->type." was already credited to your account. contact support if you need further assistance.");
                            }
                        }else{
                            if($category == "receive" && isset($user->id)) {
                                if($confirms > 2) {
                                    Deposit::insert(array('user_id'=>$user->id,'wallet_id'=>$wallet->id,'transaction_id'=>$transaction_id,'amount'=>$amount,'paid'=>1, 'confirmations'=>$confirms, 'address'=>$address_,'created_at'=>date('Y-m-d H:i:s')));                        
                                    $balance->addMoney($amount,$wallet->id,$user->id);
                                    $message.="<br>".$amount." ".$wallet->type." was credited to your account";
                                    Log::info( "\n".$amount." ".$wallet->type." was credited to your account");
                                }else{
                                    Deposit::insert(array('user_id'=>$user->id,'wallet_id'=>$wallet->id,'transaction_id'=>$transaction_id,'amount'=>$amount,'paid'=>0, 'confirmations'=>$confirms, 'address'=>$address_,'created_at'=>date('Y-m-d H:i:s')));
                                    $message.="<br>This Deposit is unconfirmed. Current confirmations:" . $confirms .". Required : 6.";
                                    Log::info( "\n"."This Deposit is unconfirmed. Current confirmations:" . $confirms .". Required : 6.");
                                }
                            }else{
                                //$message.="<br>transaction is not a deposit or account is invalid.";
                                Log::info( "\n"."transaction is not a deposit or account is invalid.");
                            }
                        }
                    }else{   
                        //$message.="<br>We can't find any information about this deposit. contact support.";       
                        Log::info("\n"."We can't find any information about this deposit. contact support.");                
                    }//trans
                }//listtrans
            }catch (Exception $e) {
                //$message.='<br>Cron Update Deposit: Caught exception: '.$e->getMessage();
                Log::info("\n".'Cron Update Deposit: Caught exception: '.$e->getMessage());                
            }
        }//wallets
        Log::info("\n".'********************* Stop cron *****************************');
        $message .= '********************* Stop cron *****************************';
        $data['message'] = $message;
        return View::make('cronupdatedeposit',$data);
    }
    public function callbackUpdateDeposit_test($wallet_type){
        $blockhash = isset($_GET['trxhash'])? $_GET['trxhash']:0; 
        $logFile = 'laravel_'.$wallet_type.'.log';
        Log::useDailyFiles(storage_path().'/logs/'.$logFile);
        Log::info("*******Test blocknotify _GET- block hash: ".$blockhash." -- wallet_type: ".$wallet_type);
        echo "*******Test blocknotify _GET- block hash: ".$blockhash." -- wallet_type: ".$wallet_type;
        $wallet = Wallet::where('type',strtoupper($wallet_type))->first();
        //echo "<pre>wallet: "; print_r($wallet); echo "</pre>"; 
        //$wallet->connectJsonRPCclient($wallet->wallet_username,$wallet->wallet_password,$wallet->wallet_ip,$wallet->port);
        try{
              $wallet->connectJsonRPCclient($wallet->wallet_username,$wallet->wallet_password,$wallet->wallet_ip,$wallet->port);               
               $results=$wallet->getBlock($blockhash);
               echo "<pre>results: "; print_r($results); echo "</pre>";
               @Log::info("\n".'Caught exception: ',$results);
        }catch (Exception $e) {
                Log::info('Caught exception: '.$e->getMessage()."\n");
        }
    }
    public function callbackUpdateDeposit($wallet_type=''){
        Log::info('********************* Callback Deposit *****************************');
        $transaction_id = isset($_GET['trxhash'])? $_GET['trxhash']:0;         
        Log::info("curl _GET- transaction_id: ".$transaction_id." -- wallet_type: ".$wallet_type);
        if($transaction_id && !empty($wallet_type)){
            $balance = new Balance();
            $wallet = Wallet::where('type',strtoupper($wallet_type))->first();
            $wallet->connectJsonRPCclient($wallet->wallet_username,$wallet->wallet_password,$wallet->wallet_ip,$wallet->port);
            $trans = $wallet->getTransaction($transaction_id);
            $message='';
            if($trans != null) {
                $account = $trans["details"][0]["account"];
                $category = $trans["details"][0]["category"];
                $confirms = $trans["confirmations"];//send,receive
                $address_ = $trans["details"][0]["address"];
                $amount = $trans["amount"];
                //$message.="<br>account: ".$account." -- category:".$category." --address: ".$address_;
                Log::info( "\n"."transaction: ",$trans);
                Log::info( "\n"."------Account: ".$account." -- category:".$category." --address: ".$address_);
                //mail("ntngocthuy88@gmail.com", 'Deposit Cron: ', var_export($trans, true)); 
                $deposit = Deposit::where('transaction_id', $transaction_id)->first();
                $user = User::where('username', $account)->first();
                if(isset($deposit->id)){
                    //$message.="<br>user_id: ".$deposit->id;
                    if($deposit->paid == 0){
                        if($category == "receive" && $confirms > 0 && isset($user->id))
                        {                                
                            Deposit::where('id',$deposit->id)->update(array('paid' => 1,'confirmations'=>$confirms));
                            $balance->addMoney($amount,$wallet->id,$user->id);
                            $message.="<br>".$amount." ".$wallet->type." was credited to your account";
                            Log::info( "\n".$amount." ".$wallet->type." was credited to your account");
                        }
                    }else{
                      
                        Log::info( "\n".$amount." ".$wallet->type." was already credited to your account. contact support if you need further assistance.");
                    }
                }else{
                    if($category == "receive" && isset($user->id)) {
                        if($confirms > 0) {
                            Deposit::insert(array('user_id'=>$user->id,'wallet_id'=>$wallet->id,'transaction_id'=>$transaction_id,'amount'=>$amount,'paid'=>1, 'confirmations'=>$confirms, 'address'=>$address_,'created_at'=>date('Y-m-d H:i:s')));                        
                            $balance->addMoney($amount,$wallet->id,$user->id);
                            
                            Log::info( "\n".$amount." ".$wallet->type." was credited to your account");
                        }else{
                            Deposit::insert(array('user_id'=>$user->id,'wallet_id'=>$wallet->id,'transaction_id'=>$transaction_id,'amount'=>$amount,'paid'=>0, 'confirmations'=>$confirms, 'address'=>$address_,'created_at'=>date('Y-m-d H:i:s')));
                           
                            Log::info( "\n"."This Deposit is unconfirmed. Current confirmations:" . $confirms .". Required : 6.");
                        }
                    }else{
                        
                        Log::info( "\n"."transaction is not a deposit or account is invalid.");
                    }
                }
            }else{   
                     
                Log::info("\n"."We can't find any information about this deposit. contact support.");                
            }//trans
        }else{
            Log::info('------------------- Error: not param transaction_id or wallet_type from _GET'); 
        }
        Log::info("\n".'********************* Stop cron *****************************');        
    }
    public function updateDataDeposit($wallet){
        Log::info("******* updateDataDeposit*************"); 
        $deposits=Deposit::where('paid',0)->where('wallet_id',$wallet->id)->get();
        foreach ($deposits as $deposit){
            try{
                $trans = $wallet->getTransaction($deposit->transaction_id);
                if($trans != null) {
                    $balance=new Balance();
                    $account = $trans["details"][0]["account"];
                    $category = $trans["details"][0]["category"];
                    $confirms = $trans["confirmations"];//send,receive
                    $address_ = $trans["details"][0]["address"];
                    $amount = $trans["amount"];
                    //$message.="<br>account: ".$account." -- category:".$category." --address: ".$address_;
                    Log::info( "\n"."transaction: ",$trans);
                    Log::info( "\n"."------Account: ".$account." -- category:".$category." --address: ".$address_);
                    $user = User::where('username', $account)->first();
                    if($category == "receive" && $confirms >= 3 && isset($user->id))
                    {                                
                        Deposit::where('id',$deposit->id)->update(array('paid' => 1,'confirmations'=>$confirms));
                        $balance->addMoney($amount,$wallet->id,$user->id);                    
                        Log::info( "\n".$amount." ".$wallet->type." was credited to ".$account);
                    }
                }  
            }catch (Exception $e) {
                Log::info('Caught exception: '.$e->getMessage()."\n");
            }          
        }
        Log::info("*******Stop updateDataDeposit*************"); 
    }

    /*
    **Get all transaction of block , find the transaction of this system to update deposit 
    **(can insert or update deposit,but only process insert), update the updateDataDeposit function process
     */
    public function blocknotifyUpdateDeposit_bakup($wallet_type=''){
        $blockhash = isset($_GET['trxhash'])? $_GET['trxhash']:0; 
        Log::info("*******Blocknotify Update Deposit: ".$blockhash." -- wallet_type: ".$wallet_type);        
        $wallet = Wallet::where('type',strtoupper($wallet_type))->first();   
        if($blockhash!=0 && $wallet_type!=''){            
            $wallet->connectJsonRPCclient($wallet->wallet_username,$wallet->wallet_password,$wallet->wallet_ip,$wallet->port);  
            //update the pendding deposits from database
            $this->updateDataDeposit($wallet); 
            //$listtrans = $wallet->getListTransactions(); 
            //echo "<pre>listtrans: "; print_r($listtrans); echo "</pre>";   
            @Log::info( "\n"."List transaction: ",$listtrans);
            //get info of block to find transaction of this system   
            $results=$wallet->getBlock($blockhash);
            if(isset($results['confirmations'])){
                @Log::info("\n".'Result Blocknotify: ',$results);
                $txids=$results['tx'];
                $balance=new Balance();
                foreach ($txids as $transaction_id) {
                    try{
                        $trans = $wallet->getTransaction($transaction_id);                        
                        if($trans != null) {
                            $account = $trans["details"][0]["account"];
                            $category = $trans["details"][0]["category"];
                            $confirms = $trans["confirmations"];//send,receive
                            $address_ = $trans["details"][0]["address"];
                            $amount = $trans["amount"];                                               
                            Log::info( "\n"."transaction: ",$trans);
                            Log::info( "\n"."------Account: ".$account." -- category:".$category." --address: ".$address_);
                            //mail("ntngocthuy88@gmail.com", 'Deposit Cron: ', var_export($trans, true)); 
                            $deposit = Deposit::where('transaction_id', $transaction_id)->first();
                            $user = User::where('username', $account)->first();                                   
                            if(!isset($deposit->id)){
                                if($category == "receive" && isset($user->id)) {
                                    //check this transaction is of this system
                                    $deposit_address=Deposit::where('wallet_id',$wallet->id)->where('user_id',$user->id)->where('address',$address_)->first(); 
                                    $addr_deposit = UserAddressDeposit::where('wallet_id',$wallet->id)->where('user_id',$user->id)->where('addr_deposit',$address_)->first();
                                    if(isset($deposit_address->address) || isset($addr_deposit->addr_deposit)){
                                        if($confirms >= 3) {
                                            Deposit::insert(array('user_id'=>$user->id,'wallet_id'=>$wallet->id,'transaction_id'=>$transaction_id,'amount'=>$amount,'paid'=>1, 'confirmations'=>$confirms, 'address'=>$address_,'created_at'=>date('Y-m-d H:i:s'),'updated_at'=>date('Y-m-d H:i:s')));                        
                                            $balance->addMoney($amount,$wallet->id,$user->id);
                                            Log::info( "\n".$amount." ".$wallet->type." was credited to your account");
                                        }else{
                                            Deposit::insert(array('user_id'=>$user->id,'wallet_id'=>$wallet->id,'transaction_id'=>$transaction_id,'amount'=>$amount,'paid'=>0, 'confirmations'=>$confirms, 'address'=>$address_,'created_at'=>date('Y-m-d H:i:s'),'updated_at'=>date('Y-m-d H:i:s')));
                                           
                                            Log::info( "\n"."This Deposit is unconfirmed. Current confirmations:" . $confirms .". Required : 3.");
                                        }
                                    }
                                    
                                }else{                                    
                                    Log::info( "\n"."transaction is not a deposit or account is invalid.");
                                }
                            }else{
                                Deposit::where('id',$deposit->id)->update(array('confirmations'=>$confirms));
                            }
                        }else{  
                            Log::info("\n"."We can't find any information about this deposit. contact support.");               
                        }//trans
                    }catch (Exception $e) {
                        Log::info('Caught exception: '.$e->getMessage()."\n");
                    }
                }
            }                
            
        }else{
            Log::info('------------------- Error: not param blockhash or wallet_type from _GET'); 
        }  
        Log::info("*******Stop Blocknotify Update Deposit*************"); 
    }
    /*
     **update the pendding deposits from database (only update)
     */    

    /*
    **Use Blocknotify to call this function, here, use listtransactions to get all transaction of this wallet
    **(can insert or update deposit,but only process insert), update the updateDataDeposit function process
     */
    public function blocknotifyUpdateDeposit($wallet_type=''){
        $blockhash = isset($_GET['trxhash'])? $_GET['trxhash']:0; 
        $logFile = 'laravel_'.$wallet_type.'.log';
        Log::useDailyFiles(storage_path().'/logs/callbackdeposits/'.$logFile);
        Log::info("*******New Blocknotify Update Deposit: ".$blockhash." -- wallet_type: ".$wallet_type);
        Log::info("\n"."-- wallet_type: ".$wallet_type);
        if($wallet_type!=''){     
            $wallet = Wallet::where('type',strtoupper($wallet_type))->first();         
            $wallet->connectJsonRPCclient($wallet->wallet_username,$wallet->wallet_password,$wallet->wallet_ip,$wallet->port);
            $limit_confirmations=(empty($wallet->limit_confirmations) || $wallet->limit_confirmations <=0 )? 3:$wallet->limit_confirmations;
            $listtrans = $wallet->getListTransactions();            
            @Log::info("\n".'Result listtrans: ',$listtrans);            
            $balance=new Balance();
            foreach ($listtrans as $key => $value) {
                try{
                    $transaction_id = $value['txid'];
                    $trans = $wallet->getTransaction($transaction_id);                        
                    if($trans != null) {
                        $account = $trans["details"][0]["account"];
                        $category = $trans["details"][0]["category"];
                        $confirms = $trans["confirmations"];//send,receive
                        $address_ = $trans["details"][0]["address"];
                        $amount = $trans["amount"];                                               
                        Log::info( "\n"."transaction: ",$trans);
                        Log::info( "\n"."------Account: ".$account." -- category:".$category." --address: ".$address_);
                        //mail("ntngocthuy88@gmail.com", 'Deposit Cron: ', var_export($trans, true)); 
                        $deposit = Deposit::where('transaction_id', $transaction_id)->first();
                        $user = User::where('username', $account)->first();                                   
                        if(isset($deposit->transaction_id)){                            
                            if($deposit->paid == 0){
                                if($category == "receive" && $confirms >= $limit_confirmations && isset($user->id))
                                {                                
                                    Deposit::where('id',$deposit->id)->update(array('paid' => 1,'confirmations'=>$confirms));
                                    $balance->addMoney($amount,$wallet->id,$user->id);
                                    $message.="<br>".$amount." ".$wallet->type." was credited to your account";
                                    Log::info( "\n".$amount." ".$wallet->type." was credited to your account");
                                }
                            }else{
                                Deposit::where('id',$deposit->id)->update(array('confirmations'=>$confirms));
                                Log::info( "\n".$amount." ".$wallet->type." was already credited to your account. contact support if you need further assistance.");
                            }
                        }else{
                            if($category == "receive" && isset($user->id)) {
                                if($confirms >= $limit_confirmations) {
                                    Deposit::insert(array('user_id'=>$user->id,'wallet_id'=>$wallet->id,'transaction_id'=>$transaction_id,'amount'=>$amount,'paid'=>1, 'confirmations'=>$confirms, 'address'=>$address_,'created_at'=>date('Y-m-d H:i:s'),'updated_at'=>date('Y-m-d H:i:s')));                        
                                    $balance->addMoney($amount,$wallet->id,$user->id);
                                    
                                    Log::info( "\n".$amount." ".$wallet->type." was credited to your account");
                                }else{
                                    Deposit::insert(array('user_id'=>$user->id,'wallet_id'=>$wallet->id,'transaction_id'=>$transaction_id,'amount'=>$amount,'paid'=>0, 'confirmations'=>$confirms, 'address'=>$address_,'created_at'=>date('Y-m-d H:i:s'),'updated_at'=>date('Y-m-d H:i:s')));
                                   
                                    Log::info( "\n"."This Deposit is unconfirmed. Current confirmations:" . $confirms .". Required : 3.");
                                }
                            }else{                                
                                Log::info( "\n"."transaction is not a deposit or account is invalid.");
                            }
                        }
                    }else{  
                        Log::info("\n"."We can't find any information about this deposit. contact support.");               
                    }//trans
                }catch (Exception $e) {
                    Log::info('Caught exception: '.$e->getMessage()."\n");
                }
            }
        }else{
            Log::info('------------------- Error: not param wallet_type from _GET'); 
        }  
        Log::info("*******Stop New Blocknotify Update Deposit*************"); 
    }    
}