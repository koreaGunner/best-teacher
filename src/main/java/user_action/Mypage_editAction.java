package user_action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user_dao.Dialogue_listDAO;
import user_dao.MypageDAO;
import user_vo.Dialogue_listVO;
import user_vo.Mypage_studentVO;
import user_vo.Mypage_teacherVO;

@WebServlet("/user/mypage_edit.do")
public class Mypage_editAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		Dialogue_listVO selected_id = Dialogue_listDAO.getInstance().selectOne(id);
		String gubun = selected_id.getGubun();
		System.out.println(gubun);
		
		MypageDAO dao = MypageDAO.getInstance();
		
		if (gubun.equals("선생님")) {
			List<Mypage_teacherVO> teacher_info = dao.mypage_teacher_info(id);
			request.setAttribute("teacher_all_info", teacher_info);
			
			List<Mypage_teacherVO> video_list = dao.teacher_video_select(id);
			request.setAttribute("video_all_list", video_list);
			
			//저장된(바인딩 된) list를 어떤 jsp에서 사용하게 할건지 결정 = 포워딩
			RequestDispatcher disp = request.getRequestDispatcher("mypage_edit_teacher.jsp");
			// Dialogue_list.jsp 에서만 저장해놓은 'list'객체를 el표기법으로 가져다 사용할 수 있다.
			disp.forward(request, response);
			// 나  Dialogue_list.jsp 에서 사용할꺼니까 거기까지 내 list를 보내라.
		}
		
		else if (gubun.equals("학생")) {
			List<Mypage_studentVO> student_info = dao.mypage_student_info(id);
			request.setAttribute("student_all_info", student_info);
			//저장된(바인딩 된) list를 어떤 jsp에서 사용하게 할건지 결정 = 포워딩
			RequestDispatcher disp = request.getRequestDispatcher("mypage_edit_student.jsp");
			// Dialogue_list.jsp 에서만 저장해놓은 'list'객체를 el표기법으로 가져다 사용할 수 있다.
			disp.forward(request, response);
			// 나  Dialogue_list.jsp 에서 사용할꺼니까 거기까지 내 list를 보내라.
		}
	}

}
