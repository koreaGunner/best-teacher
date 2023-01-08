<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최강선생 | 1:1대화</title>
</head>

<script src="../js/httpRequest.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#message_field").scrollTop($(window).height());
		var your_gubun = "${msg_content_list[0].gubun}";
		
	});
	
</script>

<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
		* {
			font-family: 'Noto Sans KR', sans-serif;
			margin:0;
			padding:0;
		}
	*:focus{
		outline:0;
	}
	html {
		min-height:100%;
		height:auto;
	}
	
	body {
		margin:0;
		padding:0;
		font-family: sans-serif;
		background: white;
	}
	
	/* 가장 큰 틀 */
	.div_all_list {
		position: absolute;
		top: 20%;
		left: 51%;
		width: 800px;
		padding: 20px 40px;
		transform: translateX(-50%);
		background: white;
		box-sizing: border-box;
		border-radius: 10px;
		min-height:200px;
		height:auto;
	}
	
	/* 대화창 최상단 상대방 정보 div */
	.message_top{
		position:relative;
		width:60px;
		height:90px;
		float:left;
	}
	
	#info_addr{width:400px;
				overflow: hidden; 
				text-overflow: ellipsis;
				display: -webkit-box;
				-webkit-line-clamp: 1; /* 라인수 */
				-webkit-box-orient: vertical;
				word-wrap:break-word;
				}
	
	#info_subject{width:400px;
				overflow: hidden; 
				text-overflow: ellipsis;
				display: -webkit-box;
				-webkit-line-clamp: 1; /* 라인수 */
				-webkit-box-orient: vertical;
				word-wrap:break-word;
				}
	
	.message_top > .back_button {
		position:absolute;
		top:34%;
		left:30%;
		cursor:pointer;
	}
	
	/* 대화 목록에 보일 상대방 프로필 사진 틀*/
	.profile_photo_div{
		position:relative;
		float:left;
		width:90px;
		height:90px;
	}
	
	.photo_box {
		position:absolute;
		top:15px;
		left:15px;
		width: 60px;
		height: 60px;
		border-radius:70%;
		overflow: hidden;
		float:left;
	   	justify-content: center;
	   	border:0;
	   	z-index:1;
	}
	
	.photo_box .profile {
		position:absolute;
		top:50%;
		left:50%;
		transform:translate(-50%,-50%);
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	
	/* 메시지 주고받는 상대방의 정보 넣는 div*/
	.message_user_info{
		position:relative;
		float:left;
		width:500px;
		height:80px;
		padding: 5px 20px;
	}
	
	.teacher_info_btn {
		width:357px;
		height:40px;
		font-size:14px;
		border:0;
		cursor:pointer;
	}
	
	
	/* 메시지 창 안에 공지사항 칸*/
	.message_notice{
		height:40px;
		border-bottom:1px solid #E3DAE3;
		padding:5px 30px;
		font-size:13px;
	}
	
	/* 메시지 주고받는 창*/
	#message_field{
		height:420px;
		overflow:auto;
		overflow-y : scroll;
		border-bottom: 1px solid #E3DAE3;
	}
	
	/* 주고받는 메시지 말풍선*/
	.msg_receive_none 	{position:relative; float:left; margin: 10px 0 10px 30px; width:360px; min-height:20px; height:auto;}
	.msg_receive_box 	{position:relative; float:left; margin: 0 0 10px 30px; padding: 10px 20px; width:auto; min-height:30px; height:auto; color: #FFF; border-radius: 10px; background-color: #F2F2F2;}
	.msg_receive_box:after {content:""; position: absolute; top: 21px; left: -30px; border-right: 30px solid #F2F2F2; border-top: 10px solid transparent; border-bottom: 10px solid transparent;}
	.msg_receive_box > .msg_receive_content {text-align:left; font-size:15px; width:auto; font-weight:300; color:black; white-space: pre-wrap; line-height:25px; word-break: break-all;}
	
	.msg_send_none 		{position:relative; float:right; margin: 10px 30px 10px 180px; width:360px; min-height:20px; height:auto;}
	.msg_send_box 		{position:relative; float:right; margin: 0 30px 10px 0; padding: 10px 20px; width:auto; min-height:30px; height:auto; color: #FFF; border-radius: 10px; background-color: #E3E2C9;}
	.msg_send_box:after {content:""; position: absolute; top: 21px; right: -30px; border-left: 30px solid #E3E2C9; border-top: 10px solid transparent; border-bottom: 10px solid transparent;}
	.msg_send_box > .msg_send_content {text-align:left; font-size:15px; width:auto; font-weight:300; color:black; white-space: pre-wrap; line-height:25px; word-break: break-all;}
	
	
	/* 메시지 입력 란 div*/
	.message_send_field{
		height:48px;
		padding:3px 1px;
	}
	
	/* 메시지 작성하는 칸 */
	.message_send_area {
		resize: none;
		height:26px;
		width:580px;
		font-size:17px;
		border:none;
		padding:12px 20px;
	}
	.message_send_area::placeholder{
		color:#E4E4E4;
	}
	
	
	/* 메시지 전송 버튼*/
	.send_button {
		width:88px;
		margin-left:5px;
		height:50px;
		font-size:20px;
		background:#94D8F6;
		border:0;
		border-radius:10px;
		cursor:pointer;
		color:white;
	}
	
	.send_button:hover {
		color:black;
	}
</style>


<body onload="getMessages();">
<jsp:include page="../Main_header.jsp"></jsp:include>

<div class="div_all_list"> <!-- 음영이 들어간 가장 큰 틀 -->
	<div style="height:660px; border:1px solid #E3DAE3;">	<!-- 메시지를 주고받을 틀 -->
		<div style="height:90px; border-bottom:1px solid #E3DAE3;"> <!-- 대화창 최상단 상대방 정보 div -->
			<!-- 대화창 최상단 뒤로가기 버튼 -->
			<div class="message_top">
				<img id="back_button" class="back_button" src="../img/message_back_button.png" onclick="back_to_list();"/>
			</div>
			<div class="profile_photo_div"> <!-- 상대방 프로필 사진 넣는 공간 -->
					<div class="photo_box">	<!-- 상대방 프로필 사진 동그라미 -->
				      	<img id="preview" class="profile" src="../img/account.png"/>
					</div>
			</div>
			<div class="message_user_info"> <!-- 상대방 프로필 정보 넣는 공간 -->
				<div style="margin:2px 2px 2px 0; font-size:17px; font-weight:500;"><p>${msg_list.nickname}</p></div>
				<div id="info_addr" style="margin:2px 2px 2px 0; color:grey;"><p>${msg_list.addr}</p></div>
				<div id="info_subject" style="margin:2px 2px 2px 0; color:grey;"><p>${msg_list.subject}</p></div>
			</div>
		</div><!-- ----------------------------------------------------------------------- -->
		<div style="height:40px; border-bottom:1px solid #E3DAE3;"> <!-- 버튼 2개 넣는 공간 -->
			<input type="button" id="teacher_info_btn" class="teacher_info_btn" style="background:#FFFCCC;" onclick="user_info();" value="🙂 상대방 정보보기">
			
			<c:if test="${msg_list.gubun eq '학생'}">
			<input type="button" id="teacher_info_btn" class="teacher_info_btn" style="background:#FBCFD0;" onclick="review_req();" value="🙏 평가 요청">
			</c:if>
			<c:if test="${msg_list.gubun eq '선생님'}">
			<input type="button" id="teacher_info_btn" class="teacher_info_btn" style="background:#FBCFD0;" onclick="review_write();" value="👍 평가 하기">
			</c:if>
			
		</div><!-- ----------------------------------------------------------------------- -->
		<div class="message_notice">
			1:1대화를 통해 간단한 미팅날짜를 잡으시고,<br>실제 과외 판단은 직접만남을 통해 확인하시는것이 좋습니다.
		</div>
		<div class="message_field" id="message_field"> <!-- 메시지 주고받은 본문 div -->
			<c:forEach var="vo" items="${ msg_content_list }">
				<c:if test="${vo.send_id ne user.id}">
					<div class="msg_receive_none">
						<div class="msg_receive_box" id="msg_receive_box"><!-- 받은 메시지 -->
							<pre class="msg_receive_content" id="msg_receive_content">${vo.content}</pre>
						</div>
					</div>
				</c:if>
				
				
				<c:if test="${vo.send_id eq user.id}">
					<div class="msg_send_none">
						<div class="msg_send_box" id="msg_send_box"><!-- 보낸 메시지 -->
							<pre class="msg_send_content" id="msg_send_content">${vo.content}</pre>
						</div>
					</div>
				</c:if>
			</c:forEach>
			
		<div id="new_message_div">	<!-- 여기서 부터 new 메시지 이다. -->
		</div>
			
		</div><!-- ----------------------------------------------------------------------- -->
	
		<div class="message_send_field"> <!-- 메시지 전송 창 div -->
			<div style="float:left;"> <!-- 메시지 입력란 -->
				<p><textarea cols="40" id="message_write_box" name="message_write_box" rows="1" autofocus class="message_send_area" placeholder="메시지를 입력하세요. (Enter : 줄바꿈, Ctrl + Enter : 전송)"></textarea></p>
			</div>
			<div style="float:left;"> <!-- 메시지 전송버튼 -->
				<input type="button" class="send_button" value="전송" onclick="postMessage();">
			</div>
		</div><!-- ----------------------------------------------------------------------- -->
	</div> <!-- 메시지를 주고받을 틀 -->
</div>


<script>
	var send_id = "${user.id}";
	var talk_seq = "${msg_content_list[0].talk_seq}";
	console.log("제일 첨 찍는 시퀀스넘버 : " + talk_seq);
	var pressed_keys = [];
	
	window.addEventListener("keydown", keysPressed, false);
	window.addEventListener("keyup", keysReleased, false);

	
	function back_to_list(){
		var login_id = "${user.id}";
		location.href="dialogue_list.do?id=" + login_id;	
	}

	function keysPressed(e) {
		pressed_keys[e.keyCode] = true;
		
		if (pressed_keys[17] && pressed_keys[13]) {
			postMessage();
		}
	}

	function keysReleased(e) {
		pressed_keys[e.keyCode] = false;
	}
	
//후기 남길수 있는 권한주기 ===================================================================================
	function review_req(){
		var review_req = confirm("해당 학생이 평가를 작성할 수 있도록 할까요?");
		
		if(review_req == true){
			var student_id = "${msg_content_list[0].your_id}";
			var teacher_id = "${msg_content_list[0].teacher_id}";
			var url = "preview_req.do";
			var param = "teacher_id=" + teacher_id + "&student_id=" + student_id + "&req_res=0";
			
			sendRequest( url, param, reqResult, "get");
		} else{
			return;
		}
	}
	
	function reqResult(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			var json = eval(data);
			
			if (json[0].result == 'already'){
				alert("이미 해당 학생은 선생님의 후기를 남길 수 있습니다.");
				return;
			}
			else {
				alert("지금부터 해당 학생은 선생님의 후기를 남길 수 있습니다!");
				return;
			}
		}
	}

//-----------------------------------------------------------------------------
	function review_write(){
		
			var teacher_id = "${msg_content_list[0].your_id}";
			var student_id = "${msg_content_list[0].student_id}";
			var url = "preview_req.do";
			var param = "teacher_id=" + teacher_id + "&student_id=" + student_id + "&req_res=1";
			
			sendRequest( url, param, review_res, "get");
		
	}
	
	function review_res(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			var json = eval(data);
			alert(json[0].result);
			if (json[0].result == 'fail'){
				alert("아직 선생님의 후기를 작성할 수 없어요ㅠㅠ");
				return;
			}else if(json[0].result == 'already'){
				
				if( !confirm("이미 후기를 작성하셨습니다.\n후기를 확인하시겠습니까?") ){
					return;
				}
				
				var t_id = "${msg_content_list[0].teacher_id}";
				location.href="../search/TeacherInfo.do?t_id=" + t_id + "&review_auth=0"; //파라미터 review_auth인 사람만 후기가 남는다.
				
			} else {
				if(!confirm("해당 선생님의 후기를 남기시겠어요?")){
					return;
				}
				var t_id = "${msg_content_list[0].teacher_id}";
				location.href="../search/TeacherInfo.do?t_id=" + t_id + "&review_auth=0"; //파라미터 review_auth인 사람만 후기가 남는다.
			}
		}
	}
	

//======================================================================================================
	
//상대방 정보보기===========================================================================================	
	function user_info(){
		var your_gubun = "${msg_list.gubun}";
		alert(your_gubun);
		
		if(your_gubun == "학생"){
			var s_id = "${msg_list.student_id}";
			location.href="../search/StudentInfo.do?s_id=" + s_id;
		}else if (your_gubun == "선생님"){
			var t_id = "${msg_list.teacher_id}";
			location.href="../search/TeacherInfo.do?t_id=" + t_id;
		}
	
	}
//======================================================================================================	
	const log = document.getElementById("message_field");
	
	log.isScrollBottom = true;
	
	log.addEventListener("scroll", (event) => {
	  if (event.target.scrollHeight - event.target.scrollTop === event.target.clientHeight) {
	    log.isScrollBottom = true;
	  } else {
	    log.isScrollBottom = false;
	  }
	});
	
	
	function postMessage() {
	    var xmlhttp = new XMLHttpRequest();
	    xmlhttp.open("POST", "msg?t="+new Date(), false);
	    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    var messageText = document.getElementById("message_write_box").value;
	    
	    console.log(messageText);
	    
	    if(messageText.trim() != ''){
		    talk_seq = "${msg_list.talk_seq}";
		    send_id = "${user.id}";
		    
		    document.getElementById("message_write_box").value = "";
		    xmlhttp.send("send_id="+ send_id +"&talk_seq="+ talk_seq + "&message="+encodeURIComponent(messageText));	
	    }
	}
	
	
	var messagesWaiting = false;
	
	function getMessages(){
		 if(!messagesWaiting){
	        messagesWaiting = true;
	        var xmlhttp = new XMLHttpRequest();
	        xmlhttp.onreadystatechange= function(){
	            if (xmlhttp.readyState==4 && xmlhttp.status==200) {
	                messagesWaiting = false;
					var msg_content = xmlhttp.responseText;					var total_content = msg_content.split('%');
					
					talk_seq = "${msg_content_list[0].talk_seq}";
				    send_id = "${user.id}";
		               
					if(send_id == total_content[0])
						$("#new_message_div").append("<div class='msg_send_none'><div class='msg_send_box' id='msg_send_box'><pre class='msg_send_content' id='msg_send_content'>" + total_content[1] + "</pre></div></div>");
					
					else {
						$("#new_message_div").append("<div class='msg_receive_none'><div class='msg_receive_box' id='msg_receive_box'><pre class='msg_receive_content' id='msg_receive_content'>" + total_content[1] + "</pre></div></div>");
					
						var read_change_url = "msg_read.do";
						var param = "talk_seq=" + talk_seq + "&login_id=" + send_id;
						console.log(param);
						sendRequest( read_change_url, param, read_result, "get");
						
						function read_result(){
							return;
						}
					}
			        
					if (log.isScrollBottom) {
			            log.scrollTop = log.scrollHeight;
			        }
	            }
	        }
	        xmlhttp.open("GET", "msg?t="+new Date(), true);
	        xmlhttp.send();
	        
	    }
	}
	setInterval(getMessages, 1000);
	
</script>


</body>
</html>