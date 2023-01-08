package search_action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import search_dao.Student_SearchDAO;

/**
 * Servlet implementation class SubjectAction
 */
@WebServlet("/search/SSubject.do")
public class SSubjectAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<String> subject = new ArrayList<String>();
		
		String subjects = "";
		
		for(int i = 1; i <= 47; i++) {
			if( i <= 46) {
				String s = "";
				s += request.getParameter("subject"+ i);
				if(!s.equals("null")) {
					subject.add(s);
				}
			}
			else {
				subjects += request.getParameter("subject"+ i);
			}
		}
		
		Student_SearchDAO.getInstance().subjects(subjects);
		
		Student_SearchDAO.getInstance().subject(subject);
		
		response.sendRedirect("StudentList.do");
		
		
	}

}
