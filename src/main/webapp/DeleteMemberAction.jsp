<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDao dao = new MemberDao();
	String id = request.getParameter("id");
	dao.deleteMember(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("삭제되었습니다.");
	location.href="AdminPage.jsp";
</script>
</head>
<body>

</body>
</html>