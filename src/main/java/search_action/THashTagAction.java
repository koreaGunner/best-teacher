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
 * Servlet implementation class HashTagAction
 */
@WebServlet("/search/THashTag.do")
public class THashTagAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<String> hashtag = new ArrayList<String>();
		
		String hashtags = "";
		
		for(int i = 1; i <= 19; i++) {
			if(i <= 18) {
				String s = "";
				s += request.getParameter("hashtag"+ i);
				if(!s.equals("null")) {
					hashtag.add(s);
				}
			}
			else {
				hashtags += request.getParameter("hashtag"+ i);
			}
				
		}
		
		Teacher_SearchDAO.getInstance().hashtags(hashtags);
		
		Teacher_SearchDAO.getInstance().hashtag(hashtag);
		
		response.sendRedirect("TeacherList.do");
		
	}

}
