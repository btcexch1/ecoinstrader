<!DOCTYPE html>
<html lang="en-US">
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<h2>Thank for your withdrawals, {{$user->username}}</h2>
		<div>
			To complete your withdrawals, click below link: <br>
			<a href='{{{ URL::to('user/withdraw-comfirm', array($withdraw_id,$confirmation_code)) }}}'>
			    {{{ URL::to('user/withdraw-comfirm', array($withdraw_id,$confirmation_code)) }}}.
			</a>
		</div>
	</body>
</html>