<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 이렇게 작성하면 꼭 body에서 쓰지않아도 된다. -->
<c:if test="${ empty user }"> <!-- session안에 user로 저장된게 비어있다면? 아직 로그인 안된상태!-->
	<script>
		alert("로그인 후 이용 가능한 페이지 입니다.");
		location.href = "Login.jsp";
	</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>