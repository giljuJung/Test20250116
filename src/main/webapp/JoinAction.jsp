<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	MemberDao dao = new MemberDao();
	dao.registerMember(id, pw, name);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("가입되었습니다. 로그인 해주세요.");
	location.href="Login.jsp";
</script>
</head>
<body>

</body>
</html>