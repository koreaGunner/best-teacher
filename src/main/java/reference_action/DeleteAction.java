package reference_action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reference_dao.CrudDAO;


@WebServlet("/reference/delete.do")
public class DeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		int ref_seq =Integer.parseInt( request.getParameter("ref_seq"));
		CrudDAO.getInstance().delete(ref_seq);
	
		//나중엔 원래페이지로 보내야
		RequestDispatcher disp = 
		request.getRequestDispatcher("reference.do");
		disp.forward(request,response);
		
	}
}
