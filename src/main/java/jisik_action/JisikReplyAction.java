package jisik_action;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import jisik_dao.JisikReplyDAO;
import jisik_dao.JisikTableDAO;
import jisik_vo.JisikReplyVO;
import jisik_vo.LoginVO;

/**
 * Servlet implementation class JisikReplyAction
 */
@WebServlet("/jisik/reply.do")
public class JisikReplyAction extends HttpServlet {
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
		
		String p_content = mr.getParameter("content");
		String content = URLDecoder.decode(p_content, "utf-8");
		int idx = Integer.parseInt(mr.getParameter("idx"));
		
		
		HttpSession session = request.getSession();
		LoginVO userVO = (LoginVO) session.getAttribute("user");
		
		JisikReplyVO vo = new JisikReplyVO();
		vo.setId(userVO.getId());
		vo.setIdx(idx);
		vo.setContent(content);
		
		
		int res = JisikReplyDAO.getInstance().insertReply(vo);
		
		//본문 글 댓글 갯수 업데이트
		int up_res = JisikTableDAO.getInstance().updateReplyInfo(idx);
		
		
		
	}

}
