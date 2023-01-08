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
 * Servlet implementation class GenderAction
 */
@WebServlet("/search/SGender.do")
public class SGenderAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<String> gender = new ArrayList<String>();
		
		String s = request.getParameter("gender");
		String genders = "";
		
		if(s.equals("전체")) {
			gender.add("여자");
			gender.add("남자");
		}
		else {
			gender.add(s);
			genders += s;
		}
		
		Student_SearchDAO.getInstance().genders(genders);
		
		Student_SearchDAO.getInstance().gender(gender);
		
		response.sendRedirect("StudentList.do");
	}

}
