package jisik_action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jisik_dao.JisikReplyDAO;
import jisik_dao.JisikTableDAO;
import jisik_dao.JjimDAO;
import jisik_dao.ReplyLikeDAO;
import jisik_vo.JisikReplyVO;
import jisik_vo.JisikTableVO;
import jisik_vo.JjimVO;
import jisik_vo.LoginVO;
import jisik_vo.ReplyLikeVO;

/**
 * Servlet implementation class JisikViewAction
 */
@WebServlet("/jisik/view.do")
public class JisikViewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		int res = JisikTableDAO.getInstance().updateReadhit(idx);
		
		
		HttpSession session = request.getSession();
		LoginVO user = (LoginVO)session.getAttribute("user");
		List<JjimVO> jjimList = new ArrayList<JjimVO>();
		
		if(user != null) {
			String id = user.getId();
			jjimList = JjimDAO.getInstance().select_JjimIdx(id);
			
		}
		
		JisikTableVO vo = JisikTableDAO.getInstance().selectOne(idx);
		vo.setLike_check(0);
		
		//선생님과 학생 학년을 받아오는 과정
		if( vo.getGubun().equals("선생님") ) {
			vo.setGrade("선생님");
		}else if( vo.getGubun().equals("학생") ) {
			String grade = JisikReplyDAO.getInstance().selectGrade(vo.getId());
			vo.setGrade(grade);
		}
		
		
		
		//찜목록에 있는지 확인
		for(int i = 0 ; i < jjimList.size(); i++) {
			
			if( jjimList.get(i).getJjim_idx() == idx ) {
				
				vo.setLike_check(1);
				break;
			}
			
		}
		
		
		List<JisikReplyVO> list = JisikReplyDAO.getInstance().selectList(idx);
		
		
		//대댓글 작성을 위한 댓글의 닉네임 가져오기
		for( int i = 0; i < list.size(); i++ ) {
			int reOrderLength = list.get(i).getReorder().length(); 
			list.get(i).setReOrderLength(reOrderLength);
			if( list.get(i).getReOrderLength() >= 2 ) {
				String baseOrder = list.get(i).getReorder().substring(0, reOrderLength-1);
				
				//baseId 찾기위한 내 ref
				int myref = list.get(i).getRef();
				
				
				//baseId찾기
				String baseNickname = JisikReplyDAO.getInstance().selectBaseNickname(myref, baseOrder);
				list.get(i).setBaseNickname(baseNickname);
				
				
			}
			
		}
		
		//댓글의 grade 심기
		for( int i = 0; i < list.size(); i++ ) {
			if( list.get(i).getGubun().equals("선생님") ) {
				list.get(i).setGrade("선생님");
				
			}else if( list.get(i).getGubun().equals("학생") ) {
				String grade = JisikReplyDAO.getInstance().selectGrade(list.get(i).getId());
				list.get(i).setGrade(grade);
			}
			
		}
		
		
		
		
		List<ReplyLikeVO> like_list = new ArrayList<ReplyLikeVO>();
		//좋아요 눌렀는지 확인
		if( user != null ) {
			String id = user.getId();
			//댓글 좋아요 누른 목록 가져오기
			like_list = ReplyLikeDAO.getInstance().selectLikeList(id);
		}
		
		for( int i = 0; i < list.size(); i++ ) {
			list.get(i).setReply_like_check(0);
		}
		
		for( int i = 0; i < list.size(); i++ ) {
			
			for( int j = 0; j < like_list.size(); j++ ) {
				
				if( list.get(i).getReply_idx() == like_list.get(j).getLike_idx() ) {
					
					list.get(i).setReply_like_check(1);
					break;
				}
			}
			
		}
		
		request.setAttribute("vo", vo);
		request.setAttribute("list", list);
		
		
		RequestDispatcher disp = request.getRequestDispatcher("jisik_view.jsp");
		disp.forward(request, response);
		
		
	}

}











