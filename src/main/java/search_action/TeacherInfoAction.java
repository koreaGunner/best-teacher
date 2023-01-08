package search_action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jisik_vo.LoginVO;
import search_dao.Student_SearchDAO;
import search_dao.Teacher_InfoDAO;
import search_vo.Student_SearchVO;
import search_vo.Teacher_ReviewVO;
import search_vo.Teacher_SearchVO;
import search_vo.Teacher_VideoVO;

/**
 * Servlet implementation class TeacherInfoAction
 */
@WebServlet("/search/TeacherInfo.do")
public class TeacherInfoAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String t_id = request.getParameter("t_id");
		String video = "";
		video += request.getParameter("video");
		
		List<Teacher_SearchVO> list1 = Teacher_InfoDAO.getInstance().info_profile(t_id);
		
		List<Teacher_VideoVO> list2 = Teacher_InfoDAO.getInstance().info_video(t_id);
		
		List<Teacher_ReviewVO> list3 = Teacher_InfoDAO.getInstance().info_review(t_id);
		
		HttpSession session = request.getSession();
		
		LoginVO user = (LoginVO)session.getAttribute("user");
		
		String s_id = "";
		
		int f = 0;
		
		if(user == null) {
			s_id = "null";
		}
		else {
			s_id = user.getId();		
			List<Student_SearchVO> found = Student_SearchDAO.getInstance().selectList();

			for(int i = 0; i < found.size(); i++) {
				if(s_id.equals(found.get(i).getId())) {
					f = 1;
					break;
				}
			}			
		}
		
		if( f == 0) {
			s_id = "null";
		}
	
		int check = Teacher_InfoDAO.getInstance().w_check(t_id, s_id);
		
		int r_check = Teacher_InfoDAO.getInstance().r_check(t_id, s_id);
		
		String avg_jumsu = Teacher_InfoDAO.getInstance().avg_jumsu(t_id);
		
		if(!avg_jumsu.equals("null")) {
			int avg_jumsu2 = Math.round(Float.parseFloat(avg_jumsu));
			request.setAttribute("avg_jumsu2", avg_jumsu2);
		}

		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("t_id", t_id);	
		request.setAttribute("s_id", s_id);
		request.setAttribute("check", check);
		request.setAttribute("r_check", r_check);
		request.setAttribute("avg_jumsu", avg_jumsu);
		
		if( video.equals("video") ) {
			RequestDispatcher disp = request.getRequestDispatcher("teacher_info.jsp?video='video'");
			disp.forward(request, response);
			
		}else {
			
			RequestDispatcher disp = request.getRequestDispatcher("teacher_info.jsp");
			disp.forward(request, response);
		}

		
		
	}

}
