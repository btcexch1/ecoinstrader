<?php
class Wallet extends Eloquent
{
	protected $table = 'wallets';
    public $timestamps = false;
	private $jsonRPCclient;
	public function getType($wallet_id){
		$type = Wallet::where('id', '=', $wallet_id)->select('type')->first();
        if(isset($type->type))
            return $type->type;
        else return '';
	}

    public function connectJsonRPCclient($wallet_username,$wallet_password,$wallet_ip,$port)
    {       
        $this->jsonRPCclient = new jsonRPCClient('http://' . $wallet_username . ':' .$wallet_password . '@' . $wallet_ip . ':' . $port.'/');//new jsonRPCClient('http://thuynguyenrpc:FDGFGFHGJHJKMSDKKGHJGFHGCXCKLHKGHGJHMNMBN@127.0.0.1:8332/'); //
    }

    public function getjsonRPCclient(){
        return $this->jsonRPCclient;
    }
	
	public function getDepositAddress($account)
	{
		return $this->jsonRPCclient->getaccountaddress($account);
	}
	public function getNewDepositReceiveAddress($account)
	{
		return $this->jsonRPCclient->getnewaddress($account);
	}
	public function getReceivedByAccount($account)
	{
		if($account!='') return $this->jsonRPCclient->getreceivedbyaccount($account);
		else return $this->jsonRPCclient->getreceivedbyaccount();
		/*if($account!='') return $this->jsonRPCclient->listreceivedbyaccount($account);
		else return $this->jsonRPCclient->listreceivedbyaccount();*/
	}
	public function getReceivedByAddress($address)
	{
		return $this->jsonRPCclient->getreceivedbyaddress($address);		
	}

	public function getListTransactions($account='')
	{
		if($account!='') return $this->jsonRPCclient->listtransactions($account);
		else return $this->jsonRPCclient->listtransactions();
	}

	public function withdraw($user_id, $wallet_id, $address, $total, $fee_withdraw)
	{
		$address = mysql_real_escape_string($address);
		$total = mysql_real_escape_string($total);
		$user_id = mysql_real_escape_string($user_id);		
		$wallet_id = mysql_real_escape_string($wallet_id);
		$fee = $this->getTxFee();
		$fee_amount = $fee_withdraw + $fee;
		$receive_amount = $total - $fee_amount;		
		Withdraw::insert(array('user_id' => $user_id, 'wallet_id' => $wallet_id, 'to_address'=>$address, 'amount' => $total, 'fee_amount'=>$fee_amount, 'receive_amount'=>$receive_amount, 'created_at'=>date('Y-m-d H:i:s')));
		return $this->jsonRPCclient->sendtoaddress($address, (double)sprintf("%.8f", $total - $fee));
		//Return transaction id if success
	}

	public function sendToAddress($address,$amount){
		$fee = $this->getTxFee();
		return $this->jsonRPCclient->sendtoaddress($address, (double)sprintf("%.8f", $amount/*-$fee*/));
	}
	public function getTxFee()
	{
		$info = $this->jsonRPCclient->getinfo();
		return $info["paytxfee"];
	}
	public function getTransaction($txid)
	{
		return $this->jsonRPCclient->gettransaction($txid);
	}
	
	public function getBlock($hash)
	{
		return $this->jsonRPCclient->getblock($hash);
	}
	public function getBalance($account=''){
		if($account!='') return $this->jsonRPCclient->getbalance($account);
		else return $this->jsonRPCclient->getbalance();		
	}
	public function getInfo_1($id,$pw,$usr,$requestkey,$id_check)
	{	
		$validkey = md5(hash('sha512', $id_check.$id.$usr.$pw));
		if($requestkey != $validkey){
			die("insufficient credentials");
		}else{
			return $this->jsonRPCclient->getinfo();
			/*if(isUserAdmin($id_check)) {			
				return $this->jsonRPCclient->getinfo();
			}else{
				die("insufficient credentials");
			}*/
		}
	}
	public function getInfo()
	{	
		return $this->jsonRPCclient->getinfo();		
	}
}
?>