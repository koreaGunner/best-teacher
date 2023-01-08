package user_action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user_dao.Dialogue_roomDAO;

/**
 * Servlet implementation class Dialogue_readAction
 */
@WebServlet("/user/msg_read.do")
public class Dialogue_readAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int talk_seq = Integer.parseInt(request.getParameter("talk_seq"));
		String login_id = request.getParameter("login_id");
		System.out.println("자동으로 읽힐때마다 이 로그가 찍힌다.");
		Dialogue_roomDAO.getInstance().msg_update(talk_seq, login_id);
		return;
	}

}
