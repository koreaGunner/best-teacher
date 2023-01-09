package search_action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jisik_vo.LoginVO;
import search_dao.Talk_CheckDAO;

/**
 * Servlet implementation class TalkCheckAction
 */
@WebServlet("/search/TalkCheck.do")
public class TalkCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String t_id = request.getParameter("t_id");
		String s_id = request.getParameter("s_id");
		
		HttpSession session = request.getSession();
		
		LoginVO user = (LoginVO)session.getAttribute("user");
		
		String login_id = user.getId();
		
		//대화방 있는지 확인
		int check = Talk_CheckDAO.getInstance().talk_check(t_id, s_id);
		System.out.println("check:"+check);
		
		//대화방 없으면 생성
		if(check == 0) {
			Talk_CheckDAO.getInstance().insert_talk(t_id, s_id);
		}
		
		//대화방 번호 찾기
		int talk_seq = Talk_CheckDAO.getInstance().talk_seq(t_id, s_id);
				
		String resultStr = "[{'param':'" + talk_seq + "'},{'param':'" + login_id + "'}]";
				
		response.setCharacterEncoding("utf-8");
		
		response.getWriter().print(resultStr);
				
	}

}
