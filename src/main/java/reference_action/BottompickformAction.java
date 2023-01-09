package reference_action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import reference_dao.Subject_bottomDAO;

/**
 * Servlet implementation class InsertAction
 */
@WebServlet("/reference/pick.do")
public class BottompickformAction extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
    */
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("UTF-8");
      
      String p_subject_middle = request.getParameter("subject_middle");
     
      Subject_bottomDAO dao = Subject_bottomDAO.getInstance();
      JSONArray subject_bottom = dao.selectList_subject_bottom(p_subject_middle);
      
      
      response.getWriter().print(subject_bottom);
   }

}