<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.1.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
.bt_login, .bt_join{
	width: 190px;
	margin-top: 4px;
}
.pw_input, .name_input{
	margin-top: 5px;
}
</style>
</head>
<body>
	<div id="join">
		<div class="join_text">
			<h1>회원가입</h1>
		</div>
		<form action="JoinAction.jsp" method="post">
		ID : <input type="text" name="id" class="id_input"/></br>
		PW : <input type="password" name="pw" class="pw_input"/><br/>
		Name : <input type="text" name="name" class="name_input"/><br/>
		<button class="bt_login">작성완료</button>
		</form>
	</div>
</body>
</html>