<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지식인</title>
<script src="https://kit.fontawesome.com/bc13bff3f1.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/css.css">
<link rel="stylesheet" href="../css/subject.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


<script src="../js/httpRequest.js"></script>
<script src="../js/smooth.js"></script>
	<style>
	*{
		margin:0;
		padding:0;
	}
	html{
		padding-bottom:100px;
	}


	.list_header{
		margin:0 auto;
		margin-left:730px;
		width:650px;
		height:80px;
		margin-bottom:100px;
		position: relative;
		}
		
	.list_header > .list_searchBox{
		margin-top:70px;
		margin-left:0px;
		width:85%;
		height:60px;
		position: relative;
	}
	
	
	
	.list_header > .list_searchBox .list_Text_search{
		
		width:45%;
		height:60px;
		border-bottom:2px solid black;
		padding-bottom:8px;
		
		display: inline;
	
	}
	
	.list_header > .list_searchBox .list_Text_search > input{
		resize:none;
		border:none;
		
		height:30px;
		font-size: 20px;
		font-weight:600;
		width:170px;
		display: inline;
		margin-bottom: 20px;
	
	}
	
	
	
	.list_header > .list_searchBox .list_Text_search > input:focus{
		outline: none;
	}
	
	.list_header > .list_searchBox .list_Text_search > div{
		display: inline;
		font-size: 22px;
		cursor: pointer;
	}
	
	
	.list_header > .list_searchBox .list_Img_search{
		position:absolute;
		top:-2px;
		left:210px;
		width:189px;
		height:38px;
		border-bottom:2px solid black;
		
		display: inline;
		margin-left: 25px;
		padding-bottom: 3px
	}
	
	
	.list_header > .list_searchBox .list_Img_search input[type="file"]{
		display: none;
	}
	
	.list_header > .list_searchBox .list_Img_search input[type="file"] + span{
		font-size: 20px;
		cursor: pointer;
		font-weight: 600;
		color:#757575;
		letter-spacing: 5px;
		
	}
	
	.list_header > .list_searchBox .list_Img_search label > span > span{
		font-size: 25px;
	}
	
	.list_header > .list_myJisik{
		position:absolute;
		display: inline;
		height:50px;
		width:51px;
		left:460px;
		cursor: pointer;
		top:-5px;
	}
	
	.list_header > .list_myJisik > .list_myJisikImg{
		font-size: 20px;
		margin-left: 13px;
	
	}
	
	.list_header > .list_myJisik > .list_myJisikText{
		font-size: 15px;
		font-weight: 600;
	}
	
	
	
	
	
	.list_header > .list_jjim{
	
		position:absolute;
		display: inline;
		height:50px;
		width:50px;
		left:535px;
		cursor: pointer;
		top:-5px;
	
	}
	
	.list_header > .list_jjim > .list_jjimImg{
		font-size: 20px;
		margin-left: 7px;
	
	}
	
	.list_header > .list_jjim > .list_jjimText{
		font-size: 15px;
		font-weight: 600;
	}
	
	
	
	.list_header > .list_insert{
		position:absolute;
		display: inline;
		height:50px;
		width:50px;
		left:600px;
		cursor: pointer;
		top:-5px;
		
	}
	
	.list_header > .list_insert > .list_insertImg{
		font-size: 20px;
		margin-left: 7px;
	
	}
	
	.list_header > .list_insert > .list_insertText{
		font-size: 15px;
		font-weight: 600;
	}
	
	
	.Jisik_labelBox{
		width:650px;
		height:140px;
		margin:-90px auto 80px;
		margin-left:730px;
		background-color: #ffffff;
		position:relative;
		border:1px solid #e5e7eb;
	}
	
	.Jisik_labelBox > .Jisik_label{
		
		position:absolute;
		top:10px;
		left:30px;
		font-size: 22px;
		font-weight: 900;
		cursor: pointer;
		
	}
	
	.Jisik_labelBox > .Jisik_label > .Jisik_label_Main{
		
		border-bottom: 0.7px solid black;
	}
	
	.Jisik_labelBox > .Jisik_label_Info{
	
		color:red;
		position: absolute;
		font-size:16px;
		top:50px;
		left:30px;
		font-weight: 600;
	
	}
	.Jisik_labelBox > .Jisik_label_Info > p{
	
		margin-bottom:3px;
	
	}
	
	

	#listBox{
		position: relative;
		width:650px;
		height:auto;
		min-height:310px;
		border:1px solid #e5e7eb;	
		margin:60px auto 65px;
		margin-left:730px;
		overflow: hidden;
		border-radius: 30px;
		background-color: #ffffff;
		
	}
	
	#listBox.noList{
		text-align: center;
  		font-size: 30px;
  		font-weight: 600;
	}
	.noList_text{
		position: absolute;
   		width: 100%;
   		left: 50%;
  		top: 50%;
   		transform: translate(-50%,-50%);
	
	}
	
	.listSubjectBox{
		border-bottom: 1px solid #e5e7eb;
		width:100%;
		height:40px;
		position: relative;
	}
	
	.listSubjectBox .listSubject{
		position:absolute;
		/* color:#4285f4; */
		 
		 padding:2px 8px;
		color:#2730C1;
		font-size:18px;
		font-weight: 600;
		margin-left:35px;
		top:5px;
		
		
	}
	
	.listProfile{
		position:relative;
		border-bottom: 1px solid #e5e7eb;
		width:100%;
		height:70px;
		padding-bottom: 2px;
	}
	
	.listProfile .imgIcon{
		width:200px;
		display: inline-block;
		cursor: pointer;
		
	}
	
	.listProfile .imgIcon img{
		width:50px;
		height:50px;
		margin-top:12px;
		margin-left: 30px;
		border-radius: 70%;
	}
	
	.listProfile .nickname{
		position:absolute;
		font-size:18px;
		display: inline-block;
		top:11px;
		left:80px;
		margin-left: 10px;
		font-weight: 600;
		color:#525257;
		cursor: pointer;
	
	}
	.listProfile .Date{
		position:absolute;
		font-size:15px;
		display: inline-block;
		top:41px;
		left:80px;
		margin-left: 12px;
		font-weight: 300;
		color:#a9a9a9;
		cursor: pointer;
	
	}
	
	.listProfile .editBox{
		position:absolute;
		display: inline-block;
		top:15px;
		left:500px;
		cursor: pointer;
		
	}
	
	.listProfile .editBox > .edit_img > img{
		width:25px;
		height:25px;
		
	
	}
	
	.listProfile .editBox > .edit_text{
		font-size: 13px;
		font-weight: 600;
		margin-top:-3px;
		
	}
	
	.listProfile .deleteBox{
		position: absolute;
		display: inline-block;
		top:15px;
		left:560px;
		cursor: pointer;
	}
	
	
	
	.listProfile .deleteBox > .delete_img > img{
		width:28px;
		height:26px;
	
	}
	
	.listProfile .deleteBox > .delete_text{
		font-size: 13px;
		font-weight: 600;
		margin-left: 2px;
		margin-top: -3px;
	}
	
	
	.listContentBox{
		width:96%;
		min-height:150px;
		height:auto;
		overflow: hidden;
		margin-bottom:15px;
		padding:22px;
		cursor: pointer;
		
		
	}
	
	
	.listContentBox .listContent > pre{
		white-space: pre-wrap;
 		word-break: break-all;
 		padding-right: 17px;
 		
	}
	
	
	
	.listReadhit{
		float:none;
		background-color:#ffffff;
		border-top:1px solid #e5e7eb;
		width:100%;
		height:45px;
		cursor: default;
	} 
	
	.listReadhit > div{
		display: inline-block;
		font-size:20px;
		margin-left: 15px;
		margin-right: 17px;
		margin-top:3px;
	}
	
	.listReadhit i{
		color:#878a8e;
		
	}
	
	.listReadhit > div:nth-child(1) {
		margin-left: 30px;
	}
	
	#more_button_box{
		margin-top:150px;
		margin-left: 50%;
		

	}
	
	#more_button_box label input[type="button"]{
		display:none;
	}
	
	#more_button_box label input[type="button"] + span{
		display:block;
		width:100px;
		height:40px;
		padding:5px;
		font-size: 20px;
		background-color: #ffffff;
		text-align:center;
	 	border:2px solid #2673F0;
	 	color: #2673F0;
	 	line-height:38px;
	 	letter-spacing:3px;
	 	
	 	font-weight:600;
		cursor: pointer;
		
	}
	
	
 
</style>

<script type="text/javascript">
	var path = window.location.pathname;
	var page = path.split("/").pop();
	var param = window.location.search;
	var real_path = path + param;
	var max_page = ${max_page};
	var cnt_page = 1;
	
	

	
	
	function insert(){
		
		location.href = 'jisik_insert.jsp'; 
	}
	
	function view(idx){
		
		var p_idx = idx;
		location.href = "view.do?idx=" + p_idx;
	}
	
	function search_t(){
		
		var search_content = document.getElementById("search_Text").value;
		
		if( search_content == '' ){
			alert('검색어를 입력해주세요');
			return;
		}
		
		location.href = "jisik_list.do?search_content=" +encodeURIComponent(search_content);
		
	}
	
	function filesearch(f){
		
		f.method = "post";
		f.enctype = "multipart/form-data";
		f.action = "jisik_list.do";
		f.submit();
		
		
		
	}
	
	function edit_content(idx){
		var p_idx = idx;
		
		location.href = "jisik_edit_form.do?idx="+p_idx+ "&path="+real_path;
		
	}
	
	
	 function delete_content(idx){
		
		var p_idx = idx;
		
		if( !confirm("정말로 삭제하시겠습니까?") ){
			return;
		}
		var url = "jisik_del.do";
		var param = "idx="+p_idx;
		
		sendRequest( url, param, delResult, "post" );
		
	}
	
	function delResult(){
		if( xhr.readyState == 4 && xhr.status == 200 ){
			
			var data = xhr.responseText;
			var json = eval(data);
			
			if( json[0].result == 'yes' ){
				alert("삭제 성공");
				location.href = real_path;
			}else{
				alert("삭제 실패");
			}
			
		}
		
	}
	
	function likeJJim(jjim, idx){
		
		jjim.classList.toggle("jjim");
		var p_idx = idx;
		
		if( '${user.id}' == '' ){
			alert('로그인 후에 클릭하세요');
			return;
		}
		
		var jjim_heart = jjim.firstChild;
	 
		if( jjim.classList.contains("jjim") ){
			
			jjim_heart.innerHTML = "💘";
			
			jjim_insert(p_idx);
			
		}else{
			
			jjim_heart.innerHTML = "🤍";
			
			jjim_delete(p_idx);
		}
		
	}
	
	
	function jjim_insert(idx){
		
		var p_idx = idx;
		var url = "jjim_insert.do";
		var param = "idx="+p_idx;
		
		sendRequest(url, param, jjim_insert_Result,"post");
		
	}
	
	function jjim_insert_Result(){
		
		if( xhr.readyState == 4 && xhr.status == 200){
			
			var data = xhr.responseText;
			var json = eval(data);
			
			var idx = json[0].idx;
			var likehit = json[1].likehit;
			var id = 'jjim'+idx;
			
			var likehit_span = document.getElementById(id);
			likehit_span.innerHTML = likehit;
			
		}
	}
	
	function jjim_delete(idx){
		
		var p_idx = idx;
		var url = "jjim_delete.do";
		var param = "idx="+p_idx;
		
		sendRequest(url, param, jjim_del_Result, "post");
		
	}
	
	function jjim_del_Result(){
		
		if( xhr.readyState == 4 && xhr.status == 200){
			
			var data = xhr.responseText;
			var json = eval(data);
			
			var idx = json[0].idx;
			var likehit = json[1].likehit;
			var span_id = 'jjim'+idx;
			
			var likehit_span = document.getElementById(span_id);
			likehit_span.innerHTML = likehit;
			
		}
	}
	
	
	function search_jjim(){
		
		location.href = "jisik_list.do?jjim=jj";
		
	}
	
	function search_myJisik(){
		
		location.href = "jisik_list.do?mylist=my"
		
	}
	
	function show_subject(){
		
		var items = document.querySelectorAll(".hide");
		
		var wrapper = document.querySelector(".wrapper");
		
		for(var i = 0; i < items.length; i++){
			
			items[i].classList.toggle("hidden");
		}
		
		
	}
	
	
	function search_subject(sub){
		
		var subject = sub.innerText;
		location.href = "jisik_list.do?subject=" + subject;
		
	}
	
	
	function show_morePage(){
		
		cnt_page++;
		
		
		$.ajax({
			
			url : "./page_list.do",
			data : {'page':cnt_page,'param':param},
			method : "POST",
			dataType: 'text',
           
			success : function success(data){
				
				
				$("#listPlus").append(data);
				if(cnt_page == max_page ){
					var more_box = document.getElementById("more_button_box");
					more_box.style.display = "none";
					
				}
				
				
			}
			
		});
		
	} 
	

</script>

</head>
<body>
	<jsp:include page="../Main_header.jsp"></jsp:include>
	
	<div class="list_header">
		
		<div class="list_searchBox">
			<form class="form1">
				<div class="list_Text_search">
					<input placeholder="검 색 어 입 력" name="search_content" id="search_Text">
					<div onclick="search_t();">🔍</div>
				</div>
			</form>
					
			<form class="form2">	
				<div class="list_Img_search">
					
					<label class="list-search-file">
						<input type="file" name="search_file" onchange="filesearch(this.form);">
						<span>이미지검색 &nbsp; <span>📷</span></span>
					</label>
				
				</div>
			</form>
		</div><!-- list_searchBox -->
		
			<c:if test="${!empty user }" >
				<div class="list_myJisik" onclick="search_myJisik();">
					<div class="list_myJisikImg">📘</div>
					<div class="list_myJisikText">My지식</div>
				</div>
			</c:if>
		
			
			<c:if test="${!empty user }">
				<div class="list_jjim" onclick="search_jjim();">
					<div class="list_jjimImg">💘</div>
					<div class="list_jjimText">찜목록</div>
				</div>
			</c:if>
		
			<c:if test="${!empty user }" >
				<div class="list_insert" onclick="insert();">
					<div class="list_insertImg">✏️</div>
					<div class="list_insertText">글쓰기</div>
				</div><!-- list_insert -->
			</c:if>
		</div><!-- list_header -->
		
		<div class="Jisik_labelBox">
			<div class="Jisik_label" onclick="location.href='jisik_list.do'">
				<p class="Jisik_label_Main">지 식 인</p>
			</div>
			
			<div class="Jisik_label_Info">
				<p>! 로그인 후에 글 작성이 가능합니다</p>
				<p>! 사진을 텍스트화 작업 후에 저장하므로 사진 업로드 시 시간이 소요될 수 있습니다.<p>
				<p>! 댓글이 달리면 수정 또는 삭제가 불가능합니다.</p>
			</div>
		</div>
		
	
	
	<div id=listAll>
	<c:if test="${ empty list }">
		<div id="listBox" class="noList">
			<div class="noList_text">
				해당 게시글이 존재하지 않습니다!
			</div>
		</div>
	</c:if>
	
	
	<c:forEach var="vo" items="${list }">
	<div id="listBox"> 
		
		<div class="listSubjectBox">
			<div class="listSubject">${vo.subject }</div>
		</div>
		
		<div class="listProfile">
			<div class="imgIcon" onclick="view(${vo.idx});"><img src="/ZV2Project/img/user_profile2.png"/><!-- <i class="fa-regular fa-circle-user"></i> --><!-- <i class="fa-solid fa-face-laugh"></i> --></div>
			<div class="nickname" onclick="view(${vo.idx});"><span>${vo.nickname }</span></div>
			<div class="Date" onclick="view(${vo.idx});"><span><f:parseDate value="${vo.regidate }" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
			<f:formatDate value="${dateValue }" pattern="YYYY-MM-dd"/></span></div>
			
			
			<c:if test="${ (!empty user) and (user.id eq vo.id) and (vo.reply_info eq 0) }">
				<div class="editBox" onclick="edit_content(${vo.idx});" >
					<div class="edit_img"><img src="/ZV2Project/img/edit.png"/></div>
					<div class="edit_text">수정</div>
				</div>
				
				<div class="deleteBox" onclick="delete_content(${vo.idx});">
					<div class="delete_img"><img src="/ZV2Project/img/delete.png"/></div>
					<div class="delete_text">삭제</div>
				</div>
			</c:if>
		</div><!-- listProfile -->
		
		<div class="listContentBox" onclick="view(${vo.idx});">
			<div class="listContent" >
				<pre>${vo.content }</pre>
			</div>
		
		</div>
		
		<div class="listReadhit" >
			<div class="readhit">👁️ ${vo.readhit }</div>
			<div class="replyInfo"><i class="fa-solid fa-comment-dots"></i> ${vo.reply_info }</div>
			
			<c:choose>
			
				<c:when test="${!empty user and vo.like_check eq 1 }">
					<div class="likehit jjim" onclick="likeJJim(this,${vo.idx});"
				     style="cursor:pointer;"><span>💘</span> <span id="jjim${vo.idx }">${vo.likehit }</span>
					</div>
				
				</c:when>
				
				<c:otherwise>
					<div class="likehit" onclick="likeJJim(this,${vo.idx});"
				     style="cursor:pointer;"><span>🤍</span> <span id="jjim${vo.idx }">${vo.likehit }</span>
					</div>
				
				</c:otherwise>
			</c:choose>
			
		</div>
	
	</div><!-- listBox -->
	</c:forEach>
	
	</div><!-- listAll -->
	
	<div id="listPlus"></div>
	
	
	
	<div class="wrapper">
        <ul class="mainMenu">
        	<li class="item" id="subject_show_button">
        		<a class="btn" onclick="show_subject();">과목 검색 버튼</a>
        	</li>
            <li class="item hide" id="cho">
                <a href="#cho" class="btn">초등</a>
                <div class="subMenu">
                    <p onclick="search_subject(this);">초등국어</p>
                    <p onclick="search_subject(this);">초등영어</p>
                    <p onclick="search_subject(this);">초등수학</p>
                    <p onclick="search_subject(this);">초등과학</p>
                    <p onclick="search_subject(this);">초등사회</p>
                </div>
            </li>
            <li class="item hide" id="middle">
                <a href="#middle" class="btn">중등</a>
                <div class="subMenu">
                    <p onclick="search_subject(this);">중등국어</p>
                    <p onclick="search_subject(this);">중등영어</p>
                    <p onclick="search_subject(this);">중등수학</p>
                    <p onclick="search_subject(this);">중등과학</p>
                    <p onclick="search_subject(this);">중등사회</p>
                </div>
            </li>
            
            <li class="item hide" id="go_kor">
                <a href="#go_kor" class="btn">고등국어</a>
                <div class="subMenu">
                    <p onclick="search_subject(this);">공통국어</p>
                    <p onclick="search_subject(this);">독서</p>
                    <p onclick="search_subject(this);">문학</p>
                    <p onclick="search_subject(this);">화법과작문</p>
                    <p onclick="search_subject(this);">언어와매체</p>
                </div>
            </li>
            <li class="item hide" id="go_eng">
                <a href="#go_eng" class="btn">고등영어</a>
                <div class="subMenu">
                    <p onclick="search_subject(this);">내신영어</p>
                    <p onclick="search_subject(this);">수능영어</p>
                </div>
            </li>
            <li class="item hide" id="go_mat">
                <a href="#go_mat" class="btn">고등수학</a>
                <div class="subMenu">
                    <p onclick="search_subject(this);">공통수학</p>
                    <p onclick="search_subject(this);">수학1</p>
                    <p onclick="search_subject(this);">수학2</p>
                    <p onclick="search_subject(this);">미적분</p>
                    <p onclick="search_subject(this);">확률과통계</p>
                    <p onclick="search_subject(this);">기하</p>
                </div>
            </li>
            
            <li class="item hide" id="go_sci">
                <a href="#go_sci" class="btn">고등과학</a>
                <div class="subMenu">
                    <p onclick="search_subject(this);">통합과학</p>
                    <p onclick="search_subject(this);">물리1</p>
                    <p onclick="search_subject(this);">물리2</p>
                    <p onclick="search_subject(this);">화학1</p>
                    <p onclick="search_subject(this);">화학2</p>
                    <p onclick="search_subject(this);">생명과학1</p>
                    <p onclick="search_subject(this);">생명과학2</p>
                    <p onclick="search_subject(this);">지구과학1</p>
                    <p onclick="search_subject(this);">지구과학2</p>
                </div>
            </li>
            
            <li class="item hide" id="go_soc">
                <a href="#go_soc" class="btn">고등사회</a>
                <div class="subMenu">
                    <p onclick="search_subject(this);">통합사회</p>
                    <p onclick="search_subject(this);">경제</p>
                    <p onclick="search_subject(this);">동아시아사</p>
                    <p onclick="search_subject(this);">사회문화</p>
                    <p onclick="search_subject(this);">생활과윤리</p>
                    <p onclick="search_subject(this);">세계사</p>
                    <p onclick="search_subject(this);">세계지리</p>
                    <p onclick="search_subject(this);">윤리와사상</p>
                    <p onclick="search_subject(this);">법과정치</p>
                    <p onclick="search_subject(this);">한국사</p>
                    <p onclick="search_subject(this);">한국지리</p>
                </div>
            </li>
        </ul>
    </div>
    
    
	
	<div id="more_button_box">
		<label>
		<input type="button" value="더보기" id="more_button" onclick="show_morePage();">
		<span>더보기</span>
		</label>
	</div>
	<script type="text/javascript">
		if( cnt_page >= max_page ){
			document.getElementById("more_button_box").style.display = "none";
			
		}
	
	</script>
	
	
	

	
</body>
</html>