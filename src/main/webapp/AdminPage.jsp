<%@page import="dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");
	MemberDao dao = new MemberDao();
	boolean check = false;
	check = dao.CheckMember(id, pw);
	MemberDto dto = dao.getMemberDto(id);
	if(!check) {%>
		<script>
			alert("로그인 하세요");
			location.href="Login.jsp";
		</script>
	<%} else if(!dto.getId().equals("admin")){%>
		<script>
			alert("관리자가 아닙니다.");
			history.back();
		</script>
	<%}
	ArrayList<MemberDto> list = dao.memberDtoList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.1.min.js"></script>
<script>
	$(function() {
		$(".modify_btn").click(function() {
			let id = $(this).closest("tr").find(".id_td").text();
			location.href="Modify.jsp?id="+id;
		});
		$(".delete_btn").click(function() {
			let id = $(this).closest("tr").find(".id_td").text();
			location.href="DeleteMemberAction.jsp?id="+id;
		});
		$(".start_btn").click(function() {
			$.ajax({
				type: 'post',
				url: 'AjaxSchedulerStartServlet',
				success: function(data){},
				error: function(r,s,e) {
        			alert("[에러] code: " + r.status + ", message: " + r.responseText + ", error: " + e);
        		}
			});
		});
		$(".stop_btn").click(function() {
			$.ajax({
				type: 'post',
				url: 'AjaxSchedulerEndServlet',
				success: function(data){},
				error: function(r,s,e) {
        			alert("[에러] code: " + r.status + ", message: " + r.responseText + ", error: " + e);
        		}
			});
		});
		$(".login_btn").click(function() {
			location.href="Login.jsp";
		});
	});
</script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
table {
    border-collapse: collapse;
    margin-bottom: 20px;
}
table th, table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}
.login_btn{
	margin-left: 294px;
    margin-top: -31px;
    position: absolute;
}
</style>
</head>
<body>
	 <h1>회원 관리</h1>
	 <button class="login_btn">로그인</button>
    <table>
            <tr>
                <th>ID</th>
                <th>PW</th>
                <th>Name</th>
                <th>Point</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
            <%for(MemberDto mdto : list) { %>
            <tr>
                <td class="id_td"><%=mdto.getId() %></td>
                <td><%=mdto.getPw() %></td>
                <td><%=mdto.getName() %></td>
                <td><%=mdto.getPoint() %></td>
                <td><button class="modify_btn">수정</button></td>
                <td><button class="delete_btn">삭제</button></td>
            </tr>
            <%} %>
    </table>
    <h1>스케줄러 관리</h1>
    <div class="scheduler_btn">
        <button class="start_btn">스케줄러 (20초마다 포인트 1 증가) 실행 시작</button>
        <button class="stop_btn">스케줄러 실행 중지</button>
    </div>
</body>
</html>