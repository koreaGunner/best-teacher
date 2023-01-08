package reference_action;

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
import reference_dao.ZzimDAO;
import reference_vo.ContentVO;


@WebServlet("/reference/zzimlist.do")
public class ZZimlistPageAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		//id갖고오기
		LoginVO DAO= (LoginVO)session.getAttribute("user");
		if(DAO!=null) {
		String id = DAO.getId();
		
		
		
		ZzimDAO dao = ZzimDAO.getInstance();
		List<ContentVO> list_content = dao.selectList_zzim( id );
		request.setAttribute("list_content", list_content);
		
		
		//나중엔 원래페이지로 보내야
				RequestDispatcher disp = 
				request.getRequestDispatcher("zzimlistpage.jsp");
				disp.forward(request,response);
				
					
	}

}
}
