package jisik_action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jisik_dao.JisikTableDAO;
import jisik_vo.JisikTableVO;

/**
 * Servlet implementation class JisikEditAction
 */
@WebServlet("/jisik/jisik_edit_form.do")
public class JisikEditFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		String path = request.getParameter("path");
		
		JisikTableVO vo = JisikTableDAO.getInstance().selectOne(idx);
		/* vo.setPath(path); */
		
		request.setAttribute("vo", vo);
		
		RequestDispatcher disp = request.getRequestDispatcher("edit_form.jsp");
		
		disp.forward(request, response);
		
		
	}

}
