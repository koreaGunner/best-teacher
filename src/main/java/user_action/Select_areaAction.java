package user_action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import user_dao.Select_areaDAO;

@WebServlet("/user/selectarea.do")
public class Select_areaAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		
		String city = request.getParameter("city");
		
		Select_areaDAO dao = Select_areaDAO.getInstance();
		JSONArray areaList = dao.selectList(city);
		
		response.getWriter().print(areaList);
	}

}
