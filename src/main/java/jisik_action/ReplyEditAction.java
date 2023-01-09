package jisik_action;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import jisik_dao.JisikReplyDAO;
import jisik_vo.JisikReplyVO;

/**
 * Servlet implementation class ReplyEditAction
 */
@WebServlet("/jisik/reply_edit.do")
public class ReplyEditAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String web_path = "/upload/";
		
		ServletContext application = request.getServletContext();

		String path = application.getRealPath(web_path);
		int max_size = 1024 * 1024 * 100;
		
		MultipartRequest mr = new MultipartRequest(request, path, max_size);
		
		int reply_idx = Integer.parseInt(mr.getParameter("reply_idx"));
		String p_content = mr.getParameter("content");
		String content = URLDecoder.decode(p_content, "utf-8");

		
		int res = JisikReplyDAO.getInstance().update_reply(reply_idx, content);
		
		JisikReplyVO vo = new JisikReplyVO();
		vo.setContent(content);
		vo.setReply_idx(reply_idx);
		
		request.setAttribute("vo", vo);
		
		RequestDispatcher disp = request.getRequestDispatcher("edit_reply_form.jsp");
		response.setCharacterEncoding("utf-8");
		disp.include(request, response);
		/*
		 * String result = "no";
		 * 
		 * if( res == 1 ) {
		 * 
		 * result = "yes"; }
		 * 
		 * String resultStr =
		 * String.format("[{'result':'%s'},{'content':'%s'},{'idx':%d}]", result,
		 * content, reply_idx); response.setCharacterEncoding("utf-8");
		 * response.getWriter().print(resultStr);
		 */
		
	}

}
