<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>


<%
	String id = request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
.back {
	width: 1024px;
	height: 78px;
	border-bottom: 1px solid black;
}

.hover1:hover {
		color:white !important;
		background-color:blue !important;
		
	}
	
	

</style>

	<!-- ajax -->
	<script src = "../js/httpRequest.js"></script>
	
	<script src="../js/pick.js"></script>
	
	<script type="text/javascript">
	
	function send_back(){
		location.href = "reference.do";
	}
     
	</script>
</head>
 
<!-- 헤더 -->	
	<jsp:include page="../Main_header.jsp"></jsp:include>
<center>

  <!-- 뒤로가기  -->
	<div class="back">
		<div class="fl" style="width: 100px; height: 78px; cursor: pointer; position:relative; left:-460px;">
			<img src="../Images/mark_arrow.PNG"
				style="display: inline-block; width: 20px; height: 20px; padding: 30px 0px;"
				class="fl" onclick="send_back();">

			<div class="fl" style="display: inline-block; position: relative; top:-34px;" onclick="send_back();">
				<strong>리스트보기</strong>
			</div>
		</div>
		<div style="clear: both"></div>
	</div>
	
  <div style ="width:600px; height:30px;"> </div>
  
  <div style="border:1px solid #e5e7eb; border-radius:10px; width:600px; padding-bottom:20px;">
  
    <form action="insert1.do" method="post" enctype="Multipart/form-data" >
    
     
      <input type="hidden" name="id" value="<%=id %>"/><br/>
      
           <div class="hangmok">
            <h2 style="display:inline-block; position:relative; font-size:20px; left:-20px;">📖 과목 선택</h2>
            <select id="subject_middle" name="subject_middle" size="1" class="area_selectline" onchange="areaChange(this.form)" 
            style="width:200px; border:2px dashed #e5e7eb;" required>
                  <option value='' selected disabled>과목 선택</option>
                  <option value="초등국어">초등국어</option>
                  <option value="중등국어">중등국어</option>
                  <option value="고등국어">고등국어</option>
                  <option value="초등영어">초등영어</option>
                  <option value="중등영어">중등영어</option>
                  <option value="고등영어">고등영어</option>
                  <option value="초등수학">초등수학</option>
                  <option value="중등수학">중등수학</option>
                  <option value="고등수학">고등수학</option>
                  <option value="초등사회">초등사회</option>	
                  <option value="중등사회">중등사회</option>
                  <option value="고등사회">고등사회</option>
                  <option value="초등과학">초등과학</option>
                  <option value="중등과학">중등과학</option>
                  <option value="고등과학">고등과학</option>
                  <option value="C">C</option>
                  <option value="Java">Java</option>
                  <option value="Python">Python</option>
            </select>
            <select name="subject_bottom" size="1" class="area_selectline" style="width:195px; border:2px dashed #e5e7eb;">
               <option id="subject_bottom" value='' selected disabled>세부과목선택</option>
            </select>            
         </div>
      
      
      <h2 style="font-size:20px; margin-left:-22px;margin-top:10px; display:inline-block; position:relative; left:-15x;">🔹 제목 &nbsp;</h2> 
      <input type="text" name="title" style="margin-top:10px; font-size:20px; width:450px; 	display:inline-block; position:relative;
      border:2px dashed #e5e7eb;" required/><br/>
      
      <h2 style="font-size:20px;  position:relative; left:-250px; top:10px;">✏️ 내용 </h2>
      <textarea name="content_main" placeholder="내용을 입력해주세요." style="font-size:20px; width:450px;
      height: 500px; display:inline-block; position:relative; right:-30px; top:-15px; border:2px dashed #e5e7eb;" 
      required></textarea> <br/>
      
       <h2 style="font-size:20px; display:inline-block; position:relative; left:-17px; position:relative; top:10px;"> 💰 판매 가격 </h2>
  	  <input type="text" name="content_price" placeholder="적정 판매가를 입력하세요." style="font-size:20px; display:inline-block;
  	  position:relative; top:10px; border:2px dashed #e5e7eb; width:400px;" required/><br/>
      
       <div style ="width:600px; height:10px;"> </div>
      <!-- 파일 업로드는 input type="file"로 지정한다.  -->
  	  <h2 style="font-size:20px; display:inline-block; position:relative; left:-15px;">👀 썸네일 사진</h2> 
  
  	  <input type="file" name="ref_route" style="border:2px dashed #e5e7eb; width:380px;" required/><br/> 
  	  <h2 style="font-size:20px; display:inline-block; position:relative; left:-24px;">📁 원본 파일 </h2> 
  	  <input type="file" name="content" style="border:2px dashed #e5e7eb; position:relative; left:10px; width:380px;" required/><br/> 
  	 
	 
 	<div style="width:600px; height:30px;"></div>
      		
       
        <input class="hover1" type="submit" value="등록하기" style="width:200px; height: 30px; font-weight:600; border-radius:10px; color:black;"/>  
        <input class="hover1" type="reset" value="다시 입력하기"  style="width:200px; height: 30px; font-weight:600; border-radius:10px; color:black;"/>
    </form>
    </div>
</center>
<div style="width:600px; height:30px;"></div>

