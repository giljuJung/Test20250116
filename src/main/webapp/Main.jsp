<%@page import="dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	MemberDao dao = new MemberDao();
	String userId = dao.getMemberDto(id).getId();
	String name = dao.getMemberDto(id).getName();
	int point = dao.getMemberDto(id).getPoint();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.1.min.js"></script>
<script>
	$(function() {
		$(".intro").click(function() {
			let id = $(".right_box").attr("id");
			let price = parseInt($(".intro_price").attr("intro_price"));
			let userPoint = parseInt($(".right_box").attr("point"));
			if(price > userPoint) {
				alert("포인트가 부족합니다. 광고를 클릭하세요.");
				return;
			};
			$.ajax({
				type: 'post',
				url: 'AjaxMemberPointActionServlet',
				data: {"id": id, "point":price},
				success: function(data){
					console.log(data);
					alert("컨텐츠(intro)를 구입하였습니다.");
					 $(".right_box").attr("point", data.point);
					 $(".point span").text("포인트 : " + data.point + "점");
				},
				error: function(r,s,e) {
        			alert("[에러] code: " + r.status + ", message: " + r.responseText + ", error: " + e);
        		}
			});
		});
		$(".java").click(function() {
			let id = $(".right_box").attr("id");
			let price = $(".java_price").attr("java_price");
			let userPoint = parseInt($(".right_box").attr("point"));
			if(price > userPoint) {
				alert("포인트가 부족합니다. 광고를 클릭하세요.");
				return;
			};
			$.ajax({
				type: 'post',
				url: 'AjaxMemberPointActionServlet',
				data: {"id": id, "point":price},
				success: function(data){
					alert("컨텐츠(java)를 구입하였습니다.");
					$(".right_box").attr("point", data.point);
					 $(".point span").text("포인트 : " + data.point + "점");
				},
				error: function(r,s,e) {
        			alert("[에러] code: " + r.status + ", message: " + r.responseText + ", error: " + e);
        		}
			});
		});
		$(".cpp").click(function() {
			let id = $(".right_box").attr("id");
			let price = $(".cpp_price").attr("cpp_price");
			let userPoint = parseInt($(".right_box").attr("point"));
			if(price > userPoint) {
				alert("포인트가 부족합니다. 광고를 클릭하세요.");
				return;
			};
			$.ajax({
				type: 'post',
				url: 'AjaxMemberPointActionServlet',
				data: {"id": id, "point":price},
				success: function(data){
					alert("컨텐츠(C++)를 구입하였습니다.");
					$(".right_box").attr("point", data.point);
					 $(".point span").text("포인트 : " + data.point + "점");
				},
				error: function(r,s,e) {
        			alert("[에러] code: " + r.status + ", message: " + r.responseText + ", error: " + e);
        		}
			});
		});
		$(".korea_img").click(function() {
			let id = $(".right_box").attr("id");
			$.ajax({
				type: 'post',
				url: 'AjaxMemberPlusPointActionServlet',
				data: {"id": id},
				success: function(data){
					alert(data.newPoint + "점이 적립되었습니다.");
					location.href="http://www.koreaitacademy.com";
					 $(".right_box").attr("point", data.point);
					 $(".point span").text("포인트 : " + data.point + "점");
				},
				error: function(r,s,e) {
        			alert("[에러] code: " + r.status + ", message: " + r.responseText + ", error: " + e);
        		}
			});
		});
		$(".logout_bt").click(function() {
			alert("로그아웃 되었습니다.");
			location.href="LogOut.jsp";
		});
	});
</script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
.top{
	display: flex;
}
.right_box{
	margin-left: 1521px;
    margin-top: 30px;
}
.main_page_text{
	margin-top: 30px;
	margin-left: 19px;
}
.mid_span{
	margin-top: 84px;
    margin-left: 18px;
    font-size: 20px;
}
.img{
	margin-left: 226px;
}
.img img{
	width: 450px;
}
.price{
	display: flex;
	gap: 385px;
}
.intro_price{
	margin-left: 355px;
}
.korea{
	float: right;
    margin: 137px 42px 0 0;
}
.korea_span{
	right: 0;
	position: absolute;
	margin-top: 104px;
	margin-right: 203px;
}
</style>
</head>
<body>
	<div id="full">
		<div class="top">
			<div class="main_page_text">
				<h1>메인페이지</h1>
			</div>
			<div class="right_box" point="<%=point%>" id="<%=userId%>">
				<span><%=name %></span><span>(<%=userId %>)님 안녕하세요.</span>
				<button class="logout_bt">로그아웃</button>
				<div class="point">
					<span>포인트 : <%=point %>점</span>
				</div>
			</div>
		</div>
		<div class="mid">
			<div class="mid_span">
				<span>구입할 컨텐츠를 선택하세요.</span>
			</div>
			<div class="img">
				<img src="img/Intro_350_408.png" class="intro"/>
				<img src="img/Java_350_408.png" class="java"/>
				<img src="img/Cpp_350_408.png" class="cpp"/>
			</div>
			<div class="price">
				<div class="intro_price" intro_price="100000">100,000포인트</div>
				<div class="java_price" java_price="500000">500,000포인트</div>
				<div class="cpp_price" cpp_price="300000">300,000포인트</div>
			</div>
		</div>
		<div class="bottom">
			<div class="korea_span">
				<span><광고></span>
			</div>
			<div class="korea">
			<img src="img/korea_it.png" class="korea_img"/>
			</div>
		</div>
	</div>
</body>
</html>