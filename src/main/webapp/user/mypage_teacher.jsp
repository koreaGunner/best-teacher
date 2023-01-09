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
	
		function profile_edit(){
			var login_id = "${user.id}";
			location.href="mypage_edit.do?id=" + login_id;
		}
		
	</script>
	
	
	<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
		* {
			font-family: 'Noto Sans KR', sans-serif;
			margin:0;
			padding:0;
			
		}
	
	
	body {
		  margin-bottom:2050px;
		}
	/* 본문 전체 틀 (음영들어간 틀) */
	.form {
		position: absolute;
		top: 18%;
		left: 50%;
		width: 1000px;
		padding: 40px;
		transform: translateX(-50%);
		border-radius: 30px;
		min-height:600px;
		height:auto;
	}
		
	
	
	/* 프로필 사진 틀 크기*/
	.photo_box {
		margin:80px 0 0 400px;
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
			color: #2673F0;
			font-weight:bold;
			cursor:pointer;
		}
	
	
	/* 프로필 내용 시작 */
	.editbutton {
		text-align:center;
        position:absolute;
        letter-spacing:2px;
        top:25px;
        right:15px;
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
		font-weight:300;
	}
	
	.profile_hangmok {
		margin-top:40px;
		width:152px;
		color:#595959;
	}
		
	
	.profile_hangmok_res {
		position:relative;
		margin:18px 10px 0 240px;
		width:350px;
		min-height:40px;
		height:auto;
	}
	
	.half_div {
		margin:15px 0 0 50px;
		width:610px;
		padding-bottom:30px;
		min-height:200px;
		height:auto;
		border-radius:10px;
		border:1px solid #D3D5F5;
	}
	
	.text_clean{
		overflow: hidden;
       	text-overflow: ellipsis;
       	white-space: nowrap;
	}
	
	</style>
	
</head>

	
	<body>
	<jsp:include page="../Main_header.jsp"></jsp:include>
	
	<c:forEach var="vo" items="${ teacher_info }">
	<!-- 프로필 사진  -->
	<div class="form">
		<div class="title" style="left:48%;">
			<h2> ◾ 프로필 사진
				<input type="button" class="editbutton" value="프로필 수정하기" onclick="profile_edit();">
			</h2>
		</div>
			<div class="photo_box">
				<c:if test="${vo.profile eq null}">
			 		<img class="profile" src="../img/account.png">
			 	</c:if>
				<c:if test="${vo.profile ne null}">
			 		<img class="profile" src="../upload/${vo.profile}">
			 	</c:if>
			 	
			</div>
	<!-- ===================================================== -->
		<div class="title" style="top:400px; left:48%;">
			<h2> ◾ 내 프로필 
			</h2>
			
			<div class="half_div">
			
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
			
			<div style="margin:18px 0 0 240px; font-weight:200;">
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
		
		<div class="title" style="top:770px; left:48%;">
			<h2> ◾ 과외정보</h2>
			
			<div class="half_div">
					<div style="min-height:60px; height:auto;">
						<div class="profile_hangmok" style="position:relative; float:left; margin:0 0 0 30px;">
							<h3> 🌐 거주지 </h3>
						</div>
						<div class="profile_hangmok_res">
							<h3 id="addr">${vo.addr}</h3>
						</div>
					</div>
					
					<div style="min-height:60px; height:auto;">
						<div class="profile_hangmok" style="position:relative; float:left; margin:0 0 0 30px;">
							<h3> 🌏 과외지역 </h3>
						</div>
						<div class="profile_hangmok_res">
							<h3 id="area" class="text_clean" >${vo.area}</h3>
						</div>
					</div>
					
					<div style="min-height:60px; height:auto;">
						<div class="profile_hangmok" style="position:relative; float:left; margin:0 0 0 30px;">
							<h3> 📖 과외과목 </h3>
						</div>
						<div class="profile_hangmok_res">
							<h3 id="subject" class="text_clean">${vo.subject}</h3>
						</div>
					</div>
					
					<div style="min-height:60px; height:auto;">
						<div class="profile_hangmok" style="position:relative; float:left; margin:0 0 0 30px;">
							<h3> 🎥 시범강의여부 </h3>
						</div>
						<div class="profile_hangmok_res">
							<h3 id="pre_yn">${vo.pre_yn}</h3>
						</div>
					</div>
					
					<div style="min-height:40px; height:auto;">
						<div class="profile_hangmok" style="position:relative; float:left; margin:0 0 0 30px;">
							<h3> 📹 비대면가능여부 </h3>
						</div>
						<div class="profile_hangmok_res">
							<h3 id="video_yn">${vo.video_yn}</h3>
						</div>
					</div>
					
					<div style="position:relative;">
						<div class="profile_hangmok" style="margin-left:30px;">
							<h3> 📝 자기소개 </h3>
							<div style="margin:15px 0 0 30px; height:250px; width:480px; border: 1px solid #BFBFBF; padding:10px; overflow:auto;">
								<pre id="introduce" style="text-align:left; font-size:17px; white-space: pre-wrap; word-break: break-all;">${vo.introduce}</pre>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
	</c:forEach>
		<div id="last_box" class="title" style="top:1800px; left:49%;">
			<h2> ◾ 업로드 한 강의</h2>
			<div class="half_div" style="padding:0;">
				<c:forEach var="video" items="${ video_list }">
					<div style="margin:30px 0 0 0; width:610px; height:230px; border-bottom:1px solid #D3D5F5;">
					<video style="width:500px; height:200px; margin:10px 0 0 53px;" controls>
	  					<source src="../upload/${video.title}"></source>
					</video>
					</div>
				</c:forEach>
			</div>
		</div>
	</body>
</html>