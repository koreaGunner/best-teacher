<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>최강선생 | 선생님 회원가입</title>
	
	<!-- Ajax 사용을 위한 js 참조 -->
	<script src="../js/httpRequest.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="../js/modal.js"></script>
	<script type="text/javascript">
		var city_all = "";
		var city_res = "";
		
		var pwdCheck = false;	//비밀번호 동일여부 판단 (0: 틀림, 1: 같음)
		var hashtag_checked = 0;  //현재 해시태그 선택한 갯수
		var subject_checked = 0;
		var area_checked = 0;
		var pageHeight = 700; // top버튼 눌렀을때의 빠르기. (각 페이지 마다 설정해야함)
		var area_cnt = 0; //과외지역 선택 갯수
		var area_total; //과외지역 json 넣을 변수. (갯수 판단을 위해 밖으로 뺌)
		var edu_area_cnt = 0;  //과외가능지역 선택갯수
		var upload_video_cnt = [0,0,0,0,0]; //강의영상 올렸는지 판단할 배열
		var upload_video_yn = 0; //강의영상 올렸는지 판단할 변수
		
		var time = 180; //기준시간 작성 (3분)
		var min = ""; //분
		var sec = ""; //초
		var x;
		
		
		$(function(){
			var phone_all = "${teacher_all_info[0].phone}";
			var phone = phone_all.split('-');
			console.log(phone[1]);
			document.getElementById('phone2').value = phone[1];
			document.getElementById('phone3').value = phone[2];
			
			city_all =  "${teacher_all_info[0].addr}";
			city_res = city_all.split(' ');
			
			
			$('#city').val(city_res[0]).prop("selected",true);
            areaChange_edit(city_res[0]);
			
			
			var option = $("<option value='" + city_res[1] + "'>"+city_res[1]+"</option selected>");
            $('#country').append(option);
            
            
            var area_all = "${teacher_all_info[0].area}";
            var area_res = area_all.split(',');		// '서울 광진구','서울 강남구', '서울 강북구' ...
            for(var i = 0 ; i < area_res.length ; i++){
            	$("#area_remind").append("<label class='modal_result'><input type='checkbox' disabled checked><span>" + area_res[i] + "</span></label>");
            	edu_area_cnt++;
            }
            
            
            $("input[name='mbti'][value='${teacher_all_info[0].mbti}']").prop("checked",true);
            
            
            var subject_all = "${teacher_all_info[0].subject}";
            console.log('밑에 과목');
            console.log(subject_all);
            var subject_res = subject_all.split(', ');
            console.log(subject_res);
            
            for(var i = 0 ; i < subject_res.length ; i++){
            	var subject_name = subject_res[i];
            	$("input[name='subject'][value='" + subject_name + "']").prop("checked",true);
            	subject_checked++;
            }
            
            var hashtag_all = "${teacher_all_info[0].hashtag}";
            var hashtag_res = hashtag_all.split(', ');
            
            for(var i = 0 ; i < hashtag_res.length ; i++){
            	var hashtag_name = hashtag_res[i];
            	$("input[name='hashtag_field'][value='" + hashtag_name + "']").prop("checked",true);
            	hashtag_checked++;
            }
		});
	
		
		
	      
		/* 제출버튼 클릭 시 최종 데이터 검증 */
		function send(f) {
			/* USER_TOTAL 테이블 내용 */
			var pw = f.upwd.value.trim();
			var name = f.name.value.trim();
			var phone1 = f.phone1.value.trim();
			var phone2 = f.phone2.value.trim();
			var phone3 = f.phone3.value.trim();
			
			/* USER_TEACHER 테이블 내용 */
			//var profile = f.profile.value.trim();
			var city = f.city.value.trim();
			var country = f.country.value.trim();
			var gender = f.gender_yn.value.trim();
			var pre = f.pre_yn.value.trim();
			var mbti = f.mbti.value.trim();
			var introduce = f.introduce.value.trim();
			var video = f.video_yn.value.trim();
			var pre_yn = f.pre_yn.value.trim();
			
			
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
			
				
			if ( phone2 =='' || phone3 ==''){
				alert("연락처좀 여쭤봐도 될까요?");
				document.form1.phone2.focus();
				return;	}
			
			if ( city == '' || country == '-------'){
				alert("거주지가 어디신가요??");
				document.form1.city.focus();
				return;	}
			
			if (edu_area_cnt == 0){
				alert("과외 지역을 정해주셔야 학생과 매칭이 가능합니다 ㅠㅠ");
				document.form1.edu_area.focus();
				return;	}
			
			if ( gender ==''){
				alert("성별을 선택해주세요.");
				document.form1.gender_man.focus();
				return;	}
			
			if ( video ==''){
				alert("비대면 수업(화상채팅) 가능여부를 선택해주세요!");
				document.form1.video_y.focus();
				return;	}	
			
			if ( pre ==''){
				alert("시범강의 가능여부를 선택해주세요!");
				document.form1.pre_y.focus();
				return;	}
				
			if ( mbti ==''){
				alert("MBTI좀 알려주시겠어요?");
				document.form1.pre_y.focus();
				return;	}	
			
			if ( subject_checked == 0 ){
				alert("수업 가능한 과목을 선택해주세요!");
				document.form1.subject_checked.focus();
				return;	}			
			
			if ( hashtag_checked == 0 ){
				alert("선생님의 강의 스타일을 선택해주세요.");
				document.form1.hashtag_field.focus();
				return;	}
			
			if ( introduce ==''){
				alert("멋진 자기소개 부탁드립니다~");
				document.form1.introduce.focus();
				return;	}
			
			
			f.enctype = "multipart/form-data";
			f.method = 'post';
			f.action="teacher_edit.do"; //jsp로 보내는게 아니라 서블릿으로 보내야한다.
			alert("정보가 수정되었습니다! 😉");
			f.submit();
		}

//----------------------------------------------------------------------------------------------------------------
		//프로필사진 
		function loadFile(input) {
			pathpoint = input.value.lastIndexOf('.');
			filepoint = input.value.substring(pathpoint+1,input.length);
			filetype = filepoint.toLowerCase();
			if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						document.getElementById('preview_').style.display = "none";
						document.getElementById('preview').src = e.target.result;
					};
					reader.readAsDataURL(input.files[0]);
				} else {
					document.getElementById('preview').src = "../img/account.png";
				}
			}
			else {
				alert('이미지만 업로드 가능합니다.');
				parentObj  = input.parentNode
				node = parentObj.replaceChild(input.cloneNode(true),input);
				document.getElementById('preview').src = "../img/account.png";
				return false;
			}
		};
		

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
	    

//---------------------------------------------------------------------------------------------------------------------
/* 지역 선택 리스트박스 함수 ================================================*/
		function areaChange(form) {
	
			var p_city = document.getElementById("city").value;
			var url = "showarea.do";
			var param = "city=" + p_city;
			sel = form.country;
			sendRequest(url, param, result_City, "GET");
		}
		
		function result_City(data){
			if(xhr.readyState == 4 && xhr.status == 200) {
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
		
		
		
		function areaChange_edit(city) {
			
			var url = "showarea.do";
			var param = "city=" + city;
			
			sendRequest(url, param, result_City_edit, "GET");
		}
		
		function result_City_edit(data){
			if(xhr.readyState == 4 && xhr.status == 200) {
				var data = xhr.responseText;
				var json = eval(data);	//json으로 받음.
				var jsonObj = JSON.parse(data); 
				var arr = [];	//배열로 전환.
				seld = document.getElementById('select_country');
				arr[0] = "-------";
				for(var i = 0 ; i < json.length ; i++){
					arr[i+1] = json[i].country;
					
				}
				
				for (i=seld.length; i>=1; i--){
					seld.options[i] = null;
				}
				
				/* 옵션박스추가 */
				for (i=0; i < arr.length;i++){
					seld.options[i] = new Option(arr[i], arr[i]);
					if (arr[i] == city_res[1]){
						seld.options[i].selected = true;
					}
				}
				
			}
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
		
//과외지역 선택 갯수 카운트==============================================
		function area_check(){
			  // 전체 체크박스
			  const checkboxes = document.querySelectorAll('input[name="area_country"]');
			  // 선택된 체크박스
			  const checked = document.querySelectorAll('input[name="area_country"]:checked');
			  // select all 체크박스
			  
			  const selectAll = document.querySelector('input[name="area_country_all"]');
			  
			  if(checkboxes.length === checked.length)  {
			    selectAll.checked = true;
			  }
			  
			  else {
			    selectAll.checked = false;
			  }
			  
			  
		}

//과외과목 선택 갯수 카운트==============================================
		function subject_check(field){
			if(field.checked)
				subject_checked += 1;
			else 
				subject_checked -= 1;
		}
		
		
//강의 영상 업로드====================================================
		function video_file_edit(input, cnt){
			var reader = new FileReader();
			reader.onload = function(e) {
			};
			reader.readAsDataURL(input.files[0]);
		}
	
		function load_video_File(input, cnt) {
			pathpoint = input.value.lastIndexOf('.');
			filepoint = input.value.substring(pathpoint+1,input.length);
			filetype = filepoint.toLowerCase();
			
			if(filetype=='wmv' || filetype=='avi' || filetype=='mp4' || filetype=='mpg' || filetype=='mov' || filetype=='') {
				upload_video_cnt[cnt] = "a";
				
				if(filetype=='')
					upload_video_cnt[cnt] = 0;
				
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
					};
					reader.readAsDataURL(input.files[0]);
				}
				
				else {
				}
			}
			
			else {
				alert('동영상만 업로드 가능합니다.');
				upload_video_cnt[cnt] = 0;
				if(cnt == 1) {
					$("#video_upload0").remove();
					$("#video_div_st").append("<input type='file' id='video_upload0' name='video_upload0' class='input_file_cls' accept='video/*' onchange='load_video_File(this)' required>");
				}
				else if(cnt == 2) {
					$("#video_upload1").remove();
					$("#video_div_st").append("<input type='file' id='video_upload1' name='video_upload1' class='input_file_cls' accept='video/*' onchange='load_video_File(this)' required>");
				}
				else if(cnt == 3) {
					$("#video_upload2").remove();
					$("#video_div_st").append("<input type='file' id='video_upload2' name='video_upload2' class='input_file_cls' accept='video/*' onchange='load_video_File(this)' required>");
				}
				else if(cnt == 4){
					$("#video_upload3").remove();
					$("#video_div_st").append("<input type='file' id='video_upload3' name='video_upload3' class='input_file_cls' accept='video/*' onchange='load_video_File(this)' required>");
				}
				else if(cnt == 5) {
					$("#video_upload4").remove();
					$("#video_div_st").append("<input type='file' id='video_upload4' name='video_upload4' class='input_file_cls' accept='video/*' onchange='load_video_File(this)' required>");
				}
			}
		}
		
		function delete_video_file(){
			if (confirm("첨부된 파일을 전체 삭제하시겠습니까?")) {
				upload_video_cnt = [0,0,0,0,0];
				$("#video_div_st").empty();
				$("#video_div_st").append("<input type='file' id='video_upload0' name='video_upload0' class='input_file_cls' accept='video/*' onchange='load_video_File(this)' required>");
				$("#video_div_st").append("<input type='file' id='video_upload1' name='video_upload1' class='input_file_cls' accept='video/*' onchange='load_video_File(this)' required>");
				$("#video_div_st").append("<input type='file' id='video_upload2' name='video_upload2' class='input_file_cls' accept='video/*' onchange='load_video_File(this)' required>");
				$("#video_div_st").append("<input type='file' id='video_upload3' name='video_upload3' class='input_file_cls' accept='video/*' onchange='load_video_File(this)' required>");
				$("#video_div_st").append("<input type='file' id='video_upload4' name='video_upload4' class='input_file_cls' accept='video/*' onchange='load_video_File(this)' required>");
			}
			else {
				return;
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
		 /* background: linear-gradient(white, #243b55); */
		 background: white;
		 
		}
		
		/* 제일 바깥 네모 라인 */
		.form {
			position: absolute;
			top: 23%;
			left: 53%;
			width: 850px;
			padding: 40px;
			transform: translateX(-50%);
			box-sizing: border-box;
			border-radius: 10px;
			min-height:6800px;
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
		
/* ---------------------------------------------------------------------------------------------------*/
		/* 프로필 사진 틀 조정 */
		.photo_box {
			position:relative;
			left:31%;
			margin-top:30px;
			width: 250px;
		    height: 250px;
		    border-radius:70%;
		    overflow: hidden;
		    float:left;
	   		justify-content: center;
	   		border:1px solid grey;
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
		
		.label_st {
			cursor:pointer;
			position:absolute;
			top:350px;
			left:308px;
			z-index:1;
		}
/*-------------------------------------------------------------------------------------------------*/
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
		
		/* 과외 가능지역 modal ----------------------------------------------------------------------------------------------------------------*/
		#modal {
		   position: fixed;
		   top:0; left: 0;
		   width: 2000px;
		   height: 6000px;
		   display: none;
		   background-color: rgba(0, 0, 0, 0.5);
		}
			#modal.show{
		      display:block;
		   }
		
		.btn-open-popup {
			border-radius:10px;
			border:1px solid #EDD3ED;
			font-size:22px;
			text-weight:bold;
			background:#D3D5F5;
			text-align:center;
			width:300px;
			height:51px;
			letter-spacing:2px;
			cursor:pointer;
		}
		
		.btn-open-popup:hover {
			background:#8287D5;
			font-weight:600;
			color:white;
		}
		
		
		#real_modal {
			display:none;
		   position: fixed;
		   width: 900px;
		   height: 600px;
		   transform: translate(-50%, -50%);
		   top: 30%;
		   left: 50%;
		   padding: 30px 5px 30px 30px;
		   background-color: rgb(255, 255, 255);
		   border-radius: 20px;
		   box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
		}
		
		#real_modal.show{
		      display:block;
		   }
		
		#real_modal > .modal_header {
		   
		}

		#real_modal > .modal_header > p {
		   color: red;
		   font-weight: bold;
		}
		
		#modal_body {
		   position: relative;
		   left: 49%;
		   transform: translateX(-50%);
		   width: 100%;
		   height: 550px;
		   overflow: auto;
		}
		
		#modal_body > div {
		   /* border: 1px red solid; */
		   padding-bottom:30px;
		   width: 94%;
		   min-height: 100px;
		}
		
		#modal_body > .modal_go_soc{
		   border:none;
		}

		#modal_body > div > .modal_sub_header{
		   margin: 0px 0 20px 30px;
		   text-align:left;
		}
		
		
		.header_radio input[type="radio"]+span {
			display: inline-block;
		   	width: 60px;
		   	background: none;
		   text-align: center;
		   height: 40px;
		   margin: 20px 0 2px 2px;
		   font-size: 20px; 
		   cursor: pointer;
		   line-height: 50px;
		}
		
		.header_radio input[type="radio"]:checked+span {
			color:#8389E0;
		}
		
		.header_radio input[type="radio"]:hover+span {
			color:#8389E0;
		}
		
		 
		.header_radio input[type="radio"]{
		 	display:none;
		}
		
		#modal_body > div >.modal_subject {
		   border-top:1px solid #D9D9D9;
		   text-align:left;
		   margin-left:40px;
		}
		
		

		#modal_body > div > .modal_subject> .box-radio-input input[type="checkbox"] {
		   display: none;
		}
		
		#modal_body > div > .modal_subject > .box-radio-input input[type="checkbox"]+span
		{
		   display: inline-block;
		   width: 108px;
		   background: none;
		   border: 1px solid #eeeeee;
		   color: #aaaaaa;
		   padding: 0px 10px;
		   text-align: center;
		   height: 45px;
		   margin: 15px 10px;
		   font-size: 20px; 
		   font-weight: 600;
		   cursor: pointer;
		   line-height: 45px;
		}

		#modal_body > div > .modal_subject > .box-radio-input input[type="checkbox"]:checked+span
		   {
		   border: 1px solid #2673F0;
		   /* background:#2673F0; */
		   color: #2673F0;
		}

		#modal_end{
		   width:100%;
		   height:80px;
		}
		
		#modal_end > .box-button-input > input[type="button"]{
		   display: none;
		}

		#modal_end > .box-button-input > input[type="button"] + span{
		   display: inline-block;
		   width: 130px;
		   background: none;
		   border: 1px solid #dfdfdf;
		   color: black;
		   padding: 0px 10px;
		   text-align: center;
		   height: 50px;
		   font-size: 20px; 
		   font-weight: 500;
		   cursor: pointer;
		   line-height: 50px;
		   float:center;
		   margin:15px 10px 0 10px;
		}
		
		.modal_result input[type="checkbox"] {
			display:none;
		}
		
		.modal_result input[type="checkbox"]+span {
			display: inline-block;
			font-size:15px;
			width: 88px;
			background: none;
			border: 1px solid #007AAE;
			color: #007AAE;
			padding: 0px 5px;
			text-align: center;
			height: 30px;
			margin: 5px -13px 0 23px;
			line-height: 30px;
			border-radius:10px;
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
			width: 120px;
			background: none;
			border: 1px solid #ABABAB;
			color: #ABABAB;
			padding: 0px 5px;
			text-align: center;
			height: 50px;
			margin: 11px 17px;
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
		
		
		
		/* 업로드 할 강의영상 전체 틀 */
		.video_list {
			position:absolute;
			left:8%;
			height:250px;
			margin-top:15px;
			font-size:25px;
		}
		
		.video_list .video_list_title{
			position:relative;
			float:left;
			background:#D1DDD4;
			width:200px;
			border:1px solid #D1DDD4;
			height:250px;
			line-height: 250px;
		}
		
		.video_div_st {
			position:relative;
			float:left;
			text-align:left;
			width:400px;
			height:250px;
			border:1px solid #D9D9D9;
			padding:0 10px;
		}
		
		.input_file_cls {
			cursor:pointer;
			font-size:18px;
			margin-bottom:15px;
		}
		
		
		.introduce_box {
			resize: none;
			margin-top:10px;
			height:300px;
			width:610px;
			font-size:20px;
			border: 1px solid black;
			padding:5px 10px;
		}
		
		
	</style>
</head>

<body>
<jsp:include page="../Main_header.jsp"></jsp:include>

<div id="modal">
</div>
	<div class="form">
		<h1> ::: 최강선생 선생님 가입신청서  ✌️ :::</h1>
		
		<form class="title" name=form1 >
			<div class="hangmok">
				<h2>🔹 프로필 사진 등록하기(선택)</h2>
		        <div class="photo_box" id="photo_box">
		        	<c:choose>
				        <c:when test="${teacher_all_info[0] eq null}">
					 		<img id="preview_" class="profile" src="../img/account.png"/>
					 	</c:when>
						<c:otherwise>
					 		<img id="preview_" class="profile" src="../upload/${teacher_all_info[0].profile}">
					 	</c:otherwise>
					 </c:choose>
					<img id="preview" class="profile" src="">
				</div>
		           	<label for="photo_upload" class="label_st">
		           		<span style="color:purple; text-decoration: underline;">프로필 사진 업로드</span>
		           		<input type="file" id="photo_upload" name="photo_upload" style="visibility: hidden; display:none;"  accept="image/*" onchange="loadFile(this)">
					</label>
			</div>
			
<!-- 아이디================================================ -->
			<div class="hangmok" style="margin-top:200px;">
				<h2>🔹 아이디를 적어주세요.</h2>
				<input type="text" name="id" id="id" class="textline" style="width:400px; background:grey;" value="${teacher_all_info[0].id}" readonly>
				<input type="button" name="jungbok_button" class="jungbok-check" value="중복확인" readonly>
			</div>
			
			
			
<!-- 비밀번호================================================ -->	
			<div class="hangmok">
				<h2>🔹 비밀번호를 적어주세요. </h2>
					<input type="password" name="upwd" id="pwd" class="textline" placeholder="비밀번호 입력" maxlength="20" required class="pass" oninput="checkPwd()" >
					<input type="password" name="psw-repeat" id="repwd" class="textline" placeholder="비밀번호 확인" maxlength="20" required class="pass" oninput="checkPwd()" >
					<p id="password_check" style="margin-top:10px;"></p>
			</div>
			
			
			
<!-- 이름================================================ -->				
			<div class="hangmok">
				<h2>🔹 이름이 무엇인가요?</h2>
				<input type="text" name="name" class="textline" value="${teacher_all_info[0].name}" maxlength="20">
			</div>
			
			
			
<!-- 닉네임================================================ -->				
			<div class="hangmok">
				<h2>🔹 닉네임을 정해주세요.</h2>
				<input type="text" name="nickname" id="nickname_text" class="textline" value="${teacher_all_info[0].nickname}" style="width:400px; background:grey;" readonly>
				<input type="button" class="jungbok-check" name="nickname_check" value="중복확인" readonly>
			</div>
			
			
			
<!-- 주민번호================================================ -->				
			<div class="hangmok">
				<h2>🔹 주민번호 앞자리를 적어주세요.</h2>
				<input type="text" id="idnumber" name="idnumber" class="textline" style="background:grey;" value="${teacher_all_info[0].idnumber}" readonly>
			</div>
			
			
			
<!-- 전화번호================================================ -->				
			<div class="hangmok">
				<h2>🔹 핸드폰 번호를 입력해주세요.</h2>
					<input type="text" id="phone1" name="phone1" maxlength=3 value="010" class="phoneline" readonly>
					<input type="text" class="phoneline" id="phone2" name="phone2" maxlength=4 size=2 oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" />
					<input type="text" class="phoneline" id="phone3" name="phone3" maxlength=4 size=2 oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" />
			</div>
			
			
			
<!-- 이메일================================================ -->				
			<div class="hangmok" style="position:relative;">
				<h2>🔹 이메일을 인증이 필요합니다.</h2>
					<input type="text" id="email_addr" name="email_addr"class="textline" style="position:absolute; width:370px; left:91px; top:40px; background:grey;" value="${teacher_all_info[0].emailaddr}" readonly>
					<input type="button" id="email_send_button" class="jungbok-check" style="position:absolute; right:90px; top:50px; width:140px;" value="인증완료" readonly>
					<div id="auth_timer" class="hidden"></div>
			</div>
			
			
			
<!-- 거주지 선택=============================================== -->
			<div class="hangmok">
				<h2>🔹 사는 지역이 어디신가요?</h2>
				<select id="city" name="city" size="1" class="area_selectline" onchange="areaChange(this.form)" onload="areaChange(this.form)">
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
				<select name="country" id="select_country" size="1" class="area_selectline">
					<option id="country" value=''></option>
				</select>				
			</div>
			
			
			
<!-- 과외 가능지역 선택========================================== -->		
			<div class="hangmok">
				<h2>🔹 과외 가능 지역이 어디신가요?</h2>
         		<input type="button" id="edu_area" name="edu_area"value="지역선택" class="btn-open-popup">
      					<div id="real_modal">
         					<div id="modal_body">
           						<div class="modal_cho">
               						<div class="modal_sub_header">
               							<h2> 지역 선택 </h2>
               							<h4 style="color:red;"> !지역별로 가능합니다. (타지역 선택불가)</h4>
               							<!-- 이 곳에 시/도 이름이 들어가야 함. -->
               							<label class="header_radio"><input type="radio"  id="seoul" value="서울" name="edu_city" onclick="areaList(this)"><span>서울</span></label>
               							<label class="header_radio"><input type="radio" id="gyunggi" value="경기" name="edu_city" onclick="areaList(this)"><span>경기</span></label>
               							<label class="header_radio"><input type="radio" id="busan" value="부산" name="edu_city" onclick="areaList(this)"><span>부산</span></label>
               							<label class="header_radio"><input type="radio" id="incheon" value="인천" name="edu_city" onclick="areaList(this)"><span>인천</span></label>
               							<label class="header_radio"><input type="radio" id="gangwon" value="강원" name="edu_city" onclick="areaList(this)"><span>강원</span></label>
               							<label class="header_radio"><input type="radio" id="chungbuk" value="충북" name="edu_city" onclick="areaList(this)"><span>충북</span></label>
               							<label class="header_radio"><input type="radio" id="chungnam" value="충남" name="edu_city" onclick="areaList(this)"><span>충남</span></label>
               							<label class="header_radio"><input type="radio" id="gyungbuk" value="경북" name="edu_city" onclick="areaList(this)"><span>경북</span></label>
               							<label class="header_radio"><input type="radio" id="gyungnam" value="경남" name="edu_city" onclick="areaList(this)"><span>경남</span></label>
               							<label class="header_radio"><input type="radio" id="jeonbuk" value="전북" name="edu_city" onclick="areaList(this)"><span>전북</span></label>
               							<label class="header_radio"><input type="radio" id="jeonnam" value="전남" name="edu_city" onclick="areaList(this)"><span>전남</span></label>
               							<label class="header_radio"><input type="radio" id="gwangju" value="광주" name="edu_city" onclick="areaList(this)"><span>광주</span></label>
               							<label class="header_radio"><input type="radio" id="daejeon" value="대전" name="edu_city" onclick="areaList(this)"><span>대전</span></label>
               							<label class="header_radio"><input type="radio" id="daegu" value="대구" name="edu_city" onclick="areaList(this)"><span>대구</span></label>
               							<label class="header_radio"><input type="radio" id="ulsan" value="울산" name="edu_city" onclick="areaList(this)"><span>울산</span></label>
               							<label class="header_radio"><input type="radio" id="saejong" value="세종" name="edu_city" onclick="areaList(this)"><span>세종</span></label>
               							<label class="header_radio"><input type="radio" id="jeju" value="제주" name="edu_city" onclick="areaList(this)"><span>제주</span></label>
               						</div>
               						
               						<div class="modal_subject" id="modal_subject">
					                	<!--  이곳에 시/군/구 이름이 들어가야함.  -->	
					                </div>
               					</div>
               						
               				</div>
				               	<div id="modal_end">
				               		<label class="box-button-input">
										<input type="button" name="search_button" value="확인" class="search">
										<span>확인</span>
									</label>
				               	
									<label class="box-button-input">
										<input type="button" name="search_button" value="취소" class="cancel">
										<span>취소</span>
									</label>
								</div>
               			</div>
               		<div id="area_remind" style="margin-top:30px; text-align:left;"></div>
			</div>
		
		
		
<!-- 성별 묻기================================================ -->
			<div class="hangmok_check" style="margin-top:90px;">
				<h2>🔹 성별을 선택해주세요.</h2>
				<c:if test="${teacher_all_info[0].gender == '남자' }">
					<label for="gender_man" class="text_20">
						<input type="radio" checked id="gender_man" class="gender_checkline" name="gender_yn" value="남자"><span>남자</span>
					</label>
					<label for="gender_woman" class="text_20">
						<input type="radio" id="gender_woman" class="gender_checkline" name="gender_yn" value="여자" style="margin-left:90px;"><span>여자</span>
					</label>
				</c:if>
				<c:if test="${teacher_all_info[0].gender == '여자' }">
					<label for="gender_man" class="text_20">
						<input type="radio" id="gender_man" class="gender_checkline" name="gender_yn" value="남자"><span>남자</span>
					</label>
					<label for="gender_woman" class="text_20">
						<input type="radio" checked id="gender_woman" class="gender_checkline" name="gender_yn" value="여자" style="margin-left:90px;"><span>여자</span>
					</label>
				</c:if>
			</div>
		
		
		
<!-- 비대면 강의, 시범강의 가능여부================================ -->		
			<div class="hangmok_check">
				<h2>🔹 비대면 수업(화상 수업)이 가능 하신가요??</h2>
				<c:if test="${teacher_all_info[0].video_yn == '가능' }">
					<label for="video_y" class="text_20">
						<input type="radio" id="video_y" checked class="gender_checkline" name="video_yn" value="가능"><span>가능</span>
					</label>
					<label for="video_n" class="text_20">
						<input type="radio" id="video_n" class="gender_checkline" name="video_yn" value="불가능" style="margin-left:90px;"><span>불가능</span>
					</label>
				</c:if>
				<c:if test="${teacher_all_info[0].video_yn == '불가능' }">
					<label for="video_y" class="text_20">
						<input type="radio" id="video_y" class="gender_checkline" name="video_yn" value="가능"><span>가능</span>
					</label>
					<label for="video_n" class="text_20">
						<input type="radio" id="video_n" checked class="gender_checkline" name="video_yn" value="불가능" style="margin-left:90px;"><span>불가능</span>
					</label>
				</c:if>	
			</div>
			
			
			<div class="hangmok_check">
				<h2>🔹 시범강의 가능 하신가요??</h2>
				<c:if test="${teacher_all_info[0].pre_yn == '가능' }">
					<label for="pre_y" class="text_20">
						<input type="radio" id="pre_y" checked class="gender_checkline" name="pre_yn" value="가능"><span>가능</span>
					</label>
					<label for="pre_n" class="text_20">
						<input type="radio" id="pre_n" class="gender_checkline" name="pre_yn" value="시범불가능" style="margin-left:90px;"><span>불가능</span>
					</label>
				</c:if>
				<c:if test="${teacher_all_info[0].pre_yn == '불가능' }">
					<label for="pre_y" class="text_20">
						<input type="radio" id="pre_y" class="gender_checkline" name="pre_yn" value="가능"><span>가능</span>
					</label>
					<label for="pre_n" class="text_20">
						<input type="radio" id="pre_n" checked class="gender_checkline" name="pre_yn" value="시범불가능" style="margin-left:90px;"><span>불가능</span>
					</label>
				</c:if>
			</div>
			
			
			
<!-- MBTI 선택============================================== -->		
			<div class="hangmok">
				<h2>🔹 MBTI가 어떻게 되시나요?</h2>
				<div class="choose_subject">
					<label class="checkbox-input" ><input type="radio" name="mbti" value="ISTJ"> <span>ISTJ</span></label>
					<label class="checkbox-input"><input type="radio" name="mbti" value="ISFJ"> <span>ISFJ</span></label>
					<label class="checkbox-input"><input type="radio" name="mbti" value="ISTP"> <span>ISTP</span></label>
					<label class="checkbox-input"><input type="radio" name="mbti" value="ISFP"> <span>ISFP</span></label>
					<label class="checkbox-input"><input type="radio" name="mbti" value="INTJ"> <span>INTJ</span></label>
					<label class="checkbox-input"><input type="radio" name="mbti" value="INFJ"> <span>INFJ</span></label>
					<label class="checkbox-input"><input type="radio" name="mbti" value="INTP"> <span>INTP</span></label>
					<label class="checkbox-input"><input type="radio" name="mbti" value="INFP"> <span>INFP</span></label>
					<label class="checkbox-input"><input type="radio" name="mbti" value="ESTJ"> <span>ESTJ</span></label>
					<label class="checkbox-input"><input type="radio" name="mbti" value="ESFJ"> <span>ESFJ</span></label>
					<label class="checkbox-input"><input type="radio" name="mbti" value="ESTP"> <span>ESTP</span></label>
					<label class="checkbox-input"><input type="radio" name="mbti" value="ESFP"> <span>ESFP</span></label>
					<label class="checkbox-input"><input type="radio" name="mbti" value="ENTJ"> <span>ENTJ</span></label>
					<label class="checkbox-input"><input type="radio" name="mbti" value="ENFJ"> <span>ENFJ</span></label>
					<label class="checkbox-input"><input type="radio" name="mbti" value="ENTP"> <span>ENTP</span></label>
					<label class="checkbox-input"><input type="radio" name="mbti" value="ENFP"> <span>ENFP</span></label>
				</div>
			</div>
			
			
			
<!-- 수업 과목 선택============================================ -->			
			<div class="hangmok">
				<h2>🔹 수업 가능한 과목을 선택해주세요.</h2>
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
			
			
<!-- 선생스타일 ================================================ -->				
			<div class="hangmok">
				<h2>🔹 강의 스타일을 선택해주세요. (최대 3개)</h2>
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
			<div class="hangmok" style="margin-top:180px;">
				<h2>🔹 자기소개 부탁드립니다!</h2>
				<p><textarea cols="10" name="introduce" rows="10" class="introduce_box" placeholder="간단한 자기소개 부탁드려요!">${teacher_all_info[0].introduce}</textarea></p>
			</div>


	<input type="button" class="confirm_button" id="confirm_button" value="정보 수정🙂" onclick="send(this.form)">
	<input type="button" class="cancel_button" id="cancel_button" value="수정 취소😟" onclick="location.href='Login.jsp'">
		</form>
	</div>
	<script>
	//과외 가능지역 받아올때 필요
	
	const body = document.querySelector('body');
    const modal = document.querySelector('#modal');
    const btnOpenPopup = document.querySelector('.btn-open-popup');
    const cancel = document.querySelector('.cancel');
    const search = document.querySelector('.search');
    const modal_button = document.querySelector('.modal_label input[type="button"] + span');
    var real_modal = document.getElementById("real_modal");
    
		document.getElementById("confirm_button").addEventListener('mouseover', function(){
			document.getElementById("confirm_button").setAttribute('value','수정할까요?');
		});
		document.getElementById("confirm_button").addEventListener('mouseout', function(){
			document.getElementById("confirm_button").setAttribute('value','정보 수정🙂');
		});
		
		document.getElementById("cancel_button").addEventListener('mouseover', function(){
			document.getElementById("cancel_button").setAttribute('value','취소할까요?');
		});
		document.getElementById("cancel_button").addEventListener('mouseout', function(){
			document.getElementById("cancel_button").setAttribute('value','수정 취소😟');
	});
		
		
		btnOpenPopup.addEventListener('click', () => {
		      modal.classList.toggle('show');
		      var docElem = document.documentElement;
		      var scrollPos = docElem.scrollTop;
		      var now_top = 50 +  scrollPos + 'px';
		       
		      real_modal.classList.toggle('show');
		      real_modal.style.top = now_top;
		      
		      if (modal.classList.contains('show')) {
		        body.style.overflow = 'hidden';
		      }
		    });

		cancel.addEventListener('click', (event) => {
		      if (event.target === cancel) {
		        modal.classList.toggle('show');
		        
		        real_modal.classList.toggle('show');
		        if (!modal.classList.contains('show')) {
		          body.style.overflow = 'auto';
		        }
		      }
		    });
		
		
		
		search.addEventListener('click', (event) => {
		        edu_area_cnt = 1;
		        $("#area_remind").empty();
		        
		        if (event.target === search) {
		        	modal.classList.toggle('show');
		        	real_modal.classList.toggle('show');
		        	
		        	if (!modal.classList.contains('show')) {
		            	body.style.overflow = 'auto';
		        	}
		       	}
		        var checked_area_arr = [];
		        
		        $("input[name=area_country]:checked").each(function(){
		        	checked_area_arr.push($(this).val());
		        });
		   		
		        edu_area_cnt = checked_area_arr.length; // 체크한 수가 몇개인지 판단한다.
		        
		        $("input[name=area_country_all]:checked").each(function(){
		        	checked_area_arr[0] = $(this).val();
		        	edu_area_cnt = 1;	//전체를 체크한 경우 전체만 보여주면 되므로 반복을 1번만 하면 된다.
		        });
		        
		        
		        for(var i = 0; i < edu_area_cnt ; i++) {
		        	$("#area_remind").append("<label class='modal_result'><input type='checkbox' disabled checked><span>" + checked_area_arr[i] + "</span></label>");
		        }
		        console.log("고른 지역 수 : " + edu_area_cnt);
		      });
		
		
		    var edu_city;
		    
		    function areaList(city) {
				
				edu_city = city.value;
				var url = "selectarea.do";
				var param = "city=" + edu_city;
				sendRequest(url, param, resultCity, "GET");
			}
			
			
			function resultCity(data){
				if(xhr.readyState == 4 && xhr.status == 200) {
					var data = xhr.responseText;
					var json = eval(data);	//json으로 받음.
					var country_arr = [];	//배열로 전환.
					var city_arr = [];
					area_total = json.length;
					
					for(var i = 0 ; i < json.length ; i++){
						country_arr[i] = json[i].country;
						city_arr[i] = json[i].city;
					}
					
					$("#modal_subject").empty();
					
						$("#modal_subject").append("<label class='box-radio-input'><input type='checkbox' id='area_country_all' name='area_country_all' onclick='selectAll(this)' value='" + edu_city + " 전체" + "'><span>전체</span></label>");
					for (i=0; i < country_arr.length;i++){
						$("#modal_subject").append("<label class='box-radio-input'><input type='checkbox' class='area_country' name='area_country' onclick='area_check(this)' value='" + city_arr[i]+ " " + country_arr[i] + "'><span>"+ country_arr[i] +"</span></label>");
					}
				}
			}
			
			function selectAll(selectAll)  {
				const checkboxes = document.getElementsByName('area_country');
				  
				checkboxes.forEach((checkbox) => {
					checkbox.checked = selectAll.checked;
					area_cnt++;
				});
				
				console.log(area_cnt);
			}
			
			
			
			 
	</script>
	
</body>
</html>