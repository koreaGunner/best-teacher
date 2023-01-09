<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="../js/baffle.min.js"></script>
	
	
	<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
      * {
         font-family: 'Noto Sans KR', sans-serif;
         margin:0;
         padding:0;
      }
      
      
      .header_top {
         width:100%;
         height:50px;
         margin:0 auto;
         border-bottom:1pt solid #CEDAE4;
         
      }
   
      #header_header {
         width:100%;
         margin:0 auto;
         height:70px;
      }
   
      #header_mainMenu {
         width:100%;
         margin:0 auto;
         height:41px;
         color:black;
         font-weight:500;
         border-bottom:1px solid #CEDAE4;
         border-top:1pt solid #CEDAE4;
      }
      
      /* 코리아IT아카데미 아이콘*/
      .top_header_image {
         position:absolute;
         left:360px;
         top:5px;
         cursor:pointer;
      }
      
      /* 최강선생 아이콘 */
      .header_image {
         position:absolute;
         left:350px;
         top:60px;
         cursor:pointer;
      }
      
      /* 로그인 헤더 문구 위치 */
      .header_center1 {
         position:absolute;
         left:740px;
         top:73px;
         font-size:20px;
      }
      
      
      /* 로그인/회원가입 버튼 위치*/
      .header_top-menu1 {      
         position:absolute;
         top:66px;
         right:380px;
      }
      
      /* 로그인/내정보 이미지 위치 */
      .login_image {
         position:absolute;
         right:120px;
         cursor:pointer;
      }
      
      /* 회원가입/로그아웃 이미지 위치 */
      .join_image {
         position:absolute;
         right:40px;
         cursor:pointer;
      }
      
      /* 알림 (종) 아이콘 위치*/
      .header_alarm {      
         position:absolute;
         top:67px;
         right:583px;
         cursor:pointer;
         width:37px;
      }
      
      /* 최상위 공지사항 위치*/
      .header_notice {      
         position:absolute;
         top:11px;
         right:380px;
         font-size:15px;
        
      }
      
      /* 메인페이지 메인메뉴 위치 */
      .header_main-menu {
         position:absolute;
         top:123px;
         left:360px;
      }
      
      /* 메인메뉴 라인 색상*/
      ul.login > li { float:left; padding:0 30px; width:120px; height:40px; line-height:10px; font-size:19px; text-align:center; cursor:pointer;}
      ul.login > li:hover { font-weight:500; color:white; background:linear-gradient(#5D64DB, #2730C1);}
      ul.login > li > span { line-height:35px; }

      ul, ol, li {list-style:none; margin:0; padding:0;}
      
      
      ul.header_beforeLogin > li > span { margin:0; padding:0; cursor:pointer;}
      ul.header_beforeLogin > li > span:hover { font-weight:900; }
      
      ul.header_beforeLogin > li ul.submenu { display:none; position:absolute; top:45px; right:1px; height:200px; border-radius:10px; background-color:transparent; cursor:pointer;}
      ul.header_beforeLogin > li:hover ul.submenu { display:block;}
      
      
      
      ul.header_beforeLogin > li ul.submenu > li { display:inline-block; width:155px; padding:5px 10px; text-align:left; background-color:white; border:1px solid #B0D1E0;font-size:20px; left:1px; border-radius:10px; line-height:40px;}
      ul.header_beforeLogin > li ul.submenu > li:hover { background:linear-gradient(#5D64DB, #2730C1); color:white; font-weight:600;}
      ul.header_beforeLogin > li ul.submenu > li:nth-child(1){ border-bottom:1px #A1C1DF solid;}
    
    
    
       /* top 버튼 */
       #back-to-top {
         position: fixed;
         bottom: 3em;
         right: 3em;
         background-color: rgba(255, 255, 255, .9);
         color: #313943;
         border: none;
         border-radius: 5px;
         padding: 1em;
         text-transform: uppercase;
         cursor: pointer;
         font-weight: 700;
         box-shadow: 0 0 2em 0 rgba(0, 0, 0, .25);
         transition: all .3s ease-in-out;
         display: inline-block;
         opacity: 0;
         text-decoration: none;
         font-size: 1em;
      }

       #back-to-top:hover {
           background-color: #fff;
           padding: 1em 3em;
       }

         #back-to-top.visible {
             opacity: 1;
         }
         

	
	</style>
	
</head>
<body>
<!-- 최상위 헤더 ============================== -->
<div class="header_top">
	<img class="top_header_image" src="/ZV2Project/img/top_header_icon.png" onclick="location.href='https://www.koreaisacademy.com'">
	 <p class="header_notice"><MARQUEE direction="up" scrolldelay="200" scrollamount="2">3조 웹프로젝트 - 최강선생(과외 매칭 사이트)</MARQUEE></p>
</div>

<!-- 상위 헤더 ============================== -->
	<div id="header_header">
		<div class="header_top-menu1">
			<ul class="header_beforeLogin">
			
		<c:if test="${ empty user }"> <!--  로그인 전 화면 출력---------------------------------------------------- -->
				<img class="login_image" src="/ZV2Project/img/login.png" onclick="loginMain();">
				<li><img class="join_image" src="/ZV2Project/img/join.png">
					<ul class="submenu">
						<li onclick="location.href='/ZV2Project/user/join_teacher.jsp'">선생님 회원가입</li> 
						<li onclick="location.href='/ZV2Project/user/join_student.jsp'">학생 회원가입</li> 
					</ul>
				</li>
		</c:if>
		
		<c:if test="${ !empty user }"> <!--  로그인 후 화면 출력---------------------------------------------------- -->
			<li><img class="login_image" src="/ZV2Project/img/mypage.png" onclick="mypage();"></li>
			<li><img class="join_image" src="/ZV2Project/img/logout.png" onclick="logout();"></li>
		</c:if>
			</ul> 
		</div>
		
		
		<main>
			<section class="section--1">
				<h3 class="text__glitch header_center1">최강선생은 최선의 결과를 만들어냅니다 🙌</h3>
			</section>
		</main>

		<img class="header_image" src="/ZV2Project/img/header_icon.png" onclick="location.href='/ZV2Project/Main_page.jsp'">
	</div>



<!-- 메인메뉴================================ -->
	<div id="header_mainMenu">
		<div class="header_main-menu">
			<ul class="login">
		      <li><span onclick="location.href='/ZV2Project/search/TeacherListFirst.do'">선생님 찾기</span></li>
		      <li><span onclick="location.href='/ZV2Project/search/StudentListFirst.do'">학생 찾기</span></li>
		      <li><span onclick="location.href='/ZV2Project/jisik/jisik_list.do'">지식인</span></li>
		      <li><span onclick="location.href='/ZV2Project/reference/reference.do'">자료실</span></li>
		      <c:if test="${ empty user }">
		      	<li><span onclick="dialogue_list_not_login();">1:1 대화</span></li>
		      </c:if>
		      <c:if test="${ !empty user }">
		      	<li><span onclick="dialogue_list_login();">1:1 대화</span></li>
		      </c:if>
		    </ul>
		
		</div>
	</div>
	
	<a id="back-to-top" href="#">🖕 Top</a>
	
	
<!-- 스크립트가 BODY 안에 있음.-------------------------------------------------------- -->
	<script>
	
	document.onkeydown = function(e) {
        var evtK = (e) ? e.which : window.event.keyCode;
        var isCtrl = ((typeof isCtrl != 'undefiend' && isCtrl) || ((e && evtK == 17) || (!e && event.ctrlKey))) ? true : false;
       
        if((isCtrl && evtK == 82) || evtK == 116){
                  if(e){
                             evtK = 505;
                  }else{
                             event.keyCode = evtK = 505;
                  }
        }
         
        if(evtK == 505){
                  location.reload(location.href);
                  return false;
        }
}
	
		function loginMain(){
			var path = window.location.pathname;
			var page = path.split("/").pop();
			var param = window.location.search;
			var real_path = encodeURI(encodeURIComponent(path + param));
				
			
			location.href = "/ZV2Project/Login.jsp?path=" + real_path;
			
		}
	
		function logo_click() {
			location.href = "Main_header.jsp";
		}
		
		function mypage(){
			var login_id = "${user.id}";
			location.href="/ZV2Project/user/mypage.do?id=" + login_id;
		}
		
		function logout(f){
			var path = window.location.pathname;
			var page = path.split("/").pop();
			var param = window.location.search;
			var real_path = '';
			if( '${user.id}' == null ){
				
				alert('이미 로그아웃 했습니다.');
				return;
			}
			
			if(!confirm("로그아웃 하시겠습니까?")){
				
				return;
			}
			if( param.includes('jjim=jj') || param.includes('mylist=my') ){
				
				real_path = path;
				
			}else{
				
				real_path = path + param;
			}
			
			if( path.includes('mypage.do') || path.includes('dialogue_room.do') || path.includes('dialogue_list.do')
					|| path.includes('mypage_edit.do') ){
				
				real_path = '/ZV2Project/Main_page.jsp';
			}
			alert("로그아웃 되었습니다.");
			location.href = "../logout.do?path="+real_path;
		}
		
		
		$(function(){
			var text = baffle(".text__glitch");
			text.set({
				characters: "█▓█ ▒░/▒░ █░▒▓/ █▒▒ ▓▒▓/█ ░█▒/ ▒▓░ █<░▒ ▓/░>",
				speed: 120
			});
			text.start();
			text.reveal(4000);
			setInterval(function(){
				text.start();
				text.reveal(4000);
			},4000);
			
		});
		
		
		var btt = document.getElementById('back-to-top');
		var docElem = document.documentElement,	//문서자체를 가져옴
		offset,
		scrollPos,
		docHeight;
		docHeight = Math.max(docElem.scrollHeight, docElem.offsetHeight);
		window.addEventListener('scroll',function(){
			
			
			//scrollPos = docElem.scrollTop; //-->scrollTop : 스크롤값 받아옴
			if(docHeight != 'undefined'){ //docHeight값이 없지 않으면
				offset = 10;
				
			}
			
			
			scrollPos = docElem.scrollTop;
			
			btt.className = (scrollPos > offset) ? 'visible': '';
			
			
		});
		
		btt.addEventListener('click', function(ev){
			ev.preventDefault();//링크의 본연의 기능을 막는다.
			//docElem.scrollTop = 0;
			scrollToTop();
		});
		
		function scrollToTop(){
			// 일정시간 마다 할일
			// var scrollInterval = setInterval(할일,시간);
			// 할일 = function(){ 실제로 할일 }
			// 윈도우 스크롤이 0이 아닐때 실제로 할일 window.scrollBy(0, -55);
			// 스크롤이 0이면 setInterval 멈춰라. clearInterval(이름);
			
			var scrollInterval = setInterval(function(){
				if(scrollPos > 0){
					window.scrollBy(0, -1000);
				}else{
					clearInterval(scrollInterval);
				}
			}, 10);
			
		}
		
		function dialogue_list_not_login(){
			alert("로그인 부탁드립니다.");
			loginMain();
		}
		
		function dialogue_list_login(){
			var login_id = "${user.id}";
			location.href="/ZV2Project/user/dialogue_list.do?id=" + login_id;	
		}
		
	</script>
<!-- 스크립트 끝------------------------------------------------------------------- -->

</body>
</html>