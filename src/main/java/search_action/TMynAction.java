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
 * Servlet implementation class MynAction
 */
@WebServlet("/search/TMyn.do")
public class TMynAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<String> myn = new ArrayList<String>();
		
		String s = request.getParameter("myn");
		String myns = "";
		
		if(s.equals("전체")) {
			myn.add("가능");
			myn.add("불가능");
		}
		else {
			myn.add(s);
			myns += s;
		}
		
		Teacher_SearchDAO.getInstance().myns(myns);
				
		Teacher_SearchDAO.getInstance().myn(myn);
		
		response.sendRedirect("TeacherList.do");	
	}

}
