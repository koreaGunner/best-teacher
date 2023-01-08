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
 * Servlet implementation class JisikReReplyAction
 */
@WebServlet("/jisik/reReply.do")
public class JisikReReplyAction extends HttpServlet {
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

		int reply_idx = Integer.parseInt( mr.getParameter("reply_idx") );
		
		//원본 댓글의 정보 얻어오기
		JisikReplyVO baseVO = JisikReplyDAO.getInstance().selectOne(reply_idx);
		String baseOrder = baseVO.getReorder();
		int baseRef = baseVO.getRef();
		int idx = baseVO.getIdx();
		
		JisikReplyVO matchVO = new JisikReplyVO();
		matchVO.setRef(baseRef);
		matchVO.setReorder(baseOrder);
		
		//세션에 저장된 아이디 찾기
		HttpSession session = request.getSession();
		LoginVO userVO = (LoginVO) session.getAttribute("user");
		String id = userVO.getId();

		//배열의 최댓값 찾기
		String maxOrder = JisikReplyDAO.getInstance().selectOne(matchVO);
		
		
		//reorder 정하기
		String newOrder = "";
		
		if( maxOrder.equals("empty") ) {
			
			newOrder = baseOrder + "a";
			
		}else {
			
			int length = baseOrder.length();
			char order = maxOrder.charAt(length);
			order++;
			newOrder = baseOrder + order; 
			
		}
		
		
		//insert 위한 VO 생성
		JisikReplyVO vo = new JisikReplyVO();
		vo.setIdx(idx);
		vo.setRef(baseRef);
		vo.setContent(content);
		vo.setReorder(newOrder);
		vo.setId(id);
		
		
		
		//부모댓글 업데이트
		JisikReplyDAO.getInstance().updateReplyNum(reply_idx);
		
		//원본글 업데이트
		JisikTableDAO.getInstance().updateReplyInfo(idx);
		
		
		//대댓글 추가
		JisikReplyDAO.getInstance().insert_reReply(vo);
		
		
		//뷰로 이동
		response.sendRedirect("view.do?idx="+idx);
		
	}

}
