package jisik_action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jisik_dao.JisikTableDAO;
import jisik_vo.JisikTableVO;

/**
 * Servlet implementation class JisikDelAction
 */
@WebServlet("/jisik/jisik_del.do")
public class JisikDelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String resultStr = "";
		String result = "no";
		
		//원본글 삭제를 위한 ocr삭제
		JisikTableDAO.getInstance().ocr_delete(idx);
		//원본글 삭제를 위한 찜 삭제
		JisikTableDAO.getInstance().jjim_delete(idx);
		
		
		//원본글 삭제
		int res = JisikTableDAO.getInstance().jisik_delete(idx);
		
		
		
		if( res == 1 ) {
			
			result = "yes";
		}
		System.out.println("res:" +res);
		
		resultStr = String.format("[{'result':'%s'}]", result);
		response.getWriter().print(resultStr);
		
		
		
	}

}
