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
import user_vo.Dialogue_listVO;

/**
 * Servlet implementation class Dialogue_listAction
 */
@WebServlet("/user/dialogue_list.do")
public class Dialogue_listAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		Dialogue_listVO selected_id = Dialogue_listDAO.getInstance().selectOne(id);
		String gubun = selected_id.getGubun();
		
		Dialogue_listDAO dao = Dialogue_listDAO.getInstance();
		//DAO에서 가져온 대화목록
		if (gubun.equals("선생님")) {
			System.out.println("list action에서 dao로 셀렉트하러감!!(선생님 계정으로)");
			List<Dialogue_listVO> list = dao.student_dial_info(id);
			request.setAttribute("content_list", list);
			//저장된(바인딩 된) list를 어떤 jsp에서 사용하게 할건지 결정 = 포워딩
			RequestDispatcher disp = request.getRequestDispatcher("Dialogue_list_teacher.jsp");
			// Dialogue_list.jsp 에서만 저장해놓은 'list'객체를 el표기법으로 가져다 사용할 수 있다.
			disp.forward(request, response);
			// 나  Dialogue_list.jsp 에서 사용할꺼니까 거기까지 내 list를 보내라.
		}
		
		
		//학생인 경우 한번에 전체 메시지 리스트와 찜한 메시지 리스트를 둘다 받아간다.
		else if (gubun.equals("학생")) {
			List<Dialogue_listVO> list = dao.teacher_dial_info(id);
			request.setAttribute("content_list", list);
			
			List<Dialogue_listVO> wish_list = dao.wish_teacher_dial_info(id);
			request.setAttribute("content_wish_list", wish_list);
			//저장된(바인딩 된) list를 어떤 jsp에서 사용하게 할건지 결정 = 포워딩
			RequestDispatcher disp = request.getRequestDispatcher("Dialogue_list_student.jsp");
			// Dialogue_list.jsp 에서만 저장해놓은 'list'객체를 el표기법으로 가져다 사용할 수 있다.
			disp.forward(request, response);
			// 나  Dialogue_list.jsp 에서 사용할꺼니까 거기까지 내 list를 보내라.
		}
		
	
	}

}


