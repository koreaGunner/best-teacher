package search_action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import search_dao.Teacher_SearchDAO;

/**
 * Servlet implementation class GenderAction
 */
@WebServlet("/search/TGender.do")
public class TGenderAction extends HttpServlet {
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
		
		Teacher_SearchDAO.getInstance().genders(genders);
		
		Teacher_SearchDAO.getInstance().gender(gender);
		
		response.sendRedirect("TeacherList.do");
	}

}
