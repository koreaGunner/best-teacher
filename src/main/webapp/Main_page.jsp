<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mainpage</title>
<link rel="stylesheet" href="css/jquery.fullPage.css">
<link rel="stylesheet" type="text/css" href="css/examples.css" />
<script src="js/baffle.min.js"></script>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	header{
		position: fixed;
		left:0;
		right:0;
		top:0;
		
		z-index: 100;
	}
	

	h1{
		font-size: 4em;
		font-family: arial,helvetica;
		color: #fff;
		margin:0;
		padding:0;
		}
		
		h1{
		font-size: 3em;
		font-family: arial,helvetica;
		color: #fff;
		margin:0;
		padding:0;
		}
		
		
	h3{
	 	font-size:2em;
	 	font-family: arial,helvetica;
		color: black;
		margin:0;
		padding:0;
	
	}
	h4{
	 	font-size:1em;
	 	font-family: arial,helvetica;
		color: #fff;
		margin:0;
		padding:0;
	
	}

	/* Centered texts in each section
	* --------------------------------------- */
	.section{
		text-align:center;
	}


	/* Backgrounds will cover all the section
	* --------------------------------------- */
	.section{
		background-size: cover;
	}
	.slide{
		background-size: cover;
	}

	/* Defining each section background and styles
	* --------------------------------------- */
	#section0 #first_img2{
		position:relative;
		width:100%;
		top:113px;
	}
	
	#section0 #first_img1{
		position: relative;
		top:160px;
		border:1px solid #dfdfdf;
	}
	
	#section1{
		background-color: #f5f5f5;
	}
	#section1 h1{
		top: 30%;
		transform: translateY(-50%);
		position: relative;
		
		color:black;
		font-size:50px;
		font-weight: 600;
	
	}
	
	#section1 h3{
		position: relative;
		top:25%;
		color:red;
		font-weight: 600;
	}
	
	#section2{
		
		background-image: url(imgs/jisik.png);
		background-size: 50% 50%;
		background-repeat: no-repeat;
		background-position: center 75%;
		opacity: 0;
	}
	
	#section2 h1{
		top: 25%;
		transform: translateY(-50%);
		position: relative;
		
		color:black;
		font-size:50px;
		font-weight: 600;
	}
	
	#section2 h3{
		top: 25%;
		transform: translateY(-50%);
		position: relative;
		
		color:black;
		font-size:25px;
		font-weight: 400;
	}
	
	
	#section3 #last_img{
		position: relative;
		top:75px;
	}
	

	/*Adding background for the slides
	* --------------------------------------- */
	#slide1{
		background-image: url(imgs/bg2.jpg);
		padding: 6% 0 0 0;
	}
	#slide2{
		background-image: url(imgs/bg5.jpg);
		padding: 6% 0 0 0;
	}
	#slide3{
		background-image: url(imgs/study.jpg);
		padding: 6% 0 0 0;
	}


	/* Bottom menu
	* --------------------------------------- */
	#infoMenu li a {
		color: #fff;
	}
	
	
	/* ----------------------------------------------------------------------- */
	
	#recomPro{ position: relative; top:350px; }
	#recomPro > div.inner{width:100%;margin:auto auto;}
	#recomPro .slideWrap{position:relative;overflow:hidden;height:350px;margin-bottom:28px;}
	#recomPro .slideWrap p.bg{position:absolute;top:33px;width:179px;height:350px;background:url("http://image.ssgdfs.com/images/newshin/bg_tic_01.png") no-repeat 0 0;
							 }
	#recomPro .slideWrap p.bg.side01{left:0px;}
	#recomPro .slideWrap p.bg.side02{right:-3px;background:url("http://image.ssgdfs.com/images/newshin/bg_tic_02.png") no-repeat 0 0;}
	#recomPro .slideWrap a.bxBtn{position:absolute;z-index:10;top:117px;margin:0;width:21px;height:39px;background:url("http://image.ssgdfs.com/images/newshin/btn_prev_01.png") no-repeat 0 0;text-indent:-9999px;}
	#recomPro .slideWrap a.bxBtn.bx-prev{left:179px;}
	#recomPro .slideWrap a.bxBtn.bx-next{left:auto;right:179px;background:url("http://image.ssgdfs.com/images/newshin/btn_next_01.png") no-repeat 0 0;}
	#recomPro .tickerSlide{position:absolute;top:0px;left:0px;overflow:hidden;-webkit-transition-timing-function: linear; /* Safari and Chrome */transition-timing-function: linear;}
	#recomPro .tickerSlide li{float:left;width:400px;padding:33px 0 0 0; 
							   margin-left: 15px;}

/* --------------------------------------------- */
	#recomPro .tickerSlide li > .content_box{
		width:300px;
		background-color: #ffffff;
		border-radius: 20px;
		height:300px;
		z-index: 300;
	}
	#recomPro .tickerSlide li > .content_box .content_profile_box{
		width:95%;
		height:100px;
		margin:0 auto;
		position:relative;
	}
	
	#recomPro .tickerSlide li > .content_box .content_profile_box .profile_img_box{
		position: absolute;
		display: inline-block;
		width:50px;
		height:50px;
		top:20px;
		left:10px;
		font-size: 40px;
		font-weight: 900;
		text-align: center;
		z-index: 500;
		
		
	}
	#recomPro .tickerSlide li > .content_box .content_profile_box .profile_box{
		width:100px;
		height:50px;
		position: absolute;
		display: inline-block;
		top:25px;
		left:70px;
		text-align: left;
	}
	
	.profile_box .profile_name{
		font-size: 20px;
		font-weight: 700;
		
	}
	
	.profile_box .profile_age{
		font-size: 13px;
	}
	
	.profile_star_box{
		width:200px;
		height:50px;
		position: absolute;
		display:inline-block;
		top:75px;
		left:45px;
		transform:translaetX(-50%);
		font-size: 20px;
	}
	
	.comment_box{
		margin:0 auto;
		width:90%;
		height:180px;
		text-align: left;
		padding:10px;
		font-size:14px;
		font-weight: bold;
		
	}
	
	
/* ---------------------------------------------------------------------- */	
      
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
         top:8px;
         cursor:pointer;
      }
      
      /* 로그인 헤더 문구 위치 */
      .header_center1 {
         position:absolute;
         left:740px;
         top:20px;
         font-size:20px;
         font-weight: 900;
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
     /*  .header_alarm {      
         position:absolute;
         top:14px;
         right:583px;
         cursor:pointer;
         width:37px;
      } */
      
      /* 최상위 공지사항 위치*/
      .header_notice {      
         position:absolute;
         top:11px;
         right:380px;
         font-size:15px;
         cursor:pointer;
      }
      
      /* 메인페이지 메인메뉴 위치 */
      .header_main-menu {
         position:absolute;
         top:71.5px;
         left:360px;
         font-family: "Noto Sans KR", sans-serif;
      }
      
      /* 메인메뉴 라인 색상*/
      ul.login > li { float:left; padding:0 30px; width:120px; height:40px; line-height:10px; font-size:19px; text-align:center; cursor:pointer;}
      ul.login > li:hover { font-weight:500; color:white; background:linear-gradient(#5D64DB, #2730C1);}
      ul.login > li > span { line-height:35px; }

      ul, ol, li {list-style:none; margin:0; padding:0;}
      
      ul.header_beforeLogin {position: absolute;
      						 top:-53px;}
      
      ul.header_beforeLogin > li > span { margin:0; padding:0; cursor:pointer;}
      ul.header_beforeLogin > li > span:hover { font-weight:900; }
      
      ul.header_beforeLogin > li ul.submenu {  font-family: "Noto Sans KR", sans-serif;
      										display:none; position:absolute; top:45px; right:1px; height:200px; border-radius:10px; background-color:transparent; cursor:pointer;}
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
	
<script src="js/jquery.fullPage.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('#fullpage').fullpage({
				verticalCentered: false,
				afterLoad: function(anchorLink, index){
					if( index == 2  ){
						 var moveType = 0;
						 var moveSpeed = 2000;
						 var moveWork = false;
						 var movePause = false;

						 function tkSlide(){  
						  var $tkSlide = $('#tickerSlide'),
						   $tkSlidePos = $('#tickerSlide').css('left').replace(/[^-\d\.]/g, ''),
						   $tkWidth = $('#tickerSlide').width(),
						   $tklength = $('#tickerSlide li').length,
						   $tkSlideW = $tkWidth + 400,
						   $tkitemW = $('#tickerSlide li').width(),
						   $tkitemFirst = $('#tickerSlide li:first-child');

						  $tkSlide.css({
						   'left' : $tkSlidePos,
						   'width' : $tkWidth + $tkitemW
						  });
						  if(moveWork==false){
						   if(moveType==0){
						    $tkSlide.css('left' ,$tkSlidePos);
						    $tkSlide.animate({left : -$tkitemW},{duration:moveSpeed, easing:"linear", step:function(){
						     if(movePause==true){
						      $tkSlide.stop();
						      }
						    }, complete:function(){
						     $tkSlide.append("<li>" + $('#tickerSlide li:first-child').html() + "</li>");
						     $('#tickerSlide li:first-child').remove();
						     $tkSlide.css('left' ,'0');
						     tkSlide();
						     }});
						   }
						  }
						 }
						 $('#tickerSlide').parent().on("mouseenter", function(){
						  movePause=true;
						 });
						 $('#tickerSlide').parent().on("mouseleave", function(){
						  movePause=false;
						  tkSlide();
						 });
						 $('.slideWrap >a.bxBtn').on('click', function(){
						  var $thisClass = $(this).hasClass("bx-prev");

						  if($thisClass){
						   for(var i=0;i<5;i++){    
						    var $tkSlide = $('#tickerSlide'),    
						    $tkitem = $('#tickerSlide li:last-child()').html();

						    $('#tickerSlide li:first-child()').before("<li>" + $tkitem + "</li>");
						    $('#tickerSlide li:last-child()').remove();
						   }
						   $tkSlide.animate({left : 200}, 500, function(){
						    $tkSlide.css('left' ,'0'); 
						   });
						  } else {
						   for(var i=0;i<5;i++){    
						    var $tkSlide = $('#tickerSlide'),    
						    $tkitem = $('#tickerSlide li:nth-child(1)').html();

						    $tkSlide.append("<li>" + $tkitem + "</li>");
						    $('#tickerSlide li:nth-child(1)').remove();
						   }
						   $tkSlide.animate({left : -200}, 500, function(){
						    $tkSlide.css('left' ,'0'); 
						   });
						   
						  }
						 });
						 tkSlide();
						
					}
					
					if( index == 3 ){
						$("#section2").stop().animate({opacity:1},500);
						
					}
				},
				onLeave:function(index, nextIndex, direction){
					if( index == 3 && (direction == 'down' || direction == 'up') ){
						$("#section2").css({opacity:0});
					}
				}
				
			});
		});
		

	</script>


</head>
<body>
	<header id="header">
	<div id="header_header">
		<div class="header_top-menu1">
			<ul class="header_beforeLogin">
			
		<c:if test="${ empty user }"> <!--  로그인 전 화면 출력---------------------------------------------------- -->
				<img class="login_image" src="img/login.png" onclick="loginMain();">
				<li><img class="join_image" src="img/join.png">
					<ul class="submenu">
						<li onclick="location.href='/ZV2Project/user/join_teacher.jsp'">선생님 회원가입</li> 
						<li onclick="location.href='/ZV2Project/user/join_student.jsp'">학생 회원가입</li> 
					</ul>
				</li>
		</c:if>
		
		<c:if test="${ not empty user }"> <!--  로그인 후 화면 출력---------------------------------------------------- -->
			<li><img class="login_image" src="img/mypage.png" onclick="mypage();"></li>
			<li><img class="join_image" src="img/logout.png" onclick="logout();"></li>
		</c:if> 
			</ul> 
		</div>
		
		
		<main>
			<section class="section--1">
				<h3 class="text__glitch header_center1">최강선생은 최선의 결과를 만들어냅니다 🙌</h3>
			</section>
		</main>


		
		<img class="header_image" src="img/header_icon.png" onclick="location.href='Main_page.jsp'">
	</div>



<!-- 메인메뉴================================ -->
	<div id="header_mainMenu">
		<div class="header_main-menu">
			<ul class="login">
		      <li><span onclick="location.href='search/TeacherListFirst.do'">선생님 찾기</span></li>
		      <li><span onclick="location.href='search/StudentListFirst.do'">학생 찾기</span></li>
		      <li><span onclick="location.href='jisik/jisik_list.do'">지식인</span></li>
		      <li><span onclick="location.href='reference/reference.do'">자료실</span></li>
		      <c:if test="${ empty user }">
		      	<li><span onclick="dialogue_list_not_login();">1:1 대화</span></li>
		      </c:if>
		      <c:if test="${ !empty user }">
		      	<li><span onclick="dialogue_list_login();">1:1 대화</span></li>
		      </c:if>
		    </ul>
		
		</div>
	</div>
	</header>
	<div id="fullpage">
	<div class="section " id="section0">
	
		<img src="img/first2.jpg" id="first_img2">
		<img src="img/first1.jpg" id="first_img1">
	
	</div>
	<div class="section" id="section1">
		<h3>수업 만족도 97.8%</h3>
		
		<h1>수강생의 목소리를 들어보세요</h1>
		
		<div class="recomPro" id="recomPro">
   <div class="inner">
    
    <div class="slideWrap">
     <a href="#none" class="bxBtn bx-prev">이전</a>
     <ul class="tickerSlide" id="tickerSlide">
      <li>
        
        <div class="content_box">
        	<div class="content_profile_box">
        		<div class="profile_img_box">
        			<div class="profile_img">😀</div>
        		</div>
        		
        		<div class="profile_box">
        			<div class="profile_name">김O운</div>
        			<div class="profile_age">고등학교 1학년</div>
        		</div>
        		
        		<div class="profile_star_box">
        			<div class="profile_star">
        				⭐⭐⭐⭐⭐
        			</div>
        		</div>
        	</div>
        	
        	<div class="comment_box">
        		
        			
        		우철선생님!! 수학 재밌게 잘 가르쳐 주셔서 감사합니다. 선생님 덕분에 8등급에서 3등급까지 올랐어요! 앞으로 1등급이 되는날까지 잘 부탁드리겠습니다! ㅎㅎ
        		댓글로도 토론이 가능하고 댓글에도 이미지를 삽입할 수 있으니 더욱 편하고 좋았습니다. 최강선생 너무만족해요!
        	
        	</div>
        
        </div>
       
      </li>
      <li>
       
         <div class="content_box">
        	<div class="content_profile_box">
        		<div class="profile_img_box">
        			<div class="profile_img">😁</div>
        		</div>
        		
        		<div class="profile_box">
        			<div class="profile_name">김O철</div>
        			<div class="profile_age">고등학교 3학년</div>
        		</div>
        		
        		<div class="profile_star_box">
        			<div class="profile_star">
        				⭐⭐⭐⭐⭐
        			</div>
        		</div>
        	</div>
        	
        	<div class="comment_box">
        		
        			처음 최강선생 사이트를 봤을때 선생님들의 학력이 없어서 솔직히 긴가민가 했었거든요. 근데 저에게 맞는 선생님을 색안경 끼지 않고 찾으니 성적도 오르고 공부가 재밌어졌습니다. 
        		
        	
        	</div>
        
        </div>
      </li>
      <li>
      
       <div class="content_box">
        	<div class="content_profile_box">
        		<div class="profile_img_box">
        			<div class="profile_img">😍</div>
        		</div>
        		
        		<div class="profile_box">
        			<div class="profile_name">임O현</div>
        			<div class="profile_age">고등학교 2학년</div>
        		</div>
        		
        		<div class="profile_star_box">
        			<div class="profile_star">
        				⭐⭐⭐⭐⭐
        			</div>
        		</div>
        	</div>
        	
        	<div class="comment_box">
        		
        			최강선생에서 학생분들에게 맞는 최고의 선생님을 찾아보세요! 학력만 따지지 않고, 선생님들의 과외영상을 보며 내게 맞는 스타일의 선생님을 찾아보세요. 저도 강의영상도 보고 1:1대화를 통해 저와 맞는 선생님에게 과외를 받았더니 성적이 많이 올랐습니다. 또 제가 풀고 싶은 문제도 자료실에 준비되어있으니 이보다 좋을수는 없겠죠!!
        		
        	
        	</div>
        
        </div>
       
      </li>
      <li>
      
        <div class="content_box">
        	<div class="content_profile_box">
        		<div class="profile_img_box">
        			<div class="profile_img">😋</div>
        		</div>
        		
        		<div class="profile_box">
        			<div class="profile_name">최O보</div>
        			<div class="profile_age">중학교 3학년</div>
        		</div>
        		
        		<div class="profile_star_box">
        			<div class="profile_star">
        				⭐⭐⭐⭐⭐
        			</div>
        		</div>
        	</div>
        	
        	<div class="comment_box">
        		
        			최강선생님에서는 '진짜' 선생님만을 만날 수 있었어요! 학생이 선생님을 판단하는 기준은 오로지 시범영상 뿐이었어요! 그렇기 때문에 더욱 수업스타일을 저와 맞추는데 집중할 수 있었고 그 어떤 과외보다도 높은 성적 향상을 얻을 수 있었습니다. 다양한 카테고리로 쉽게 검색이 가능하고 수업 외적으로도 좋은 자료를 얻을 수 있어서 좋았습니다. 
        		
        	
        	</div>
        
        </div>
       
      </li>
      <li>
      
        <div class="content_box">
        	<div class="content_profile_box">
        		<div class="profile_img_box">
        			<div class="profile_img">😃</div>
        		</div>
        		
        		<div class="profile_box">
        			<div class="profile_name">이O걸</div>
        			<div class="profile_age">고등학교 1학년</div>
        		</div>
        		
        		<div class="profile_star_box">
        			<div class="profile_star">
        				⭐⭐⭐⭐⭐
        			</div>
        		</div>
        	</div>
        	
        	<div class="comment_box">
        		
        			최강선생님에서는 특별한 게시판이있어요! 바로 지식인 게시판인데요 생각외로 알찬 기능덕에 많은 도움을 받았습니다. 제가 질문할 문제를 다 작성할 필요없이 이미지를 업로드하면 자동으로 훌륭하신 선생님들이 관련 내용을 검색했을때 제 질문이 뜨고 이런 간편하고 접근성 좋은 기능덕분에 빠른 답변과 양질의 정보를 쉽게 얻을 수 있었어요!
        		
        	
        	</div>
        
        </div>
       
      </li>
      <li>
      <div class="content_box">
        	<div class="content_profile_box">
        		<div class="profile_img_box">
        			<div class="profile_img">😆</div>
        		</div>
        		
        		<div class="profile_box">
        			<div class="profile_name">정O훈</div>
        			<div class="profile_age">재수생</div>
        		</div>
        		
        		<div class="profile_star_box">
        			<div class="profile_star">
        				⭐⭐⭐⭐⭐
        			</div>
        		</div>
        	</div>
        	
        	<div class="comment_box">
        		
        			최강선생은 확실한 선생님만 매칭해줘요! 분명히 잘 가르치는사람과 공부를 잘하는 사람은 구분되어져야하는게 맞다고 생각해요. 기존의 과외매칭사이트에서는 학벌순으로 선생님을 찾았다면 최강선생에서는 학벌블라인드&시범강의 제도로 인해 진짜 '실력'만을 보고 선생님을 고를 수 있었어요. 여러 선택카테고리와 빠른매칭 / 1대1 대화기능이 더욱 사이트 이용을 편하게 해주었어요! 
        		
        	
        	</div>
        
        </div>
       
        
      </li>
      <li>
       
        <div class="content_box">
        	<div class="content_profile_box">
        		<div class="profile_img_box">
        			<div class="profile_img">😀</div>
        		</div>
        		
        		<div class="profile_box">
        			<div class="profile_name">박O지</div>
        			<div class="profile_age">고등학교 1학년</div>
        		</div>
        		
        		<div class="profile_star_box">
        			<div class="profile_star">
        				⭐⭐⭐⭐⭐
        			</div>
        		</div>
        	</div>
        	
        	<div class="comment_box">
        		최강선생에서 경보선생님 만났어요! 최강선생 아니었으면 경보선생님을 만날수 없었을 거에요! 최강선생은 최선이 맞아요
        			최강선생에서 만난 과외선생님으로 성적이 많이 올랐습니다. 다른 과목 선생님도 최강선생에서 구해야 겠어요. 저에게 맞는 선생님을 찾을 수 있는 최강선생! 최곱니다.
        		
        	
        	</div>
        
        </div>
       
      </li>
      <li>
       
        <div class="content_box">
        	<div class="content_profile_box">
        		<div class="profile_img_box">
        			<div class="profile_img">😉</div>
        		</div>
        		
        		<div class="profile_box">
        			<div class="profile_name">김O</div>
        			<div class="profile_age">고등학교 1학년</div>
        		</div>
        		
        		<div class="profile_star_box">
        			<div class="profile_star">
        				⭐⭐⭐⭐⭐
        			</div>
        		</div>
        	</div>
        	
        	<div class="comment_box">
        		
        			최강선생을 통해 지금 과외선생님과 수업을 하게 된것이 정말 저에게는 최고의 선택이었습니다.
        			수업도 수업이지만 인간적으로도 너무 잘맞아서 선생님에게 많이 의지하게 되고 고민도 많이 사라졌습니다.
        			저에게 딱 맞는 선생님을 찾게해준 최강선생에게 너무 고맙고 주변 친구들한테도 매번 추천하고있습니다!!
        			대학 갈때까지 최강선생만 믿겠습니다!
        		
        	
        	</div>
        
        </div>
       
      </li>
     </ul>
    
    </div>
   </div>
  </div>
	</div><!-- section1 -->
	<div class="section" id="section2">
	<h1>교육기업 유일 대통령상 3관왕</h1>
	<h3>업계 최초 정부기관상 18관왕 수상 달성</h3>
	</div>
	<div class="section" id="section3">
		<img src="img/last.jpg" id="last_img">
	</div>
</div>
<script type="text/javascript">

	function mypage(){
		var login_id = "${user.id}";
		location.href="/ZV2Project/user/mypage.do?id=" + login_id;
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
	
	function loginMain(){
		var path = window.location.pathname;
		var page = path.split("/").pop();
		var param = window.location.search;
		console.log(page);
		console.log(param);
		var real_path = encodeURI(encodeURIComponent(page + param));
			
			
		
		location.href = "Login.jsp?path=" + real_path;
		
	}

	function logo_click() {
		location.href = "Main_header.jsp";
	}

	function logout(f){
		var path = window.location.pathname;
		var page = path.split("/").pop();
		var param = window.location.search;
		console.log(page);
		console.log(param);
		var real_path = '';
		if(!confirm("로그아웃 하시겠습니까?")){
			
			return;
		}
		if( param.includes('jjim=jj') || param.includes('mylist=my') ){
			
			real_path = page;
			
		}else{
			
			real_path = page + param;
		}
		alert("로그아웃 되었습니다.");
		location.href = "logout.do?path="+real_path;
	}



	function dialogue_list_not_login(){
		alert("로그인 부탁드립니다.");
		loginMain();
	}
	
	function dialogue_list_login(){
		var login_id = "${user.id}";
		location.href="user/dialogue_list.do?id=" + login_id;	
	}

</script>
</body>
</html>