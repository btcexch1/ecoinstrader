<?php
class Deposit extends Eloquent
{
	protected $table = 'deposits';
	public function addressIsDesposited($address){
		$deposit = Deposit::where('address',$address)->first();
		if(isset($deposit->address)) return 1;
		else return 0;
	}
}
?>