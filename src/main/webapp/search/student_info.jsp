<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과외 학생 상세</title>

	<script src="https://kit.fontawesome.com/bc13bff3f1.js" crossorigin="anonymous"></script>
	<script src="../js/httpRequest.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
	
	<style>
	* { padding: 0; 
	    margin: 0;
	    font-family: "NotoSansKRRegular", sans-serif;}
	/* body{margin-bottom:150px;} */
	
	#frame { width: 850px; 
			 overflow: auto;
			 margin: 0 auto;}
			 
			 
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
	
	#info_main { width: 800px;
				 height: 200px;
				 margin: 0 auto;
				 margin-top: 100px;
				 position: relative;
				 border: 1px solid #eaeaea;
				}
				 
	i { color: #eaeaea;}
	
	#info_main img { width: 200px;
					 height: 200px;}
	
	.span { margin-left:15px;
			margin-right:15px;}
	
	
	
	#info_main div:nth-child(2) { position: absolute;
								  top: 25px;
								  left: 225px;
								  }
	
									 
	#info_main div:nth-child(3) {position: absolute;
								  top: 90px;
								  left: 225px;
								 }								 
	
	#info_main div:nth-child(4) {position: absolute;
								  top: 115px;
								  left: 225px;
								  }
	
	#info_main div:nth-child(5) {position: absolute;
								  top: 140px;
								  left: 225px;
								  }
									  								  
	#info_main div:nth-child(6) input { position: absolute;
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
	
	#info_etc {margin: 0 auto;
			   text-align: center;}
	
	#info_etc div { margin-top: 50px;
					margin-bottom: 30px;
					text-align: left;
					}
	
	#info_etc div:nth-child(even) { border-bottom: 1px solid #eaeaea;
									padding-bottom: 20px; }
									
	#info_etc { display: inline;}
	
	#info_etc div:nth-child(14) { margin-bottom: 250px;}	

	</style>

	</head>
	
	<body>
	
	<jsp:include page="../Main_header.jsp"></jsp:include>
	
	
	<div id="frame">
	
		<c:forEach var="vo" items="${ list }">		
			<div id="info_main">
				<div>
					<c:if test="${vo.gender eq '남자'}">
					<img src="/ZV2Project/Images/default_picture1.png">
					</c:if>
					<c:if test="${vo.gender eq '여자'}">
					<img src="/ZV2Project/Images/default_picture2.png">
					</c:if>
				</div>	
				<div style="font-size:25px; font-weight: bold;">${ vo.nickname }</div>
				<div id="info_gender"><i class="fa-solid fa-user fa-1x"></i> <span class="span">성별</span> ${ vo.gender }</div>
				<div id="info_subject"><i class="fa-solid fa-book fa-1x"></i> <span class="span">과목</span> ${ vo.subject }</div>		
				<div id="info_area"><i class="fa-solid fa-location-dot fa-1x"></i> <span class="span">지역</span> ${ vo.addr }</div>
				
				<c:if test="${ t_id != 'null'}">	
				<div><input type="button" value="제안하기" onclick="talk('${ t_id }','${ vo.id }');"></div>
				</c:if>	
			</div>
			
			
			<div id="info_etc">
			<div><h3>과외희망여부</h3></div>
			<div><i class="fa-solid fa-pencil fa-1x"></i> ${ vo.hyn }</div>
			<div><h3>한줄소개</h3></div>
			<div><i class="fa-solid fa-pencil fa-1x"></i> ${ vo.introduce }</div>
			<div><h3>학년</h3></div>
			<div><i class="fa-solid fa-pencil fa-1x"></i> 저는 ${ vo.grade } 입니다.</div>
			<div><h3>지역</h3></div>
			<div><i class="fa-solid fa-pencil fa-1x"></i> ${ vo.addr } 입니다.</div>
			<div><h3>성격</h3></div>
			<div><i class="fa-solid fa-pencil fa-1x"></i> 저는 ${ vo.hashtag } 성격입니다.</div>
			<div><h3>과목</h3></div>
			<div><i class="fa-solid fa-pencil fa-1x"></i> 저는 ${ vo.subject } 과외를 원합니다.</div>
			<div><h3>비대면 가능 여부</h3></div>
			<div><i class="fa-solid fa-pencil fa-1x"></i> ${ vo.myn }</div>			
			</div>
			
		</c:forEach>		
	
	</div>
	
	<script>
	
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
	
	</script>	

</body>
</html>