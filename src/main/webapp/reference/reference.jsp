<%@page import="reference_vo.Subject_middleVO"%>
<%@page import="java.util.List"%>
<%@page import="reference_dao.Subject_middleDAO"%>
<%@page import="reference_vo.ContentVO"%>
<%@page import="reference_dao.ContentDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>      



<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>김과외 특급자료실</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>

	
	/*특급자료실 박스  */
	.reference_benner {
		width : 768px;	
		height : 38px;
		padding : 20px 0;
		margin:0px auto;
	}
	
	/*특급자료실 박스 안 */
	.reference_benner > div.my_item >div:nth-child(1) {
	font-size:24px;
	font-family: 'Pretendard Variable', sans-serif !important;
    font-weight: 700;
    padding:1px;
	height:31px;
	width:130px;
		
	}
	/*my_list박스  */
	.reference_benner > div.my_item >div:nth-child(2) {
	font-family: "NotoSansKRRegular", sans-serif !important;
	font-size:8px;
    font-weight: 300;
    margin: 0px auto;
    padding:0px 0px 0px 1px;
	}
	
	.reference_benner > div.my_item > div:nth-chile(2) > div {
	display:inline-block;
	}
	
	
	
	/* 중과목 분류  */
	.subject_middle { 
		width:768px;
		margin:0 auto;
		height:124px;
		/* background-color:#E6E6E6;  */
		background-color:#f7f7f7;
		border-radius: 0.5em;
	}
	
	.subject_middle > li { 
		
		text-align: center; 
		display: inline-block; 
		padding: 8px 8px;
		width:104px; 
		margin:0px; 
		font-size: 16px; 
	 	color:black;
		cursor:pointer;
	}
	/* 소과목 분류 */
	.subject_bottom { 
		width:768px;
		margin:0 auto;
		height:100% ;
		border : 1px solid #eaeaea;
	}
	/*정렬박스  */
	.align { 
		width:768px;
		margin:0 auto;
		height:33px;
		padding-top:10px;
	}
	
	.align > div > div { 
		padding:1px 5px 0px 5px;
		margin: 0 auto;
		font-family: 'NotoSansKRRegular', sans-serif !important;
		color: #cfcfcf;
		
		
	}
	
	
	/* 컨텐츠 포괄하는 div  */
	div.inner{  
		width: 768px;
		margin:0 auto;
	
	
	}
	
	/* 컨텐츠별 div  */
	.content > div.inner > div.list_item {
		border-top: 1px solid #e5e7eb;
		width:768px;
		height:132px;
		margin:0 auto;
	
	}
	
	

	
	.fl {float:left;}	
	.fr {float:right;}	
	.hovermiddle:hover{
		color:#848484;
	}
	.hover:hover {
		color:black;
	}
	
	.hover1:hover {
		color: #2673F0 !important;
   		border:1px dashed #2673F0 !important; 
		
	}
	
	.hover2:hover {
   
	  	color: #2673F0 !important;
	    background-color: #fff;
	    border: 1px solid #2673F0 !important;
      
   }


</style>

	<!-- ajax - 중과목 선택 카테고리 기능 -->
	<script src = "../js/httpRequest.js"></script>
	<script type="text/javascript">
	
	
	
		//중과목 눌렀을 때 : 해당 중과목 소속 소과목 출력 /  해당 중과목 관련 컨텐츠 거름용 
		function send_subject_middle( middle ) {
			
			var subject_middle = middle; //유효성체크 (무슨과목불러올것이냐)
			
			var url = "reference.do";
			var param = "subject_middle=" + subject_middle;
			location.href = 'reference.do' + "?"+param; 
			 
			//다시 돌아오는 곳 설정 -> js폴더에 준비해둔 httpRequest 안의 sendRequest사용
			//sendRequest(전송 url , 파라미터, 	콜백 메서드, 전송타입);
			
		}

		//소과목 눌렀을 때 해당 컨텐츠 거름용
		function send_subject_bottom(bottom ){
			
			var subject_bottom = bottom;
			
			var url = "reference.do";
			var param = "subject_bottom=" + subject_bottom;
			 location.href = 'reference.do' + "?" + param;
		
		}
		
		
		//글쓰기 페이지 가기
		function send_uploadpage(user){
			var id = user;
			var param = "id=" + id
			var url = "fileUploadForm.jsp";
			location.href = 'fileUploadForm.jsp'+"?"+param;
		}
		
		//구매목록 페이지 가기
		function send_buylistpage(user){
			var id = user;
			var param = "id=" + id
			var url = "buylistaction.do";
			location.href = 'buylistaction.do'+"?"+param;
		}
		
		
		
		function delete_ref(num){
			var ref_seq=num;
			var param = "ref_seq=" + ref_seq
			var url = "delete.do";
			location.href = 'delete.do'+"?"+param;
		}
		
		//최신순 정렬눌렀을 때
		function send_align_latest(latest) {
			var align = latest;
			var subject_middle = '<%=request.getParameter("subject_middle")%>';
			var subject_bottom = '<%=request.getParameter("subject_bottom")%>';
		
			var url = "reference.do";
		
			var param_middle = "subject_middle=" + subject_middle;
			var param_bottom = "&subject_bottom=" + subject_bottom;
			var param_align = "&align=" + align;
		    location.href = 'reference.do' + "?" + param_middle + param_bottom + param_align;
			 
			
		}
		//다운로드순 정렬눌렀을 때
		function send_align_download(download)  {
			var align = download;
			var subject_middle = '<%=request.getParameter("subject_middle")%>';
			var subject_bottom = '<%=request.getParameter("subject_bottom")%>';
			
			var url = "reference.do";
					
			var param_middle = "subject_middle=" + subject_middle;
			var param_bottom = "&subject_bottom=" + subject_bottom;
			var param_align = "&align=" + align;
			location.href = 'reference.do' + "?" + param_middle + param_bottom + param_align;	
		}
		//평점순 정렬눌렀을 때
		function send_align_avgscore(avgscore) {
			
			var align = avgscore;
			var subject_middle = '<%=request.getParameter("subject_middle")%>';
			var subject_bottom = '<%=request.getParameter("subject_bottom")%>';
			
			var url = "reference.do";
					
			var param_middle = "subject_middle=" + subject_middle;
			var param_bottom = "&subject_bottom=" + subject_bottom;
			var param_align = "&align=" + align;
			location.href = 'reference.do' + "?" + param_middle + param_bottom + param_align;
			
		}
		
	
		/*상세페이지 전환  */
		function send_detail(num, contentname, filesize ){		
			var ref_seq = num;
			var content = contentname;
			var fileSize = filesize;
			
			var param_ref_seq = "ref_seq=" + ref_seq;
			//var param_content = "content=" + encodeURIComponent(content);
			//var param_fileSize = "fileSize=" + filesize;
			
			var url = "reference_detail.do";
			
			location.href = 'reference_detail.do'+"?"+param_ref_seq;
		}
		
		//로그인하라고 띄우는 창
		function send_alertLogin(){
			alert("로그인을 해주세요.");
		}
		//캐시페이지 가기
		function send_cashpage(){
			var url = "mycash.do";
			location.href = 'mycash.do';
		}
		
		//캐쉬충전페이지 가기
		function send_zzimlist(){
			var url = "zzimlist.do";
			location.href = 'zzimlist.do';
		}
		
		//캐쉬충전페이지 가기
		function send_cashcharge(){
			var url = "cashcharge.do";
			location.href = 'cashcharge.do';
		}
	</script>





</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../Main_header.jsp"></jsp:include>
	
	<!-- 특급자료실 박스 -->
	<div class= "reference_benner">
			<div class="my_item">
				<div class="fl">특급자료실</div>
				<div class="fr">
					<div class="fl" 
					style="height:33px; width:200px; letter-spacing: -0.05em; text-align: right;
					border-bottom : 2px solid black;">
					
					<!--검색기능  -->
					<form action="search.do">
						<input class="fl" name="id" type="text" placeholder="제목/내용 검색하기"size="20" 
						style="height:33px; width:150px; padding: 0px 0px 0px 10px; border: 0px solid white;">
						
						
						<input type="submit" value="" style="height:24px; width:24px; cursor:pointer;
						background-size:100% 100%; background-image:url(https://kimstudy.com/Resources/images/content_search.png);
						border:0px white; background-color:white;">
						
					 </form>
					 
					</div>
					
					<div class="fl" 
					style="height:33px; width:56px; letter-spacing: -0.05em; text-align: center;">
						
						<c:if test="${!empty user}">
							<img src ="../Images/mark_cash.PNG" 
							style= "height:24px; width:24px; margin:0px 0px 0px 16px; display:block; cursor:pointer;"
							onclick="send_cashpage()">
						</c:if>	
						<c:if test="${empty user}"> 
							<img src ="../Images/mark_cash.PNG" 
							style= "height:24px; width:24px; margin:0px 0px 0px 16px; display:block; cursor:pointer;"
							onclick="send_alertLogin()">
						</c:if>
					
						
						
						<c:forEach var="vo" items="${ showmycash }">
						<c:if test="${!empty user}">
						${ vo.point } 
						</c:if>
						</c:forEach>
						
						<c:if test="${empty user}"> 
						캐시
						</c:if>
					</div>
					
					<div class="fl" 
					style="height:33px; width:56px; letter-spacing: -0.05em; text-align: center;">
					
						<c:if test="${!empty user}">
							<img src ="../Images/mark_heart.PNG" 
							style= "height:24px; width:24px; margin:0px 0px 0px 16px; display:block; cursor:pointer;"
							onclick="send_zzimlist()">
						</c:if>	
						<c:if test="${empty user}"> 
							<img src ="../Images/mark_heart.PNG" 
							style= "height:24px; width:24px; margin:0px 0px 0px 16px; display:block; cursor:pointer;" 
							onclick="send_alertLogin()">
						</c:if>
						찜한자료
					</div>
					<div class="fl" 
					style="height:33px; width:60px; letter-spacing: -0.05em; text-align: center;">
						<c:if test="${!empty user}">
							<img src ="../Images/mark_cashplus.PNG" 
							style= "height:24px; width:24px; margin:0px 0px 0px 16px; display:block; cursor:pointer;"
							onclick="send_cashcharge()">
						</c:if>	
						<c:if test="${empty user}"> 
							<img src ="../Images/mark_cashplus.PNG" 
							style= "height:24px; width:24px; margin:0px 0px 0px 16px; display:block; cursor:pointer;" 
							onclick="send_alertLogin()">
						</c:if>
						
						캐시충전
					</div>
				
				</div>
				<div style="clear:both"></div><!-- float의 영향이 아래까지 내려가지않도록 끊어주는 기능. -->
			</div>
	</div>
	
	<!-- 중과목 분류 -->			
	<div class="subject_middle">
			<!--jdbc  -->
			<c:forEach var="vo" items="${ list_subject_middle }">
				<li class="hovermiddle"
				onclick="send_subject_middle('${ vo.subject_middle }');">
				${ vo.subject_middle }
				</li>
				
			</c:forEach>
	</div>
	
	<div class="subject_bottom">
		<c:forEach var="vo" items="${ list_subject_bottom }" >
			<div class="hover1" style="text-align:center; display: inline-block; padding: 8px 16px; margin:4px;
			font-size: 12px; border:1px dashed #e1e1e1; border-radius:4px; cursor:pointer;"
			onclick="send_subject_bottom('${ vo.subject_bottom }');" >
			${ vo.subject_bottom }  
			</div>
			
			
			
		</c:forEach>
		
	
	</div>
	
	
	<!-- 6 -->
	<div class="align">
		<div>
			
			<c:if test="${!empty user}">
					<div class="fl" 
		                 style = "color: #2673F0 !important; background-color: #fff; border: 1px solid transparent;
		                	      border-image: linear-gradient(to right, #5ec8d9, #2730C1); border-image-slice: 1;
		             		      font-size:14px; cursor:pointer;" 
		              		      onclick="send_uploadpage('${user.id}')" >
                   		<p>게시글 작성</p>
              	   </div>
					
					<div class="fl"
					     style = "margin-left:3px; color: #2673F0 !important; background-color: #fff;
              				      border: 1px solid transparent; border-image: linear-gradient(to right, #5ec8d9, #2730C1);
                  				  border-image-slice: 1; font-size:14px; cursor:pointer; 
              					  position:relative; left:5px;"
               					  onclick="send_buylistpage('${user.id}')" >
             	    	<p>구매한 자료</p>
               		</div>
					
			</c:if>	
			
			<div class="fr hover" style = "font-size:14px; cursor:pointer;" 
				 onclick="send_align_avgscore('avgscore');" >
				 평점순
			</div>
			<div class="fr" style = "font-size:14px; padding:0px 5px;"  >
				|
			</div>
			<div class="fr hover" style = "font-size:14px; cursor:pointer;" 
				 onclick="send_align_download('download');" >
				 다운로드순
			</div>
			<div class="fr" style = "font-size:14px; padding:0px 5px;"  >
				|
			</div>
			<div class="fr hover" style = "font-size:14px; cursor:pointer;" 
				 onclick="send_align_latest('latest');" >
				 최신순
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
	<!-- 7  컨텐츠 -->
	
<style>
	
	/*컨텐츠 이미지  */
	.list_item > div:nth-child(1) {
		width: 120px;
		height: 120px;
		border: 1px solid #e5e7eb;
	}

	
	.list_item div:nth-child(1) > img {
		margin: 10px;
		width: 100px;
		height:100px;
		border: 1px solid #e5e7eb;
		align:middle;
	}
	
	/*컨텐츠 내용  */
	.list_item > div:nth-child(2) {
		padding:0px;
		width: 640px;
		height: 120px;
		/* border: 1px solid #e5e7eb; */
	}
	.list_item > div:nth-child(2) > div:nth-child(1) {
		margin: 8px 0px 0px 0px;
		width: 628px;
		height: 20px;
		font-size: 0.875rem;
    	line-height: 1.25rem;
    	color : #BDBDBD;
		/* border: 1px solid #e5e7eb; */
	
	}
	
	.list_item > div:nth-child(2) > div:nth-child(2) {
		width: 628px;
		height: 52px;
		font-family: 'Pretendard Variable', sans-serif !important;
    	font-weight: 500 !important;
		font-size: 1rem;
   		line-height: 1.5rem;
		/* border: 1px solid #e5e7eb; */
	
	}
	.list_item > div:nth-child(2) > div:nth-child(3) {
		width: 628px;
		height: 22px;
		background-color : white;
		margin: 8px 0px 0px 0px;
	}
	

	.list_item > div:nth-child(2) > div:nth-child(3) > div:nth-child(1) {
		font-family: sans-serif !important;
		font-weight: 400 !important;
   	 	font-style: normal;
    	font-stretch: normal;
    	font-size: 0.875rem;
    	line-height: 1.25rem;
	}
	
	.list_item > div:nth-child(2) > div:nth-child(3) > div:nth-child(4) {
		font-family: sans-serif !important;
		font-weight: 400 !important;
   	 	font-style: normal;
    	font-stretch: normal;
    	font-size: 0.875rem;
    	line-height: 1.25rem;
	}
	
	.list_item > div:nth-child(2) > div:nth-child(3) > div:nth-child(6) {
		font-family: sans-serif !important;
		font-weight: 400 !important;
   	 	font-style: normal;
    	font-stretch: normal;
    	font-size: 0.875rem;
    	line-height: 1.25rem;
	}

</style>
	<div class="content" style="padding: 0px 0px 30px 0px;">
		<div class="inner">
		
		
		<c:forEach var="vo2" items="${ list_content }">
		<!-- 삭제버튼 활성화  -->
		<c:if test="${vo2.id eq user.id}"> 
			<div class="list_item" style= "cursor:pointer; padding: 10px 0px 0px 0px;">
			
				<div class="fl">
				
					<!-- 사진넣는곳 -->
					<div>
						
						<img src="../upload/${ vo2.ref_route }" align="middle" 
						onclick="send_detail('${vo2.ref_seq}', '${ vo2.content}', '${vo2.fileSize}');">
						
					</div>
				</div>
				<div class="fr">
					<div style="display:inline-block;">
					
						<div class="fl" style="display:inline-block;" 
						onclick="send_detail('${vo2.ref_seq}', '${ vo2.content}', '${vo2.fileSize}');">
						${ vo2.nickname }
						</div> 
						<div class="fl" style=" width:477px; height:20px;"
						onclick="send_detail('${vo2.ref_seq}', '${ vo2.content}', '${vo2.fileSize}');"></div>
						
						<!-- 삭제버튼 -->
						<input class="hover2 fr" type="button" value="삭제" 
                  			   style="width:50px; height: 25px; border: 0.5px solid #cfcfcf;
                    		   outline: none; color: #cfcfcf; background-color: white;
                 			   font-size:14px; cursor:pointer;"
                 			   onclick="delete_ref(${vo2.ref_seq})"/>
						<div style="clear:both"></div>
					</div>
					
					
					
					<div onclick="send_detail('${vo2.ref_seq}', '${ vo2.content}', '${vo2.fileSize}');">${ vo2.title }</div>
					<div onclick="send_detail('${vo2.ref_seq}', '${ vo2.content}', '${vo2.fileSize}');">
						<div class="fl">${ vo2.content_price }</div>
						<div class="fl"><img src="../Images/mark_cashcolor.PNG" 
							style= "height:16px; weight:16px;
							padding:2px 0px 0px 2px;"></div>
						<div class="fl"><img src="../Images/mark_download.PNG" 
							style="height:16px; weight:16px; padding:2px 0px 0px 2px;"></div>
						<div class="fl">${ vo2.download_cnt }</div>
						<div class="fl"><img src="../Images/mark_star.png" 
							style="height:16px; weight:16px; padding:2px 0px 0px 2px;"></div>
								
						<div class="fl">
							${ vo2.avg_score }
						</div>
					</div>
					<div style="clear:both"></div>
				</div>
				<div style="clear:both"></div>
			</div>
			</c:if>
		</c:forEach>
		
		
	
		<c:forEach var="vo2" items="${ list_content }">
		
		<!-- 삭제버튼 비활성화 -->
			<c:if test="${vo2.id ne user.id}">
			<div class="list_item" style= "cursor:pointer; padding: 10px 0px 0px 0px;"  
			onclick="send_detail('${vo2.ref_seq}', '${ vo2.content}', '${vo2.fileSize}');">
			
				<div class="fl">
				
					<!-- 사진넣는곳 -->
					<div>
						
						<img src="../upload/${ vo2.ref_route }" align="middle">
						
					</div>
				</div>
				<div class="fr">
					<div>${ vo2.nickname }</div>
					<div>${ vo2.title }</div>
					<div>
						<div class="fl">${ vo2.content_price }</div>
						<div class="fl"><img src="../Images/mark_cashcolor.PNG" 
							style= "height:16px; weight:16px;
							padding:2px 0px 0px 2px;"></div>
						<div class="fl"><img src="../Images/mark_download.PNG" 
							style="height:16px; weight:16px; padding:2px 0px 0px 2px;"></div>
						<div class="fl">${ vo2.download_cnt }</div>
						<div class="fl"><img src="../Images/mark_star.png" 
							style="height:16px; weight:16px; padding:2px 0px 0px 2px;"></div>
								
						<div class="fl">
							${ vo2.avg_score }
						</div>
					</div>
					<div style="clear:both"></div>
				</div>
				<div style="clear:both"></div>
			</div>
			</c:if>
		</c:forEach>
		
		
		
		</div> <!-- inner  -->
		<div style="border-top:1px solid #e5e7eb; height:100px; width:768px; margin:0 auto;"></div>
	</div>
</body>
</html>