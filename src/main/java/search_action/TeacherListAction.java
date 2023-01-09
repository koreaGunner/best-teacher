package search_action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import search_dao.Teacher_SearchDAO;
import search_vo.Teacher_SearchVO;

/**
 * Servlet implementation class TeacherListAction
 */
@WebServlet("/search/TeacherList.do")
public class TeacherListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Teacher_SearchVO> list = Teacher_SearchDAO.getInstance().selectList();
		
		for(int i = 0; i < list.size(); i++) {
			String id = list.get(i).getId();
			String title = Teacher_SearchDAO.getInstance().video_selectOne(id);
			list.get(i).setTitle(title);
			
		}
		
		String subject = Teacher_SearchDAO.getInstance().subject();		
		String area = Teacher_SearchDAO.getInstance().area();		
		String myn = Teacher_SearchDAO.getInstance().myn();		
		String gender = Teacher_SearchDAO.getInstance().gender();		
		String mbti = Teacher_SearchDAO.getInstance().mbti();		
		String hashtag = Teacher_SearchDAO.getInstance().hashtag();
		
		
		
		if(subject == "") {
			subject += "null";
		}
		
		if(area == "") {
			area += "null";
		}
		
		if(myn == "") {
			myn += "null";
		}
		
		if(gender == "") {
			gender += "null";
		}
		
		if(mbti == "") {
			mbti += "null";
		}
		
		if(hashtag == "") {
			hashtag += "null";
		}
		
		request.setAttribute("list", list);		
		request.setAttribute("subject", subject);		
		request.setAttribute("area", area);		
		request.setAttribute("myn", myn);		
		request.setAttribute("gender", gender);	
		request.setAttribute("mbti", mbti);		
		request.setAttribute("hashtag", hashtag);
			
		RequestDispatcher disp = request.getRequestDispatcher("teacher_list.jsp");
		disp.forward(request, response);
		
	}

}
