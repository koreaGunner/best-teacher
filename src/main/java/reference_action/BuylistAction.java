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
@WebServlet("/reference/buylist.do") //불러오는 url 맵핑
public class BuylistAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {   
		
		//세션에서 로그인 id받아옴
		HttpSession session = request.getSession();
		LoginVO DAO= (LoginVO)session.getAttribute("user");
		if(DAO!=null) {
				
				
			String id = DAO.getId();			
			//구매하기
			String resultStr = "";
			int ref_seq =Integer.parseInt(request.getParameter("ref_seq"));
			
			//이전에 구매했었는지 구매여부 판단 /0이여야 아직 안산거니까 0일때만 구매하기 가능
			int checkbuy = ContentDAO.getInstance().b_check(ref_seq, id);
			//System.out.println(checkbuy);  0 잘나옴
			
			 //bp_check는 포인트가 컨텐츠구매하는데 넉넉한지 유효성 검사해서 1이면 가능 0이면 불가능 얘기하는 것. 
			 //-> db처리는dao단계에서 다 되어서 넘어오는거 주의 int checkpoint =
			
			 
			 if( checkbuy == 0 ) {
			 ContentDAO.getInstance().b_insert(ref_seq, id); 
			 ContentDAO.getInstance().bp_update(ref_seq, id); 
			 
			 //자료판매자 포인트증가시키기
			ContentDAO.getInstance().get_point(ref_seq); 
			 }
			 

			resultStr = "[{'param':'"+ ref_seq +"'}]";
			
			response.getWriter().print(resultStr);
		
		}
		
		
		
	}

}