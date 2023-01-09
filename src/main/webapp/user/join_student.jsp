<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>최강선생 | 학생 회원가입</title>
	
	<!-- Ajax 사용을 위한 js 참조 -->
	<script src="../js/httpRequest.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		
		var b_idcheck = false;	//아이디 중복확인 성공여부
		var b_nickcheck = false;  //닉네임 중복확인 성공여부
		var b_emailcheck = false;  //이메일 인증 성공여부
		var email_auth_num = 0;  //서버에서 만든 이메일 인증번호(이메일 전송된 번호)
		var datetime = 0;  //이메일 인증 요청시간 카운트
		var pwdCheck = false;	//비밀번호 동일여부 판단 (0: 틀림, 1: 같음)
		var hashtag_checked = 0;
		var subject_checked = 0;  //현재 과목 선택한 갯수
		var pageHeight = 500; // top버튼 눌렀을때의 빠르기. (각 페이지 마다 설정해야함)
		
		var time = 180; //기준시간 작성 (3분)
		var min = ""; //분
		var sec = ""; //초
		var x;
		
		/* 제출버튼 클릭 시 최종 데이터 검증 */
		function send(f) {
			/* USER_TOTAL 테이블 내용 */
			var id = f.id.value.trim();
			var pw = f.upwd.value.trim();
			var name = f.name.value.trim();
			var nickname = f.nickname.value.trim();
			var phone1 = f.phone1.value.trim();
			var phone2 = f.phone2.value.trim();
			var phone3 = f.phone3.value.trim();
			
			
			/* USER_STUDENT 테이블 내용 */
			var hope_yn = f.find_yn.value.trim();
			var grade = f.grade.value.trim();
			var city = f.city.value.trim();
			var country = f.country.value.trim();
			var gender = f.gender_yn.value.trim();
			var hope_time = f.time.value.trim();
			var introduce = f.introduce.value.trim();
			
			
			if(id == ''){
				alert("아이디를 입력하세요.");
				document.form1.id.focus();
				return;	}
			
			if( !b_idcheck ){
				alert("아이디 중복확인을 해주세요!");
				document.form1.jungbok_button.focus();
				return;	}
			
			if( pw ==''){
				alert("비밀번호를 입력하세요.");
				document.form1.upwd.focus();
				return;	}
			
			if( !pwdCheck ){
				alert("비밀번호가 일치하지 않습니다.");
				document.form1.upwd.focus();
				return;	}

			if ( name ==''){
				alert("이름좀 알려주세요!!");
				document.form1.name.focus();
				return;	}
			
			if( nickname ==''){
				alert("닉네임을 입력하세요.");
				document.form1.nickname.focus();
				return;	}
			
			if( !b_nickcheck ){
				alert("닉네임 중복확인을 해주세요!");
				document.form1.nickname_check.focus();
				return;	}
			
			if ( phone2 =='' || phone3 ==''){
				alert("연락처좀 여쭤봐도 될까요?");
				document.form1.phone2.focus();
				return;	}
			
			if (!b_emailcheck){
				alert("이메일 인증을 해주세요!");
				document.form1.email_addr.focus();
				return;	}
			
			if ( hope_yn ==''){
				alert("과외를 구하고 있는지 선택해주세요.");
				document.form1.find_yn.focus();
				return;	}
			
			if ( grade == ''){
				alert("학년좀 알려주세요!");
				document.form1.grade.focus();
				return;	}
			
			if ( city == '' || country == '-------'){
				alert("사는 지역을 알아야 선생님 매칭이 가능해요ㅠㅠ");
				document.form1.city.focus();
				return;	}
			
			if ( gender ==''){
				alert("성별을 선택해주세요.");
				document.form1.gender_yn.focus();
				return;	}
			
			if ( subject_checked == 0 ){
				alert("과외가 필요한 과목이 무엇인가요??");
				document.form1.subject.focus();
				
				return;	}
			
			if ( hope_time ==''){
				alert("과외가 가능한 시간을 작성해주세요.");
				document.form1.time.focus();
				return;	}
			
			if ( hashtag_checked == 0 ){
				alert("원하시는 과외선생님의 스타일을 선택해주세요.");
				document.form1.hashtag_field.focus();
				return;	}
			
			if ( introduce ==''){
				alert("멋진 자기소개 부탁드립니다~");
				document.form1.introduce.focus();
				return;	}
			
			
			f.method = 'post';
			f.action="join.do"; //jsp로 보내는게 아니라 서블릿으로 보내야한다.
			alert("최강선생에 가입되었습니다! 😉")
			f.submit();
		}

//----------------------------------------------------------------------------------------------------------------

		//아이디 입력 판단(영어,숫자만 입력) ==========================================*/
		function checkId(e)  {
			e.value = e.value.replace(/[^A-Za-z0-9]/ig, '');
			var inputed = $('#id').val();
			$("#id").css("background-color", "#FFCECE");
			b_idcheck = false;
		}
		
		//아이디 중복체크 메소드
		function check_id(f) {
			var reinputed = $('#id').val();
			var id = f.id.value.trim();
			var regType = /^[a-zA-Z](?=.*[a-zA-Z])(?=.*[0-9]).{5,14}$/g;
			
			//아이디 칸이 비어있는 경우
			if( id == ''){
				alert("아이디를 입력하세요.");
				document.form1.id.focus();
				b_idcheck = false;
				return;
			}
			
			//아이디 유효성 검사 (앞글자는 영어, 영어+숫자만 가능, 6~10자리)
			if (!regType.test(id)) {
				alert("아이디는 6~15자리, 영어+숫자만 가능합니다.");
				document.form1.id.focus();
				b_idcheck = false;
				return;
			}
			
			//ID중복확인을 위해 Ajax로 ID전송
			var url = "idcheck.do";
			var param = "id=" + id;
			
			sendRequest( url, param, idResult, "get");
		}
		
		//아이디 중복체크 시 받아오는 결과 값
		function idResult() {
			if(xhr.readyState == 4 && xhr.status == 200){
				
				var data = xhr.responseText;
				var json = eval(data);
				
				if (json[0].param == 'can_use_id'){
					alert("사용 가능한 아이디입니다.");
					$("#id").css("background-color", "#B0F6AC");
					b_idcheck = true;
					return;
				}
				else {
					alert("중복된 아이디 입니다.");
					document.form1.id.focus();
					b_idcheck = false;
					return;
				}
			}
		}
		

//------------------------------------------------------------------------------------------------------------------
		//비밀번호 확인 체크
		function checkPwd() {
	        var inputed = $('#pwd').val();
	        var reinputed = $('#repwd').val();
	        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
	            $("#repwd").css("background-color", "#FFCECE");
	            $("#password_check").text('※비밀번호가 일치하지 않습니다.');
	            pwdCheck = false;
	        }
	        else if (inputed == reinputed) {
	            $("#repwd").css("background-color", "#B0F6AC");
	            $("#password_check").text('※비밀번호가 일치합니다.');
	            pwdCheck = true;
	        } else if (inputed != reinputed) {
	            pwdCheck = false;
	            $("#repwd").css("background-color", "#FFCECE");
	            $("#password_check").text('※비밀번호가 일치하지 않습니다.');
	            
	        }
	    }
	    
//------------------------------------------------------------------------------------------------------------------
		//닉네임 입력 판단
		function checkNickname(){
			var inputed = $('#nickname_text').val();
			$("#nickname_text").css("background-color", "#FFCECE");
			b_nickcheck = false;
		}
		
		//닉네임 중복체크 메소드
		function check_nickname(f) {
			var nickname = f.nickname.value.trim();
			var regType = /^[가-힣|a-z|A-Z|0-9|]{2,8}$/;
			
			//닉네임 칸이 비어있는 경우
			if( nickname == ''){
				alert("닉네임을 입력하세요.");
				document.form1.nickname.focus();
				b_nickcheck = false;
				return;
			}
			
			//닉네임 유효성 검사 (특수문자 불가 )
			if (!regType.test(nickname)) {
				alert("닉네임은 2~8자리, 특수문자는 사용하실 수 없습니다.");
				document.form1.nickname.focus();
				b_nickcheck = false;
				return;
			}
			
			//닉네임 중복확인을 위해 Ajax로 ID전송
			var url = "nickcheck.do";
			var param = "nickname=" + nickname;
			
			sendRequest( url, param, nickResult, "get");
		}
		
		
		//닉네임 중복체크 시 받아오는 결과 값
		function nickResult() {
			if(xhr.readyState == 4 && xhr.status == 200){
				
				var data = xhr.responseText;
				var json = eval(data);
				
				if (json[0].param == 'can_use_nickname'){
					alert("사용 가능한 닉네임 입니다.");
					b_nickcheck = true;
					$("#nickname_text").css("background-color", "#B0F6AC");
					return;
				}
				else {
					alert("중복된 닉네임 입니다.");
					document.form1.nickname.focus();
					b_nickcheck = false;
					return;
				}
			}
		}
		
//-----------------------------------------------------------------------------------------------
		//이메일 인증번호 입력란 숫자만 처리
		function authnum(e)  {
			e.value = e.value.replace(/[^0-9]/ig, '');
		}
		
		//이메일 인증 메소드
		function email_auth(f) {
			var addr = f.email_addr.value.trim();
			var exptext = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			
			//이메일 칸이 비어있는 경우
			if( addr == ''){
				alert("이메일 주소를 입력하세요.");
				document.form1.email_addr.focus();
				$("#emailsend_check").text('※이메일 주소를 입력하세요.');
				b_emailcheck = false;
				return;
			}
			
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
			if(!exptext.test(addr)){
				alert("이메일형식이 올바르지 않습니다.");
				$("#emailsend_check").text('※이메일형식이 올바르지 않습니다.');
				document.form1.email_addr.focus();
				b_emailcheck = false;
				return;
			}
			
			//이메일 인증번호 전송을 위해 Ajax로 전송
			var url = "email_auth.do";
			var param = "id=" + addr;
			
			sendRequest( url, param, emailResult, "get");
		}
		
		function emailResult(){
			if(xhr.readyState == 4 && xhr.status == 200){
				
				var data = xhr.responseText;
				var json = eval(data);
				
				if(json[0].param == 'send_fail'){
					alert("인증번호 전송 실패했습니다. 이메일 주소를 확인해주세요.");
					document.form1.email_addr.focus();
					$("#emailsend_check").text('※인증번호 전송 실패했습니다. 이메일 주소를 확인해주세요.');
					b_emailcheck = false;
					return;
				}
				else if(json[0].param == ''){
					alert("시스템 에러입니다. 이메일 관리자에게 문의해주세요.");
					document.form1.email_addr.focus();
					$("#emailsend_check").text('※시스템 에러입니다. 이메일 관리자에게 문의해주세요.');
					b_emailcheck = false;
					return;
				}
				else {
					email_auth_num = json[0].param;	//서블릿으로 부터 인증번호를 받는다. (리스폰스)
					alert("인증번호를 전송하였습니다.");
					document.form1.email_addr.focus();
					$("#emailsend_check").text('※인증번호를 전송하였습니다. 하단에 인증번호를 입력해주세요.');
					
					var send_button_hidden = document.getElementById('email_send_button');
					var auth_button_hidden = document.getElementById('email_auth_button');
					var resend_button_hidden = document.getElementById('resend_button');
					var auth_text_hidden = document.getElementById('auth_num');
					var auth_result_hidden = document.getElementById('emailauth_result');
					var timer_onoff = document.getElementById('auth_timer');
					var email_input_readonly = document.getElementById('email_addr');
					
					auth_button_hidden.classList.remove('hidden');
					resend_button_hidden.classList.remove('hidden');
					auth_text_hidden.classList.remove('hidden');
					auth_result_hidden.classList.remove('hidden');
					timer_onoff.classList.remove('hidden');
					email_input_readonly.classList.add('readonly');
					document.form1.auth_num.focus();
					
					x = setInterval(function() {
						//parseInt() : 정수를 반환
						min = parseInt(time/60);
						sec = time%60;
						
						if(min == 0){
							timer_onoff.innerHTML = sec + "초";
							send_button_hidden.classList.add('hidden');
							time--;
						}
						else {
							timer_onoff.innerHTML = min + "분" + sec + "초";
							send_button_hidden.classList.add('hidden');
							time--;
						}
							
						//타임아웃 시
						if (time < 0) {
							clearInterval(x); //setInterval() 실행을 끝냄
							send_button_hidden.classList.remove('hidden');
							timer_onoff.classList.add('hidden');
							auth_button_hidden.classList.add('hidden');
							resend_button_hidden.classList.add('hidden');
							auth_text_hidden.classList.add('hidden');
							auth_result_hidden.classList.add('hidden');
							email_input_readonly.classList.remove('readonly');
						}
					}, 1000);
				}
			}
		}
		
		
		// 재전송 버튼을 눌렀을 시 
		function resend() {
			clearInterval(x);	//기존에 동작하던 타이머를 멈춘다.
			document.getElementById('auth_timer').innerHTML = '';	//기존에 동작하던 타이머 시간을 비운다.
			
			document.getElementById('email_send_button').classList.remove('hidden');
			document.getElementById('auth_timer').classList.add('hidden');
			document.getElementById('email_auth_button').classList.add('hidden');
			document.getElementById('resend_button').classList.add('hidden');
			document.getElementById('auth_num').classList.add('hidden');
			document.getElementById('emailauth_result').classList.add('hidden');
			document.getElementById('email_addr').classList.remove('readonly');
			time=180;	//타이머 시간을 초기화 한다.
			document.form1.email_addr.focus();
		}
		
		
		function email_auth_check(f) {
			var input_num = f.auth_num.value.trim();
			
			if(input_num == ''){
				alert("인증번호 6자리를 입력해주세요.")
				document.form1.auth_num.focus();
				return;
			}
			
			console.log(email_auth_num);
			console.log(input_num);
			
			if( email_auth_num == input_num){
				alert("이메일 인증이 완료되었습니다.");
				$("#emailauth_result").text('※이메일 인증 완료되었습니다.');
				clearInterval(x);
				document.getElementById('auth_timer').innerHTML = "인증 완료";
				document.getElementById('email_addr').classList.add('readonly');
				document.getElementById('auth_num').classList.add('readonly');
				document.getElementById('email_send_button').classList.add('readonly');
				document.getElementById('resend_button').classList.add('readonly');
				document.getElementById('email_auth_button').classList.add('readonly');
				b_emailcheck = true;
				return;
			}
			else{
				alert("이메일 인증번호가 올바르지 않습니다.");
				b_emailcheck = false;
				return;
			}
		}

//---------------------------------------------------------------------------------------------------------------------
/* 지역 선택 리스트박스 함수 ================================================*/
		function areaChange(form) {
	
			var p_city = document.getElementById("city").value;
			var url = "showarea.do";
			var param = "city=" + p_city;
			sel = form.country;
			sendRequest(url, param, resultCity, "GET");
		}
		
		function resultCity(data){
			if(xhr.readyState == 4 && xhr.status == 200) {
				console.log("여긴 학생쪽 콜백메소드");
				var data = xhr.responseText;
				var json = eval(data);	//json으로 받음.
				var jsonObj = JSON.parse(data); 
				var arr = [];	//배열로 전환.
				arr[0] = "-------";
				
				for(var i = 0 ; i < json.length ; i++){
					arr[i+1] = json[i].country;
				}
				
				for (i=sel.length; i>=1; i--){
					sel.options[i] = null;
				}
				
				/* 옵션박스추가 */
				for (i=0; i < arr.length;i++){
					sel.options[i] = new Option(arr[i], arr[i]);
				}
			}
		}
		
		
//---------------------------------------------------------------------------------------------------------------------
//과목 선택 갯수 카운트==============================================
		function subject_check(field){
			if(field.checked)
				subject_checked += 1;
				
			else
				subject_checked -= 1;
			
			console.log(subject_checked);
		}
		
//---------------------------------------------------------------------------------------------------------------------
// 해시태그 선택 3개 한정 ==========================================
			function hashtag_check(field){
				if(field.checked)
					hashtag_checked += 1;
					
				else
					hashtag_checked -= 1;
				
				if( hashtag_checked > 3){
					field.checked = false;
					hashtag_checked -= 1;
				}
			}
	
		
	</script>
	
	
	
	<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
		* {
			font-family: 'Noto Sans KR', sans-serif;
			margin:0;
			padding:0;
		}
		
	html {
		min-height:600%;
	}
	body {
		  margin:0;
		  padding:0;
		  font-family: sans-serif;
		  background: white;
		}
		
		/* 제일 바깥 네모 라인 */
		.form {
			position: absolute;
			top: 23%;
			left: 52%;
			width: 800px;
			padding: 40px;
			transform: translateX(-50%);
			background: white;
			box-sizing: border-box;
			border-radius: 10px;
			min-height:5500px;
		}
		
		.form h1 {
		  margin: 0 0 70px;
		  padding: 0;
		  color: black;
		  text-align: center;
		}
		
		/* 회원가입 틀 안에 내용전체 div*/
		.form .title {
			position: absolute;
			left:50%;
			width:700px;
			transform: translateX(-50%);
			padding: 20px;
			text-align:center;
			border-radius: 10px;
		}
		
		.form .title h2 {
		  margin: 0 0 10px;
		  padding: 0;
		  color: black;
		  text-align: left;
		}
		
		
		.jungbok-check {
			border-radius:10px;
			border:1px solid #EDD3ED;
			font-size:20px;
			text-weight:bold;
			background:#D3D5F5;
			text-align:center;
			width:100px;
			height:51px;
			cursor:pointer;
		}
		
		.jungbok-check:hover {
			border-radius:10px;
			border:1px solid #EDD3ED;
			font-size:20px;
			background:linear-gradient(#D3D5F5, white);
			text-align:center;
			width:100px;
			height:51px;
			cursor:pointer;
		}
		
		#auth_timer {
			position:absolute;
			border-radius:10px;
			border:1px solid #EDD3ED;
			font-size:25px;
			text-weight:bold;
			background:#D3D5F5;
			text-align:center;
			height:40px;
			padding:5px 0px;
			right:90px;
			top:50px;
			width:138px;
		}
		
		/* 이메일 인증 관련 클래스 */
		.hidden {display:none;}
		.inline {display:inline;}
		.readonly {pointer-events:none; color:#C1C1C1;}
		
		
		/* 회원가입 항목 별 div */
		.hangmok {
			min-height:250px;
			height:auto;
			
		}
		
		/* 기본 입력란 사이즈 */
		.textline {
			left:100px;
			width:500px;
			height:50px;
			border-radius:10px;
			border:1px solid #8E8E8E;
			font-size:18px;
			letter-spacing:2px;
			text-align:center;
			margin-top:10px;
		}
		
		
		/* 이메일 입력란 사이즈 */
		.emailline {
			position:absolute;
			left:91px;
			top:110px;
			width:210px;
			height:50px;
			border-radius:10px;
			border:1px solid #8E8E8E;
			font-size:18px;
			letter-spacing:2px;
			text-align:center;
			margin-top:10px;
		}
		
		#emailauth_result {
			position:absolute;
			left:98px;
			margin-top:8px;
			margin-bottom:15px;
			top:170px;
		}
		
		
		/* 핸드폰번호 앞자리 리스트박스*/
		.phone_selectline {
			width:130px;
			height:53px;
			border-radius:10px;
			border:1px solid #8E8E8E;
			font-size:25px;
			letter-spacing:2px;
			text-align:center;
			margin-top:10px;
			margin-right:10px;
		}
		
		.phoneline {
			width:150px;
			height:50px;
			border-radius:10px;
			border:1px solid #8E8E8E;
			font-size:25px;
			letter-spacing:2px;
			text-align:center;
			margin-top:10px;
			margin-right:10px;
		}
		
		/* 과외구함여부 체크박스*/
		.hangmok_check {
			min-height:230px;
			height:auto;
			text-align:left;
		}
		
		.checkline {
			margin-right:10px;
			margin-left:200px;
			margin-top:20px;
			margin-bottom:20px;
			width:25px;
			height:25px;
			text-align: left;
		}
		
		.text_20{
			font-size:20px;
			letter-spacing:2px;
			cursor:pointer;
		}
		
		/*학년 리스트 박스*/
		.grade_selectline {
			margin-left:95px;
			width:500px;
			height:50px;
			border-radius:10px;
			border:1px solid #8E8E8E;
			font-size:20px;
			letter-spacing:3x;
			text-align:center;
			margin-top:10px;
			margin-right:10px;
		}
		
		/*거주지 리스트 박스*/
		.area_selectline {
			width:200px;
			height:53px;
			border-radius:10px;
			border:1px solid #8E8E8E;
			font-size:20px;
			letter-spacing:2px;
			font-weight:bold;
			text-align:center;
			margin-top:10px;
			margin-right:10px;
		}
		
		/* 성별 체크 박스 */
		.gender_checkline {
			margin-right:10px;
			margin-top:15px;
			margin-bottom:20px;
			width:25px;
			height:20px;
			text-align: left;
		}
		
		.gender_checkline > span { 
			font-size:25px;
		
		}
		
		
		/* 선택한 과목 확인란*/
		.select_subject {
			left:100px;
			width:680px;
			min-height:50px;
			height:auto;
			border-radius:10px;
			border:0.5px solid #8E8E8E;
			font-size:17px;
			text-align:left;
			padding: 0px 10px;
			letter-spacing:1px;
			margin-top:20px;
		}
		
		ul.subject { height:40px;}
		ul.subject > li > span { border:2px dotted #9B9FDC; height:40px; line-height:52px; border-radius:30px; padding: 2px 20px; cursor:pointer; text-align:center;}
		ul.subject > li > span:hover { border:1px solid white; background:linear-gradient(#9B9FDC, #2730C1); padding: 2px 20px; color:white; font-weight:600;}
		
		/* 과목 선택란 폼*/
		.choose_subject {
			width:680px;
			min-height:300px;
			height:auto;
			border-radius:10px;
			border:1px solid #8E8E8E;
			font-size:17px;
			text-align:left;
			padding: 10px 10px;
			margin-top:15px;
			margin-bottom:150px;
		}
		
		.checkbox-input input[type="checkbox"] {
			display: none;
		}
		
		.checkbox-input input[type="checkbox"]+span
		{
			display: inline-block;
			width: 95px;
			background: none;
			border: 1px solid #ABABAB;
			color: #ABABAB;
			padding: 0px 5px;
			text-align: center;
			height: 50px;
			margin: 10px 10px;
			font-size: 17px; 
			font-weight: 400;
			cursor: pointer;
			line-height: 50px;
			border-radius:10px;
		}
		
		.checkbox-input input[type="checkbox"]:checked+span
		{
			border: 2px solid #2673F0;
			/* background:#2673F0; */
			color: #2673F0;
			font-weight:bold;
		}
		
		.checkbox-input input[type="radio"] {
			display: none;
		}
		
		.checkbox-input input[type="radio"]+span
		{
			display: inline-block;
			width: 95px;
			background: none;
			border: 1px solid #ABABAB;
			color: #ABABAB;
			padding: 0px 5px;
			text-align: center;
			height: 50px;
			margin: 10px 10px;
			font-size: 17px; 
			font-weight: 400;
			cursor: pointer;
			line-height: 50px;
			border-radius:10px;
		}
		
		.checkbox-input input[type="radio"]:checked+span
		{
			border: 2px solid #2673F0;
			/* background:#2673F0; */
			color: #2673F0;
			font-weight:bold;
		}
		
		
		/* 최하단 제출/취소 버튼 */
		.confirm_button {
			width:230px;
			height:60px;
			padding: 10px 0px;
			color: black;
			font-size: 18px;
			overflow: hidden;
			transition: .5s;
			margin-top: 50px;
			letter-spacing: 4px;
			text-align:center;
			border-radius: 5px;
			border:0;
			background:linear-gradient(#FFCCA9, #FF7F27);
			cursor:pointer;
		}
		
		.confirm_button:hover {
			background: #FA6600;
		  	color: white;
		  	border-radius: 5px;
		  	box-shadow: 0 0 3px #FA6600,
		              	0 0 15px #FA6600,
		              	0 0 30px #FA6600,
		              	0 0 60px #FA6600;
		}
		
		
		.cancel_button {
			width:230px;
			height:60px;
			padding: 10px 0px;
			color: black;
			font-size: 18px;
			overflow: hidden;
			transition: .5s;
			margin-top: 30px;
			margin-left:40px;
			letter-spacing: 4px;
			text-align:center;
			border-radius: 5px;
			border:0;
			background: linear-gradient(#D9D9D9, #989797);
			cursor:pointer;
		}
		
		.cancel_button:hover {
			background: #807F7F;
		  	color: white;
		  	border-radius: 5px;
		  	box-shadow: 0 0 3px #807F7F,
		              	0 0 15px #807F7F,
		              	0 0 30px #807F7F,
		              	0 0 60px #807F7F;
		}
		
		
	</style>
</head>

<body>
<jsp:include page="../Main_header.jsp"></jsp:include>

	<div class="form">
		<h1> ::: 최강선생 학생 가입신청서  ✌️ :::</h1>
		
		<form class="title" name=form1>
		
<!-- 아이디================================================ -->
			<div class="hangmok">
				<h2> 아이디를 적어주세요.</h2>
				<input type="text" name="id" id="id" class="textline" style="width:400px;" placeholder="영문+숫자, 6~15자리만 가능합니다." maxlength="15" oninput="checkId(this)" >
				<input type="button" name="jungbok_button" class="jungbok-check" value="중복확인" onclick="check_id(this.form);">
			</div>
			
			
<!-- 비밀번호================================================ -->	
			<div class="hangmok">
				<h2> 비밀번호를 적어주세요. </h2>
					<input type="password" name="upwd" id="pwd" class="textline" placeholder="비밀번호 입력" maxlength="20" required class="pass" oninput="checkPwd()" >
					<input type="password" name="psw-repeat" id="repwd" class="textline" placeholder="비밀번호 확인" maxlength="20" required class="pass" oninput="checkPwd()" >
					<p id="password_check" style="margin-top:10px;"></p>
			</div>
			
			
<!-- 이름================================================ -->				
			<div class="hangmok">
				<h2> 이름이 무엇인가요?</h2>
				<input type="text" name="name" class="textline" maxlength="20">
			</div>
			
			
<!-- 닉네임================================================ -->				
			<div class="hangmok">
				<h2> 닉네임을 정해주세요.</h2>
				<input type="text" name="nickname" id="nickname_text" class="textline" style="width:400px;" placeholder="2~8자리 입력 (특수문자 사용불가)" maxlength="8" oninput="checkNickname()">
				<input type="button" class="jungbok-check" name="nickname_check" value="중복확인" onclick="check_nickname(this.form);">
			</div>
			
			
<!-- 전화번호================================================ -->				
			<div class="hangmok">
				<h2> 핸드폰 번호를 입력해주세요.</h2>
					<input type="text" id="phone1" name="phone1" maxlength=3 value="010" class="phoneline" readonly>
					<input type="text" class="phoneline" id="phone2" name="phone2" maxlength=4 size=2 oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" />
					<input type="text" class="phoneline" id="phone3" name="phone3" maxlength=4 size=2 oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" />
			</div>
			
			
<!-- 이메일================================================ -->				
			<div class="hangmok" style="position:relative;">
				<h2> 이메일을 인증이 필요합니다.</h2>
					<input type="text" id="email_addr" name="email_addr"class="textline" style="position:absolute; width:370px; left:91px; top:40px;"placeholder="이메일 입력" maxlength="30">
					<input type="button" id="email_send_button" class="jungbok-check" style="position:absolute; right:90px; top:50px; width:140px;" value="인증번호 전송" onclick="email_auth(this.form)">
					<div id="auth_timer" class="hidden"></div>
					
					<input type="text" id="auth_num" name="auth_num" class="emailline hidden" placeholder="인증번호 입력" maxlength="6" oninput="authnum(this)">
					<input type="button" id="email_auth_button" class="jungbok-check hidden" style="position:absolute; right:268px; top:120px; width:120px;" value="확인" onclick="email_auth_check(this.form)">
					<input type="button" id="resend_button" class="jungbok-check hidden" style="position:absolute; right:90px; top:120px; width:170px;" value="인증번호 재전송" onclick="resend()">
					<p id="emailauth_result" class="hidden"></p>
					
			</div>
			
			
<!-- 과외선생 구함여부================================================ -->				
			<div class="hangmok_check" style="margin-top:80px;">
				<h2>현재 과외선생님을 구하시나요?</h2>
				<label for="find_teacher" class="text_20">
					<input type="radio" id="find_teacher" class="gender_checkline" name="find_yn" value="희망"><span>네, 과외 선생님을 찾고있어요.</span></label>
				<label for="find_teacher2" class="text_20">
					<input type="radio" id="find_teacher2" class="gender_checkline" name="find_yn" value="희망하지 않음" style="margin-left:70px;"><span>아니요, 구하고 있지 않아요.</span></label>
			</div>
			
			
<!-- 학년================================================ -->				
			<div class="hangmok_check" style="margin-top:20px;">
				<h2>학년이 어떻게 되시나요?</h2>
				<select id="grade" name="grade" size="1" class="grade_selectline">
						<option value='' selected disabled>학년선택</option>
						<option value="직장인">직장인</option>
						<option value="대학생">대학생</option>
						<option value="고3" style='background:#D9D9D9;border:0;'>고등학교 3학년</option>
						<option value="고2" style='background:#D9D9D9;border:0;'>고등학교 2학년</option>
						<option value="고1" style='background:#D9D9D9;border:0;'>고등학교 1학년</option>
						<option value="중3" style=''>중학교 3학년</option>
						<option value="중2" style=''>중학교 2학년</option>
						<option value="중1" style=''>중학교 1학년</option>
						<option value="초6" style='background:#D9D9D9;border:0;'>초등학교 6학년</option>
						<option value="초5" style='background:#D9D9D9;border:0;'>초등학교 5학년</option>
						<option value="초4" style='background:#D9D9D9;border:0;'>초등학교 4학년</option>
						<option value="초3" style='background:#D9D9D9;border:0;'>초등학교 3학년</option>
						<option value="초2" style='background:#D9D9D9;border:0;'>초등학교 2학년</option>
						<option value="초1" style='background:#D9D9D9;border:0;'>초등학교 1학년</option>
						<option value="유치원 이하">유치원 이하</option>
				</select>
			</div>
			
			
			
			<div class="hangmok">
				<h2> 사는 지역이 어디신가요?</h2>
				<select id="city" name="city" size="1" class="area_selectline" onchange="areaChange(this.form)">
						<option value='' selected disabled>시/도</option>
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="부산">부산</option>
						<option value="경남">경남</option>
						<option value="인천">인천</option>
						<option value="경북">경북</option>
						<option value="대구">대구</option>
						<option value="충남">충남</option>
						<option value="전남">전남</option>
						<option value="전북">전북</option>
						<option value="충북">충북</option>
						<option value="강원">강원</option>
						<option value="대전">대전</option>
						<option value="광주">광주</option>
						<option value="울산">울산</option>
						<option value="제주">제주</option>
						<option value="세종">세종</option>
				</select>
				<select name="country" size="1" class="area_selectline">
					<option id="country" value='' selected disabled>시/군/구</option>
				</select>				
			</div>
			
			
			<div class="hangmok_check">
				<h2>성별을 선택해주세요.</h2>
				<label for="gender_man" class="text_20">
					<input type="radio" id="gender_man" class="gender_checkline" name="gender_yn" value="남자"><span>남자</span>
				</label>
				<label for="gender_woman" class="text_20">
					<input type="radio" id="gender_woman" class="gender_checkline" name="gender_yn" value="여자" style="margin-left:90px;"><span>여자</span>
					</label>
			</div>
			
			
			<div class="hangmok">
				<h2>과외를 원하시는 과목을 선택해주세요.</h2>
				<div class="choose_subject">
					<p style="padding:0px 10px; font-size:20px; font-weight:bold;">초등학교</p>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="초등국어" onclick="subject_check(this)"> <span>초등국어</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="초등수학" onclick="subject_check(this)"> <span>초등수학</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="초등영어" onclick="subject_check(this)"> <span>초등영어</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="초등사회" onclick="subject_check(this)"> <span>초등사회</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="초등과학" onclick="subject_check(this)"> <span>초등과학</span></label>
					
					<p style="padding:0px 10px; margin-top:40px; font-size:20px; font-weight:bold; ">중학교</p>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="중등국어" onclick="subject_check(this)"> <span>중등국어</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="중등수학" onclick="subject_check(this)"> <span>중등수학</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="중등영어" onclick="subject_check(this)"> <span>중등영어</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="중등사회" onclick="subject_check(this)"> <span>중등사회</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="중등과학" onclick="subject_check(this)"> <span>중등과학</span></label>
					
					<p style="padding:0px 10px; margin-top:40px; font-size:20px; font-weight:bold;">고등국어</p>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="공통국어" onclick="subject_check(this)"> <span>공통국어</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="독서" onclick="subject_check(this)"> <span>독서</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="문학" onclick="subject_check(this)"> <span>문학</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="화법과 작문" onclick="subject_check(this)"> <span>화법과 작문</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="언어와 매체" onclick="subject_check(this)"> <span>언어와 매체</span></label>
					
					<p style="padding:0px 10px; margin-top:40px; font-size:20px; font-weight:bold;">고등영어</p>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="내신영어" onclick="subject_check(this)"> <span>내신영어</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="수능영어" onclick="subject_check(this)"> <span>수능영어</span></label>
					
					<p style="padding:0px 10px; margin-top:40px; font-size:20px; font-weight:bold;">고등수학</p>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="공통수학" onclick="subject_check(this)"> <span>공통수학</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="수학1" onclick="subject_check(this)"> <span>수학1</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="수학2" onclick="subject_check(this)"> <span>수학2</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="미적분" onclick="subject_check(this)"> <span>미적분</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="확통" onclick="subject_check(this)"> <span>확통</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="기하" onclick="subject_check(this)"> <span>기하</span></label>
					
					<p style="padding:0px 10px; margin-top:40px; font-size:20px; font-weight:bold;">고등사회</p>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="통합사회" onclick="subject_check(this)"> <span>통합사회</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="경제" onclick="subject_check(this)"> <span>경제</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="동아시아사" onclick="subject_check(this)"> <span>동아시아사</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="사회문화" onclick="subject_check(this)"> <span>사회문화</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="생활과 윤리" onclick="subject_check(this)"> <span>생활과 윤리</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="세계사" onclick="subject_check(this)"> <span>세계사</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="세계지리" onclick="subject_check(this)"> <span>세계지리</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="윤리와 사상" onclick="subject_check(this)"> <span>윤리와 사상</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="법과 정치" onclick="subject_check(this)"> <span>법과 정치</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="한국사" onclick="subject_check(this)"> <span>한국사</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="한국지리" onclick="subject_check(this)"> <span>한국지리</span></label>
					
					<p style="padding:0px 10px; margin-top:40px; font-size:20px; font-weight:bold;">고등과학</p>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="통합과학" onclick="subject_check(this)"> <span>통합과학</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="물리1" onclick="subject_check(this)"> <span>물리1</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="물리2" onclick="subject_check(this)"> <span>물리2</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="화학1" onclick="subject_check(this)"> <span>화학1</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="화학2" onclick="subject_check(this)"> <span>화학2</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="생명과학1" onclick="subject_check(this)"> <span>생명과학1</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="생명과학2" onclick="subject_check(this)"> <span>생명과학2</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="지구과학1" onclick="subject_check(this)"> <span>지구과학1</span></label>
					<label class="checkbox-input"><input type="checkbox" name="subject" value="지구과학2" onclick="subject_check(this)"> <span>지구과학2</span></label>
				</div>
			</div>
			
			
<!-- 과외시간================================================ -->				
			<div class="hangmok">
				<h2>과외 가능한 시간을 적어주세요.</h2>
				<input type="text" name="time" class="textline" placeholder="예시)월,수,금 18시~20시">
			</div>
			
			
<!-- 선생스타일 ================================================ -->				
			<div class="hangmok">
				<h2>원하는 선생님 스타일을 골라주세요. (최대 3개)</h2>
				<div class="choose_subject">
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="차분한" onclick="hashtag_check(this)"> <span>차분한</span></label>
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="사려깊은" onclick="hashtag_check(this)"> <span>사려깊은</span></label>
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="체계적인" onclick="hashtag_check(this)"> <span>체계적인</span></label>
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="꼼꼼한" onclick="hashtag_check(this)"> <span>꼼꼼한</span></label>
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="엄격한" onclick="hashtag_check(this)"> <span>엄격한</span></label>
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="유쾌한" onclick="hashtag_check(this)"> <span>유쾌한</span></label>
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="친근한" onclick="hashtag_check(this)"> <span>친근한</span></label>
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="지적인" onclick="hashtag_check(this)"> <span>지적인</span></label>
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="듬직한" onclick="hashtag_check(this)"> <span>듬직한</span></label>
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="열정적인" onclick="hashtag_check(this)"> <span>열정적인</span></label>
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="귀여운" onclick="hashtag_check(this)"> <span>귀여운</span></label>
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="개성있는" onclick="hashtag_check(this)"> <span>개성있는</span></label>
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="사교적인" onclick="hashtag_check(this)"> <span>사교적인</span></label>
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="낙천적인" onclick="hashtag_check(this)"> <span>낙천적인</span></label>
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="내향적인" onclick="hashtag_check(this)"> <span>내향적인</span></label>
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="외향적인" onclick="hashtag_check(this)"> <span>외향적인</span></label>
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="상냥한" onclick="hashtag_check(this)"> <span>상냥한</span></label>
					<label class="checkbox-input"><input type="checkbox" name="hashtag_field" value="감성적인" onclick="hashtag_check(this)"> <span>감성적인</span></label>
				</div>
			</div>
			
			
<!-- 자기소개================================================ -->				
			<div class="hangmok">
				<h2>자기소개 부탁드립니다!</h2>
				<p><textarea cols="10" name="introduce" rows="10" style="resize: none; margin-top:10px; height:300px;width:610px;font-size:20px;border: 1px solid black;padding:5px 10px; resize: none;" placeholder="간단한 자기소개 부탁드려요!"></textarea></p>
			</div>


	<input type="button" class="confirm_button" id="confirm_button" value="신청서 제출🙂" onclick="send(this.form)">
	<input type="button" class="cancel_button" id="cancel_button" value="취 소😟" onclick="location.href='Login.jsp'">
	
	
		</form>
	</div>
	
	<script>
		document.getElementById("confirm_button").addEventListener('mouseover', function(){
			document.getElementById("confirm_button").setAttribute('value','가입할까요? 😁');
		});
		document.getElementById("confirm_button").addEventListener('mouseout', function(){
			document.getElementById("confirm_button").setAttribute('value','신청서 제출🙂');
		});
		
		document.getElementById("cancel_button").addEventListener('mouseover', function(){
			document.getElementById("cancel_button").setAttribute('value','취소하시게요? 😥');
		});
		document.getElementById("cancel_button").addEventListener('mouseout', function(){
			document.getElementById("cancel_button").setAttribute('value','취 소😟');
	});
	</script>
	
</body>
</html>