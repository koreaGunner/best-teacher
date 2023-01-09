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
	
	$(document).ready(function(){
	    // 라디오버튼 클릭시 이벤트 발생
	    $("input:radio[name='show_message_menu']").click(function(){
	        if($("input[name='show_message_menu']:checked").val() == "all_list"){
	        	document.getElementById('message_whole_div').classList.remove('hidden');
				document.getElementById('message_wish_div').classList.add('hidden');
	        	
	        }else if($("input[name='show_message_menu']:checked").val() == "wish_list"){
				document.getElementById('message_wish_div').classList.remove('hidden');
	        	document.getElementById('message_whole_div').classList.add('hidden');
	        	
	        }
	    });
	});

	
	
</script>

<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
		* {
			font-family: 'Noto Sans KR', sans-serif;
			margin:0;
			padding:0;
		}
	
	html {
		min-height:100%;
		height:auto;
		padding-bottom:200px;
	}
	
	body {
		margin:0;
		padding:0;
		font-family: sans-serif;
		background: white;
		
	}
	
	/* 최상위 새로고침 버튼 위치 */
	.div_refresh{
		position: absolute;
		top:23%;
		left:63%;
	}
	
	.div_refresh > .refresh_button{
		font-size:20px;
		cursor:pointer;
		border:0;
		background:none;
	}
	
	.border{
		border:1px solid red;
	}
	/* 가장 큰 틀 */
	.div_all_list {
		position: absolute;
		top: 27%;
		left: 50%;
		width: 800px;
		padding: 10px 40px;
		transform: translateX(-50%);
		background: none;
		box-sizing: border-box;
		border-radius: 10px;
		min-height:200px;
		height:auto;
	}
	
	/* 음영이 들어간 틀 안에 버튼을 포함하여 메시지 전체를 담을 틀*/
	.div_all_messagebox {
		width:712px;
		border:1px solid #E0E0E0;
		border-top:0;
		height:auto;
		min-height:100px;
	}
	
	/* 버튼을 제외한 전체 리스트가 담길 전체 div. 메시지 수에 따라 높이가 증가함. */
	.message_whole_div {
		min-height:100px;
		height:auto;
		width:712px;
	}
	
	/* 버튼을 제외한 찜 리스트가 담길 전체 div. 메시지 수에 따라 높이가 증가함. */
	.message_wish_div {
		min-height:100px;
		height:auto;
		width:712px;
	}
	
	.hidden {display:none;}
	
	
	/* 상단 메시지/찜한 메시지 버튼 */
	.message_list_radio input[type="radio"]{
		 	display:none;
	}
	.message_list_radio input[type="radio"]+span {
			display: inline-block;
			width: 356px;
			background: #E0E0E0;
			color: #808080;
			text-align: center;
			height: 50px;
			font-size: 17px; 
			font-weight: 300;
			cursor: pointer;
			line-height: 50px;
	}
	.message_list_radio input[type="radio"]:checked+span {
			color:black;
			border-top:3px solid #D5B6D5;
			border-bottom:0;
			background:none;
			font-weight:600;
	}
	
	/* 메시지 1개당 차지할 공간. 메시지 마다 반복될 것임.*/
	.message_hangmok {
		width:711px;
		height:150px;
		border-bottom: 1px solid #E3DAE3;
		cursor:pointer;
	}
	.message_hangmok:hover {
		background: #FFFEEB;
	}
	
	
	
	
	/* 상대방의 프로필 사진이 들어갈 div 공간 */
	.profile_div{
		position:absolute;
		float:left;
		width:150px;
		height:150px;
	}


	/* 대화 목록에 보일 상대방 프로필 사진 틀*/
	.photo_box {
			position:absolute;
			margin:35px;
			width: 80px;
		    height: 80px;
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
		
	/* 메시지 목록에 뜰 상대방의 뱃지 */
	.list_badge{
		border:0;
		padding:1px 10px;
		border-radius:50%;
		background:#6BD089;
		color:white;
		margin:5px 5px 5px 0;
	}
			
		
	/* 메시지 리스트에 보일 상대방 정보 */
	.message_user_info{
		position:absolute;
		left:191px;
		width:420px;
		height:96px;
		padding: 27px 10px;
	}
	
	
	/* 메시지 목록에 메시지 내용 한줄처리*/
	.message_list_message{
		margin-top:10px;
		font-size:19px;
		overflow: hidden;
       	text-overflow: ellipsis;
       	white-space: nowrap;
       	font-weight:500;
	}
	
	/* 최근 주고받았던 메시지 시간 박스*/
	.lastest_datetime{
		position:absolute;
		float:left;
		left:631px;
		width:118px;
		height:64px;
		padding:43px 0;
		text-align:center;
	}
		
		
</style>


<body>
<jsp:include page="../Main_header.jsp"></jsp:include>
	<div class="div_refresh">
		<input type="button" class="refresh_button" onclick="window.location.reload()" value="새로고침 🔃">
	</div>
	<div class="div_all_list"> <!-- 음영이 들어간 하얀 틀 -->
		<div class="div_all_messagebox"> <!-- 실질적인 메시지와 내용이 담길 틀 -->
			<div style="height:50px;">	<!--  전체메시지/찜한메시지 버튼 div -->
				<div style="float:left; display:inline-block;">
					<label for="all_message" class="message_list_radio">
					<input type="radio" id="all_message" name="show_message_menu" value="all_list" checked><span>전체 메시지</span></label>
				</div>
				<div style="float:left;">
					<label for="like_message" class="message_list_radio">
					<input type="radio" id="like_message" name="show_message_menu" value="wish_list"><span>찜한 선생님의 메시지</span></label>
					
				</div>
			</div>
		
			<!-- 위에는 버튼이었고 아래부터가 버튼 이후 메시지 내용 전체 틀이다.(회색으로 칠해진곳)================================================== -->
			<div class="message_whole_div" id="message_whole_div"> <!-- 메시지 종류 선택버튼 밑부터 전체 div -->
				
<!-- 이곳 부터 표시해 놓은 곳까지 대화 수 1명당 메시지 틀이 반복된다!!=========================================================================== -->			
				<c:forEach var="vo" items="${ content_list }">
					<div class="message_hangmok" onclick="message_info(${vo.talk_seq});">	<!-- 상대방 1명과의 메시지내용을 채울 공간. 이 div가 반복될 것이다. -->
						<div class="profile_div"> <!-- 상대방 프로필 사진 넣는 공간 -->
							<div class="photo_box">	<!-- 상대방 프로필 사진 동그라미 -->
								<c:if test="${ profile == null}">
					        		<img id="preview" class="profile" src="../img/account.png"/>
								</c:if>
								<c:if test="${ profile != null}">
					        		<img id="preview" class="profile" src="../upload/${ vo.profile }"/>
								</c:if>
								
							</div>
						</div><!-- ------------------------------------------------------------------- -->
						<div class="message_user_info"> <!-- 상대방 정보 등이 들어갈 공간. -->
							<div style="margin:5px 2px 2px 0; font-size:18px;">${ vo.nickname }</div>
							<div style="margin:2px 2px 5px 0; color:grey;">${ vo.addr }</div>
							<c:choose>
								<c:when test="${vo.content ne null}">
									<div class="message_list_message">${ vo.content }</div>
								</c:when>
								<c:otherwise>
									<div class="message_list_message">(내용 없음)</div>
								</c:otherwise>
							</c:choose>
							
						</div><!-- ------------------------------------------------------------------- -->
						<div class="lastest_datetime"> <!-- 최근 주고받은 메시지 시간경과 -->
							<p>${ vo.last_send_date }</p>
							<p>${ vo.last_send_time }</p><br>
							<c:if test="${vo.read_info eq 0}">
								<c:if test="${vo.last_send_id ne user.id and vo.last_send_id ne null}">
					        		<p style="font-size:10px; margin-top:-10px;">🔴</p>
					        	</c:if>
							</c:if>
						</div><!-- ------------------------------------------------------------------- -->
					</div>
				</c:forEach>
<!-- 위에 적어놓은 곳 부터 이곳까지 메시지 1개당 틀이다. 위 내용이 반복된다.====================================================================== -->

			</div> <!-- 버튼을 제외한 메시지 전체 내용의 끝. 여기까지는 전체 메시지의 목록이다. message_whole_div-->
			
			
<!-- 여기서 부터는 찜 메시지 리스트이다. 위에 전체 리스트와 똑같다. 전체리스트 버튼이 체크 되어있다면 찜 리스트는 display:none 이 된다. -->			
			<div class="message_wish_div hidden" id="message_wish_div"> <!-- 메시지 종류 선택버튼 밑부터 전체 div -->
				
<!-- 이곳 부터 표시해 놓은 곳까지 대화 수 1명당 메시지 틀이 반복된다!!=========================================================================== -->			
				<c:forEach var="vo_w" items="${ content_wish_list }">
					<div class="message_hangmok" onclick="message_info(${vo_w.talk_seq});">	<!-- 상대방 1명과의 메시지내용을 채울 공간. 이 div가 반복될 것이다. -->
						<div class="profile_div"> <!-- 상대방 프로필 사진 넣는 공간 -->
							<div class="photo_box">	<!-- 상대방 프로필 사진 동그라미 -->
								<c:if test="${ profile == null}">
					        		<img id="preview" class="profile" src="../img/account.png"/>
								</c:if>
								<c:if test="${ profile != null}">
					        		<img id="preview" class="profile" src="../upload/${ vo_w.profile }"/>
								</c:if>
								
							</div>
						</div><!-- ------------------------------------------------------------------- -->
						<div class="message_user_info"> <!-- 상대방 정보 등이 들어갈 공간. -->
							<div style="margin:5px 2px 2px 0; font-size:18px;">${ vo_w.nickname }</div>
							<div style="margin:2px 2px 5px 0; color:grey;">${ vo_w.addr }</div>
							<c:choose>
								<c:when test="${vo_w.content ne null}">
									<div class="message_list_message">${ vo_w.content }</div>
								</c:when>
								<c:otherwise>
									<div class="message_list_message">(내용 없음)</div>
								</c:otherwise>
							</c:choose>
						</div><!-- ------------------------------------------------------------------- -->
						<div class="lastest_datetime"> <!-- 최근 주고받은 메시지 시간경과 -->
							<p>${ vo_w.last_send_date }</p>
							<p>${ vo_w.last_send_time }</p><br>
							<c:if test="${vo_w.read_info eq 0}">
								<c:if test="${vo_w.last_send_id ne user.id and vo_w.last_send_id ne null}}">
					        		<p style="font-size:10px; margin-top:-10px;">🔴</p>
					        	</c:if>
							</c:if>
						</div><!-- ------------------------------------------------------------------- -->
					</div>
				</c:forEach>
<!-- 위에 적어놓은 곳 부터 이곳까지 메시지 1개당 틀이다. 위 내용이 반복된다.====================================================================== -->

		
			</div> <!-- 버튼을 제외한 메시지 전체 내용의 끝. message_whole_div-->
		</div> <!-- 가장 큰 틀 안에 버튼을 포함하여 실질적인 내용이 들어갈 가장 큰 틀임. div_all_messagebox-->
	</div> <!-- 음영이 있는 하얀색 가장 큰 틀 이다. all_list -->
	
	<script>
		function message_info(seq){
			var login_id = "${user.id}";
			location.href="dialogue_room.do?talk_seq=" + seq + "&login_id=" + login_id;
		}
	</script>

</body>
</html>