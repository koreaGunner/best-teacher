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
import search_dao.Student_InfoDAO;
import search_dao.Teacher_SearchDAO;
import search_vo.Student_SearchVO;
import search_vo.Teacher_SearchVO;

/**
 * Servlet implementation class StudentInfoAction
 */
@WebServlet("/search/StudentInfo.do")
public class StudentInfoAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String s_id = request.getParameter("s_id");
		
		List<Student_SearchVO> list = Student_InfoDAO.getInstance().info(s_id);
		
		HttpSession session = request.getSession();
		
		LoginVO user = (LoginVO)session.getAttribute("user");
		
		String t_id = "";
		
		int f = 0;
		
		if(user == null) {
			t_id = "null";
		}
		else {
			t_id = user.getId();		
			List<Teacher_SearchVO> found = Teacher_SearchDAO.getInstance().selectList();

			for(int i = 0; i < found.size(); i++) {
				if(t_id.equals(found.get(i).getId())) {
					f = 1;
					break;
				}
			}			
		}
		
		if( f == 0) {
			t_id = "null";
		}
		
		System.out.println("f:"+f);
		request.setAttribute("list", list);
		request.setAttribute("t_id", t_id);

		RequestDispatcher disp = request.getRequestDispatcher("student_info.jsp");
		disp.forward(request, response);
		
	}

}
