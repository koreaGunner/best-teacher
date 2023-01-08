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
 * Servlet implementation class MbtiAction
 */
@WebServlet("/search/TMbti.do")
public class TMbtiAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<String> mbti = new ArrayList<String>();
		
		String mbtis = "";
		
		for(int i = 1; i <= 17; i++) {
			if(i <= 16) {
				String s = "";
				s += request.getParameter("mbti"+ i);
				if(!s.equals("null")) {
					mbti.add(s);
				}
			}
			else {
				mbtis += request.getParameter("mbti"+ i);
			}				
		}
		
		Teacher_SearchDAO.getInstance().mbtis(mbtis);
		
		Teacher_SearchDAO.getInstance().mbti(mbti);
		
		response.sendRedirect("TeacherList.do");
		
	}

}
