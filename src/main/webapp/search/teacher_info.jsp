<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>과외 선생님 상세</title>
	
	<script src="https://kit.fontawesome.com/bc13bff3f1.js" crossorigin="anonymous"></script>
	<script src="../js/httpRequest.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	
	<style>
	* { padding: 0; 
	    margin: 0;
	    font-family: "NotoSansKRRegular", sans-serif;}
	body{ margin-bottom:50px;}
	
	#frame { width: 850px; 
			 overflow: auto;
			 margin: 0 auto;}
	
	#info_main { width: 800px;
				 height: 200px;
				 border: 1px solid #eaeaea;
				 margin: 0 auto;
				 margin-top: 100px;
				 position: relative;}
				 
	i { color: #eaeaea;}
	
	#wish img { cursor: pointer;}
	
	.span { margin-left:15px;
			margin-right:15px;}
	
	#info_main div:nth-child(1) img{ width: 200px;
									 height: 200px;
									 }
	
	#info_main div:nth-child(2) { position: absolute;
								  top: 25px;
								  left: 225px;
								  }
							 
	#pic_frame { position: absolute;
				 top: 25px;
				 right: 25px;
				 width: 40px;
				 height: 40px;}	
				 
				 
	#info_area{ width:420px;
				overflow: hidden; 
				text-overflow: ellipsis;
				display: -webkit-box;
				-webkit-line-clamp: 1; /* 라인수 */
				-webkit-box-orient: vertical;
				word-wrap:break-word;
				} 	
	
	#info_subject{ width:420px;
				   overflow: hidden; 
				   text-overflow: ellipsis;
				   display: -webkit-box;
			    	-webkit-line-clamp: 1; /* 라인수 */
				   -webkit-box-orient: vertical;
				   word-wrap:break-word;
	
					}					 

	#info_main div:nth-child(3) img{ width: 40px;
									 height: 40px;}
									 								 
	#info_main div:nth-child(4) {position: absolute;
								  top: 90px;
								  left: 225px;
								 }								 
	
	#info_main div:nth-child(5) {position: absolute;
								  top: 115px;
								  left: 225px;
								  }
	
	#info_main div:nth-child(6) {position: absolute;
								  top: 140px;
								  left: 225px;
								  }
								  						  
	#info_main div:nth-child(7) input { position: absolute;
										top: 130px;
										right: 20px;
										background-color: #2730C1;
										color: white;
										cursor: pointer;
										border: none;
										border-radius: 5px;
										width: 90px;
										height: 50px;
										}
										
	
	
	#info_menu { width: 800px;
				 margin: 0 auto;
				 margin-top: 50px;
				 border-bottom: 1px solid #eaeaea;
				 overflow: hidden;}
										
	.menu { padding: 16px 0;
			text-align: center;
			float: left;
			width: 266px;
			color: #666666;
			font-size: 20px;
			cursor: pointer;
			border-bottom: 1px solid #eaeaea;
			}
			
 	#profile { border-bottom: 3px solid #2730C1;
			   color: #2730C1;}
	
	#info_etc {margin: 0 auto;
			   text-align: center;}
	
	#info_etc div { margin-top: 50px;
					margin-bottom: 30px;
					text-align: left;
					}
	
	#info_etc div:nth-child(even) { border-bottom: 1px solid #eaeaea;
									padding-bottom: 20px; }
									
	#info_etc div:nth-child(12) { margin-bottom: 250px;}
									
	#info_etc { display: inline;}
	
	#lecture_video { display: none; }
	
	#reviews { display: none; }
	
	.route { width: 600px;
			 height: 400px;
			 margin: 0 auto;
			 margin-top: 50px;
			 border: 1px solid black;
			 box-shadow: 5px 5px 10px rgba(0,0,0,0.6); }
	
	.title { 
			 width: 600px;
			 font-size: 20px;
			 margin: 0 auto;
			 margin-top: 10px;
			 margin-bottom: 50px;
			 padding: 5px;
			 box-sizing: border-box;}
	
	#reviews { overflow: hidden;
			   position: relative;}
	
	.review_write { position: absolute; 
				    top: 10px;
				    right: 125px;
				    }
				   
	.review_write input { width: 110px;
						  height: 40px;
						  cursor: pointer;
						  background-color: white;
						  border: 1px solid #e5e7eb;
						  border-radius: 5px;
						  font-size: 16px;
						  }
						  
	.review_write input:hover { background:linear-gradient(#5D64DB, #2730C1); color:white;}
			 
	#reviews div i { color: #ffdf3e;}
		
	.reviews_frame { 
					 width: 650px;
					 margin-top: 50px;
					 margin-bottom: 50px;
					 }
			 
	.avg_jumsu { margin: 0 auto;
				 margin-top: 50px;
				 width: 200px;
				 height: 60px;
				 text-align: center;
				 font-size: 20px;
				 }
	
	.word_box { border: 1px solid #eaeaea;
				width: 600px;
				overflow: hidden;
				/* height: 100px; */
				padding: 11px 15px 11px 21px;
			    border-image-source: url(/ZV2Project/Images/word_window.png);
			    border-image-width: 19px 7px 7px 12px;
			    border-image-slice: 19 7 7 12 fill;}
			    	
	.student_nickname { display: inline-block;}
	.star { display: inline-block;}				 
	.jumsu { display: inline-block;}
	
	.review { margin-top: 5px;
			  margin-left: 15px;
			  width: 500px;
			  word-break: break-all; }
			  
	.write_date { float: right;}
	
	
	
	#modal_review_write {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        background-color: rgba(0, 0, 0, 0.3);
        z-index: 998;
      }

      #modal_review_write.show {
        display: block;
      }

      #real_modal_review_write {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 600px;
        height: 52%;
        padding: 20px;
        background-color: rgb(255, 255, 255);
        border-radius: 5px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15); 

        transform: translateX(-50%) translateY(-50%); 
        z-index: 999;
        box-sizing: border-box;        
        }
      	
	    #modal_header_review_write { box-sizing: border-box;
	  				  		  margin: 10px;
	  				  		  margin-bottom: 20px;
	  				  		  }
		
		#modal_body_review_write { box-sizing: border-box;
							  overflow: auto;
							  height: 320px;
							  }
											
		#modal_body_review_write div { width: 47px;
									   height: 50px;
									   display: inline-block;
									   text-align: center;
									   border: 1px solid #dddddd;
									   border-radius: 10px;
									   margin-top: 15px;
									   margin-bottom: 20px;
									   color: #dddddd;
									   }				  
		
		#modal_body_review_write input[type="radio"] { 
			width: 0;
			height: 0;		
		}
		
		#modal_body_review_write label { font-size: 30px;
										 cursor: pointer; }
		
		#modal_body_review_write input[type="radio"]:checked+div {
			background-color: #2730C1;		
			color: white;
		}
		
		#modal_body_review_write textarea { width: 550px;
										    height: 150px;
										    resize: none;
										    font-size: 18px;
										    padding: 10px;
										    box-sizing: border-box;
										    margin-top: 10px;}					  
				
		#modal_end_review_write {
		   width:100%;
		   height:80px;
		   box-sizing: border-box;
		   text-align: right;		   
		}
		
		#modal_end_review_write input { width: 120px;
						  height: 50px;
						  cursor: pointer;
						  margin: 5px;
						  background-color: white;
						  border: 1px solid #e5e7eb;
						  font-size: 16px;
						  }
						  
		#modal_end_review_write input:hover { background:linear-gradient(#5D64DB, #2730C1); color:white;}
	
	
		video{height:430px; width:100%; margin-top:30px;}
	
	
	</style>

	</head>
	
	<body>
	
	<jsp:include page="../Main_header.jsp"></jsp:include>
	<div id="modal_review_write">
	<div id="real_modal_review_write">
		<div id="modal_header_review_write">
		<h2>후기</h2>
		</div>
		
	<form id="WriteForm" action="TeacherRiview.do">	
		<div id="modal_body_review_write">
		<h3>평점</h3>

				<input class="review_jumsu" type="radio" id="1" name="jumsu" value="1">
				<div>
				<label for="1">1</label>
				</div>

				<input class="review_jumsu" type="radio" id="2" name="jumsu" value="2">
				<div>
				<label for="2">2</label>
				</div>

				<input class="review_jumsu" type="radio" id="3" name="jumsu" value="3">
				<div>
				<label for="3">3</label>
				</div>

				<input class="review_jumsu" type="radio" id="4" name="jumsu" value="4">
				<div>
				<label for="4">4</label>
				</div>

				<input class="review_jumsu" type="radio" id="5" name="jumsu" value="5">
				<div>
				<label for="5">5</label>
				</div>

				<input class="review_jumsu" type="radio" id="6" name="jumsu" value="6">
				<div>
				<label for="6">6</label>
				</div>

				<input class="review_jumsu" type="radio" id="7" name="jumsu" value="7">
				<div>
				<label for="7">7</label>
				</div>

				<input class="review_jumsu" type="radio" id="8" name="jumsu" value="8">
				<div>
				<label for="8">8</label>
				</div>

				<input class="review_jumsu" type="radio" id="9" name="jumsu" value="9">
				<div>
				<label for="9">9</label>
				</div>

				<input class="review_jumsu" type="radio" id="10" name="jumsu" value="10" checked>
				<div>
				<label for="10">10</label>
				</div>
				
		<h3>후기 작성</h3>
		<textarea id="WriteForm" name="review"></textarea>
		
		</div>
		<div id="modal_end_review_write">
			<input type="hidden" name="t_id" value="${t_id}">		
			<input type="hidden" name="s_id" value="${s_id}">		
			<input type="button" value="취소" onclick="modalOn_review_write()">
            <input type="button" value="후기등록" onclick="send_review_write(this.form)">
		</div>
	</form>	
		
	</div>
</div>
	
	
	<div id="frame">
				
		<c:forEach var="vo" items="${ list1 }">		
			<div id="info_main">
				<div>
					<c:if test="${ vo.profile eq null }">
						<c:if test="${vo.gender eq '남자'}">
							<img src="/ZV2Project/Images/default_picture1.png">
						</c:if>
						<c:if test="${vo.gender eq '여자'}">
							<img src="/ZV2Project/Images/default_picture2.png">
						</c:if>
					</c:if>
					<c:if test="${ vo.profile ne null }">
						<img src="../upload/${ vo.profile }">
					</c:if>
					
				</div>	
				<div style="font-size:25px; font-weight: bold;">${ vo.nickname }</div>
						
					
					<div id="pic_frame">
						<c:if test="${ s_id != 'null'}">
						
							<c:if test="${ check == 1 }">
								<div id="wish" class="show" onclick="pic('${ vo.id }','${ s_id }')">														
									<img id="pic" src="/ZV2Project/Images/select_on.png">									
								</div>
							</c:if>
							
							<c:if test="${ check == 0 }">
								<div id="wish" onclick="pic('${ vo.id }','${ s_id }')">										
									<img id="pic" src="/ZV2Project/Images/select_off.png">									
								</div>
							</c:if>
											
						</c:if>
					</div>
				
				<div id="info_gender"><i class="fa-solid fa-user fa-1x"></i> <span class="span">성별</span> ${ vo.gender }</div>
				<div id="info_subject"><i class="fa-solid fa-book fa-1x"></i> <span class="span">과목</span> ${ vo.subject }</div>		
				<div id="info_area"><i class="fa-solid fa-location-dot fa-1x"></i> <span class="span">&nbsp;지역</span> ${ vo.area }</div>
				
				<c:if test="${ s_id != 'null'}">						
				<div><input type="button" value="문의하기" onclick="talk('${ vo.id }','${ s_id }');"></div>			
				</c:if>
			</div>
			
			<div id="info_menu">
			<div id="profile" class="menu" onclick="select(1)">프로필</div>
			<div id="video" class="menu" onclick="select(2)">강의영상</div>
			<div id="review" class="menu" onclick="select(3)">후기</div>		
			</div>
			
			
			<div id="info_etc">
			<div><h3>한줄소개</h3></div>
			<div><i class="fa-solid fa-pencil fa-1x"></i> ${ vo.introduce }</div>
			<div><h3>과외 가능 지역</h3></div>
			<div><i class="fa-solid fa-pencil fa-1x"></i> 저는 ${ vo.area }에서 과외 가능합니다.</div>
			<div><h3>성격</h3></div>
			<div><i class="fa-solid fa-pencil fa-1x"></i> 저는 ${ vo.hashtag } 성격입니다.</div>
			<div><h3>과목</h3></div>
			<div><i class="fa-solid fa-pencil fa-1x"></i> 저는 ${ vo.subject } 과목을 수업합니다.</div>
			<div><h3>MBTI</h3></div>
			<div><i class="fa-solid fa-pencil fa-1x"></i> 저는 ${ vo.mbti } 입니다.</div>
			<div><h3>비대면 가능 여부</h3></div>
			<div><i class="fa-solid fa-pencil fa-1x"></i> ${ vo.myn }</div>			
			</div>
			
		</c:forEach>
		
		<div id="lecture_video">
		
		<c:forEach var="vo" items="${ list2 }">
		
		
		<div class="title">
			<video controls>
				<source src="../upload/${vo.title }" type="video/mp4">
			</video>
		</div>
			
		</c:forEach>
		
		</div>
		
		
		
		<div id="reviews">
			
			<c:if test="${ avg_jumsu != 'null' }">
			<div class="avg_jumsu">
					<c:choose>				
						<c:when test="${ avg_jumsu2 mod 2 eq 0}">
							<div class="star">
								<c:forEach var="i" begin="1" end="${ avg_jumsu2 div 2}">
								<i class="fa-solid fa-star"></i>
								</c:forEach>
								<c:forEach var="i" begin="1" end="${ 5 - avg_jumsu2 div 2}">
								<i class="fa-regular fa-star"></i>
								</c:forEach>
							</div>		
						</c:when>
						
						<c:when test="${ avg_jumsu2 mod 2 eq 1}">
							<div class="star">
								<c:forEach var="i" begin="1" end="${ avg_jumsu2 div 2}">
								<i class="fa-solid fa-star"></i>
								</c:forEach>
								<i class="fa-regular fa-star-half-stroke"></i>
								<c:forEach var="i" begin="1" end="${ 5 - avg_jumsu2 div 2}">
								<i class="fa-regular fa-star"></i>
								</c:forEach>
							</div>
						</c:when>					
					</c:choose>
					<br>					
			<span>평균 평점 : ${ avg_jumsu }</span>			
			</div>			 
			</c:if>
					
			<c:if test="${ avg_jumsu eq 'null' }">
			<div class="avg_jumsu">
			<span>후기 없음</span>			
			</div>			
			</c:if>
			
			<c:if test="${ r_check eq 0 }">
			<div class="review_write">
			<input class="review_btn" type="button" value="후기남기기" onclick="modalOn_review_write()">
			</div>
			</c:if>
			
			<c:forEach var="vo" items="${ list3 }">
			
				<div class="reviews_frame">				
					 
					<div class="word_box">
						<div class="student_nickname" style="margin-left: 15px;">${ vo.student_nickname }</div><br>
						
						<c:choose>				
						<c:when test="${ vo.jumsu mod 2 eq 0}">
							<div class="star" style="margin-left: 15px;">
								<c:forEach var="i" begin="1" end="${ vo.jumsu div 2}">
								<i class="fa-solid fa-star"></i>
								</c:forEach>
								<c:forEach var="i" begin="1" end="${ 5 - vo.jumsu div 2}">
								<i class="fa-regular fa-star"></i>
								</c:forEach>
							</div>		
						</c:when>
						
						<c:when test="${ vo.jumsu mod 2 eq 1}">
							<div class="star" style="margin-left: 15px;">
								<c:forEach var="i" begin="1" end="${ vo.jumsu div 2}">
								<i class="fa-solid fa-star"></i>
								</c:forEach>
								<i class="fa-regular fa-star-half-stroke"></i>
								<c:forEach var="i" begin="1" end="${ 5 - vo.jumsu div 2}">
								<i class="fa-regular fa-star"></i>
								</c:forEach>
							</div>
						</c:when>					
						</c:choose>
						
						<div class="jumsu">${ vo.jumsu }</div>							
						<pre class="review"><span>${ vo.review }</span></pre>				
						<div class="write_date"><span>${ vo.write_date }</span></div>
				  </div>											
				</div>
		
			</c:forEach>
		
		</div>
		
	
	</div>
	
	<script type="text/javascript">
	
	$(function(){
		var param = window.location.search;
		
		if( param.includes('review_auth=0') ){
			
			select(3);
		}else if( param.includes('video=') ){
			
			select(2);
		}
	});
	
	
	function pic( teacher, student ) {

		var t_id = teacher;
		var s_id = student;
		
		var wish = document.getElementById("wish");
		wish.classList.toggle("show");
		
		const pic = document.querySelector("#pic");
				
		if(wish.classList.contains("show")) {
			pic.src = "/ZV2Project/Images/select_on.png";
			send(t_id, s_id);		
		}
		else{
			pic.src = "/ZV2Project/Images/select_off.png";
			send(t_id, s_id);
		}
		
	}
	
	function talk(t_id, s_id) {
		var url = "TalkCheck.do";
		var param = "t_id=" + t_id + "&s_id=" + s_id;
		sendRequest(url, param, talkSend, "post");
	}
	
	function talkSend() {
	      if(xhr.readyState == 4 && xhr.status == 200) {
	         var data = xhr.responseText;
	         var json = eval(data);
	         
	         location.href="../user/dialogue_room.do?talk_seq="+json[0].param+"&login_id="+json[1].param;
	            
	      }   
	   }
	
		
	function send(t_id,s_id) {
		var url = "TeacherWishList.do";
		var param = "t_id=" + t_id + "&s_id=" + s_id;		
		sendRequest(url, param, sendCheck, "post");				
	}
	
	function sendCheck() {
		if(xhr.readyState == 4 && xhr.status == 200) {	
			}	
		}
	
	
	function select(n) {
		
		if(n == 1) {
			document.getElementById("profile").style.color = "#2730C1";
			document.getElementById("profile").style.borderBottom = "3px solid #2730C1";
			document.getElementById("video").style.color = "#666666";
			document.getElementById("video").style.borderBottom = "none";
			document.getElementById("review").style.color = "#666666";
			document.getElementById("review").style.borderBottom = "none";
			document.getElementById("info_etc").style.display = "inline";
			document.getElementById("lecture_video").style.display = "none";
			document.getElementById("reviews").style.display = "none";
		}
		
		if(n == 2) {
			document.getElementById("profile").style.color = "#666666";
			document.getElementById("profile").style.borderBottom = "none";
			document.getElementById("video").style.color = "#2730C1";
			document.getElementById("video").style.borderBottom = "3px solid #2730C1";
			document.getElementById("review").style.color = "#666666";
			document.getElementById("review").style.borderBottom = "none";
			document.getElementById("info_etc").style.display = "none";
			document.getElementById("lecture_video").style.display = "inline";
			document.getElementById("reviews").style.display = "none";
		}
		
		if(n == 3) {
			document.getElementById("profile").style.color = "#666666";
			document.getElementById("profile").style.borderBottom = "none";
			document.getElementById("video").style.color = "#666666";
			document.getElementById("video").style.borderBottom = "none";
			document.getElementById("review").style.color = "#2730C1";
			document.getElementById("review").style.borderBottom = "3px solid #2730C1";
			document.getElementById("info_etc").style.display = "none";
			document.getElementById("lecture_video").style.display = "none";
			document.getElementById("reviews").style.display = "inline";
		}
		
	}
	
	function modalOn_review_write() {
		const body = document.querySelector('body');
		const modal = document.querySelector('#modal_review_write');
		 modal.classList.toggle('show');
		 
		  if (modal.classList.contains('show')) {
	          body.style.overflow = 'hidden';
	        } 				 
		  else if (!modal.classList.contains('show')) {
	            body.style.overflow = 'auto';
	          } 	 		
	}
	
	function send_review_write(f) {			
		f.submit();
	}
	
	</script>	
	
	</body>
		
	
</html>