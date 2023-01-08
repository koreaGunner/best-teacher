package search_action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import search_dao.AreaDAO;
import search_vo.AreaVO;

/**
 * Servlet implementation class AreaAction
 */
@WebServlet("/search/SArea1.do")
public class SAreaAction1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String city = request.getParameter("city");
	
		String resultStr = "";
		
		List<AreaVO> list = AreaDAO.getInstance().selectList(city);
		
		StringBuilder re = new StringBuilder();
		re.append("[");
		
		for(int i = 0; i < list.size(); i++) {
			re.append("{'param':'" + list.get(i).getCountry() + "'},");
		}
		
		re.deleteCharAt(re.length()-1);
		
		re.append("]");
		
		resultStr += re.toString();
	
		response.setCharacterEncoding("utf-8");
		
		response.getWriter().print(resultStr);
		
	}

}
