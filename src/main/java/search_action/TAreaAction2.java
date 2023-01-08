package search_action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import search_dao.AreaDAO;
import search_dao.Teacher_SearchDAO;
import search_vo.AreaVO;

/**
 * Servlet implementation class AreaAction2
 */
@WebServlet("/search/TArea2.do")
public class TAreaAction2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String city = request.getParameter("city");
		String country = request.getParameter("country");

		ArrayList<String> area = new ArrayList<String>();
		
		String areas = "";
		
		if(country.equals("전체")) {
			areas += city + " 전체";
			List<AreaVO> w =  AreaDAO.getInstance().selectList(city);
			for(int i = 1; i < w.size(); i++) {
				area.add(w.get(i).getCity() + " " + w.get(i).getCountry());
			}
		}
		else {
			if(!country.equals("")) {
				area.add(city + " " + country);
				areas += city + " " + country;
			}
		}
		
		Teacher_SearchDAO.getInstance().areas(areas);
		
		Teacher_SearchDAO.getInstance().area(area);
		
		response.sendRedirect("TeacherList.do");
		
		
	}

}
