package reference_action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reference_dao.BuyDAO;
import reference_vo.ContentVO;


@WebServlet("/reference/buylistaction.do")
public class BuylistPageAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		String id = "";
		id += request.getParameter("id");
		
		
		BuyDAO dao = BuyDAO.getInstance();
		List<ContentVO> list_content = dao.selectList_buy( id );
		request.setAttribute("list_content", list_content);
		
		
		//나중엔 원래페이지로 보내야
				RequestDispatcher disp = 
				request.getRequestDispatcher("buylistpage.jsp");
				disp.forward(request,response);
				
					
	

}
}
