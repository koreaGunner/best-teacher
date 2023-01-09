package reference_action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jisik_vo.LoginVO;
import reference_dao.ContentDAO;

/**
 * Servlet implementation class UserListAction
 */
@WebServlet("/reference/wishlist.do") //불러오는 url 맵핑
public class WishlistAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {   
		
		//세션에서 로그인 id받아옴
		HttpSession session = request.getSession();
		LoginVO DAO= (LoginVO)session.getAttribute("user");
		if(DAO!=null) {
		String id = DAO.getId();				

		
		
		//찜하기
		String resultStr = "";
		
		int ref_seq =Integer.parseInt(request.getParameter("ref_seq"));
		int check = ContentDAO.getInstance().w_check(ref_seq, id);
		
		
		
		if( check == 0) {
			ContentDAO.getInstance().w_insert(ref_seq, id);
		}
				
		if( check == 1) {
			ContentDAO.getInstance().w_delete(ref_seq, id);
		}
		
		resultStr = "[{'param':'"+ ref_seq +"'}]";
		
		response.getWriter().print(resultStr);
		
		}
		
		//int ref_seq =Integer.parseInt(request.getParameter("ref_seq"));
		
		//RequestDispatcher disp = request.getRequestDispatcher("reference_detail.do?ref_seq="+ ref_seq);
		//disp.forward(request, response);
		
		


		
	}

}