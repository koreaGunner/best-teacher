package reference_action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jisik_vo.LoginVO;
import reference_dao.CommentDAO;

/**
 * Servlet implementation class UserListAction
 */
@WebServlet("/reference/popup.do") //불러오는 url 맵핑
public class PopupAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {   
		HttpSession session = request.getSession();

		LoginVO DAO= (LoginVO)session.getAttribute("user");
		
		//자료번호받기
		int ref_seq =Integer.parseInt( request.getParameter("ref_seq"));
		//입력점수받기
		int score =Integer.parseInt( request.getParameter("score"));
		//컨텐트 내용 받기
		String content = request.getParameter("content");
		if(DAO!=null) {//로그인조건 충족시
			
			//id받기
			String id = DAO.getId();
			
			
			//db처리
			CommentDAO.getInstance().insert_comment(ref_seq,content,id,score);
			
		}
			
		

		
		
		//나중엔 원래페이지로 보내야
		RequestDispatcher disp = 
		request.getRequestDispatcher("reference_detail.do?ref_seq="+ ref_seq);
		disp.forward(request,response);
		
			
				
				
	}		
				
	

}
