package search_action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import search_dao.Teacher_InfoDAO;

/**
 * Servlet implementation class TeacherRiviewAction
 */
@WebServlet("/search/TeacherRiview.do")
public class TeacherRiviewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String t_id = request.getParameter("t_id");
		String s_id = request.getParameter("s_id");
		int jumsu = Integer.parseInt(request.getParameter("jumsu"));
		String review = request.getParameter("review");
		
		Teacher_InfoDAO.getInstance().insert_review(t_id, s_id, jumsu, review);
		
		Teacher_InfoDAO.getInstance().r_update(t_id, s_id);
		
		response.sendRedirect("TeacherInfo.do?t_id=" + t_id+"&review_auth=0");
	
	}

}
