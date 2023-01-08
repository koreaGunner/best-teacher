<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>      


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐시 충전 페이지</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>

	/*내캐시 박스  */
	.reference_benner {
	width : 768px;	
	height : 38px;
	padding : 20px 0;
	margin:0px auto;
	}	
	
	/*내캐시 박스 안 */
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
	
	.showcash {
	width:650px;
	border:1px solid #eaeaea;
	padding:20px 0px 0px 0px;
	margin:0px auto;
	font-family: "NotoSansKRRegular", sans-serif !important;
	
	}
	
	.showcash >div:nth-child(1) {
	width:586px;
	height:30px;
	background-color:#f7f7f7;
	padding:12px 32px;
	font-size:20px;
	}
	
	.showcash >div:nth-child(2) {
	width:586px;
	height:85px;
	
	padding:32px;
	text-align:center;
	
	}
	
	.showcash >div:nth-child(2)>div:nth-child(1) {

	text-align:center;
	height:80px;
	display:inline;
	font-size: 24px !important;
	font-family: "NotoSansKRRegular", sans-serif !important;
	}
	
	
	.showcash >div:nth-child(2)>div:nth-child(2) {
	height:60px;
	text-align:center;
	color: #a3a3a3 !important;
	font-size: 12px !important;
	text-decoration: underline;
	text-decoration-color : #a3a3a3;
	}
	
	.showcash >div:nth-child(3) {
	width:650px;
	height:40px;
	color: #666666;
	font-size:16px;
	background-color:#f7f7f7;
	text-align:center;
	padding:10px 0px 0px 0px;
	}
	
	.margin {
	width:650px;
	height:30px;
	margin:0px auto;

	}
	
	
	.text {
	width:610px;
	height:180px;
	border:1px solid #eaeaea;
	padding:20px;
	margin: 0 auto;
	background-color:#f7f7f7;
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
	
	
	.fl {float:left;}	
	.fr {float:right;}	

</style>

	
	<script src = "../js/httpRequest.js"></script>
	<script type="text/javascript">
	
	function send_cashpage(){
		
		var url = "mycash.do";
		location.href = 'mycash.do';	
	}
	
	function send_zzimlistpage(){
		var url = "zzimlist.do";
		location.href = 'zzimlist.do';
	}
	
	function send_cashchargepage(){
		var url = "cashcharge.do";
		location.href = 'cashcharge.do';
	}
	
	function send_detail(num, contentname, filesize ){		
		var ref_seq =num;
		var content =contentname;
		var fileSize =filesize;
		
		var param_ref_seq = "ref_seq=" + ref_seq;
		var param_content = "content=" + content;
		var param_fileSize = "fileSize=" + filesize;
		
		var url = "reference_detail.do";
		
		location.href = 'reference_detail.do'+"?"+param_ref_seq + "&"+param_content + "&" + param_fileSize;
	}
	
	
	
	//뒤로가기
	function send_back(){
		location.href = "reference.do";
	}
	</script>





</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../Main_header.jsp"></jsp:include>
	
	<!-- 특급자료실 박스 -->
	<div class= "reference_benner" style="border-bottom:1px solid #e5e7eb;">
			<div class="my_item">
				<div class="fl">구매한 자료</div>
				
				
			
			
				<div class="fr">
				
					<!-- 내캐시 -->
					<div class="fl" 
					style="height:33px; width:56px; letter-spacing: -0.05em; text-align: center;">
						
					
						<img src ="../Images/mark_cash.PNG" 
						style= "height:24px; width:24px; margin:0px 0px 0px 16px; display:block; cursor:pointer;"
						onclick="send_cashpage();">
						캐시	
					</div>
					
					<div class="fl" 
					style="height:33px; width:56px; letter-spacing: -0.05em; text-align: center;">
						
						<img src ="../Images/mark_heart.PNG" 
						style= "height:24px; width:24px; margin:0px 0px 0px 16px; display:block; cursor:pointer;"
						onclick="send_zzimlistpage();">
						찜한자료
					</div>
					<div class="fl" 
					style="height:33px; width:60px; letter-spacing: -0.05em; text-align: center;">
						<img src ="../Images/mark_cashplus.PNG" 
						style= "height:24px; width:24px; margin:0px 0px 0px 16px; display:block; cursor:pointer;"
						onclick="send_cashchargepage();">
						캐시충전
					</div>
				
				</div>
				<div style="clear:both"></div><!-- float의 영향이 아래까지 내려가지않도록 끊어주는 기능. -->
				
				
				
				
			<div class="back">
			<div class="fl" style="width: 100px; height: 78px; cursor: pointer;">

				<img src="../Images/mark_arrow.PNG"
					style=" position:relative; top:6px; display: inline-block; width: 20px; height: 20px; padding: 30px 0px;"
					class="fl" onclick="send_back();">


				<div class="fl" style="position:relative; top:4px; padding: 30px 0px;" onclick="send_back();">
					<strong>리스트보기</strong>
				</div>
			</div>
			</div>
			
			</div>
	</div>
	
<div style="clear: both"></div>

	
	<div class="content">
		<div class="inner">
		
		<c:if test="${empty list_content}">
			<h2 style="text-align:center; position:relative; top:100px; font-size:30px;">😀 구매한 자료가 없습니다!</h2>
		</c:if>
		
		
		<c:forEach var="vo2" items="${ list_content }">
			<div class="list_item" style= "cursor:pointer; padding: 10px 0px 0px 0px;" 
			onclick="send_detail('${vo2.ref_seq}', '${ vo2.content}', '${vo2.fileSize}');">
			
				<div class="fl">
				
					<!-- 사진넣는곳 -->
					<div>	
						<img src="../upload/${ vo2.ref_route }"
						align="middle">
					</div>
				</div>
				<div class="fr">
					<div>${ vo2.id }</div>
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
						<div class="fl">${ vo2.avg_score }</div>
					</div>
					<div style="clear:both"></div>
				</div>
				<div style="clear:both"></div>
			</div>
		</c:forEach>
		
		</div> <!-- inner  -->
	<div style="border-top:1px solid #e5e7eb; height:100px; width:768px; margin:0 auto;"></div>
	</div>
	
</body>

</html>