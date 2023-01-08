<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 상세페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
	crossorigin="anonymous"></script>
  
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	



<style>
*{
margin: 0;
padding: 0;
}

.big {
	width: 1024px;
	margin: 0px auto;
}

.fl {
	float: left;
}

.fr {
	float: right;
}

.back {
	width: 1024px;
	height: 78px;
	margin: 0px auto;
	border-bottom: 1px solid black;
}

.content {
	width: 717px;
	margin: 0px auto;
	padding: 20px 0px 0px 0px;
}

.img {
	width: 685px;
	height: 539px;
	margin: 10px 15px 0px 15px;
	border: 1px solid #e5e7eb;
	box-shadow: 2px 4px 4px rgb(0 0 0/ 20%);
}

.img>img {
	height: 539px;
	margin: 0px auto;
	display: block;
}

.title {
	width: 685px;
	height: 93px;
	margin: 0px auto;
}

.title>div:nth-child(1) {
	width: 685px;
	height: 40px;
	margin: 0px auto;
}

.title>div:nth-child(2) {
	width: 685px;
	height: 16px;
	margin: 0px auto;
}

.title>div:nth-child(3) {
	width: 685px;
	height: 37px;
	margin: 0px auto;
}

.imformation {
	width: 685px;
	height: 94px;
	margin: 0px auto;
}

.imformation>div:nth-child(1) {
	width: 685px;
	height: 16px;
	margin: 0px auto;
}

.imformation>div:nth-child(2) {
	width: 232px;
	height: 78px;
	margin: 0px auto;
}
/*캐시  */
.imformation>div:nth-child(2)>div:nth-child(1) {
	width: 232px;
	height: 34px;
	margin: 0px auto;
}

/*평점  */
.imformation>div:nth-child(2)>div:nth-child(2) {
	width: 231px;
	height: 22px;
	margin: 0px auto;
	display: inline-block;
}
/*다운로드 수  */
.imformation>div:nth-child(2)>div:nth-child(3) {
	width: 232px;
	height: 18px;
	margin: 0px auto;
}

/* 찜하기 박스 (오른쪽) */
.imformation>div:nth-chile(3) {
	width: 200px;
	height: 78px;
	margin: 0px auto;
	border: 1px solid black;
}

.imformation>div:nth-child(3)>div:nth-child(1) {
	width: 200px;
	height: 38px;
	margin: 0px auto;
}

/* 컨텐츠  내용*/
.explain {
	width: 687px;
	height: 0px auto;
	margin: 0px auto;
	padding: 20px;
	background-color: #F4F3F0;
	border-radius: 0.5rem;
}

/* 내 캐시 div */
.mycash {
	width: 685px;
	height: 96px;
	margin: 0px auto;
	border: 1px solid #e5e7eb;
	padding: 20px 20px 20px 20px;
}

.usher {
	width: 685px;
	height: 100px;
	margin: 0px auto;
	border: 1px solid #e5e7eb;
	padding: 20px 20px 20px 20px;
}

.buying {
	width: 685px;
	height: 100px;
	margin: 0px auto;
}

.commtent {
	width: 685px;
	height: 0px auto;
	margin: 0px auto;
}

.comment_write_login {
	width: 385px;
	height: 24px;
	margin: 20px 0px 0px 0px;
	padding: 15px 0px 15px 300px;
	border-radius: 0.5rem;
	background-color: #FFDA25;
	font-size: 1rem;
	line-height: 1.5rem;
	font-family: 'Pretendard Variable', sans-serif !important;
	cursor: pointer;
}

.comment_write_logout {
	width: 385px;
	height: 24px;
	margin: 20px 0px 0px 0px;
	padding: 15px 0px 15px 300px;
	border-radius: 0.5rem;
	background-color: #DFDFDF;
	font-size: 1rem;
	line-height: 1.5rem;
	font-family: 'Pretendard Variable', sans-serif !important;
	color: white;
	cursor: pointer;
}

.popup {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	background: #fff;
	width: 512px;
	height: 770px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	border-radius: 5px;
	text-align: right;
	padding: 24px;
	box-sizing: border-box;
	opacity: 0;
}

.popup:target {
	opacity: 1;
}

/* 모달 */
   .modal {
        position: fixed;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
        z-index: 10;
      }

      .modal.show {
        display: block;
      }

      .modal_body {
        position: absolute;
        top: 50%;
        left: 50%;

        width: 464px;
        height: 723px;

        padding: 32px;

        text-align: center;

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
        z-index: 10;
        margin:0 auto;"
        font-family:'Pretendard Variable', sans-serif !important;
        
      }
      
      #message {
		height:150px; 
		width:376px; 
		border:1px solid black; 
		margin:0px auto; 
		padding:12px;	
	}
	

</style>

<script src="../js/httpRequest.js"></script>
<script type="text/javascript">
	
	$( function(){
		var pre = document.getElementById('preshow');
		console.log('${param.filename}');
		
		var param = encodeURIComponent('${param.filename}');
		pre.src= '../upload/'+param;
		console.log(pre);
	
	});
	
	
	
	
	function send_back(){
		location.href = "reference.do";
	}
	
	
	
	// 찜하기 눌렀을 때. db에 해당 자료 저장
	function send_wishlist(check, ref_seq) {
		var heartbox = document.getElementById("heartBox");
		var heart_img = document.getElementById("heartImg");
		var p_check = check;
		var p_ref_seq = ref_seq;
		
		heartbox.classList.toggle("heart"); //heart라는 클래스가 없으면 만들고 있으면 지워라
		
		if( heartbox.classList.contains("heart") ){ //heart라는 클래스가 있으면 찜하기를 누른상황! 
			heart_img.src = "../Images/select_on.png";
			
			//db처리 실행해라.
			ajax_check( p_check, p_ref_seq );
			
		}else{ //heart라는 클래스가 없으면 찜하기를 누르지 않은 상황 
			//ajax처리
			heart_img.src = "../Images/select_off.png";
			
			//db처리
			ajax_check( p_check, p_ref_seq );
		}
		
				
	}
	
	
	//db처리
	function ajax_check(check, ref_seq){
		var url = "wishlist.do";
		var param = "ref_seq=" + ref_seq + "&check="+check;
		sendRequest(url, param, sendCheck, "post");		
		
	}
	
	//db처리 -> 콜백(반드시필요 - 하나의 묶음)
	function sendCheck() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			var data = xhr.responseText;
			var json = eval(data);			
				/* location.href="reference_detail.do?ref_seq="+json[0].param; */
			}
		}
	
	
	//바로구매버튼 눌렀을 때( 로그인 안한상태 )
	function send_buyalertLogin(){
		alert("로그인을 해주세요.");
		
	}
	
	
	//자료구매
	function buying_ref(checkbuy, ref_seq, cash, contentprice){
		

	if( !confirm("구매하시겠습니까?") ){
		return;
	}
			
	
		//alert(cash);
		//alert(contentprice);
		//console.log(cash);
		//console.log(contentprice);
		
		if( cash < contentprice ){
			alert("포인트가 부족합니다!");
			return;
		} else {
			
			var b_check = checkbuy;
			var b_ref_seq = ref_seq;
			//db처리 실행해라.
			ajax_checkbuy( b_check, b_ref_seq ); 	
		}	
	}
	
	
	
	//db처리
	function ajax_checkbuy(check, ref_seq){
		var url = "buylist.do";
		var param = "ref_seq=" + ref_seq + "&check="+check;
		sendRequest(url, param, buyCheck, "post");		
		
	}
	
	//db처리 -> 콜백(반드시필요 - 하나의 묶음)
	function buyCheck() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			var data = xhr.responseText;
			var json = eval(data);			
			location.href="reference_detail.do?ref_seq="+json[0].param; 
			}
		}
	
	
	

	//다운로드 버튼 눌렀을 때(로그인 상태/구매한상태)
	function download_ref(num, contentname, filesize ){		
		var ref_seq =num;
		var content =contentname;
		var fileSize =filesize;
		
		var param_ref_seq = "ref_seq=" + ref_seq;
		var param_content = "content=" + encodeURIComponent(content);
		var param_fileSize = "fileSize=" + filesize;
		
		var url = "download.do";
		
		location.href = 'download.do'+"?"+param_ref_seq + "&"+param_content + "&" + param_fileSize;
	}
		
	
	
	//후기남기기 버튼 눌렀을 때(로그인 안한 상태)
	function send_alertLogin(){
		alert("로그인을 해주세요.");
		
	}
	//후기남기기 버튼 눌렀을 때( 로그인은 했는데 구매를 안한 상황 )
	function send_alertBuying(){
		alert("자료를 구매해주세요.");
		
	}
	
	//모달
	function modalOn() {
        const body = document.querySelector('body');
        const modal = document.querySelector('.modal');
         modal.classList.toggle('show');
         
          if (modal.classList.contains('show')) {
               body.style.overflow = 'hidden';
             } 
         
          else if (!modal.classList.contains('show')) {
                 body.style.overflow = 'auto';
               }     
     }
	
	// 모달 안 디자인 함수
	
	function mark(star) {
		//alert(star);
		setScore(star);
	}
    function setScore(star) {
        //scoreValue.value = score;
		 score = star;
		//alert(score);
        if (score >= 1) {
            $("#imgStar1").attr("src", "../Images/leftfullstar.png"); 
        } else {
            $("#imgStar1").attr("src", "../Images/leftemptystar.PNG");
        }
        
        if (score >= 2) {
        	  $("#imgStar2").attr("src", "../Images/rightfullstar.PNG"); 
        } else {
        	  $("#imgStar2").attr("src", "../Images/rightemptystar.PNG");
        }
        if (score >= 3) {
        	  $("#imgStar3").attr("src", "../Images/leftfullstar.png"); 
        } else {
            $("#imgStar3").attr("src", "../Images/leftemptystar.PNG");
        }
        if (score >= 4) {
        	  $("#imgStar4").attr("src", "../Images/rightfullstar.PNG"); 
        } else {
        	  $("#imgStar4").attr("src", "../Images/rightemptystar.PNG");
        }
        if (score >= 5) {
        	  $("#imgStar5").attr("src", "../Images/leftfullstar.png"); 
        } else {
            $("#imgStar5").attr("src", "../Images/leftemptystar.PNG");
        }
        if (score >= 6) {
        	  $("#imgStar6").attr("src", "../Images/rightfullstar.PNG"); 
        } else {
        	  $("#imgStar6").attr("src", "../Images/rightemptystar.PNG");
        }
        if (score >= 7) {
        	  $("#imgStar7").attr("src", "../Images/leftfullstar.png"); 
        } else {
            $("#imgStar7").attr("src", "../Images/leftemptystar.PNG");
        }
        if (score >= 8) {
        	  $("#imgStar8").attr("src", "../Images/rightfullstar.PNG"); 
        } else {
        	  $("#imgStar8").attr("src", "../Images/rightemptystar.PNG");
        }
        if (score >= 9) {
        	  $("#imgStar9").attr("src", "../Images/leftfullstar.png"); 
        } else {
            $("#imgStar9").attr("src", "../Images/leftemptystar.PNG");
        }
        if (score >= 10) {
        	  $("#imgStar10").attr("src", "../Images/rightfullstar.PNG"); 
        } else {
        	  $("#imgStar10").attr("src", "../Images/rightemptystar.PNG");
        }    
    }

    //별점 선택  총평입력
   		var score=0;//전역변수처리
   //평점 db처리
    	function save(num) {
    		//alert(score); 위에서 전역변수로 score처리했음
    		
    		if (document.getElementById('message').value=="") { //내용담겨있는지 확인
  			alert("내용을 입력해주세요"); 
 			return; 
			} 
    		
    		
    		var ref_seq =num;
    		//alert(num);
    		var param_ref_seq = "ref_seq=" + ref_seq;
    		var param_score = "score=" + score;
    		var url = "popup.do";
    		var content = document.getElementById("message").value;
    		location.href = 'popup.do'+"?"+param_ref_seq +"&"+param_score+"&content="+encodeURIComponent(content);
    	}
	
   		
   		
   		
   	
  </script>

 


</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../Main_header.jsp"></jsp:include>
	
	

	<!-- big ( 전체 아우르는 div) -->
	<div class="big">
		<!-- 뒤로가기  -->
		<div class="back">
			<div class="fl" style="width: 100px; height: 78px; cursor: pointer;">

				<img src="../Images/mark_arrow.PNG"
					style="display: inline-block; width: 20px; height: 20px; padding: 30px 0px;"
					class="fl" onclick="send_back();">


				<div class="fl" style="padding: 30px 0px;" onclick="send_back();">
					<strong>리스트보기</strong>
				</div>
			</div>
			<div style="clear: both"></div>
		</div>


		<!--컨텐츠 내용  -->
		<div class="content">
			
			<div class="img">	
			
				<c:if test="${ empty user }">
							<img src="../Images/pdf.PNG">
				</c:if>	
				 	
				<c:if test="${ (!empty user) and (checkbuy eq 0) }">
							<img src="../Images/pdf.PNG">	
				</c:if>	
				
			   
			    
							<!--구매 했을 때  -->
				<c:if test="${ (!empty user) and (checkbuy eq 1) }">
				
				
				<iframe id="preshow" src="" 
				frameborder="0" style="width: 685px; height: 539px;">
				</iframe>  
				</c:if>	
				
			
			</div>	
				<c:forEach var="vo" items="${ list_content }">
				<div class="title">
					<div></div>
					<div
						style="color: #a3a3a3 !important; font-size: 16px !important; margin-bottom: 0.25rem;">${ vo.nickname }</div>
					<div
						style="font-size: 22px !important; font-family: 'Pretendard Variable', sans-serif !important;">
						<b>${ vo.title }</b>
					</div>
				</div>
				<div class="imformation">
					<div></div>
					<div class="fl">
						<div>
							<div class="fl"
								style="font-size: 1.5rem; line-height: 2rem; font-family: 'Nanum Gothic', sans-serif;">
								<b id="content_price">${ vo.content_price }</b>
							</div>

							<div class="fl">
								<img src="../Images/mark_cashcolor.PNG"
									style="height: 32px; weight: 32px; padding: 2px 0px 0px 2px;">
							</div>

						</div>

						<div>
						<c:if test="${ vo.avg_score - 1 ge 0 && vo.avg_score - 1 le 1}"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAHalf.png"
								style="height: 12px; weight: 14px;">
							</div>
						 </c:if>
						
						 <c:if test="${ vo.avg_score - 2 gt 0 }"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAFilled.png"
									style="height: 12px; weight: 14px;">
							</div>
						 </c:if>
							
						<c:if test="${ vo.avg_score - 3 ge 0 && vo.avg_score - 3 le 1}"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAHalf.png"
								style="height: 12px; weight: 14px;">
							</div>
						 </c:if>
						 	
						 <c:if test="${ vo.avg_score - 4 gt 0 }"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAFilled.png"
									style="height: 12px; weight: 14px;">
							</div>
						 </c:if>
						 <c:if test="${ vo.avg_score - 5 ge 0 && vo.avg_score - 5 le 1}"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAHalf.png"
								style="height: 12px; weight: 14px;">
							</div>
						 </c:if>
						  <c:if test="${ vo.avg_score - 6 gt 0 }"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAFilled.png"
									style="height: 12px; weight: 14px;">
							</div>
						 </c:if>
						 <c:if test="${ vo.avg_score - 7 ge 0 && vo.avg_score - 7 le 1}"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAHalf.png"
								style="height: 12px; weight: 14px;">
							</div>
						 </c:if>
						  <c:if test="${ vo.avg_score - 8 gt 0 }"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAFilled.png"
									style="height: 12px; weight: 14px;">
							</div>
						 </c:if>
						 <c:if test="${ vo.avg_score - 9 ge 0 && vo.avg_score - 9 le 0.9}"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAHalf.png"
								style="height: 12px; weight: 14px;">
							</div>
						 </c:if>
						  <c:if test="${ vo.avg_score - 10 eq 0 }"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAFilled.png"
									style="height: 12px; weight: 14px;">
							</div>
						 </c:if>

							<div class="fl" style="font-size: 15px; position:relative; left:5px; top:2px;">
								<b>${ vo.avg_score }</b>
							</div>
						</div>
						<div>
							<div class="fl"
								style="font-size: 15px; line-height: 20px; font-family: 'Pretendard Variable', sans-serif !important;">
								<b>다운로드 수  &nbsp; | </b>
							</div>
							<div class="fl"
								style="font-size: 15px; line-height: 20px; font-family: 'Pretendard Variable', sans-serif !important;">
								<b>&nbsp; ${ vo.download_cnt }</b>
							</div>
						</div>
					</div>
					<div class="fr">
						<div></div>
						<!--찜하기 했을 때, ref_seq보내기  -->
						<div class="fr" style="height: 40px; width: 40px;">

							<c:if test="${!empty user}">
								<!-- 로그인 했을 때만 찜하기 가능.  -->

								<c:if test="${ check == 1 }">
									<div id="heartBox" class="heart"
										style="cursor: pointer; height: 40px; width: 40px;"
										onclick="send_wishlist(${ check },${ vo.ref_seq })">
										<img id="heartImg" src="../Images/select_on.png"
											style="height:40px; width:40px;">
									</div>
								</c:if>

								<c:if test="${ check == 0 }">
									<div id="heartBox"
										style="cursor:pointer; height: 40px; width: 40px;"
										onclick="send_wishlist(${ check },${ vo.ref_seq })">

										<img id="heartImg" src="../Images/select_off.png"
											style="height:40px; width: 40px;">
									</div>
								</c:if>
						
							</c:if>
						</div>	
						<div style="clear: both"></div>
					</div>


				</div>
				<div style="clear: both"></div>
				<div style="width: 685px; height: 15px;"></div>
				<div class="explain">
					<div style="padding: 10px 0px;">${ vo.content_main }</div>
				</div>
				<div style="width: 685px; height: 20px; margin: 0px auto;"></div>

				<div class="mycash">
					<div class="fl"
						style="height: 20px; font-size: 1.125rem; font-family: 'Pretendard Variable', sans-serif !important; padding: 7px 0px 0px 0px;">
						내 캐시</div>
					<div class="fr">
						<img src="../Images/mark_cashcolor.PNG"
							style="height: 32px; weight: 32px; padding: 2px 0px 0px 2px;">
					</div>
					<div class="fr"
						style="height: 20px; font-size: 1.125rem; font-family: 'Pretendard Variable', sans-serif !important; font-weight: 500 !important; padding: 6px 0px 0px 0px;">
						
							<c:if test="${!empty user}">
							<c:forEach var="vo2" items="${ showmycash}">
							<b id="showmycash">${ vo2.point }</b>
						</c:forEach> 
						</c:if>
						

						<c:if test="${empty user}"> 
						보유캐시
						</c:if>
					</div>
					<div style="clear: both"></div>
					<div style="width: 685px; height: 20px;"></div>
					<div
						style="font-size: 0.875rem; line-height: 1.25rem; padding: 0px 0px 3px 0px;">
						캐시는 해당 사이트 출석을 통해 획득 가능 하며, 지식인 페이지에서도 보충할 수 있습니다.</div>
					<div style="clear: both"></div>
					<div style="border-top: 1px solid black;"></div>
				</div>
				<div style="width: 685px; height: 20px;"></div>


				<div class="usher">
					<div class="fl">
						<img src="../Images/mark_question.PNG"
							style="height: 18px; weight: 18px; padding: 8px 0px 0px 2px;">
					</div>
					<div class="fl"
						style="height: 20px; font-size: 15px; font-family: 'Pretendard Variable', sans-serif !important; font-weight: 500 !important; padding: 7px 0px 0px 0px; color: #505050;">
						<b>자료 이용안내</b>
					</div>
					<div style="clear: both"></div>

					<div
						style="width: 630px; height: 24px; padding: 3px 0px 3px 0px; color: #777777; font-size: 14px; font-family: 'Pretendard Variable', sans-serif !important;">
						<b style="font-size: 25px;">·</b> 최강선생에서 제공하는 모든 자료는 저작권의 보호를 받고
						있습니다.
					</div>
					<div
						style="width: 630px; height: 24px; padding: 3px 0px 3px 0px; color: #777777; font-size: 14px; font-family: 'Pretendard Variable', sans-serif !important;">
						<b style="font-size: 25px;">·</b> 상업적인 용도.무단복제, 배포 및 도용을 엄격 금지하고
						있음을 알려드립니다.
					</div>
				</div>

				
				<div class="buying">
					<div style="width: 685px; height: 50px;"></div>
					<div style="width: 685px; height: 50px; margin: 0px auto;">
					
					
					   <!--로그인 했을 때  -->
					   
						   <!--구매 안했을 때 구매하기 클릭 (로그인on/구매이력x) -->
							<c:if test="${ (!empty user) and (checkbuy eq 0) }">
							<c:forEach var="vo2" items="${ showmycash}">
									<div id="buy" style="width: 240px; height: 33px; background-color: #FFDA25; 
									margin: 0px auto; text-align: center; border-radius: 0.5rem; padding: 12px 0px 0px 0px; 
									font-family: 'Pretendard Variable', sans-serif !important; font-weight: 500 !important; font-size: 1rem;
									cursor:pointer;" onclick="buying_ref(${ checkbuy },${ vo.ref_seq },${ vo2.point },${ vo.content_price } );">
										구매하기
									</div>
							</c:forEach>
							</c:if>	
				
							<!--구매 했을 때 다운로드 클릭  -->
							<c:if test="${ (!empty user) and (checkbuy eq 1) }">
								<div id="buy downA" style="width: 240px; height: 33px; background-color: #FFDA25; 
								margin: 0px auto; text-align: center; border-radius: 0.5rem; padding: 12px 0px 0px 0px; 
								font-family: 'Pretendard Variable', sans-serif !important; font-weight: 500 !important; font-size: 1rem;
								cursor:pointer;" onclick="download_ref('${vo.ref_seq}', '${ vo.content}', '${vo.fileSize}');">
								다운로드
								</div>
							</c:if>	
						
						
						<!-- 로그인안했을 때 -->
						<c:if test="${empty user}">
							<div style="width: 240px; height: 33px; background-color: #DFDFDF; 
							margin: 0px auto; text-align: center; border-radius: 0.5rem; padding: 12px 0px 0px 0px; 
							font-family: 'Pretendard Variable', sans-serif !important; font-weight: 500 !important; font-size: 1rem;
							cursor:pointer; color:white; " onclick="send_buyalertLogin();">
								다운로드
							</div>
						</c:if>
					</div>
				</div>
				
				
				<div class="comment">
					<div style="width: 685px; height: 76px;"></div>
					<div style="width: 685px; height: 44px;">
						<h3 style="font-family: 'Pretendard Variable', sans-serif !important;">
							후기
						</h3>
					</div>
				</div>


				<div style="width: 685px; height: 93px; background-color: #FAFAFA; margin: 0px auto;">
					<div
						style="width: 170px; height: 93px; margin: 0px auto; text-align: center;">
						<div class="fl"
							style="width: 67px; height: 53px; margin: 15px 0px 0px 0px; font-size: 44px; font-family: 'Pretendard Variable', sans-serif !important; font-weight: 500 !important;">
							<b>${ vo.avg_score }</b>
						</div>
						<div class="fl" style="width: 90px; height: 38px;">

							<div style="width: 90px; height: 30px;"></div>
							
							
						<div class="fl" style="margin-left:23px; width:100px;">
						<c:if test="${ vo.avg_score - 1 ge 0 && vo.avg_score - 1 le 1}"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAHalf.png"
								style="height: 16px; weight: 18px;">
							</div>
						 </c:if>
						
						 <c:if test="${ vo.avg_score - 2 gt 0 }"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAFilled.png"
									style="height: 16px; weight: 18px;">
							</div>
						 </c:if>
							
						<c:if test="${ vo.avg_score - 3 ge 0 && vo.avg_score - 3 le 1}"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAHalf.png"
								style="height: 16px; weight: 18px;">
							</div>
						 </c:if>
						 	
						 <c:if test="${ vo.avg_score - 4 gt 0 }"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAFilled.png"
									style="height: 16px; weight: 18px;">
							</div>
						 </c:if>
						 <c:if test="${ vo.avg_score - 5 ge 0 && vo.avg_score - 5 le 1}"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAHalf.png"
								style="height: 16px; weight: 18px;">
							</div>
						 </c:if>
						  <c:if test="${ vo.avg_score - 6 gt 0 }"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAFilled.png"
									style="height: 16px; weight: 18px;">
							</div>
						 </c:if>
						 <c:if test="${ vo.avg_score - 7 ge 0 && vo.avg_score - 7 le 1}"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAHalf.png"
								style="height: 16px; weight: 18px;">
							</div>
						 </c:if>
						  <c:if test="${ vo.avg_score - 8 gt 0 }"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAFilled.png"
									style="height: 16px; weight: 18px;">
							</div>
						 </c:if>
						 <c:if test="${ vo.avg_score - 9 ge 0 && vo.avg_score - 9 lt 1}"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAHalf.png"
								style="height: 16px; weight: 18px;">
							</div>
						 </c:if>
						  <c:if test="${ vo.avg_score - 10 eq 0 }"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAFilled.png"
									style="height: 16px; weight: 18px;">
							</div>
						 </c:if>	

						</div>

						
						<div class="fl"
							style="width: 110px; height: 20px; margin-top:-5px; font-size: 0.875rem; line-height: 1.25rem; font-family: 'Pretendard Variable', sans-serif !important; font-weight: 400 !important;">
							${ comment_cnt } 개 후기
						</div>
						
					</div>
				</div>
		</div>
				<div style="clear: both"></div>
				<div style="margin: 10px 0px 0px 0px; background-color: white;"></div>

				
				
				<!--로그인 되어있고 자료 구매했을 때만 후기 달기 가능  -->
				<c:if test="${ (!empty user) and (checkbuy eq 1) }">
					<div class="comment_write_login" style="margin:0 auto;"
						onclick="modalOn(${ vo.ref_seq});" >후기남기기</div>
						
						<!--showPopup(${ vo.ref_seq});  -->
				</c:if>
				
				
						<!-- 모달창 -->
					 <div class="modal">
   						   <div class="modal_body" >
   						   		<div style="height:40px; width:400px;  margin:0 auto; text-align:center; 
									font-size:20px;">
									자료는 어떠셨나요?
									</div>		
									<div style="height:113px; width:400px;  margin:0 auto; padding:24px 38px 24px 0px;">
										<div  class="fl" style="height:113px; width:80px; margin:0 auto;">
										
										</div>
										<div class="fl" style="height:14px; width:280px;  margin:0 auto; font-size:14px;
										color:#33B89F;">
										${ vo.nickname}
										</div>
										<div class="fl" style="height:14px; width:280px;">
										
										</div>
										
										<div  class="fl" style="height:54px; width:280px;  margin:0 auto; font-size:18px;">
										${ vo.content}
										</div>
									</div>		
									<div style="height:18px; width:280px;  margin:0 auto; font-size:18px; padding:12px 0px 0px 0px;
									text-align:center; font-family: NotoSansKRRegular, sans-serif !important; position:relative; top:-15px;">별점</div>
									<div style="height:50px; width:250px;  margin:0 auto; text-align:center;">
									
									
										<img id="imgStar1" src="../Images/leftemptystar.PNG" 
										onclick="mark(1)"
										style="height:40px; width:22px; cursor:pointer; margin:0px -3px; padding:0px;">
										<img id="imgStar2" src="../Images/rightemptystar.PNG" 
										onclick="mark(2)"
										style="height:40px; width:22px; cursor:pointer; margin:0px -3px; padding:0px;">
										<img id="imgStar3" src="../Images/leftemptystar.PNG" 
										onclick="mark(3)"
										style="height:40px; width:22px; cursor:pointer; margin:0px -3px; padding:0px;">
										<img id="imgStar4" src="../Images/rightemptystar.PNG"
										onclick="mark(4)"
										style="height:40px; width:22px; cursor:pointer; margin:0px -3px; padding:0px;">
										<img id="imgStar5" src="../Images/leftemptystar.PNG" 
										onclick="mark(5)"
										style="height:40px; width:22px; cursor:pointer; margin:0px -3px; padding:0px;">
										<img id="imgStar6" src="../Images/rightemptystar.PNG" 
										onclick="mark(6)"
										style="height:40px; width:22px; cursor:pointer; margin:0px -3px; padding:0px;">
										<img id="imgStar7" src="../Images/leftemptystar.PNG" 
										onclick="mark(7)"
										style="height:40px; width:22px; cursor:pointer; margin:0px -3px; padding:0px;">
										<img id="imgStar8" src="../Images/rightemptystar.PNG"
										onclick="mark(8)"
										style="height:40px; width:22px; cursor:pointer; margin:0px -3px; padding:0px;">
										<img id="imgStar9" src="../Images/leftemptystar.PNG" 
										onclick="mark(9)"
										style="height:40px; width:22px; cursor:pointer; margin:0px -3px; padding:0px;">
										<img id="imgStar10" src="../Images/rightemptystar.PNG"
										onclick="mark(10)"
										style="height:40px; width:22px; cursor:pointer; margin:0px -3px; padding:0px;">
										
							
										<!--<img src="https://kimstudy.com/Resources/images/icStarAEmpty@3x.png" style="height:40px; width:40px; margin:2px;">-->
										
									</div>
									
									<div style="color: #a3a3a3 !important; height:18px; width:400px; margin:0 auto; 
									font-size:13px; padding:0px 0px 32px 0px; text-align:center; 
									font-family: 'NotoSansKRRegular', sans-serif !important;">별점을 선택해주세요</div>
									<div style="height:20px; width:250px;  margin:0 auto;"></div>
									<div style="height:18px; width:400px;  margin:0 auto; 
									font-size:18px; padding:0px 0px 32px 0px; text-align:center; 
									font-family: 'NotoSansKRRegular', sans-serif !important;">총평</div>
									<textarea id="message" placeholder="내용을 입력해주세요."></textarea>
									
									<div style="height:38px; width:464px;"></div>
									
									<div style="height:58px; width:464px; margin:0 auto;">
									<div class="fl" style="height:43px; width:223px; cursor:pointer; text-align:center; border-radius: 8px; border:1px solid #D1D0CE;
									padding: 15px 0px 0px 0px;" onclick="modalOn();">
									닫기
									</div>
									<div class="fl" style="height:58px; width:13px;"></div>
									<div class="fl" style="height:43px; width:223px; cursor:pointer;
									text-align:center; padding: 15px 0px 0px 0px; color:white; background-color:#33B89F; border-radius: 8px;" 
									onclick="save(${ vo.ref_seq });">	
									저장하기
									</div>
									</div>	
								</div>
								
   						   
   						   </div>
   				 
   				 
   				 
				<!-- 1차 거름 : 로그인 되어있지만 자료 구매했을 때만 후기 달기 가능  (역시 후기 못남김)-->
				<!-- 2차 거름 : 로그인안되있어서 회색 후기남기기 박스뜸 ( 후기 못남김 ) -->
				<c:choose>
					<c:when test="${(!empty user) and (checkbuy eq 0)}">
							<div class="comment_write_logout btn-open-popup"
							style="margin: 0px auto; cursor: pointer;"
							onclick="send_alertBuying();">후기남기기</div>
					</c:when>
					
					<c:when test="${(empty user)}">
							<div class="comment_write_logout btn-open-popup"
							style="margin: 0px auto; cursor: pointer;"
							onclick="send_alertLogin();">후기남기기</div>
					</c:when>
				</c:choose>

			</c:forEach>
					
					
					
			<div style="margin: 10px 0px 0px 0px;">
				<div style="margin: 0px 0px 0px 150px;">
					<img class="fl" style="height: 15px; width: 15px;"
						src="https://kimstudy.com/Resources/images/ic18_info_line.svg">
					<div class="fl"
						style="font-size: 15px; padding: 0px 0px 0px 10px; color: #777777;">
						이 자료를 다운받은 회원만 후기를 남기실 수 있습니다.</div>
				</div>
			</div>
			<div style="clear: both"></div>
			<div style="margin: 50px 0px 0px 0px;"></div>


			<div class="comment_content"
				style="width: 685px; height: 0px auto; margin: 0px auto; padding: 10px 20px 100px 20px;">


				<div style="width: 685px; height: 0px auto;">
					<c:forEach var="vo" items="${ list_comment }">
						<div
							style="width: 685px; min-height: 81px; height:auto; margin: 20px 0px 0px 0px; border-bottom: 1px solid #e5e7eb;">
							<!-- 사진영역 -->
							<div class="fl" style="width: 72px; height: 81px;">
								<img src="https://kimimage.place5.com/profile_man.png"
									style="border-radius: 50%; height: 50px; width: 50px;">
							</div>
							<!-- 컨텐츠영역 -->

							<div class="fl"
								style="width: 560px; height: 14px; font-size: 14px; color: #a3a3a3; font-family: 
								'Pretendard Variable', sans-serif !important; font-weight: 400 !important;">${ vo.nickname }</div>
							<div class="fl"
								style="width: 560px; height: 14px; font-size: 14px; color: black; font-family: 
								'Pretendard Variable', sans-serif !important; font-weight: 500 !important;">

								<c:if test="${ vo.regist_score - 1 ge 0 && vo.regist_score - 1 le 1}"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAHalf.png"
								style="height: 12px; weight: 12px;">
							</div>
						 </c:if>
						
						 <c:if test="${ vo.regist_score - 2 gt 0 }"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAFilled.png"
									style="height: 12px; weight: 12px;">
							</div>
						 </c:if>
							
						<c:if test="${ vo.regist_score - 3 ge 0 && vo.regist_score - 3 le 1}"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAHalf.png"
								style="height: 12px; weight: 12px;">
							</div>
						 </c:if>
						 	
						 <c:if test="${ vo.regist_score - 4 gt 0 }"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAFilled.png"
									style="height: 12px; weight: 12px;">
							</div>
						 </c:if>
						 <c:if test="${ vo.regist_score - 5 ge 0 && vo.regist_score - 5 le 1}"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAHalf.png"
								style="height: 12px; weight: 12px;">
							</div>
						 </c:if>
						  <c:if test="${ vo.regist_score - 6 gt 0 }"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAFilled.png"
									style="height: 12px; weight: 12px;">
							</div>
						 </c:if>
						 <c:if test="${ vo.regist_score - 7 ge 0 && vo.regist_score - 7 le 1}"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAHalf.png"
								style="height: 12px; weight: 12px;">
							</div>
						 </c:if>
						  <c:if test="${ vo.regist_score - 8 gt 0 }"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAFilled.png"
									style="height: 12px; weight: 12px;">
							</div>
						 </c:if>
						 <c:if test="${ vo.regist_score - 9 ge 0 && vo.regist_score - 9 le 0.9}"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAHalf.png"
								style="height: 12px; weight: 12px;">
							</div>
						 </c:if>
						  <c:if test="${ vo.regist_score - 10 eq 0 }"> 
						 	<div class="fl">
								<img src="https://kimstudy.com/Resources/images/icStarAFilled.png"
									style="height: 12px; weight: 12px;">
							</div>
						 </c:if>
								<b style="margin-left:8px;">${ vo.regist_score }</b>

							</div>
							
							
							<div class="fl"
								style="width: 560px; height: 10px; font-size: 10px; color: #a3a3a3; font-family: 'Pretendard Variable', sans-serif !important; font-weight: 400 !important;">
									<f:parseDate value="${vo.write_date}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
	         						<f:formatDate value="${dateValue}" pattern="YYYY-MM-dd"/>
								
								</div>
							<div class="fl"
								style="width: 560px; min-height: 21px; height:auto; margin: 10px 0px 0px 0px; color: #1C2322 !important; opacity: 0.7; font-family: 'Pretendard Variable', sans-serif !important; font-weight: 500 !important;">${ vo.content }</div>

							<div style="clear: both"></div>
						</div>
					</c:forEach>

				</div>





			</div>



		</div>

	</div>
	



</body>
</html>