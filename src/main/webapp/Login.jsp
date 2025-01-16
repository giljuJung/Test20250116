<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.1.min.js"></script>
<script>
	$(function() {
		$(".bt_join").click(function() {
			location.href="Join.jsp";
		});
	});
</script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}
.bt_login, .bt_join{

	width: 190px;
	margin-top: 4px;
}
.pw_input{
	margin-top: 5px;
}
</style>
</head>
<body>
	<div id="login">
		<div class="login_text">
			<h1>로그인</h1>
		</div>
		<form action="LoginAction.jsp" method="post">
		ID : <input type="text" name="id" class="id_input"/></br>
		PW : <input type="password" name="pw" class="pw_input"/><br/>
		<button class="bt_login">로그인</button><br/>
		</form>
		<button class="bt_join">회원가입</button>
	</div>
</body>
</html>