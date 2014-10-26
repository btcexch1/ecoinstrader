<!DOCTYPE html>
<html lang="en-US">
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<h2>Dear {{$user->username}},</h2>
		<div>
			You just login from different IP ({{$ip}}) with last login ({{$user->ip_lastlogin}})
		</div>
	</body>
</html>