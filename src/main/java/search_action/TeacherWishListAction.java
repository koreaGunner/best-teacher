package search_action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import search_dao.Teacher_InfoDAO;

/**
 * Servlet implementation class TeacherWishListAction
 */
@WebServlet("/search/TeacherWishList.do")
public class TeacherWishListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String t_id = request.getParameter("t_id");
		String s_id = request.getParameter("s_id");
		
		int check = Teacher_InfoDAO.getInstance().w_check(t_id, s_id);
		
		if( check == 0) {
			Teacher_InfoDAO.getInstance().w_insert(t_id, s_id);
		}
				
		if( check == 1) {
			Teacher_InfoDAO.getInstance().w_delete(t_id, s_id);
		}
		
	}

}
