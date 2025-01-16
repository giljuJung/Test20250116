<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	MemberDao dao = new MemberDao();
	boolean check = false;
	check = dao.CheckMember(id, pw);
	session.setAttribute("id",id);
	session.setAttribute("pw",pw);
	MemberDto dto = dao.getMemberDto(id);
	if(dto.getId().equals("admin") && dto.getPw().equals("admin")) {%>
		<script>
			location.href="AdminPage.jsp";
		</script>
	<%}
	else if(check && dto.getId() != "admin" && dto.getPw() != "admin") {%>
		<script>
			location.href="Main.jsp";
		</script>
	<%} else if(!check) {%>
		<script>
			alert("아이디/비밀번호를 다시 확인하세요.");
			history.back();
		</script>
	<%}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>