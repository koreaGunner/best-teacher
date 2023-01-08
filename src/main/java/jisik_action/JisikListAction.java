package jisik_action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jisik_dao.JisikTableDAO;
import jisik_dao.JjimDAO;
import jisik_vo.JisikTableVO;
import jisik_vo.JjimVO;
import jisik_vo.LoginVO;
import ocr.OcrReturn;

/**
 * Servlet implementation class JisikListAction
 */
@WebServlet("/jisik/jisik_list.do")
public class JisikListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		
		MultipartRequest mr = null;
		
		boolean multiBool = false;
		
		String contentType = request.getHeader("Content-Type");
		
		if( contentType != null && contentType.indexOf("multipart/form-data") > -1 ) {
			
			multiBool = true;
		}
		
		
		String web_path = "/upload/";
		ServletContext application = request.getServletContext();

		String path = application.getRealPath(web_path);
		//절대경로 확인
		/* System.out.println(path); */

		int max_size = 1024 * 1024 * 100;

		String filename = "";
		String search_content = "";
		File f = null;
		String jjim = "";
		String mylist = "";
		String subject = "";
		int max_page = 0;
		int row_num = 0;
		
		if( multiBool ) {
			
			mr = new MultipartRequest(request, path, max_size, "UTF-8", new DefaultFileRenamePolicy());
			
			f = mr.getFile("search_file");
			
			search_content += mr.getParameter("search_content");
			
			jjim += mr.getParameter("jjim");
			
			mylist += mr.getParameter("mylist");
			
			subject += mr.getParameter("subject");
			
		}else {
			
			search_content += request.getParameter("search_content");
			
			jjim += request.getParameter("jjim");
			
			mylist += request.getParameter("mylist");
			
			subject += request.getParameter("subject");
		}
		
		
		
		HttpSession session = request.getSession();
		LoginVO user = (LoginVO)session.getAttribute("user");
		List<JjimVO> jjimList = new ArrayList<JjimVO>();
		
		if(user != null) {
			String id = user.getId();
			jjimList = JjimDAO.getInstance().select_JjimIdx(id);
			
		}
		
		int start = 1;
		int end = 15;
		
		
		List<JisikTableVO> list = new ArrayList<JisikTableVO>();
		
		

		if (f == null && (search_content.equals("null") || search_content.equals("")) && ( jjim.equals("null") || jjim.equals(""))
				&& ( mylist.equals("null") || mylist.equals("") )
				&& ( subject.equals("null") || subject.equals("") ) ) {
			
			list = JisikTableDAO.getInstance().pageSelectList(start,end);
			
			row_num = JisikTableDAO.getInstance().row_Num();
			
			

		} else if (f != null) {
			filename = f.getName();
			String ocrResult = "";
			OcrReturn ocr = new OcrReturn();

			try {
				ocrResult = ocr.ocrtest(path, filename);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			int length = ocrResult.length();
			int half_length = length / 2;
			int quarter_length = half_length / 2;
			String part1 = ocrResult.substring(0, quarter_length);
			String part2 = ocrResult.substring(quarter_length, quarter_length * 2);
			String part3 = ocrResult.substring(quarter_length * 2, quarter_length * 3);
			String part4 = ocrResult.substring(quarter_length * 3, quarter_length * 4);

			list = JisikTableDAO.getInstance().page_searchImgselectList(part1, part2, part3, part4, start, end);
			
			row_num = JisikTableDAO.getInstance().row_Num_Img(part1, part2, part3, part4);
			

		} else if (!search_content.equals("null") && !search_content.equals("")) {
			list = JisikTableDAO.getInstance().page_searchTextselectList(search_content, start, end);
			
			row_num = JisikTableDAO.getInstance().row_Num_Text(search_content);

		} else if( jjim.equals("jj") ) {
			String id = user.getId();
			list = JisikTableDAO.getInstance().page_searchJjimselectList(id,start,end);
			
			row_num = JisikTableDAO.getInstance().row_Num_jjim(id);
			
			
		} else if( mylist.equals("my") ) {
			String id = user.getId();
			list = JisikTableDAO.getInstance().page_searchMyList(id, start, end);
			
			row_num = JisikTableDAO.getInstance().row_Num_MyList(id);
				
			
		} else if( !subject.equals("null") && !subject.equals("") ) {
			list = JisikTableDAO.getInstance().page_searchSubejctselectList(subject, start, end);
			
			row_num = JisikTableDAO.getInstance().row_Num_Subject(subject);
			
		}
		
		
		
		int mod_page = row_num % 15;
		
		max_page = row_num / 15;
		
		if( mod_page != 0 ) {
			
			max_page++;
		}
		
		
		
		
		
		for(int i = 0; i < list.size(); i++ ) {
			
			list.get(i).setLike_check(0);
		}//for
		
	
		for( int i = 0; i < list.size(); i++ ) {
			
			for(int j = 0; j < jjimList.size(); j++) {
				
				if( list.get(i).getIdx() == jjimList.get(j).getJjim_idx() ) {
					
					list.get(i).setLike_check(1);
					break;
				}
				
			}//inner
			
		}//outer
		
		
		request.setAttribute("list", list);
		request.setAttribute("max_page", max_page);

		RequestDispatcher disp = request.getRequestDispatcher("jisik_list.jsp");

		disp.forward(request, response);

	}

}
