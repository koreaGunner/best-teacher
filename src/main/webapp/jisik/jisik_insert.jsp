<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지식인 글쓰기</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="../css/summernote-lite.css">
<script src="../js/summernote-lite.js"></script>
<script src="../js/lang/summernote-ko-KR.js"></script>
<link rel="shortcut icon" href="#">


<script src="../js/modal.js"></script>
<link rel="stylesheet" href="../css/jisik_insert.css">
</head>
<body>
<jsp:include page="../Main_header.jsp"></jsp:include>

	<div id="location">
		<div id="location_box">
			<div id="modal_button_div">
				<p>과목  <span>➜</span></p> 
				<label class="modal_label">
				<input type="button" value="과목선택하기" class="btn-open-popup">
				<span class="btn-open-span">과목선택하기</span>
				</label>
			</div>
			
			<textarea id="summernote" name="content"></textarea>
			
			
			<div class="location_button">	
				
				<c:if test="${!empty user }">
					<label class="box-button-insert" >
						<input type="button" class="btn-insert">
						<span onclick="extraction();">질문하기</span>
					</label>
				</c:if>
				
				<c:if test="${empty user }">
					<label class="box-button-insert" >
						<input type="button" class="btn-insert">
						<span onclick="not_login();">질문하기</span>
					</label>
				
				</c:if>
				
				<label class="box-button-insert" >		
					<input type="button" class="btn-cancel">
					<span onclick="location.href='jisik_list.do'">취소</span>
				</label>		
			</div>
		</div>	
	</div>



	<div id="modal">
		<div id="real_modal">
			<div class="modal_header">
				<h1>과목</h1>
				<p>!중복선택이 불가능합니다</p>
				<p>!반드시 과목선택을 하셔야 합니다</p>

			</div>
			<!-- modal_header -->

			<div id="modal_body">
				<div class="modal_cho">
					<div class="modal_sub_header">
						<h2>초등</h2>
					</div>
					<div class="modal_subject">
						<label class="box-radio-input"> <input type="radio"
							name="subject" value="초등국어"> <span>초등국어</span>
						</label>
						<label class="box-radio-input"> <input type="radio"
							name="subject" value="초등영어"> <span>초등영어</span>
						</label>
						<label class="box-radio-input"> <input type="radio"
							name="subject" value="초등수학"> <span>초등수학</span>
						</label>
						<label class="box-radio-input"> <input type="radio"
							name="subject" value="초등과학"> <span>초등과학</span>
						</label>
						<label class="box-radio-input"> <input type="radio"
							name="subject" value="초등사회"> <span>초등사회</span>
						</label>
					</div>

				</div>
				<!-- 초등 -->

				<div class="modal_jung">
					<div class="modal_sub_header">
						<h2>중등</h2>
					</div>
					<div class="modal_subject">
						<label class="box-radio-input"> <input type="radio"
							name="subject" value="중등국어"> <span>중등국어</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="중등영어"> <span>중등영어</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="중등수학"> <span>중등수학</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="중등과학"> <span>중등과학</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="중등사회"> <span>중등사회</span>
						</label>
					</div>


				</div>
				<!-- 중등 -->

				<div class="modal_go_kor">
					<div class="modal_sub_header">
						<h2>고등국어</h2>
					</div>
					<div class="modal_subject">
						<label class="box-radio-input"> <input type="radio"
							name="subject" value="공통국어"> <span>공통국어</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="독서"> <span>독서</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="문학"> <span>문학</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="화법과작문"> <span>화법과작문</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="언어와매체"> <span>언어와매체</span>
						</label>
					</div>

				</div>
				<!-- 고등국어 -->

				<div class="modal_go_eng">
					<div class="modal_sub_header">
						<h2>고등영어</h2>
					</div>

					<div class="modal_subject">
						<label class="box-radio-input"> <input type="radio"
							name="subject" value="내신영어"> <span>내신영어</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="수능영어"> <span>수능영어</span>
						</label>
					</div>

				</div>
				<!-- 고등영어 -->

				<div class="modal_go_mat">
					<div class="modal_sub_header">
						<h2>고등수학</h2>
					</div>
					<div class="modal_subject">
						<label class="box-radio-input"> <input type="radio"
							name="subject" value="공통수학"> <span>공통수학</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="수학1"> <span>수학1</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="수학2"> <span>수학2</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="미적분"> <span>미적분</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="확률과통계"> <span>확률과통계</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="기하"> <span>기하</span>
						</label>
					</div>


				</div>
				<!-- 고등수학 -->

				<div class="modal_go_sci">
					<div class="modal_sub_header">
						<h2>고등과학</h2>
					</div>
					<div class="modal_subject">
						<label class="box-radio-input"> <input type="radio"
							name="subject" value="통합과학"> <span>통합과학</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="물리1"> <span>물리1</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="물리2"> <span>물리2</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="화학1"> <span>화학1</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="화학2"> <span>화학2</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="생명과학1"> <span>생명과학1</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="생명과학2"> <span>생명과학2</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="지구과학1"> <span>지구과학1</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="지구과학2"> <span>지구과학2</span>
						</label>
					</div>



				</div>
				<!-- 고등과학 -->

				<div class="modal_go_soc">
					<div class="modal_sub_header">
						<h2>고등사회</h2>
					</div>
					<div class="modal_subject">
						<label class="box-radio-input"> <input type="radio"
							name="subject" value="통합사회"> <span>통합사회</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="경제"> <span>경제</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="동아시아사"> <span>동아시아사</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="사회문화"> <span>사회문화</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="생활과윤리"> <span>생활과윤리</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="세계사"> <span>세계사</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="세계지리"> <span>세계지리</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="윤리와사상"> <span>윤리와사상</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="법과정치"> <span>법과정치</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="한국사"> <span>한국사</span>
						</label> <label class="box-radio-input"> <input type="radio"
							name="subject" value="한국지리"> <span>한국지리</span>
						</label>
					</div>
				</div>
				<!-- 고등사회 -->
				
				
			</div>
			<!-- modal_body -->
			
				<div id="modal_end">
				
					<label class="box-button-input">
						<input type="button" name="search_button" value="취소"
							   class="cancel">
						<span>취소</span>
					</label>
					
					
					<label class="box-button-input">
						<input type="button" name="search_button" value="검색"
							   class="search">
						<span>선택</span>
					</label>
					
					
				
				
				</div>
				

		</div>

	</div><!-- modal -->
	

	<script>
		$('#summernote').summernote({
	
			tabsize : 2,
			minHeight : 300,
			maxHeight: 450,
			width: 625,
			placeholder:"과목버튼을 이용해 과목을 정해야 합니다"+
			"<br><br>글 작성시 글씨 크기를 키우셔야 화면에 잘 보입니다"+
			"<br><br>댓글이 달리면 수정 또는 삭제가 불가능합니다"
		});
	
    
		
		
		const body = document.querySelector('body');
	    const modal = document.querySelector('#modal');
	    const btnOpenPopup = document.querySelector('.btn-open-popup');
	    const cancel = document.querySelector('.cancel');
	    const search = document.querySelector('.search');
	   	const modal_button = document.querySelector('.modal_label input[type="button"] + span');

	    btnOpenPopup.addEventListener('click', () => {
	      modal.classList.toggle('show');
	      var docElem = document.documentElement;
	      var scrollPos = docElem.scrollTop;
	      var now_top = scrollPos + 500 + 'px';
	      var real_modal = document.getElementById("real_modal");
	      real_modal.style.top = now_top;
	      
	     
			
	      if (modal.classList.contains('show')) {
	        body.style.overflow = 'hidden';
	      }
	    });

	    cancel.addEventListener('click', (event) => {
	      if (event.target === cancel) {
	        modal.classList.toggle('show');

	        if (!modal.classList.contains('show')) {
	          body.style.overflow = 'auto';
	        }
	      }
	    });
	    
	    
	    search.addEventListener('click', (event) => {
	        if (event.target === search) {
	          var radioVal = $('input[name="subject"]:checked').val();
	          modal.classList.toggle('show');
	          btnOpenPopup.setAttribute('value',radioVal);          
	          $(".modal_label .btn-open-span").text(radioVal);
	          
	          modal_button.style.color ='#fff';
	          modal_button.style.borderColor = '#2673F0';
	          modal_button.style.background = '#2673F0';
	          modal_button.style.borderRadius = '40px';
	          
	          if( btnOpenPopup.getAttribute('value') == 'undefined' ){
	        	  btnOpenPopup.setAttribute('value','과목선택하기');
	        	  $(".modal_label .btn-open-span").text('과목선택하기');
	        	  modal_button.style.color ='black';
	              modal_button.style.borderColor = 'black';
	              modal_button.style.background = '#fff';
	              modal_button.style.borderRadius = '0px';
	          }

	          if (!modal.classList.contains('show')) {
	            body.style.overflow = 'auto';
	          }
	        }
	      });
		
		
		function not_login(){
			
			alert("로그인 후에 글을 작성하실 수 있습니다");
			return;
			
		}
		

		function extraction() {
			"use strict";
			// 스마트 에디터에서 content 값이 "~~"와 같은 text 타입으로 넘어온다.
			
			var content = document.getElementById("summernote").value;

			var div = document.createElement("div");
			div.innerHTML = content;
			var base64Images = div.querySelectorAll("img"); // img 태그 추출
			var subject = btnOpenPopup.getAttribute('value');
			if( subject == '과목선택하기'){
				alert('과목을 선택해주세요');
				return;
			}
			
			
			
			var imgFiles = [];


			for (var i = 0; i < base64Images.length; i++) {
				var src = base64Images[i].src;
				var filename = base64Images[i].getAttribute('data-filename');// 질문!!!!
				// base 64 image일 경우 javascript File 객체로 변환
				if (src.startsWith("data:")) {
					var arr = src.split(',');
					var mime = arr[0].match(/:(.*?);/)[1];
					var bstr = atob(arr[1]);
					var n = bstr.length;
					let u8arr = new Uint8Array(n);

					while (n--) {
						u8arr[n] = bstr.charCodeAt(n);
					}

					var imgFile = new File([ u8arr ], filename, {
						type : mime
					});
					imgFiles.push(imgFile);
					
					
					base64Images[i].setAttribute('src', '../upload/'+filename);

				}//if
			}//for
			
			content = div.innerHTML;
			
			
 
		 	var fdata = new FormData();
			
			var index = 0;
			imgFiles.forEach(function(e) {
				fdata.append("file" + index, imgFiles[index]);
				index++;
			});
			fdata.append("length", imgFiles.length);
			fdata.append("content",content);
			fdata.append("subject", subject);
			 
			
			  $.ajax({

				url : "./jisik_insert.do",
				data : fdata,
				method : "POST",
				
				enctype : "multipart/form-data; charset=utf-8",
				processData : false,
				contentType : false,
				cache : false,
				async : false,
				success : function success(data) {

					location.href="jisik_list.do";
				}
				
			});    
			 

		}//extraction
	</script>
	
	
</body>
</html>
















