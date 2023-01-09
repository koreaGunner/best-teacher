package reference_action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reference_dao.SearchDAO;
import reference_dao.Subject_middleDAO;
import reference_vo.ContentVO;
import reference_vo.Subject_middleVO;



@WebServlet("/reference/search.do")
public class ContentSearchAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		Subject_middleDAO dao = Subject_middleDAO.getInstance();
		List<Subject_middleVO> list_subject_middle = dao.selectList();
		
		//list를 request영역에 바인딩 ( 저장해둔다는 뜻)
		request.setAttribute("list_subject_middle", list_subject_middle);
			
				
		
		String id = request.getParameter("id");
		//String title = request.getParameter("title");
		SearchDAO dao1 = SearchDAO.getInstance();
		List<ContentVO> list_content1 = dao1.searchid(id);
		//List<ContentVO> list_content2 = dao.searchid(title);
		
		request.setAttribute("list_content", list_content1);
		
		
		
		RequestDispatcher disp = 
				request.getRequestDispatcher("reference.jsp");
		disp.forward(request,response);
		
		
}
	
}
	
