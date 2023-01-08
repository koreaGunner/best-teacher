<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최강선생 | 회원가입</title>
	
	<style>
		.divCenter {
			position:absolute;
        	top:50%;
        	left:50%;
        	transform:translate(-50%);
		}
		
		.button{
			text-align: center;
			width: 250px;
			padding: 15px 32px;
			font-size: 16px;
			margin: 4px 2px;
		}
		.student {
			background-color: rgb(168,255,255);
		}

		.student:hover {
			background: rgb(30,255,255);
		}
				
		.teacher {
		 	background: rgb(174,255,207);
		}
		
		.teacher:hover{
			background: rgb(0,255,102);
		}
	</style>
	
</head>
<body>
	<div class="divCenter">
		<button class="button student" style='cursor:pointer;' id="student" onclick=""> 학생 회원가입</button>
		<button class="button teacher" style='cursor:pointer;'id="teacher" > 선생님 회원가입</button>		
	</div>
	
</body>
</html>