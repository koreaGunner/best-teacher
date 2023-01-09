<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.divCenter {
			text-align:center;
		}
	</style>
		
<script>
	function send(f){
		alert("로그아웃 되었습니다.");
		location.href = "logout.do";
	}
</script>
</head>
<body>
	<jsp:include page="check_login.jsp"></jsp:include> <!-- 로그인이 선행되었는지 판단 -->
	
	<div class="divCenter">
	
	로그인 완료 한 후 메인페이지<br><br>
	[${ user.nickname }]님 환영합니다!!<br>
	
	<form>
	<input type="button" value="로그아웃" onclick="send(this.form)">
	</form>
	</div>
</body>
</html>