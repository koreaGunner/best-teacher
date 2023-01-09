package user_action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user_dao.Dialogue_roomDAO;

/**
 * Servlet implementation class Dialogue_deleteAction
 */
@WebServlet("/user/preview_req.do")
public class review_reqAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String teacher_id = request.getParameter("teacher_id");
		String student_id = request.getParameter("student_id");
		int req_res = Integer.parseInt(request.getParameter("req_res"));
		String resultStr = "";
		
		int res = Dialogue_roomDAO.getInstance().review_select(teacher_id, student_id);
		System.out.println("res"+res);
		
		//req_res가 0이면 선생이 평가를 요청한 상태임.
		if(req_res == 0) {
			if(res == 0) {
				Dialogue_roomDAO.getInstance().review_insert(teacher_id, student_id);
				resultStr = "[{'result' : 'success'}]";
			}else {
				resultStr = "[{'result' : 'already'}]";
			}
			response.getWriter().print(resultStr);
		}
		
		//req_res가 1이면 학생이 후기를 남기려는 상황임.
		else if(req_res == 1){
			
			//res가 0이다? 후기를 남길 권한이 없다.
			if(res == 0) {
				resultStr = "[{'result' : 'fail'}]";
			}else {
				
				int review_info = Dialogue_roomDAO.getInstance().review_infoSelect(teacher_id,student_id);
				
				if( review_info == 0 ) {
					
					resultStr = "[{'result' : 'success'}]";
				}else if( review_info == 1 ) {
					
					resultStr = "[{'result' : 'already'}]";
				}
				
				
			}
			response.getWriter().print(resultStr);
		}
	}

}
