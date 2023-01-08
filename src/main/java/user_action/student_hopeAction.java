package user_action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user_dao.MypageDAO;

/**
 * Servlet implementation class student_hopeAction
 */
@WebServlet("/user/hope_yn.do")
public class student_hopeAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String hope_result = request.getParameter("hope");
		System.out.println(hope_result);
		MypageDAO.getInstance().hope_update(id, hope_result);
		
		response.getWriter().print("°ú¿ÜÈñ¸Á º¯°æ");
	}

}
