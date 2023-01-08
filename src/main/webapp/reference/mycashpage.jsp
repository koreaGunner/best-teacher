<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>      


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내캐시페이지</title>
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
	
	
	
	</script>





</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../Main_header.jsp"></jsp:include>
	
	<!-- 특급자료실 박스 -->
	<div class= "reference_benner">
			<div class="my_item">
				<div class="fl">내 캐시</div>
				<div class="fr">
				
					<!-- 내캐시 -->
					<div class="fl" 
					style="height:33px; width:56px; letter-spacing: -0.05em; text-align: center;">
						
					
						<img src ="../Images/mark_cash.PNG" 
						style= "height:24px; width:24px; margin:0px 0px 0px 16px; display:block; cursor:pointer;"
						onclick="send_cashpage()">
						캐시	
					</div>
					
					<div class="fl" 
					style="height:33px; width:56px; letter-spacing: -0.05em; text-align: center;">
						
						<img src ="../Images/mark_heart.PNG" 
						style= "height:24px; width:24px; margin:0px 0px 0px 16px; display:block; cursor:pointer;"
						onclick="send_zzimlistpage()">
						찜한자료
					</div>
					<div class="fl" 
					style="height:33px; width:60px; letter-spacing: -0.05em; text-align: center;">
						<img src ="../Images/mark_cashplus.PNG" 
						style= "height:24px; width:24px; margin:0px 0px 0px 16px; display:block; cursor:pointer;"
						onclick="send_cashchargepage()">
						캐시충전
					</div>
				
				</div>
				<div style="clear:both"></div><!-- float의 영향이 아래까지 내려가지않도록 끊어주는 기능. -->
			</div>
	</div>

	<div class="showcash">
		<div>내 캐시</div>
		<div>
			<div>	
				<div>
					<c:forEach var="vo" items="${ showmycash }">	
					<p style="display:inline;">${ vo.point } </p>
					</c:forEach> 
					
					<img style="height:26px; width:26px; margin:10px 0px 0px 0px;   
					position: relative; top:4px;" src="../Images/mark_cashcolor.PNG"> 
					
				</div>		
			</div>
			<div onclick="send_cashchargepage()">
			<p style="cursor:pointer;">캐시 충전하기</p>
			</div>
		</div>
		<div>*캐시는 지식인활동으로 충전 가능하고, 특급자료실 자료 다운로드시 사용됩니다.</div>
	</div>
	
	<div class="margin"></div>
	<div class="text">
		<img style="width:24px; height:24px;"src="../Images/star-removebg-preview.png">
		<p style="position: relative; top:-6px; display:inline;" >최강선생에서 과외를 구하셨나요 ? </p>
		<div class="margin"></div>
		<div style="color: #a3a3a3;">최강선생에서의 포인트는 열혈활동을 증명해주는 증거입니다! 
		실제 과외를 진행할 때, 포인트로 구매한 자료들을 잘 이용하여 더 좋은 성적향상을 도모해보세요!</div>
		<div class="margin"></div>
		<div style="color: #a3a3a3; text-decoration: underline; text-decoration-color : #a3a3a3;">
		포인트를 얻는 방법은 다양합니다. 많은 포인트를 벌어보아요.</div>
		<div style="padding: 0px 0px 0px 510px; color:black; cursor:pointer;" onclick="send_cashchargepage()"> 포인트 벌기 ></div>
		
	</div>
	
</body>

</html>