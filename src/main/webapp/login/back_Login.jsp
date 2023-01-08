<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최강선생 | 로그인 페이지</title>
	<script src="../js/httpRequest.js"></script>
	<script>
		function send(f){ //이름은 send, form태그를 하나만 받음 (body에 명시되어있음)
			var id = f.id.value.trim();
			var pw = f.pw.value.trim();
			
			//유효성 체크
			if(id == ''){	//id 공백 체크
				alert("아이디를 입력하세요.");
				return;
			}
			if(pw == ''){	//pw 공백 체크
				alert("비밀번호를 입력하세요.");
				return;
			}
			
			var url = "login.do"; //login.do라는 서블릿을 호출한다.
			//파라미터를 2개 보낸다. (아이디&패스워드)
			var param = "id=" + id + "&pw=" + encodeURIComponent(pw); //비밀번호에 특수문자가 섞여있을수 있으니 
			sendRequest(url, param, resultCheck, "POST");
		}
		
		//위에 resultCheck라는 콜백메소드를 만든다.
		function resultCheck() {
			
			if(xhr.readyState == 4 && xhr.status == 200){
				//서블릿 (LoginAction)에서 넘어온 값이 무엇인지 처리한다.
				//아이디 없음 : "[{'param' : 'no_id'}]"
				//비밀번호 틀림 : "[{'param' : 'no_pw'}]" 
				//로그인 성공 : "[{'param' : 'success'}]"
				var data = xhr.responseText;
				var json = eval(data);
				
				if (json[0].param == 'no_id'){
					alert("아이디가 일치하지 않습니다.");
				}
				else if (json[0].param == 'no_pw'){
					alert("비밀번호가 일치하지 않습니다.");
				}
				else if (json[0].param == 'success'){
					//로그인 성공이면 메인페이지로 가도 된다.
					location.href="../jisik_list.do";
				}
			}
		}
	</script>
</head>
<body>

	<form>
		<table border="1" align="center">
			<caption> ::: 최강선생 로그인 :::</caption>
			<tr>
				<th>아이디</th>
				<td><input name="id"></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pw" ></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="로그인" onclick="send(this.form);">
					<input type="button" value="회원가입" onclick="location.href='login_insert.jsp'">
					<!-- 버튼을 누르면 아이디/비밀번호가 틀렸는지 알려줌. -->
			</tr>
		
		</table>
	
	</form>

</body>
</html>