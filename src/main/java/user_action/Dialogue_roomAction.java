package user_action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user_dao.Dialogue_roomDAO;
import user_vo.Dialogue_roomVO;

/**
 * Servlet implementation class Dialogue_roomAction
 */
@WebServlet("/user/dialogue_room.do")
public class Dialogue_roomAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int talk_seq = Integer.parseInt(request.getParameter("talk_seq"));
		String id = request.getParameter("login_id");
		
		//선생 학생 구분을 위한 select
		Dialogue_roomVO login_id = Dialogue_roomDAO.getInstance().login_id_select(id);
		
		Dialogue_roomDAO.getInstance().msg_update(talk_seq, id);
		
		String gubun = login_id.getGubun();
		System.out.println("roomdao의 구분 : " + gubun);
		
		Dialogue_roomDAO dao = Dialogue_roomDAO.getInstance();
		
		
		
		if (gubun.equals("선생님")) {
			Dialogue_roomVO opponent_info = dao.student_info(talk_seq);
			request.setAttribute("msg_list", opponent_info);
			
			List<Dialogue_roomVO> list = dao.teacher_msg_select(talk_seq);
			request.setAttribute("msg_content_list", list);
		}
		
		if (gubun.equals("학생")) {
			Dialogue_roomVO opponent_info = dao.teacher_info(talk_seq);
			request.setAttribute("msg_list", opponent_info);
			
			List<Dialogue_roomVO> list = dao.student_msg_select(talk_seq);
			request.setAttribute("msg_content_list", list);
		}
		
		//저장된(바인딩 된) list를 어떤 jsp에서 사용하게 할건지 결정 = 포워딩
		RequestDispatcher disp = request.getRequestDispatcher("Dialogue_room.jsp");
		// Dialogue_list.jsp 에서만 저장해놓은 'list'객체를 el표기법으로 가져다 사용할 수 있다.
		disp.forward(request, response);
		// 나  Dialogue_list.jsp 에서 사용할꺼니까 거기까지 내 list를 보내라.
		
		
	}

}
