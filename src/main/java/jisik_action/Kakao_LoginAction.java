package jisik_action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jisik_dao.LoginDAO;
import jisik_vo.LoginVO;

/**
 * Servlet implementation class Kakao_LoginAction
 */
@WebServlet("/kakaologin.do")
public class Kakao_LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String kakao_email = request.getParameter("kakao_email");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String path = request.getParameter("path");
		
//카카오 로그인 최초시도=====================================================================================================================
		if(id.equals("try")) {
			LoginVO user = LoginDAO.getInstance().kakao_login(kakao_email);
			
			// LoginVO가 결과값을 받을거고, LoginDAO로 부터 getInstance 호출해서 selectOne 메소드를 호출하여 String타입의 ID를 보내줌.
			// 아이디만 보낸다. (아이디 먼저 유효성 체크)
			//조회가 잘 됐다면 user에서 빼올수 있는 값은 id와 pw 2가지이다.
			//조회가 안됐다면 user는 null값이다.
			
			String resultStr = "";
			
			//user가 null값이면 최강선생 계정과 카카오 이메일이 연동되지 않은것.
			if( user==null ) {
				resultStr = "[{'param' : 'no_account'}]";
				response.getWriter().print(resultStr);
				//바로 resultStr을 login.jsp의 콜백메소드(resultCheck)로 보낸다.
				return; //비밀번호 검사할 필요가 없음. 바로 끝냄.
			}
					
			//위 if문 2개를 전부 만나지 않았다면 정상로그인임.
			// 로그인 한 정보를 세션에 저장할 것임(바인딩)
			HttpSession session = request.getSession(); //request로 부터 session공간을 할당받는 작업
			session.setMaxInactiveInterval(3600);	//세션에 담긴 값 유지 시간 (단위:초)
			session.setAttribute("user", user); //user라는 객체는 id,pw정보가 들어있음. 이게 세션에 담겨있는것임.
			//세션은 웹브라우저가 켜져있을땐 날아가면 안되므로 RAM메모리에 저장한다. 따라서 필요할때만 써줘야한다.
			
			resultStr = String.format("[{'param' : 'success'}, {'p_path':'%s'}]", path);
			response.getWriter().print(resultStr);	//로그인 성공을 사용자에게 알려줌.
		}
		
		
		
//카카오 로그인 실패 - 최초등록 필요==================================================================================================================
		else if(id.equals("no")) {
			request.setAttribute("kakao_email", kakao_email);
			request.setAttribute("path", path);
			RequestDispatcher disp = request.getRequestDispatcher("kakaologin.jsp");
			disp.forward(request, response);
		}
		
		

//카카오 로그인 최초등록하고 로그인===================================================================================================================
		else {
			//넘겨받은 아이디부터 조회
			LoginVO user = LoginDAO.getInstance().selectOne(id);
			// LoginVO가 결과값을 받을거고, LoginDAO로 부터 getInstance 호출해서 selectOne 메소드를 호출하여 String타입의 ID를 보내줌.
			// 아이디만 보낸다. (아이디 먼저 유효성 체크)
			//조회가 잘 됐다면 user에서 빼올수 있는 값은 id와 pw 2가지이다.
			//조회가 안됐다면 user는 null값이다.
			
			String resultStr = "";
			
			//user가 null값이면 아이디가 일치하지 않은것
			if( user==null ) {
				resultStr = "[{'param' : 'no_id'}]";
				response.getWriter().print(resultStr);
				//바로 resultStr을 login.jsp의 콜백메소드(resultCheck)로 보낸다.
				return; //비밀번호 검사할 필요가 없음. 바로 끝냄.
			}
			
			//위에 if문을 만나지 않았다면 id값은 있는것이므로 pw로 받아왔을 것이다.
			//DB에서 받아온 비밀번호와 파라미터로 받은 비밀번호를 비교한다.
			if( !user.getPw().equals(pw)) {	//비밀번호 불일치
				resultStr = "[{'param' : 'no_pw'}]";
				response.getWriter().print(resultStr);
				//바로 resultStr을 login.jsp의 콜백메소드(resultCheck)로 보낸다.
				return; //비밀번호가 틀렸으므로 바로 끝냄.
			}
			
			//위 if문 2개를 전부 만나지 않았다면 정상로그인임.
			// 로그인 한 정보를 세션에 저장할 것임(바인딩)
			
			//그 전에 카카오 이메일을 최강선생 계정에 업데이트 한다. (추 후 이 사용자는 카카오 이메일만으로 로그인이 가능하게 됨)
			LoginVO kakao_update = new LoginVO();
			kakao_update.setId(id);
			kakao_update.setPw(pw);
			kakao_update.setKakao_email(kakao_email);
			LoginDAO.getInstance().kakao_email_update(kakao_update);
			
			
			HttpSession session = request.getSession(); //request로 부터 session공간을 할당받는 작업
			session.setMaxInactiveInterval(3600);	//세션에 담긴 값 유지 시간 (단위:초)
			session.setAttribute("user", user); //user라는 객체는 id,pw정보가 들어있음. 이게 세션에 담겨있는것임.
			//세션은 웹브라우저가 켜져있을땐 날아가면 안되므로 RAM메모리에 저장한다. 따라서 필요할때만 써줘야한다.
			
			resultStr = String.format("[{'param' : 'success'}, {'p_path':'%s'}]", path);
			response.getWriter().print(resultStr);	//로그인 성공을 사용자에게 알려줌.
		}
		
		
	}
}
