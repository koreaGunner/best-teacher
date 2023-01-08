<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="vo" items="${list }">
	<div id="listBox"> 
		
		<div class="listSubjectBox">
			<div class="listSubject">${vo.subject }</div>
		</div>
		
		<div class="listProfile">
			<div class="imgIcon" onclick="view(${vo.idx});"><img src="/ZV2Project/img/user_profile2.png"/><!-- <i class="fa-regular fa-circle-user"></i> --><!-- <i class="fa-solid fa-face-laugh"></i> --></div>
			<div class="nickname" onclick="view(${vo.idx});"><span>${vo.nickname }</span></div>
			<div class="Date" onclick="view(${vo.idx});"><span><f:parseDate value="${vo.regidate }" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
			<f:formatDate value="${dateValue }" pattern="YYYY-MM-dd"/></span></div>
			
			
			<c:if test="${ (!empty user) and (user.id eq vo.id) and (vo.reply_info eq 0) }">
				<div class="editBox" onclick="edit_content(${vo.idx});" >
					<div class="edit_img"><img src="/ZV2Project/img/edit.png"/></div>
					<div class="edit_text">수정</div>
				</div>
				
				<div class="deleteBox" onclick="delete_content(${vo.idx});">
					<div class="delete_img"><img src="/ZV2Project/img/delete.png"/></div>
					<div class="delete_text">삭제</div>
				</div>
			</c:if>
		</div><!-- listProfile -->
		
		<div class="listContentBox" onclick="view(${vo.idx});">
			<div class="listContent" >
				<pre>${vo.content }</pre>
			</div>
		
		</div>
		
		<div class="listReadhit" >
			<div class="readhit">👁️ ${vo.readhit }</div>
			<div class="replyInfo"><i class="fa-solid fa-comment-dots"></i> ${vo.reply_info }</div>
			
			<c:choose>
			
				<c:when test="${!empty user and vo.like_check eq 1 }">
					<div class="likehit jjim" onclick="likeJJim(this,${vo.idx});"
				     style="cursor:pointer;"><span>💘</span> <span id="jjim${vo.idx }">${vo.likehit }</span>
					</div>
				
				</c:when>
				
				<c:otherwise>
					<div class="likehit" onclick="likeJJim(this,${vo.idx});"
				     style="cursor:pointer;"><span>🤍</span> <span id="jjim${vo.idx }">${vo.likehit }</span>
					</div>
				
				</c:otherwise>
			</c:choose>
			
		</div>
	
	</div>
	</c:forEach>
	
	

</body>
</html>