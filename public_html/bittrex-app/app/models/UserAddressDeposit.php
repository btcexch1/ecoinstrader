<?php
class UserAddressDeposit extends Eloquent
{
	protected $table = 'user_address_deposit';
	public $timestamps = false;

	public function updateAddress($user_id, $wallet_id,$address){
		$useraddress = UserAddressDeposit::where('user_id',$user_id)->where('wallet_id',$wallet_id)->first();
		if(isset($useraddress->addr_deposit)){
			UserAddressDeposit::where('id', $useraddress->id)->update(array('addr_deposit' => $address));
		}else{
			UserAddressDeposit::insert(array('user_id' => $user_id, 'wallet_id' => $wallet_id, 'addr_deposit'=>$address));
		}
	}
}
?>