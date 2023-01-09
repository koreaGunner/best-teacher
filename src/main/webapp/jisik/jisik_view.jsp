<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지식인 뷰</title>
<link rel="stylesheet" href="../css/css.css">

<script src="https://kit.fontawesome.com/bc13bff3f1.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="../css/summernote-lite.css">
<script src="../js/summernote-lite.js"></script>
<script src="../js/lang/summernote-ko-KR.js"></script>
<link rel="shortcut icon" href="#">
<script src="../js/httpRequest.js"></script>



<style>

	html{
		padding-bottom: 150px;
	}
	

	.listBox{
		position: relative;
		width:650px;
		height:auto;
		min-height:310px;
		border:1px solid #e5e7eb;	
		margin:70px auto 120px;
		overflow: hidden;
		background-color: #ffffff;
		border-radius: 30px;
		
	}
	
	.listSubjectBox{
		border-bottom: 1px solid #e5e7eb;
		width:100%;
		height:40px;
		position: relative;
	}
	
	.listSubjectBox .listSubject{
		position:absolute;
		color:#273057;
		font-size:18px;
		font-weight: 600;
		margin-left:35px;
		top:9px;
		
		
	}
	
	.listProfile{
		position:relative;
		border-bottom: 1px solid #e5e7eb;
		width:100%;
		height:70px;
		padding-bottom: 2px;
	}
	
	.listProfile .imgIcon{
		width:200px;
		display: inline-block;
		cursor: pointer;
		
	} 
	
	.listProfile .imgIcon img{
		width:50px;
		height:50px;
		margin-top:12px;
		margin-left: 30px;
		border-radius: 70%;
	}
	
	
	.listProfile .nickname{
		position:absolute;
		font-size:18px;
		display: inline-block;
		top:11px;
		left:80px;
		margin-left: 10px;
		font-weight: 600;
		color:#525257;
		cursor: pointer;
	
	}
	
	.listProfile .Date{
		position:absolute;
		font-size:15px;
		display: inline-block;
		top:41px;
		left:80px;
		margin-left: 12px;
		font-weight: 300;
		color:#a9a9a9;
		cursor: pointer;
	}
	
	.listProfile .editBox{
		position:absolute;
		display: inline-block;
		top:15px;
		left:450px;
		cursor: pointer;
		
	}
	
	.listProfile .editBox > .edit_img > img{
		width:25px;
		height:25px;
		
	
	}
	
	.listProfile .editBox > .edit_text{
		font-size: 13px;
		font-weight: 600;
		margin-top:-3px;
		
	}
	
	.listProfile .deleteBox{
		position: absolute;
		display: inline-block;
		top:15px;
		left:510px;
		cursor: pointer;
	}
	
	
	
	.listProfile .deleteBox > .delete_img > img{
		width:28px;
		height:26px;
	
	}
	
	.listProfile .deleteBox > .delete_text{
		font-size: 13px;
		font-weight: 600;
		margin-left: 2px;
		margin-top: -3px;
	}
	
	.listProfile .jjimBox{
		position: absolute;
		display: inline-block;
		top:11px;
		left:575px;
		cursor: pointer;
	}
	
	.listProfile .jjimBox > .jjim_img{
		font-size: 22px;
	
	}
	
	.listProfile .jjimBox > .jjim_text{
		font-size: 13px;
		font-weight: 600;
		margin-left: -2px;
		
	}
	
	
	
	
	.listContentBox{
		width:96%;
		min-height:150px;
		height:auto;
		overflow: hidden;
		padding:22px;
		border-bottom: 1px solid #e5e7eb;
		
	}
	
	.listContent > pre{
		white-space: pre-wrap;
 		word-break: break-all;
		padding-right: 17px;
		
	}
	
	.listaddReply .AddReplyBox{
		width:100%;
		min-height:70px;
		height:auto;
		border:1px solid transparent;
		position:relative;
		padding-bottom: 3px;
	}
	
	
	.listaddReply .AddReplyBox > p{
		display: inline-block;
	}
	
	.listaddReply .AddReplyBox .AddReplyAlert{
		position:absolute;
		top:6px;
		left:22px;
		font-size: 40px;
		color:#878a8e;
	}
	
	.AddReplyBox .reply-open-input > input[type="button"]{
		display: none;
	}

	.AddReplyBox .reply-open-input > input[type="button"] + span{
		position:absolute;
		display: inline-block;
		width: 500px;
		background-color:#f7f7f7;
		color: #dadadb;
		padding: 0px 10px;
		text-align: center;
		height: 52px;
		font-size: 20px; 
		font-weight: 700;
		letter-spacing:2px;
		cursor: pointer;
		line-height: 53px;
		top:10.5px;
		left:83px;
		border-radius: 20px;
	}
	
	
	
	.listaddReply .AddReplyBox #showBox{
		margin-top:80px;
		display: none;
	
	}
	
	
	.note-editor{
		margin-left: 13px;
	}
	
	
	.note-modal-content{
		position:absolute;
		top:50%;
		left:50%;
		transform:translate(-50%,-50%);
	
	}
	
	
	
	.listaddReply .listaddReplyButton{
		
		border-top:1px solid #e5e7eb;
		margin-top: 20px;
	}
	
	.AddReplyButton .reply{
		display: inline-block;
		margin-left:256px;
		
	}
	
	.listaddReply .AddReplyBox #showBox.show{
		margin-top:80px;
		display: block;
	
	}
	
	#showBox .AddReplyButton{
		
		margin:10px auto;
		position: relative;
		height:45px;
		
	}
	
	#showBox .AddReplyButton > input{
		position:absolute;
		display:inline-block;
	
		border:none;
		color:#ffffff;
		background-color:#ff8906;
		width:120px;
		height:45px;
		text-decoration: none;
	
		font-size: 18px;
		font-weight:600;
		cursor: pointer;
		
		border-radius: 10px;
		
	}
	
	#showBox .AddReplyButton .reply{
		left:-60px;
		letter-spacing: 2px;
	}
	
	#showBox .AddReplyButton .replyend{
		left:334px;
	
	}
	
	
	
	
/* -------------------------------------------------------------------------- */	
	
	
	.replyBox{
		position: relative;
		width:650px;
		height:auto;
		min-height:245px;
		border:1px solid #e5e7eb;	
		margin:50px auto 30px;
		overflow: hidden;
		background-color: #ffffff;
		border-radius: 30px;
	}
	
	
	.replyInfoBox{
		width:100%;
		height:35px;
		margin:0 auto;
	}
	
	.replyInfoBox .replyInfo{
		color:black;
		font-size: 20px;
		font-weight: 400;
		margin-left:30px;
		margin-top:5px;
	}
	
	.replyInfoBox .replyInfo span{
		
		font-size: 18px;
		
	}
	
	/* 댓글 없을때 */
	.noreplyBox{
		
		border-top: 1px solid #e5e7eb;
		width:100%;
		height:260px;
		
	}
	
	.noreplyBox > .noreply_content{
		margin:60px auto;
		color:#878a8e;
		text-align: center;
	
	}
	
	.noreplyBox > .noreply_content > .noreply_img{
	
		font-size: 40px;
		margin-bottom:3px;
	}
	
	.noreplyBox > .noreply_content > .noreply_text{
	
		font-size: 22px;
	}
	
	
	.replyProfile{
		position:relative;
		border-top: 2px solid #e5e7eb;
		border-bottom: 1px solid #e5e7eb;
	
		width:100%;
		height:50px;
	}
	
	.replyProfile .imgIcon{
		width:200px;
		display: inline-block;
		cursor: pointer;
	}
	
	.replyProfile .imgIcon img{
		width:40px;
		height:40px;
		margin-top:5px;
		margin-left: 28px;
		border-radius: 70%;
	}
	
	.replyProfile .nickname{
		position:absolute;
		font-size:15px;
		display: inline-block;
		top:5px;
		left:77px;
		margin-left: 10px;
		font-weight: 600;
		color:#525257;
		cursor: pointer;
	
	}
	.replyProfile .Date{
		position:absolute;
		font-size:12px;
		display: inline-block;
		top:26px;
		left:77px;
		margin-left: 12px;
		font-weight: 300;
		color:#a9a9a9;
		cursor: pointer;
	
	}
	
	.replyProfile .editBox{
		position:absolute;
		display: inline-block;
		top:7px;
		left:540px;
		cursor: pointer;
		
	}
	
	.replyProfile .editBox > .edit_img > img{
		width:20px;
		height:20px;
		
	
	}
	
	.replyProfile .editBox > .edit_text{
		font-size: 10px;
		font-weight: 600;
		margin-top:-3px;
		
	}
	
	.replyProfile .deleteBox{
		position: absolute;
		display: inline-block;
		top:7px;
		left:580px;
		cursor: pointer;
	}
	
	
	
	.replyProfile .deleteBox > .delete_img > img{
		width:23px;
		height:21px;
	
	}
	
	.replyProfile .deleteBox > .delete_text{
		font-size: 10px;
		font-weight: 600;
		margin-left: 2px;
		margin-top: -3px;
	}
	
	
	.replyContentBox{
		position:relative;
		width:96%;
		min-height:75px;
		height:auto;
		
		margin-bottom:15px;
		padding:25px 25px 0;
		
		border-bottom:1px solid #e5e7eb;
		
	
	}
	
	.replyContentBox.reply{
		padding: 25px 25px 0 70px;
	
	}
	
	
	.replyContentBox > .replyContent{
		width:99%;
		display: block;
		position:relative;
	}
	
	.replyContentBox > .replyContent > .baseNickname{
		color:#065fd4;
		font-size: 15px;
		margin-bottom: 20px;
		font-weight: 600;
	}
	
	
	.replyContentBox pre{
		white-space: pre-wrap;
 		word-break: break-all;
 		display: block;
 		padding-right: 17px;
 		margin-bottom:20px;
	
	}
	
	.replyContentBox.reply pre{
		white-space: pre-wrap;
 		word-break: break-all;
 		display: block;
 		padding-right: 17px;
 		margin-bottom:20px;
 		width:560px;
	
	}
	
	
	.replyLikeBox{
		position:relative;
		display:inline-block;
		width:500px;
		margin-top:-10px;
		margin-left:100px;
		height:30px;
	}
	
	.replyLikeBox > .replyLike{
		position:absolute;
		left:400px;
		font-size: 18px;
		font-weight: bold;
		cursor: pointer;
		
	
	}
	
	.reply_forHiddenBox{
	 	position:absolute;
	 	left:40px;
	 	
	 	display: inline-block;
	 	margin-top:-12px;
	 	height:35px;
	 
	 	
	 }
	 
	.reply_forHiddenBox input[type="button"]{
	 	display: none;
	 }
	 
	 .reply_forHiddenBox input[type="button"] + span{
	 	cursor: pointer;
	 	background-color: white;
	 	font-size: 20px;
	 	color:#878a8e;
	 
	 }
	 .reply_forHiddenBox #replyWriteText{
	 	
	 	font-size: 17px;
	 }
	
	.ReplyAddReply{
		margin-top:15px;
		width:100%;
		min-height:60px;
		height:auto;
		border:1px solid transparent;
		position:relative;
		display: none;
		
	}
	
	.show{
		display: block;
	
	}
	
	.hidden{
		display: none;
	}
	
	
	.ReplyAddReply > p{
	
		display: inline-block;
	}
	
	
	.ReplyAddReply .reply-close-hidden > input[type="button"]{
		display:none;
		background-color: white;
	}
	
	.ReplyAddReply .reply-close-hidden > input[type="button"] + span{
		position:absolute;
		
		top:-15px;
		left:22px;
		cursor: pointer;
	 	background-color: white;
	 	font-size: 30px;
	 	color:#878a8e;
	}
	
	
	.ReplyAddReply .reply-open-input > input[type="button"]{
		display: none;
	}

	.ReplyAddReply .reply-open-input > input[type="button"] + span{
		position:absolute;
		display: inline-block;
		width: 500px;
		background-color:#f7f7f7;
		color: #dadadb;
		padding: 0px 10px;
		text-align: center;
		height: 39px;
		font-size: 15px; 
		font-weight: 700;
		cursor: pointer;
		line-height: 40px;
		top:-10px;
		left:83px;
		border-radius: 20px;
		letter-spacing: 5px;
		
	}
	
	
	.ReplyAddReply #showBox{
		margin-top:55px;
		display: none;
	
	}
	
	
	.ReplyAddReply #showBox.show{
		margin-top:55px;
		display: block;
	
	}
	
	.show_replyEditBox{
		display:none;
	}
	
	.show_replyEditBox .AddReplyButton{
		
		margin:10px auto;
		position: relative;
		height:45px;
		
	}
	
	.show_replyEditBox .AddReplyButton > input{
		position:absolute;
		display:inline-block;
	
		border:none;
		color:#ffffff;
		background-color:#ff8906;
		width:120px;
		height:45px;
		text-decoration: none;
	
		font-size: 18px;
		font-weight:600;
		cursor: pointer;
		
		border-radius: 10px;
		
	}
	
	.show_replyEditBox .AddReplyButton .reply_edit_button{
		left:195px;
		letter-spacing: 2px;
	}
	
	.show_replyEditBox .AddReplyButton .reply_edit_hide{
		left:334px;
		letter-spacing: 2px;
	}
	
	
	
 
</style>

</head>
<body>
<jsp:include page="../Main_header.jsp"></jsp:include>

	<div class="listBox">
		
		<div class="listSubjectBox">
			<div class="listSubject">${vo.subject }</div>
		</div>
		
		<div class="listProfile">
			<div class="imgIcon" onclick="member_info('${vo.id}','${vo.gubun }');"><img src="/ZV2Project/img/user_profile2.png"/><!-- <i class="fa-regular fa-circle-user"></i> --></div>
			<div class="nickname" onclick="member_info('${vo.id}','${vo.gubun }');"><span>${vo.nickname }</span></div>
			<div class="Date" onclick="member_info('${vo.id}','${vo.gubun }');"><span>${vo.grade } · <f:parseDate value="${vo.regidate }" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
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
			
			<c:choose>
				<c:when test="${!empty user and vo.like_check eq 1 }">
					<div class="jjimBox jjim" onclick="likeJJim(this,${vo.idx});">
						<div class="jjim_img" id="jjim_img">💘</div>
						<div class="jjim_text">찜하기</div>
					</div>
				</c:when>
				
				<c:otherwise>
					<div class="jjimBox" onclick="likeJJim(this,${vo.idx});">
						<div class="jjim_img" id="jjim_img">🤍</div>
						<div class="jjim_text">찜하기</div>
					</div>
				</c:otherwise>
			
			
			</c:choose>
			
			
		
		</div><!-- listProfile -->
		
		<div class="listContentBox">
			
			<div class="listContent">
				<pre>${vo.content }</pre>
			</div>
		
		</div><!-- listContentBox -->
		
		<div class="listaddReply">
			
				
				<div class="AddReplyBox">
					
						<c:if test="${ empty user }">
							<p class="AddReplyAlert"><i class="fa-solid fa-comment-dots"></i></p>
							
							<label class="reply-open-input">
									<input type="button" name="reply_open_button" value="로그인 하셔야 작성하실 수 있습니다."
							   		class="login_write" onclick="loginView();">
									<span>로그인 하셔야 작성하실 수 있습니다.</span>
							</label>
						</c:if>
						
						<c:if test="${ !empty user }">
							<form>
								<p class="AddReplyAlert"><i class="fa-solid fa-comment-dots"></i></p>
								<label class="reply-open-input">
									<input type="button" name="reply_open_button" value="클릭하시면 댓글 작성창이 열립니다"
							   		class="reply_open" onclick="show_summer(this.form);">
									<span>클릭하시면 댓글 작성 창이 열립니다</span>
								</label>
								
								<div id="showBox" data-name="쇼박스">
								
									<textarea class="summernote" name="content" id="content_jisik${vo.idx }"></textarea>
									<div class="AddReplyButton">
										<input type="button"  value="댓글추가" class="reply" onclick="reply(${vo.idx});">
										<input type="button"  value="댓글창접기" class="replyend" onclick="show_summer(this.form);">
									</div>
								</div>
								
							</form>
						</c:if>
					
				</div>
			
		</div>
	
	</div><!-- view 원본글 -->
	
<!-- ----------------------------------------------------------------------------------------------------- -->
	
	<div class="replyBox">
		
		<div class="replyInfoBox">
			<div class="replyInfo"><!-- 댓글 --> &nbsp; 댓글<span> (${vo.reply_info })</span></div>
		</div>
		<c:if test="${ vo.reply_info eq 0}">
			<div class="noreplyBox">
				<div class="noreply_content">
					<div class="noreply_img"><i class="fa-solid fa-comment-dots"></i></div>
					<div class="noreply_text">아직 댓글이 없습니다.</div>
					
				</div>
			
			</div>
		</c:if>
		
		<c:if test="${ vo.reply_info gt 0}">
		<c:forEach var="list" items="${list }">
			<div class="replyBox_for_content">
				<div class="replyProfile">
					<c:if test="${list.reOrderLength ge 2 }">
						<div class="imgIcon" onclick="member_info('${list.id}','${list.gubun }');"><img src="/ZV2Project/img/user_profile4.png"/><!-- <i class="fa-regular fa-circle-user"></i> --></div>
					</c:if>
					
					<c:if test="${list.reOrderLength eq 1 }">
						<div class="imgIcon" onclick="member_info('${list.id}','${list.gubun }');"><img src="/ZV2Project/img/user_profile.png"/><!-- <i class="fa-regular fa-circle-user"></i> --></div>
					</c:if>
					<div class="nickname" onclick="member_info('${list.id}','${list.gubun }');"><span>${list.nickname }</span></div>
					<div class="Date" onclick="member_info('${list.id}','${list.gubun }');"><span>${list.grade } · <f:parseDate value="${list.regidate }" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
					<f:formatDate value="${dateValue }" pattern="YYYY-MM-dd"/></span></div>
					
					<c:if test="${ (!empty user) and (user.id eq list.id) and (list.replynum eq 0) }">
					<!-- 댓글 수정 -->
						<div class="editBox" onclick="open_edit_reply(this);" >
							<div class="edit_img"><img src="/ZV2Project/img/edit.png"/></div>
							<div class="edit_text">수정</div>
						</div>
						
						
						<!-- 댓글 삭제 -->
						<div class="deleteBox" onclick="delete_reply(${list.reply_idx});">
							<div class="delete_img"><img src="/ZV2Project/img/delete.png"/></div>
							<div class="delete_text">삭제</div>
						</div>
					</c:if>
					
				</div>
				
				<c:if test="${list.reOrderLength ge 2 }">
				<div class="replyContentBox reply" id="contentBox${list.reply_idx }">
					<div class="replyContent" id="replyContent${list.reply_idx }">
						
						<p class="baseNickname">┖ ${list.baseNickname } 님의 대댓글</p>
						
						<pre id="content${list.reply_idx }">${list.content }</pre>
						
					</div><!-- replyContent -->
					
					<div class="show_replyEditBox" id="editBox${list.reply_idx }" data-name="댓글수정">
						
							<textarea class="summernote" name="edit_reply_content${list.reply_idx }" id="edit_reply_content${list.reply_idx }" >${list.content }</textarea>
							<div class="AddReplyButton">
								<input type="button"  value="댓글수정" class="reply_edit_button"
								       onclick="edit_reply(${list.reply_idx},${list.reOrderLength});">
								<input type="button"  value="수정취소" class="reply_edit_hide"
								       onclick="reply_edit_hidden(this,${list.reOrderLength});">
							</div>
							
					</div><!-- show_replyEditBox -->
					
					
				</div>
				</c:if>
				
				
				<c:if test="${list.reOrderLength eq 1 }">
				<div class="replyContentBox" id="contentBox${list.reply_idx }">
					<div class="replyContent" id="replyContent${list.reply_idx }">
						
						
						
						<pre id="content${list.reply_idx }">${list.content }</pre>
						
					</div><!-- replyContent -->
					
					<div class="show_replyEditBox" id="editBox${list.reply_idx }" data-name="댓글수정">
						
							<textarea class="summernote" name="content" id="edit_reply_content${list.reply_idx }">${list.content }</textarea>
							<div class="AddReplyButton">
								<input type="button"  value="댓글수정" class="reply_edit_button"
								       onclick="edit_reply(${list.reply_idx});">
								<input type="button"  value="수정취소" class="reply_edit_hide"
								       onclick="reply_edit_hidden(this,${list.reOrderLength});">
							</div>
							
					</div><!-- show_replyEditBox -->
					
					
				</div>
				</c:if>
				
				<c:choose>
				
					<c:when test="${!empty user and list.reply_like_check eq 1 }">
						<div class="replyLikeBox">
							<div class="replyLike like" onclick="like_reply(this, ${list.reply_idx},'${list.id }');">
								<span id="likeHeart${list.reply_idx }">❤️</span> <span id="likehit${list.reply_idx }">${list.likehit }</span>
							</div>
						</div>
					</c:when>
					
					<c:otherwise>
						<div class="replyLikeBox">
							<div class="replyLike" onclick="like_reply(this, ${list.reply_idx},'${list.id }');">
								<span id="likeHeart${list.reply_idx }">🤍</span> <span id="likehit${list.reply_idx }">${list.likehit }</span>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
					
				<div class="reply_forHiddenBox">
					<form>
						<label class="reply-open-hidden">
							<input type="button" name="reply_open_hidden" onclick="hidden_open(this.form);">
							<span><i class="fa-solid fa-comment-dots"></i> <span id="replyWriteText">대댓글쓰기</span></span>
						</label>
					</form>
				</div>
				
				
				
				<div class="ReplyAddReply">
				<form>
					<label class="reply-close-hidden">
						<input type="button" name="reply_close_hidden" onclick="hidden_close(this.form);">
						<span><i class="fa-solid fa-comment-dots"></i></span>
					</label>
				</form>
				
				<c:if test="${ empty user }">
					
					
					<label class="reply-open-input">
							<input type="button" name="reply_login_button" value="로그인 하셔야 작성하실 수 있습니다."
					   		class="login_write" onclick="loginView();">
							<span>로그인 하셔야 작성하실 수 있습니다.</span>
					</label>
				</c:if>
								
				<c:if test="${ !empty user }">
					<form>
						<label class="reply-open-input">
							<input type="button" name="reply_open_button" value="클릭하시면 댓글 작성창이 열립니다"
					   		class="reply_open" onclick="show_summer(this.form);">
							<span>클릭하시면 댓글 작성 창이 열립니다</span>
						</label>
						
						<div id="showBox" data-name="쇼박스">
						
							<textarea class="summernote" name="content" id="reReply${list.reply_idx }"></textarea>
							<input type="hidden" value="${list.reply_idx }" name="reply_idx">
							<div class="AddReplyButton">
								<input type="button"  value="댓글추가" class="reply" onclick="reReply(${list.reply_idx});">
								<input type="button"  value="댓글창접기" class="replyend"
								       onclick="show_summer(this.form);">
							</div>
						</div>
						
					</form>
				</c:if>
				</div><!-- ReplyAddReply -->
			</div><!-- replyBox_for_content -->
		</c:forEach>
		</c:if>
	</div><!-- view 댓글 -->

	
	
	
	
	
	


<script>

	var path = window.location.pathname;
	var page = path.split("/").pop();
	var param = window.location.search;
	var real_path = path + param;
	

	$('.summernote').summernote({
		tabsize : 2,
		minHeight: 175,
		width: 625,
		placeholder:"글 작성시 글씨 크기를 키우셔야 화면에 잘 보입니다"+
		"<br><br>댓글이 달리면 수정 또는 삭제가 불가능합니다"
	});

	
	function reply(idx){
		"use strict";
		
		var p_idx = idx;
		var content_id = 'content_jisik' +p_idx;
		
		var content = document.getElementById(content_id).value;
		var fdata = new FormData();
		
		fdata.append("content", encodeURIComponent(content));
		fdata.append("idx",p_idx);
		
		$.ajax({
			
			url : "./reply.do",
			data : fdata,
			method : "POST",
			
			enctype : "multipart/form-data; charset=utf-8",
			processData : false,
			contentType : false,
			cache : false,
			async : false,
			
			success : function success(data){
				
				location.href="view.do?idx="+p_idx;
			}
			
		});
		
		
	}
	
	function loginView(){
		
		
		
		location.href = "../Login.jsp?path=" + real_path;
		
	}
	
	function show_summer(f){
		const summer = f.content;
		const replyOpenButton = f.reply_open_button;
		const replyButtonSpan = replyOpenButton.nextSibling.nextSibling;
		
		
		const show = summer.parentElement;
		show.classList.toggle('show');
		
		if( show.classList.contains('show') ){
			
			$(replyButtonSpan).text('클릭하시면 댓글 작성 창이 닫힙니다');
			
		}else if(!show.classList.contains('show')){
			
			$(replyButtonSpan).text('클릭하시면 댓글 작성 창이 열립니다');
			
		} 
	}
	
	function reReply(reply_idx){
		"use strict";
		
		var p_reply_idx = reply_idx;
		var content_id = 'reReply'+p_reply_idx;
		var content = document.getElementById(content_id).value;
	
		var p_idx = ${vo.idx};
		
		var fdata = new FormData();
		fdata.append("content",encodeURIComponent(content));
		fdata.append("idx",p_idx);
		fdata.append("reply_idx",p_reply_idx);
		
		
		$.ajax({
			
			url : "./reReply.do",
			data : fdata,
			method : "POST",
			
			enctype : "multipart/form-data; charset=utf-8",
			processData : false,
			contentType : false,
			cache : false,
			async : false,
			
			success : function success(data){
				
				location.href="view.do?idx="+p_idx;
			}
			
		});
		
	}
	
	function hidden_open(f){
		
		var start_open_button = f.reply_open_hidden;
		
		//reply_forHiddenBox
		var hidden_div = start_open_button.parentElement.parentElement.parentElement;
		hidden_div.style.display = "none";
		
		//ReplyAddReply
		var open_div = hidden_div.nextSibling.nextSibling;
		open_div.style.display="block";
	}
	
	function hidden_close(f){
		
		var start_close_button = f.reply_close_hidden;
		
		//ReplyAddReply
		var start_hidden_div = start_close_button.parentElement.parentElement.parentElement;
		start_hidden_div.style.display = "none";
		
		//reply_forHiddenBox
		var last_hidden_div = start_hidden_div.previousSibling.previousSibling;
		last_hidden_div.style.display = "inline-block";
		
	}
	
	
	//원본글 수정
	function edit_content(idx){
		var p_idx = idx;
		
		location.href = "jisik_edit_form.do?idx="+p_idx+ "&path="+real_path;
		
	}
	
	//원본글 삭제
	 function delete_content(idx){
		
		var p_idx = idx;
		
		if( !confirm("정말로 삭제하시겠습니까?") ){
			return;
		}
		alert(p_idx);
		var url = "jisik_del.do";
		var param = "idx="+p_idx;
		
		sendRequest( url, param, delResult, "post" );
		
	}
	
	function delResult(){
		if( xhr.readyState == 4 && xhr.status == 200 ){
			var data = xhr.responseText;
			var json = eval(data);
			
			if( json[0].result == 'yes' ){
				alert("삭제 성공");
				location.href = "jisik_list.do";
			}else{
				alert("삭제 실패");
			}
			
		}
		
	}
	
	
	
	
	
	
	
	function open_edit_reply(editbox){
		
		var reply_content_box = editbox.parentElement.nextSibling.nextSibling;
		
		
		
		reply_content_box.style.padding="20px 0";
		
		var reply_content = editbox.parentElement.nextSibling.nextSibling.firstChild.nextSibling;
		
		reply_content.style.display="none";
		
		var edit_box = reply_content.nextSibling.nextSibling.nextSibling;
		
		
		edit_box.style.display="block";
		
		
	}
	
	//edixbox숨기기
	function reply_edit_hidden(hide_button,reorder_length){
		
		var edit_box = hide_button.parentElement.parentElement;
		
		var reply_content = edit_box.previousSibling.previousSibling.previousSibling;
		
		var reply_content_box = reply_content.parentElement;
		
		edit_box.style.display = "none";
		reply_content.style.display="block";
		
		
		if( reorder_length >= 2 ){
			reply_content_box.style.padding="25px 25px 0 70px";
			
		}else{
			
			reply_content_box.style.padding="25px 25px 0";
		}
		
	}
	

	//댓글 수정
	function edit_reply(idx,reorder){
		"use strict";
		var p_idx = idx;
		var edit_content_id = 'edit_reply_content' + p_idx;
		var edit_content = document.getElementById(edit_content_id).value;
		var fdata = new FormData();
		fdata.append("content",encodeURIComponent(edit_content));
		fdata.append("reply_idx",p_idx);
		
		var content_id = 'content' + p_idx;
		var edit_box_id = 'editbox'+p_idx;
		var content_box_id = 'contentBox' + p_idx;
		
		
		$.ajax({
			
			url : "./reply_edit.do",
			data : fdata,
			method : "POST",
			
			enctype : "multipart/form-data; charset=utf-8",
			processData : false,
			contentType : false,
			cache : false,
			async : false,
			
			success : function success(data){
				document.getElementById("editBox"+p_idx).style.display="none";
				document.getElementById("replyContent"+p_idx).style.display="block";
				if( reorder >= 2 ){
					
					document.getElementById("contentBox"+p_idx).style.padding="25px 25px 0 70px";

				}else{
					
					document.getElementById("contentBox"+p_idx).style.padding="25px 25px 0";
				}
				
				document.getElementById('content'+p_idx).innerHTML = edit_content;
			
			}
			
		});
		
		
	}
	
	
	
	//댓글 삭제
	 function delete_reply(idx){
		
		var p_idx = idx;
		
		if( !confirm("정말로 삭제하시겠습니까?") ){
			return;
		}
		
		var url = "reply_del.do";
		var param = "reply_idx="+p_idx;
		
		sendRequest( url, param, delReply_Result, "post" );
		
	}
	
	function delReply_Result(){
		if( xhr.readyState == 4 && xhr.status == 200 ){
			
			var data = xhr.responseText;
			var json = eval(data);
			
			if( json[0].result == 'yes' ){
				alert("삭제 성공");
				location.href = real_path;
			}else{
				alert("삭제 실패");
			}
			
		}
		
	}
	
	
	
	
	function likeJJim(jjim, idx){
		
		jjim.classList.toggle("jjim");
		var p_idx = idx;
		
		if( '${user.id}' == '' ){
			alert('로그인 후에 클릭하세요');
			return;
		}
		
		
		
		
		var jjim_heart = document.getElementById("jjim_img");
	 
		if( jjim.classList.contains("jjim") ){
			
			jjim_heart.innerHTML = "💘";
			
			jjim_insert(p_idx);
			
		}else{
			
			jjim_heart.innerHTML = "🤍";
			
			jjim_delete(p_idx);
		}
		
	}
	
	
	function jjim_insert(idx){
		
		var p_idx = idx;
		var url = "jjim_insert.do";
		var param = "idx="+p_idx;
		
		sendRequest(url, param, jjim_insert_Result,"post");
		
	}
	
	function jjim_insert_Result(){
		
		if( xhr.readyState == 4 && xhr.status == 200){
			
			var data = xhr.responseText;
			var json = eval(data);
			
			alert('찜 등록');
		
			
		}
	}
	
	function jjim_delete(idx){
		
		var p_idx = idx;
		var url = "jjim_delete.do";
		var param = "idx="+p_idx;
		
		sendRequest(url, param, jjim_del_Result, "post");
		
	}
	
	function jjim_del_Result(){
		
		if( xhr.readyState == 4 && xhr.status == 200){
			
			var data = xhr.responseText;
			var json = eval(data);
			
			alert('찜 해제');
			
		}
	}
	
	function like_reply( reply_like_box, idx,id){
		
		var p_idx = idx;
		
		if( '${user.id}' == '' ){
			alert('로그인 후에 클릭하세요');
			return;
		}
		
		if( reply_like_box.classList.contains('like') ){
			alert('이미 좋아요를 눌렀습니다');
			return;
		}
		
		reply_like_box.classList.add('like');
		
		var likeheart_id = 'likeHeart' + p_idx;
		var likehit_id = 'likehit' + p_idx;
		
		var likeheart = document.getElementById(likeheart_id);
		var likehit = document.getElementById(likehit_id);
		
		likeheart.innerHTML = '❤️';
		
		var url = "reply_like.do";
		var param = "idx="+p_idx+"&id="+id;
		
		sendRequest( url, param, reply_like_Res, "post" );
		
	}
	
	function reply_like_Res(){
		
		if( xhr.readyState == 4 && xhr.status == 200 ){
			var data = xhr.responseText;
			var json = eval(data);
			var update_likehit = json[0].likehit;
			var p_idx = json[1].idx;
			var likehit_id = 'likehit' + p_idx;
		 	var likehit = document.getElementById(likehit_id); 
			likehit.innerHTML = update_likehit;
			
		}
	}
	
	function member_info(id, gubun){
		
		var p_id = id;
		var p_gubun = gubun;
		
		if( p_gubun == '학생'){
			
			location.href="../search/StudentInfo.do?s_id="+p_id;
			
		}else if( p_gubun == '선생님' ){
			
			location.href="../search/TeacherInfo.do?t_id="+p_id;
		}
		
	}
	
</script>
</body>
</html>