<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	MemberDao dao = new MemberDao();
	MemberDto dto = dao.getMemberDto(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.1.min.js"></script>
<style>
.submit_bt{
	width: 184px;
    margin-top: 9px;
}
</style>
</head>
<body>
	<h1>회원관리-수정관리자</h1>
	<form action="ModifyAction.jsp" method="post">
		ID <input type="text" name="id" value="<%=dto.getId()%>" readonly/><br/>
		PW <input type="text" name="pw" value="<%=dto.getPw()%>"/><br/>
		Name <input type="text" name="name" value="<%=dto.getName()%>"/><br/>
		point <input type="text" name="point" value="<%=dto.getPoint()%>"/><br/>
		<input type="submit" class="submit_bt" value="제출"/>
	</form>
</body>
</html>