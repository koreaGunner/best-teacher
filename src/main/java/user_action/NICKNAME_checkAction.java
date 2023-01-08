package user_action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user_dao.NICKNAME_checkDAO;
import user_vo.NICKNAME_checkVO;


/**
 * Servlet implementation class ID_checkAction
 */
@WebServlet("/user/nickcheck.do")
public class NICKNAME_checkAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nickname = request.getParameter("nickname");
		NICKNAME_checkVO user = NICKNAME_checkDAO.getInstance().selectOne(nickname);
		String resultStr = "";
		
		if( user==null ) {
			resultStr = "[{'param' : 'can_use_nickname'}]";
			response.getWriter().print(resultStr);
			//바로 resultStr을 login.jsp의 콜백메소드(resultCheck)로 보낸다.
			return; //아이디 사용가능! 바로끝냄.
		}
		
		//디폴트는 사용할 수 없다 이다.
		resultStr = "[{'param' : 'cant_use_nickname'}]";
		response.getWriter().print(resultStr);	//아이디 사용 불가 전달
		
	}

}
