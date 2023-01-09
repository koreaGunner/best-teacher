<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>최강선생 | 마이페이지</title>
	<script src="../js/httpRequest.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="https://kit.fontawesome.com/bc13bff3f1.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
	
	
		function radio_check1(){
				$('input:radio[name=hope_yn]:input[value="희망"]').prop("checked", true);
				var url = "hope_yn.do";
				var login_id = "${user.id}";
				var hope_result = "희망";
				var param = "id=" + login_id + "&hope=" + hope_result;
				
				sendRequest( url, param, hope_res, "get");
		}
		
		
		function radio_check2(){
				$('input:radio[name=hope_yn]:input[value="희망하지않음"]').prop("checked", true);
				var url = "hope_yn.do";
				var login_id = "${user.id}";
				var hope_result = "희망하지않음";
				var param = "id=" + login_id + "&hope=" + hope_result;
				
				sendRequest( url, param, hope_res, "get");
		}
	
		function hope_res() {
			if(xhr.readyState == 4 && xhr.status == 200){
			}
		}
	
		
		function profile_edit(){
			var login_id = "${user.id}";
			location.href="mypage_edit.do?id=" + login_id;
		}
	
		
		function wish_reference(){
			location.href="../reference/zzimlist.do";
		}
		
		function wish_jisik(){
			location.href="../jisik/jisik_list.do?jjim=jj";
		}
		
		function teacher_info(teacher_id){
			console.log(teacher_id);
			location.href="../search/TeacherInfo.do?t_id=" + teacher_id;
		}
	</script>
	
	
	<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
		* {
			font-family: 'Noto Sans KR', sans-serif;
			margin:0;
			padding:0;
		}
	html{
		height:2400px;
	}
	body {
		  /* margin:0;
		  padding:0; */
		  font-family: sans-serif;
		 	
		 
		 
		}
	/* 본문 전체 틀 (음영들어간 틀) */
	.form {
		position: absolute;
		top: 23%;
		left: 52%;
		width: 1000px;
		padding: 40px;
		transform: translateX(-50%);
		border-radius: 30px;
		min-height:500px;
		height:auto;
	}
		
	
	
	/* 프로필 사진 틀 크기*/
	.photo_box {
		width: 220px;
	    height: 220px; 
	    border-radius: 70%;
	    overflow: hidden;
	    float:left;
	}
	
	.photo_box .profile {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
	
	
	/* 본문내용 틀*/
	.title {
		position: absolute;
		left:62%;
		width:650px;
		transform: translateX(-50%);
		padding: 20px;
		text-align:left;
		border-radius: 10px;
		min-height:150px;
		height:auto;
	}
	
	.form .h2 {
		color: black;
		text-align: left;
	}
	
	
	/* 과외를 구하고 계신가요? */
	.form .h1 {
	  	margin: 0 0 10px;
		padding: 0 10px;
		color: black;
		text-align: left;
		float:left;
	}
	
	.radioround {
		border:1px solid #D3D5F5;
		border-radius:10px;
		width:280px;
		height:70px;
		margin-top:30px;
		font-size:20px;
		float:left;
		cursor:pointer;
		color:#A6A6A6;
	}
	
	.radiobox {
		margin-left:10px;
		margin-right:10px;
		margin-bottom:50px;
		margin-top:25px;
		width:25px;
		height:20px;
		text-align: left;
		cursor:pointer;
	}

	.radiolabel input[type="radio"]:checked+span
		{
			/* background:#2673F0; */
			color: #2673F0;
			font-weight:bold;
			cursor:pointer;
		}
	
	
	/* 프로필 내용 시작 */
	.editbutton {
		position:relative;
	    left:408px;
	    text-align:center;
	    letter-spacing:2px;
	    width : 130px;
	    height : 27px;
	    font-size:15px;
	    cursor:pointer;
	    background:none;
	    border:1px solid black;
	}
	
	.editbutton:hover{
      color:white;
      background:#1a72e2;
      border:1px solid #1a72e2;
   }
	
	.title .h3 {
		position:absolute;
		margin-left:40px;
	}
	
	.profile_hangmok {
		margin-top:40px;
		width:150px;
		color:#595959;
	}
		
		
	.text_clean{
		overflow: hidden;
       	text-overflow: ellipsis;
       	white-space: nowrap;
	}
	
	.wish_button{
		width:303px;
		height:70px;
		font-size:18px;
		border:0;
		cursor:pointer;
		border-radius:10px;
	}
	
	
	/* 찜한 선생 1명당 차지할 공간. 선생 수 마다 반복될 것임.*/
	.message_hangmok {
		width:300px;
		height:150px;
		border: 1px solid #E3DAE3;
		cursor:pointer;
		border-radius:10px;
		display:inline-block;
	}
	.message_hangmok:hover {
		background: #FFFEEB;
	}
	
	/* 상대방의 프로필 사진이 들어갈 div 공간 */
	.teacher_profile_div{
		position:absolute;
		float:left;
		width:150px;
		height:150px;
	}


	/* 대화 목록에 보일 상대방 프로필 사진 틀*/
	.teacher_photo_box {
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
	
	.teacher_photo_box .teacher_profile {
		position:absolute;
		top:50%;
		left:50%;
		transform:translate(-50%,-50%);
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	
	/* 메시지 리스트에 보일 상대방 정보 */
	.message_user_info{
		position:relative;
		left:130px;
		width:120px;
		height:96px;
		padding: 27px 10px;
	}
	
	.message_list_message{
		overflow: hidden;
       	text-overflow: ellipsis;
       	white-space: nowrap;
	}
	
	
	</style>
	
</head>


	<body>
	<jsp:include page="../Main_header.jsp"></jsp:include>
	
	<!-- 프로필 사진  -->
	<c:forEach var="vo" items="${ student_info }">
	<div class="form">
			<div class="photo_box">
			 	<img class="profile" src="../img/account.png">
			</div>
		<div class="title">
			<h2> 과외선생님을 찾고 계시나요??</h2>
				<c:if test="${ vo.hope_yn == '희망'}">
					<div class="radioround" onclick="radio_check1();">
						<label for="hope" class="radiolabel"><input type="radio" class="radiobox" name="hope_yn" id="hope" value="희망" checked><span style="cursor:pointer;">과외선생님을 찾고있어요!</span></label>
					</div>
					<div class="radioround" style="margin-left:50px;" onclick="radio_check2();">
						<label for="not_hope" class="radiolabel"><input type="radio" class="radiobox" name="hope_yn" id="not_hope" value="희망하지않음"><span style="cursor:pointer;">찾고 있지 않아요.</span></label>
					</div>
				</c:if>
				<c:if test="${ vo.hope_yn == '희망하지않음'}">
					<div class="radioround" onclick="radio_check1();">
						<label for="hope" class="radiolabel"><input type="radio" class="radiobox" name="hope_yn" id="hope" value="희망"><span style="cursor:pointer;">과외선생님을 찾고있어요!</span></label>
					</div>
					<div class="radioround" style="margin-left:50px;" onclick="radio_check2();">
						<label for="not_hope" class="radiolabel"><input type="radio" class="radiobox" name="hope_yn" id="not_hope" value="희망하지않음" checked><span style="cursor:pointer;">찾고 있지 않아요.</span></label>
					</div>
				</c:if>
		</div>
	<!-- ===================================================== -->
		<div class="title" style="top:280px; left:48%;">
			<h2> ◾ 내 프로필 
				<input type="button" class="editbutton" value="프로필 수정하기" onclick="profile_edit();">
			</h2>
			
			<div  style="margin:15px 0 0 50px; width:610px; min-height:265px; border-radius:10px; border:1px solid #D3D5F5;">
			
			<div style="margin-left:30px; width:160px; float:left;">
				<div class="profile_hangmok" style="margin-top:20px">
					<h3> 🙂  아이디 </h3>
				</div>
				<div class="profile_hangmok">
					<h3> 🤓 닉네임 </h3>
				</div>
				<div class="profile_hangmok">
					<h3> 📞 연락처 </h3>
				</div>
				<div class="profile_hangmok">
					<h3> 💰  포인트 </h3>
				</div>
			</div>
			
			
				<div style="margin:18px 0 0 240px;">
					<h3 id="id">${vo.id}</h3>
				</div>
				<div style="margin:41px 0 0 240px;">
					<h3 id="nickname">${vo.nickname}</h3>
				</div>
				<div style="margin:40px 0 0 240px;">
					<h3 id="phone">${vo.phone}</h3>
				</div>
				<div style="margin:40px 0 0 240px;">
					<h3 id="point">${vo.point}</h3>
				</div>
			
		</div>
		</div>
		
		<div class="title" style="top:650px; left:48%;">
			<h2> ◾ 과외정보</h2>
			
			<div  style="margin:15px 0 0 50px; width:610px; height:680px; border-radius:10px; border:1px solid #D3D5F5;">
			
			
				<div style="width:160px; float:left;">
					<div class="profile_hangmok" style="margin:20px 0 0 30px;">
						<h3> 🎓 학 년 </h3>
					</div>
					<div class="profile_hangmok" style="margin-left:30px;">
						<h3> 🌏 지 역 </h3>
					</div>
					<div class="profile_hangmok" style="margin-left:30px;">
						<h3> 📖 과 목 </h3>
					</div>
					<div class="profile_hangmok" style="margin-left:30px;">
						<h3> 🕘 과외가능시간 </h3>
					</div>
					<div class="profile_hangmok" style="margin-left:30px;">
						<h3> 👨‍🎓 선호 스타일 </h3>
					</div>
					<div class="profile_hangmok" style="margin-left:30px;">
						<h3> 📝 자기소개 </h3>
						<div style="margin:15px 0 0 30px; height:250px; width:480px; border: 1px solid #BFBFBF; padding:10px; overflow:auto;">
							<pre id="introduce" style="text-align:left; font-size:17px; white-space: pre-wrap; word-break: break-all;">${vo.introduce}</pre>
						</div>
					</div>
				</div>
			
				<div style="width:350px; margin:20px 0 0 240px; ">
					<h3 id="grade">${vo.grade}</h3>
				</div>
				<div style="width:350px; margin:39px 0 0 240px;">
					<h3 id="addr">${vo.addr}</h3>
				</div>
				<div style="width:350px; margin:40px 0 0 240px;">
					<h3 id="subject" class="text_clean">${vo.hope_subject}</h3>
				</div>
				<div style="width:350px; margin:40px 0 0 240px;">
					<h3 id="hope_time" class="text_clean">${vo.hope_time}</h3>
				</div>
				<div style="width:350px; margin:39px 0 0 240px;">
					<h3 id="hashtag">${vo.hashtag}</h3>
				</div>
			
			</div>
		</div>
		
		<div class="title" style="top:1450px; left:48%;">
			<h2> ◾ 찜 목록</h2>
			<div  style="margin:15px 0 0 50px; width:610px; height:80px; border-radius:10px;">
				<input type="button" id="wish_reference" class="wish_button" style="background:#FFFCCC;" onclick="wish_reference()" value="자료실 찜❤️">
				<input type="button" id="wish_jisik" class="wish_button" style="background:#FBCFD0;" onclick="wish_jisik()" value="지식인 찜💘 ">
			</div>
			
			<div style="margin:15px 0 0 50px; width:610px; min-height:100px; height:auto; border-radius:10px;">
				<c:forEach var="vo" items="${ wish_teacher_info }">
					<div class="message_hangmok" onclick="teacher_info('${vo.id}');">	<!-- 상대방 1명과의 메시지내용을 채울 공간. 이 div가 반복될 것이다. -->
						<div class="teacher_profile_div"> <!-- 상대방 프로필 사진 넣는 공간 -->
							<div class="teacher_photo_box">	<!-- 상대방 프로필 사진 동그라미 -->
					        	<img id="preview" class="teacher_profile" src="../img/account.png"/>
							</div>
						</div><!-- ------------------------------------------------------------------- -->
						<div class="message_user_info"> <!-- 상대방 정보 등이 들어갈 공간. -->
							<div style="margin:5px 2px 2px 0; font-size:18px;">${vo.nickname}</div>
							<div style="margin:2px 2px 5px 0; color:grey;">${vo.addr}</div>
							<div class="message_list_message">${vo.subject}</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
		</div>
		
		
		
	</div>
	</c:forEach>
	</body>
</html>