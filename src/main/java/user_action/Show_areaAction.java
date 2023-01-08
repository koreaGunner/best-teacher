package user_action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import user_dao.Find_areaDAO;

@WebServlet("/user/showarea.do")
public class Show_areaAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		
		String city = request.getParameter("city");
		
		Find_areaDAO dao = Find_areaDAO.getInstance();
		JSONArray countryList = dao.selectList(city);
		System.out.println("지역 시/군/구 받아감.");
		
		response.getWriter().print(countryList);
	}

}
