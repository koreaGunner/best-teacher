package reference_action;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jisik_vo.LoginVO;
import reference_dao.ContentDAO;
import reference_dao.MypageDAO;
import reference_vo.CommentVO;
import reference_vo.ContentVO;


/**
 * Servlet implementation class UserListAction
 */
@WebServlet("/reference/reference_detail.do") //불러오는 url 맵핑
public class ReferenceDetailAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {   
	
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//내캐시현황 얼마남았는지불러오기
		HttpSession session = request.getSession();

		LoginVO DAO= (LoginVO)session.getAttribute("user");
		
		
		if(DAO!=null) {
		String id = DAO.getId();		
		MypageDAO cash = MypageDAO.getInstance(); 
		List<LoginVO> showmycash = cash.showmycash(id); 
		request.setAttribute("showmycash", showmycash);
		//System.out.println(showmycash.get(0).getPoint());
		}
			
		
		
		
		//디테일 세부정보 불러오기
		int ref_seq =Integer.parseInt( request.getParameter("ref_seq"));
		ContentDAO dao = ContentDAO.getInstance();
		List<ContentVO> list_content = dao.selectList_detail(ref_seq);
		request.setAttribute("list_content", list_content);
		
		//파일명써서 미리보기 불러오기
		String filename = ContentDAO.getInstance().filename(ref_seq);
		//filename = new String(filename.getBytes("8859_1"),"utf-8");
		
		//filename = URLEncoder.encode(filename,"utf-8");
		String savePath = "../upload";
	    String sFilePath = savePath + "\\" + filename;
	    System.out.println(sFilePath);
		request.setAttribute("filename", sFilePath);
		
		//댓글개수 불러오기
		int cnt = ContentDAO.getInstance().showComment_cnt(ref_seq);
		request.setAttribute("comment_cnt", cnt);
		//System.out.println(cnt);
		
		//찜하기 (로그인 시에만 보임)
		if(DAO!=null) {//로그인시
			String id = DAO.getId();
			int check = ContentDAO.getInstance().w_check(ref_seq, id);
			request.setAttribute("check", check);
		}
		
		
		
		//해당 컨텐츠번호 댓글 전체 불러오기(int ref_seq 재활용)
		ContentDAO commentdao = ContentDAO.getInstance();
		List<CommentVO> list_comment = commentdao.selectList_comment(ref_seq);
		request.setAttribute("list_comment", list_comment);
		
		
		//구매기능관련 check보내기
				if(DAO!=null) {//로그인시
					String id = DAO.getId();
					
					//구매했는지 여부 ( 0:아직 미구매 / 1:구매완료상태 )
					int check = ContentDAO.getInstance().b_check(ref_seq, id);
					request.setAttribute("checkbuy", check);
					
					  //int checkpoint = ContentDAO.getInstance().bp_check(ref_seq, id);
					  //request.setAttribute("checkpoint", checkpoint);
					 
				}
				        
		        
		//나중엔 원래페이지로 보내야
		RequestDispatcher disp = 
		request.getRequestDispatcher("reference_detail.jsp?filename="+filename);
		disp.forward(request,response);
		
			
				
				
	}		
				
	
	
}
