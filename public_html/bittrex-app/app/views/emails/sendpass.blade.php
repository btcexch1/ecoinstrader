<!DOCTYPE html>
<html lang="en-US">
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<p>Dear {{$user->firstname}} {{$user->lastname}},</p>
		<p>Thank for your signup</p>
		<div>
			<h2>Your information</h2>
			<p>Username: {{$user->username}}</p>
			<p>Password: {{$password}}</p>
		</div>
	</body>
</html>