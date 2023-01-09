package reference_action;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import reference_dao.CrudDAO;
import reference_vo.InsertVO;

/**
 * Servlet implementation class UserListAction
 */
@WebServlet("/reference/insert1.do") //불러오는 url 맵핑
public class InsertAction1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {   
		
		
	  //일단 값 받아오기
	    // request.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다.
	    // 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음
	    String uploadPath = request.getRealPath("/upload");
	    //out.println("절대경로 : " + uploadPath + "<br/>");
	     
	    int maxSize = 1024 * 1024 * 300; // 한번에 올릴 수 있는 파일 용량 : 300M로 제한
	     
	    String id = "";
	    String title = "";
	    int content_price=0;
	    String content_main = "";
	    String subject_middle ="";
	    String subject_bottom ="";
	     
	    String ref_route = ""; // 중복처리된 이름 (원래 filename1이었음)
	    String content = ""; // 
	    long fileSize = 0; // 파일 사이즈
	 
	     
	   
	     
	   
	        // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
	    	MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
	         
	        // form내의 input name="name" 인 녀석 value를 가져옴
	        id = multi.getParameter("id");
	        // name="title" 인 녀석 value를 가져옴
	        title = multi.getParameter("title");
	        // name="price" 인 녀석 value를 가져옴
	        content_price = Integer.parseInt(multi.getParameter("content_price"));
	        // name="content" 인 녀석 value를 가져옴
	        content_main = multi.getParameter("content_main");
	        
	        //줄바꿈처리
	        content_main = content_main.replaceAll("\n", "<br/>");
	        
	     // name="subject_middle" 인 녀석 value를 가져옴
	        subject_middle = multi.getParameter("subject_middle");
	     // name="subject_bottom" 인 녀석 value를 가져옴
	        subject_bottom = multi.getParameter("subject_bottom");
	         
	        
	        //썸네일
				File sumf = multi.getFile("ref_route");
				if(sumf != null) {
					ref_route = sumf.getName();
				}
	        
			//원본파일
				File contentf = multi.getFile("content");
				if(contentf != null) {
					content = contentf.getName();
					fileSize = contentf.length();
				}
				
				InsertVO vo= new InsertVO();
			
				vo.setTitle(title);
				vo.setId(id);
				
				//줄바꿈처리

				vo.setContent_main(content_main);
				vo.setRef_route(ref_route);
				vo.setContent_price(content_price);
				vo.setSubject_middle(subject_middle);
				vo.setSubject_bottom(subject_bottom);
				vo.setContent(content);
				vo.setFileSize(fileSize);
				
	  			//db처리
	  			CrudDAO.getInstance().insert(vo);

	  		
	  		//다시 메인페이지로 와야함
				RequestDispatcher disp = 
						request.getRequestDispatcher("reference.do");
				disp.forward(request,response);
		
		
		
		
	}
		
		
		
	

}