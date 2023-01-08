package jisik_action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jisik_dao.JisikTableDAO;
import jisik_dao.JjimDAO;
import jisik_vo.LoginVO;

/**
 * Servlet implementation class JjimInsertAction
 */
@WebServlet("/jisik/jjim_insert.do")
public class JjimInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		HttpSession session = request.getSession();
		LoginVO user = (LoginVO)session.getAttribute("user");
		
		String id = user.getId();
		
		JjimDAO.getInstance().insert_jjim(idx, id);
		
		JisikTableDAO.getInstance().plusLikehit(idx);
		
		int likehit = JisikTableDAO.getInstance().selectLikehit(idx);
		
		String resultStr = String.format("[{'idx':%d}, {'likehit':%d}]", idx, likehit );

		response.getWriter().print(resultStr);
		
	}

}
