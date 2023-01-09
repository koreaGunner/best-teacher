<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최강선생 - 과외 학생 찾기</title>
	<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/bc13bff3f1.js" crossorigin="anonymous"></script>
	<script src="../js/httpRequest.js"></script>

<style>

body { background-color: #f7f7f7;
	   margin-bottom: 150px;}

* {
	margin: 0;
	padding: 0;
}

#frame {
	width: 1200px;
	overflow: auto;
	margin: 0 auto;
	background-color: #f7f7f7;
}

table {
	margin: 0 auto;
	border: 1px solid #eaeaea;
	border-collapse: collapse;
	background-color: white;
}

td {
	border: 1px solid #eaeaea;
}

td:nth-child(1) {
	border-left: none;
	border-bottom: none;
}

#frame {
	margin: 0 auto;
}

.print {
	margin:50px;
	border: 1px solid #eaeaea;
	width: 490px;
	height: 200px;
	background-color: white; display : inline-block;
	position: relative;
	margin-top: 50px;
	margin-bottom: 50px;
	display: inline-block;
	box-shadow: 5px 5px 10px rgba(0,0,0,0.6);
	cursor: pointer;
}

.list {
	padding: 6px;
	width: 270px;
	position: absolute;
	overflow: auto;
}

.line {
	margin: 0;
	height:19px;
	display: block;
	width: calc(100% - 15px);
	padding: 2px;
	font-size: 14px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	max-width: 100%;
	margin-bottom:4px;
}

.line i {
	font-size: 14px;
	color: gray;
	margin-right: 5px;
}

.video {
	width: 200px;
	height: 200px;
	right: 0;
	position: absolute;
	border-left: 1px solid #eaeaea;	
}

.video i { color: #0B0F56;}

.menu {
	width: 250px;
	height: 125px;
	cursor: pointer;
	position: relative;
}

.menu i { color: #2730C1; }

.menu:hover i{
	color: red;
}

.image {
	position: absolute;
	top: 40px;
	left: 40px;
}



.text {
	font-size: 25px;
	text-align: center;
	font-weight: bold;
	width: 100px;
	height: 50px;
	top: 40px;
	right: 50px;
	position: absolute;
}

.text .subjects { 	width: 100px;
					height: 50px;
					font-size:15px; 
					color:#2730C1;
					overflow: hidden; 
					text-overflow: ellipsis;
					 display: -webkit-box;
				    -webkit-line-clamp: 3; /* 라인수 */
				    -webkit-box-orient: vertical;
				    word-wrap:break-word; 
				    line-height: 1.2em;
				    height: 3.6em; /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */}
				    
.text .areas {	color:#2730C1;
				font-size:20px; 
				}

.text .myns { 	color:#2730C1;
				font-size:17px; 
				} 

.text .genders { color:#2730C1;}


span.flag {
	display: inline-block;
	padding: 4px 6px;
	font-size: 10px;
	text-align: center;
	border-radius: 20px;
	color: white;
	background-color: white;
	line-height: 1;
}

span.flag.b1 {
	background-color: #f6cd85;
}

span.flag.b2 {
	background-color: #98bae3;
}




 #modal_subject {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        background-color: rgba(0, 0, 0, 0.3);
        z-index: 998;
      }

      #modal_subject.show {
        display: block;
      }

      #real_modal_subject {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 750px;
        height: 770px;
        padding: 20px;
        background-color: rgb(255, 255, 255);
        border-radius: 5px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15); 

        transform: translateX(-50%) translateY(-50%); 
        z-index: 999;
        box-sizing: border-box;
        
      }
      	
	    #modal_header_subject { box-sizing: border-box;
	  				  			margin: 10px;}
      
        #real_modal_subject > #modal_header_subject > p {
   		color: red;
   		font-weight: bold;
		}
		
		#modal_body_subject { box-sizing: border-box;
							  overflow: auto;
							  height: 570px;}
					  
		#modal_body_subject::-webkit-scrollbar {
		    width: 8px;
		    background-color: #ebebeb;
		    border-radius: 4px;
		  }
	  
	    #modal_body_subject::-webkit-scrollbar-thumb {
		    background-color: #cbcbcb;
	   	    border-radius: 4px;
		  }

		#modal_body_subject > div {
		   border-bottom:1px #e5e7eb solid;
		   padding-bottom:30px;
		   width: 85%;
		   min-height: 100px;
		   margin: 50px auto;
		}
		
		#modal_body_subject > .modal_go_sci{
		   border:none;
		}
		
		#modal_body_subject > div > .modal_sub_header_subject{
		   margin-left: 20px;
		   margin-bottom: 20px;
		}
		
		#modal_body_subject > .modal_subject { box-sizing: border-box;}
		
		#modal_body_subject > div > .modal_subject > .box-checkbox-input input[type="checkbox"] {
   			display: none;
			}

		#modal_body_subject > div > .modal_subject > .box-checkbox-input input[type="checkbox"]+span
		   {
		   display: inline-block;
		   width: 130px;
		   background: none;
		   border: 1px solid #eeeeee;
		   color: #aaaaaa;
		   padding: 0px 10px;
		   text-align: center;
		   height: 50px;
		   margin: 20px 20px;
		   font-size: 17px; 
		   cursor: pointer;
		   line-height: 50px;
		}
		
		#modal_body_subject > div > .modal_subject > .box-checkbox-input input[type="checkbox"]:checked+span
		   {
		        border-image: linear-gradient(to right, #5ec8d9, #2730C1);
			    border-image-slice: 1 ;
		        border-image-width: 2px ;
		 		color: #2673F0;
		}
		
		#modal_end_subject{
		   width:100%;
		   height:80px;
		   box-sizing: border-box;
		   text-align: right;
		   margin-top:10px;
		}
		
		#modal_end_subject input { width: 120px;
						  height: 50px;
						  cursor: pointer;
						  margin: 5px;
						  background-color: white;
						  border: 1px solid #e5e7eb;
						  font-size: 16px;
						  }
						  
		#modal_end_subject #search_button { background:linear-gradient(#5D64DB, #2730C1); color:white;}
		
		
		
		
		
		
		
		#modal_area {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        background-color: rgba(0, 0, 0, 0.3);
        z-index: 998;
      }

      #modal_area.show {
        display: block;
      }

      #real_modal_area {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 750px;
        height: 800px;
        padding: 20px;
        background-color: rgb(255, 255, 255);
        border-radius: 5px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15); 

        transform: translateX(-50%) translateY(-50%); 
        z-index: 999;
        box-sizing: border-box;
        
      }
      	
	    #modal_header_area { box-sizing: border-box;
	  				  			margin: 10px;}
      
        #real_modal_area > #modal_header_area > p {
   		color: red;
   		font-weight: bold;
		}
		
		#modal_body_area { box-sizing: border-box;
						   overflow: auto;
						   height: 500px;}
					  
		#area_table { width: 100%;
					  border: none;
					  margin-top: 30px;}
		
		#area_table td { border: none;}
		
		#area_table input { width: 75px;
							height: 30px;
							font-size: 20px;
							cursor: pointer;
							border: none;
							margin-top: 10px;
							margin-bottom: 10px;
							background-color: white;}
		
		#area_table input:hover { background:linear-gradient(#5D64DB, #2730C1); 
								  color:white !important;
								  border-radius: 5px;}
					  
		#modal_body_area::-webkit-scrollbar {
		    width: 8px;
		    background-color: #ebebeb;
		    border-radius: 4px;
		  }
	  
	    #modal_body_area::-webkit-scrollbar-thumb {
		    background-color: #cbcbcb;
	   	    border-radius: 4px;
		  }

		#modal_body_area > div {
		   width: 85%;
		   min-height: 100px;
		   margin: 50px auto;
		}
				
		#modal_body_area > div > .modal_sub_header_area{
		   margin-left: 20px;
		   margin-bottom: 20px;
		}
		
		.country { display: inline-block;
				   width: 150px;
				   margin-right: 48px;
				   margin-top: 19px;}
		
		.country label { font-size: 20px;
						 margin: 0 10px;
						 cursor: pointer;
						 color: #aaaaaa;}
		
		#modal_body_area #country_frame input[type="radio"] {
		width: 16px;
		height: 16px;
		cursor: pointer;
		}
		
				   
		#modal_body_area #country_frame input[type="radio"]:checked {
			accent-color: #2730C1;
		}
						
		#modal_end_area {
		   width:100%;
		   height:80px;
		   box-sizing: border-box;
		   text-align: right;
		  
		}
		
		#modal_end_area .btn { 	  width: 120px;
								  height: 50px;
								  cursor: pointer;
								  margin: 5px;
								  background-color: white;
								  border: 1px solid #e5e7eb;
								  font-size: 16px;}
								  
		#modal_end_area #search_button { background:linear-gradient(#5D64DB, #2730C1); color:white; }
		
		
		
		
		
		#modal_gender {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        background-color: rgba(0, 0, 0, 0.3);
        z-index: 998;
      }

      #modal_gender.show {
        display: block;
      }

      #real_modal_gender {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 400px;
        height: 338px;
        padding: 20px;
        background-color: rgb(255, 255, 255);
        border-radius: 5px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15); 

        transform: translateX(-50%) translateY(-50%); 
        z-index: 999;
        box-sizing: border-box;
        
      }
      	
	    #modal_header_gender { box-sizing: border-box;
	  				  			margin: 10px;}
      
		#modal_body_gender { box-sizing: border-box;
					  overflow: auto;
					  height: 190px;
					  margin-left: 10px;}
		
		#modal_body_gender table { width: 100%;
								height: 100%;
								border: none;}
		#modal_body_gender table td { border: none; }
		
		#modal_body_gender table input[type="radio"] {
			width: 16px;
			height: 16px;
			cursor: pointer;
			accent-color: #2730C1;
		}
		
		#modal_body_gender table label { font-size: 20px;
									  margin: 0 10px;
									  color: #aaaaaa;
									  cursor: pointer;}
			
		#modal_end_gender {
		   width:100%;
		   height:80px;
		   box-sizing: border-box;
		   text-align: right;
		   margin-top:10px;
		}
		
		#modal_end_gender input { width: 120px;
							  height: 50px;
							  cursor: pointer;
							  margin: 5px;
							  background-color: white;
							  border: 1px solid #e5e7eb;
							  font-size: 16px;
							  }
						  
		#modal_end_gender #search_button { background:linear-gradient(#5D64DB, #2730C1); color:white;}	
		
		
		
		
		#modal_myn {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        background-color: rgba(0, 0, 0, 0.3);
        z-index: 998;
      }

      #modal_myn.show {
        display: block;
      }

      #real_modal_myn {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 400px;
        height: 338px;
        padding: 20px;
        background-color: rgb(255, 255, 255);
        border-radius: 5px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15); 

        transform: translateX(-50%) translateY(-50%); 
        z-index: 999;
        box-sizing: border-box;
        
      }
      	
	    #modal_header_myn { box-sizing: border-box;
	  				  			margin: 10px;}
      
		#modal_body_myn { box-sizing: border-box;
					  overflow: auto;
					  height: 190px;
					  margin-left: 10px;}
		
		#modal_body_myn table { width: 100%;
								height: 100%;
								border: none;}
		#modal_body_myn table td { border: none; }
		
		#modal_body_myn table input[type="radio"] {
			width: 16px;
			height: 16px;
			cursor: pointer;
			accent-color: #2730C1;
		}
		
		#modal_body_myn table label { font-size: 20px;
									  margin: 0 10px;
									  color: #aaaaaa;
									  cursor: pointer;}
			
		#modal_end_myn {
		   width:100%;
		   height:80px;
		   box-sizing: border-box;
		   text-align: right;
		   margin-top:10px;
		}
		
		#modal_end_myn input { width: 120px;
							  height: 50px;
							  cursor: pointer;
							  margin: 5px;
							  background-color: white;
							  border: 1px solid #e5e7eb;
							  font-size: 16px;
							  }
						  
		#modal_end_myn #search_button { background:linear-gradient(#5D64DB, #2730C1); color:white;}	

</style>

</head>
<body>

<jsp:include page="../Main_header.jsp"></jsp:include>

<div id="modal_subject">
	<div id="real_modal_subject">
	
		<div id="modal_header_subject">
            <h2>과목</h2>
            <p>!중복선택이 가능합니다</p>
            <p>!선택하지 않고 검색시 전체로 검색이 됩니다</p>
         </div>
         <!-- modal_header -->
         
         <form action="SSubject.do">

         <div id="modal_body_subject">
            <div class="modal_cho">
               <div class="modal_sub_header_subject">
                  <h3>초등</h3>
               </div>
               <div class="modal_subject">
                  <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject1" value="초등국어"> <span>초등국어</span>
                  </label>
                  <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject2" value="초등영어"> <span>초등영어</span>
                  </label>
                  <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject3" value="초등수학"> <span>초등수학</span>
                  </label>
                  <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject4" value="초등과학"> <span>초등과학</span>
                  </label>
                  <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject5" value="초등사회"> <span>초등사회</span>
                  </label>
               </div>

            </div>
            <!-- 초등 -->

            <div class="modal_jung">
               <div class="modal_sub_header_subject">
                  <h3>중등</h3>
               </div>
               <div class="modal_subject">
                  <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject6" value="중등국어"> <span>중등국어</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject7" value="중등영어"> <span>중등영어</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject8" value="중등수학"> <span>중등수학</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject9" value="중등과학"> <span>중등과학</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject10" value="중등사회"> <span>중등사회</span>
                  </label>
               </div>


            </div>
            <!-- 중등 -->

            <div class="modal_go_kor">
               <div class="modal_sub_header_subject">
                  <h3>고등국어</h3>
               </div>
               <div class="modal_subject">
                  <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject11" value="공통국어"> <span>공통국어</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject12" value="독서"> <span>독서</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject13" value="문학"> <span>문학</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject14" value="화법과작문"> <span>화법과작문</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject15" value="언어와매체"> <span>언어와매체</span>
                  </label>
               </div>

            </div>
            <!-- 고등국어 -->

            <div class="modal_go_eng">
               <div class="modal_sub_header_subject">
                  <h3>고등영어</h3>
               </div>
               <div class="modal_subject">
                  <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject16" value="내신영어"> <span>내신영어</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject17" value="수능영어"> <span>수능영어</span>
                  </label>
               </div>

            </div>
            <!-- 고등영어 -->

            <div class="modal_go_mat">
               <div class="modal_sub_header_subject">
                  <h3>고등수학</h3>
               </div>
               <div class="modal_subject">
                  <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject18" value="공통수학"> <span>공통수학</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject19" value="수학1"> <span>수학1</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject20" value="수학2"> <span>수학2</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject21" value="미적분"> <span>미적분</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject22" value="확률과통계"> <span>확률과통계</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject23" value="기하"> <span>기하</span>
                  </label>
               </div>


            </div>
            <!-- 고등수학 -->
            
             <div class="modal_go_soc">
               <div class="modal_sub_header_subject">
                  <h3>고등사회</h3>
               </div>
               <div class="modal_subject">
                  <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject24" value="통합사회"> <span>통합사회</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject25" value="경제"> <span>경제</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject26" value="동아시아사"> <span>동아시아사</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject27" value="사회문화"> <span>사회문화</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject28" value="생활과윤리"> <span>생활과윤리</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject29" value="세계사"> <span>세계사</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject30" value="세계지리"> <span>세계지리</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject31" value="윤리와사상"> <span>윤리와사상</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject32" value="법과정치"> <span>법과정치</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject33" value="한국사"> <span>한국사</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject34" value="한국지리"> <span>한국지리</span>
                  </label>
               </div>
            </div>
            <!-- 고등사회 -->

            <div class="modal_go_sci">
               <div class="modal_sub_header_subject">
                  <h3>고등과학</h3>
               </div>
               <div class="modal_subject">
                  <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject35" value="통합과학"> <span>통합과학</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject36" value="물리1"> <span>물리1</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject37" value="물리2"> <span>물리2</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject38" value="화학1"> <span>화학1</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject39" value="화학2"> <span>화학2</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject40" value="생명과학1"> <span>생명과학1</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject41" value="생명과학2"> <span>생명과학2</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject42" value="지구과학1"> <span>지구과학1</span>
                  </label> <label class="box-checkbox-input"> <input type="checkbox"
                     name="subject43" value="지구과학2"> <span>지구과학2</span>
                  </label>
               </div>

            </div>
            <!-- 고등과학 -->
        
                      
         </div>
         <!-- modal_body -->
                
            <div id="modal_end_subject">
            	 <input type="hidden" id="subjects" name="subject47" >                                       
                 <input type="button" id="search_button" value="검색" onclick="send_subject(this.form);">
                 <input type="button" id="search_close" value="닫기" onclick="modalOn_subject()">
            </div>
            
          </form>   
	
	</div>
</div>



<div id="modal_area">

	<div id="real_modal_area">
	
		<div id="modal_header_area">
            <h2>지역</h2>
            <p>!선택하지 않고 검색시 전체로 검색이 됩니다</p>
            	<table id="area_table">
					<tr>
						<td><input type="button" id="서울" value="서울" onclick="send_city('서울'), change('서울')"></td>
						<td><input type="button" id="부산" value="부산" onclick="send_city('부산'), change('부산')"></td>
						<td><input type="button" id="대구" value="대구" onclick="send_city('대구'), change('대구')"></td>
						<td><input type="button" id="인천" value="인천" onclick="send_city('인천'), change('인천')"></td>
						<td><input type="button" id="광주" value="광주" onclick="send_city('광주'), change('광주')"></td>
						<td><input type="button" id="대전" value="대전" onclick="send_city('대전'), change('대전')"></td>
						<td><input type="button" id="울산" value="울산" onclick="send_city('울산'), change('울산')"></td>
						<td><input type="button" id="경기" value="경기" onclick="send_city('경기'), change('경기')"></td>
						<td><input type="button" id="강원" value="강원" onclick="send_city('강원'), change('강원')"></td>
					</tr>
					
					<tr>
						<td><input type="button" id="충북" value="충북" onclick="send_city('충북'), change('충북')"></td>
						<td><input type="button" id="충남" value="충남" onclick="send_city('충남'), change('충남')"></td>
						<td><input type="button" id="세종" value="세종" onclick="send_city('세종'), change('세종')"></td>
						<td><input type="button" id="전북" value="전북" onclick="send_city('전북'), change('전북')"></td>
						<td><input type="button" id="전남" value="전남" onclick="send_city('전남'), change('전남')"></td>
						<td><input type="button" id="경북" value="경북" onclick="send_city('경북'), change('경북')"></td>
						<td><input type="button" id="경남" value="경남" onclick="send_city('경남'), change('경남')"></td>
						<td><input type="button" id="제주" value="제주" onclick="send_city('제주'), change('제주')"></td>
					</tr>								
				</table>
         </div>
         <!-- modal_header -->
         
       		<form action="SArea2.do">

		         <div id="modal_body_area">
		         		         
					<div id="country_frame">
																																		
					</div> 
		            
		         </div>
		         <!-- modal_body -->
		          
		            <div id="modal_end_area">
		                 <input type="hidden" value="" id="city" name="city"> 
		                 <input type="hidden" value="" id="country" name="country">                                
		                 <input type="button" value="검색" id="search_button" class="btn" onclick="send_area(this.form);">
		                 <input type="button" value="닫기" id="search_close" class="btn" onclick="modalOn_area()">
		            </div>
            
          	</form>   
	
	</div>
</div>



<div id="modal_myn">
	<div id="real_modal_myn">
		<div id="modal_header_myn">
		<h2>비대면 여부</h2>
		</div>
		
	<form action="SMyn.do">	
		<div id="modal_body_myn">
		<table>
			<tr>
				<td>
				<input type="radio" id="전체1" name="myn" value="전체" checked>
				<label for="전체1">전체</label>
				</td>			
			</tr>	
			<tr>
				<td>
				<input type="radio" id="가능" name="myn" value="가능">
				<label for="가능">가능</label>
				</td>			
			</tr>			
			<tr>			
				<td>
				<input type="radio" id="불가능" name="myn" value="불가능">
				<label for="불가능">불가능</label>
				</td>
			</tr>			
		</table>
	
		</div>
		<div id="modal_end_myn">			
            <input type="button" id="search_button" value="검색" onclick="send_myn(this.form);">
			<input type="button" id="search_close" value="닫기" onclick="modalOn_myn()">
		</div>
	</form>	
		
	</div>
</div>



<div id="modal_gender">
	<div id="real_modal_gender">
		<div id="modal_header_gender">
		<h2>성별</h2>
		</div>
		
	<form action="SGender.do">	
		<div id="modal_body_gender">
		<table>
			<tr>
				<td>
				<input type="radio" id="전체2" name="gender" value="전체" checked>
				<label for="전체2">전체</label>
				</td>			
			</tr>	
			<tr>
				<td>
				<input type="radio" id="남자" name="gender" value="남자">
				<label for="남자">남자</label>
				</td>			
			</tr>			
			<tr>			
				<td>
				<input type="radio" id="여자" name="gender" value="여자">
				<label for="여자">여자</label>
				</td>
			</tr>			
		</table>
	
		</div>
		<div id="modal_end_gender">			
            <input type="button" id="search_button" value="검색" onclick="send_gender(this.form);">
			<input type="button" id="search_close" value="닫기" onclick="modalOn_gender()">
		</div>
	</form>	
		
	</div>
</div>




<div id="wframe">

	<div style="height:100px; weight:100%;">
	</div>
	

	<table>

		<tr>
			<td>
				<div class="menu" onclick="modalOn_subject()">
					<div class="image">
						<i class="fa-solid fa-book fa-3x"></i>
					</div>
					<div class="text">
						<c:if test="${ subject != 'null' }">
						<div class = "subjects">
						${subject}
						</div>
						</c:if>
						<c:if test="${ subject == 'null' }">
						과목
						</c:if>	
					</div>
				</div>
			</td>

			<td>
				<div class="menu" onclick="modalOn_area()">
					<div class="image">
						<i class="fa-solid fa-location-dot fa-3x"></i>
					</div>
					<div class="text">
						<c:if test="${ area != 'null' }">
						<div class="areas">
						${area}
						</div>
						</c:if>
						<c:if test="${ area == 'null' }">
						지역
						</c:if>	
					</div>
				</div>
			</td>

			<td>
				<div class="menu" onclick="modalOn_myn()">
					<div class="image">
						<i class="fa-solid fa-headset fa-3x"></i>
					</div>
					<div class="text">
						<c:if test="${ myn != 'null' }">
						<div class="myns">
						비대면 ${myn}
						</div>
						</c:if>
						<c:if test="${ myn == 'null' }">
						비대면
						</c:if>	
					</div>
				</div>
			</td>
			
			<td>
				<div class="menu" onclick="modalOn_gender()">
					<div class="image">
						<i class="fa-solid fa-user fa-3x"></i>
					</div>
					<div class="text">
						<c:if test="${ gender != 'null' }">
						<div class="genders">
						${gender}
						</div>
						</c:if>
						<c:if test="${ gender == 'null' }">
						성별
						</c:if>		
					</div>
				</div>
			</td>			
		</tr>
	</table>
	
	<div style="height:100px; weight:100%;">
	</div>
	
	<div id="frame">
		<c:forEach var="vo" items="${ list }">
		
		<div class="print" onclick="send('${ vo.id }')">
						
			<div class="list">
							
				<div class="line">			
					<c:if test="${vo.hyn eq '희망'}">
						<span class="flag b1">${ vo.hyn }</span>
					</c:if>
					<c:if test="${vo.hyn eq '희망하지않음'}">
						<span class="flag b2">${ vo.hyn }</span>
					</c:if>
				</div>
				<div class="line" style="font-weight:bold;">${ vo.nickname }</div>
				<div class="line"><i class="fa-solid fa-user fa-3x"></i>${ vo.grade } ${ vo.gender }</div>
				<div class="line"><i class="fa-solid fa-book fa-3x"></i>${ vo.subject }</div>
				<div class="line"><i class="fa-solid fa-location-dot fa-3x"></i>${ vo.addr }</div>
				<div class="line"><i class="fa-solid fa-hashtag fa-3x"></i>${ vo.hashtag }</div>
				<div class="line"><i class="fa-solid fa-headset fa-3x"></i>${ vo.myn }</div>		
						
			</div>
			
				<div class="video">
					<c:if test="${vo.gender eq '남자'}">
					<img src="/ZV2Project/Images/default_picture1.png" style="height:100%; width:100%;">
					</c:if>
					<c:if test="${vo.gender eq '여자'}">
					<img src="/ZV2Project/Images/default_picture2.png" style="height:100%; width:100%;">
					</c:if>
				</div>
			</div>
		</c:forEach>
		
		<form id="form" action="StudentInfo.do" method="get">
			<input id="id" type="hidden" name="s_id" value="">
		</form>
					
	</div>
	
</div>

		<script>
			function send(id) {	
				var p_id = document.getElementById("id");				
				p_id.setAttribute('value', id);				
				document.getElementById("form").submit();				
			} 		
		</script>
		
		<script>		
			function modalOn_subject() {
				const body = document.querySelector('body');
				const modal = document.querySelector('#modal_subject');
				 modal.classList.toggle('show');
				 
				  if (modal.classList.contains('show')) {
			          body.style.overflow = 'hidden';
			        } 				 
				  else if (!modal.classList.contains('show')) {
			            body.style.overflow = 'auto';
			          } 	 
			}
			
			function send_subject(f) {
				let n = $('input[type="checkbox"]:checked');
				let sub = "";
				for(let i = 0; i < n.length; i++) {
					sub += n[i].value;
					sub += ",";
				}				
				if(sub == "") {
					sub = "null";
				}
				else {
					sub = sub.substring(0, sub.length-1);
				}
				let subjects = document.getElementById("subjects");
				subjects.setAttribute('value',sub);
				f.submit();
			}			
		</script>
		
		<script>		
			function modalOn_area() {
				const body = document.querySelector('body');
				const modal = document.querySelector('#modal_area');
				 modal.classList.toggle('show');
				 
				  if (modal.classList.contains('show')) {
			          body.style.overflow = 'hidden';
			        } 			 
				  else if (!modal.classList.contains('show')) {
			            body.style.overflow = 'auto';
			          } 	 
			}
										
			function send_city(city) {
				var url = "SArea1.do";
				var param = "city="+city;
				var hidden_city = document.getElementById("city");
				hidden_city.setAttribute('value', city);
				sendRequest(url, param, sendCheck, "post");				
			}
			
			function sendCheck() {
				if(xhr.readyState == 4 && xhr.status == 200) {	
					var data = xhr.responseText;
					var json = eval(data);
					var country = "";
					for(let i = 0; i < json.length; i++) {
						country += '<div class="country">'
						if( i == 0) {
							country += '<input type="radio" id="'+ json[i].param +'" name="country" value="'+ json[i].param +'" checked>'	
						}
						else {
							country += '<input type="radio" id="'+ json[i].param +'" name="country" value="'+ json[i].param +'">'
						}					
						country += '<label for="'+ json[i].param +'">'+ json[i].param +'</label>'		
						country += '</div>'												
					}				
					document.getElementById("country_frame").innerHTML = country;					
					}	
				}
			
			function change(city) {
				var p_city = "#" + city;
				$(function() {
					$(p_city).parent().siblings().children().css("color","black");
					$(p_city).parent().parent().siblings().children().children().css("color","black");
					$(p_city).css("color","#2730C1");
				});				
			}
	
			function send_area(f) {				
				f.submit();
			}	
		</script>
		
		<script>			
			function modalOn_myn() {
				const body = document.querySelector('body');
				const modal = document.querySelector('#modal_myn');
				 modal.classList.toggle('show');
				 
				  if (modal.classList.contains('show')) {
			          body.style.overflow = 'hidden';
			        } 				 
				  else if (!modal.classList.contains('show')) {
			            body.style.overflow = 'auto';
			          } 	 
			}
			
			function send_myn(f) {
				f.submit();
			}		
		</script>
		
		<script>			
			function modalOn_gender() {
				const body = document.querySelector('body');
				const modal = document.querySelector('#modal_gender');
				 modal.classList.toggle('show');
				 
				  if (modal.classList.contains('show')) {
			          body.style.overflow = 'hidden';
			        } 				 
				  else if (!modal.classList.contains('show')) {
			            body.style.overflow = 'auto';
			          } 	 
			}
			
			function send_gender(f) {
				f.submit();
			}		
		</script>

</body>
</html>




