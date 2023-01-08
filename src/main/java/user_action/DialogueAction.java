package user_action;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.AsyncContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user_dao.Dialogue_roomDAO;
import user_vo.Dialogue_roomVO;

/**
 * Servlet implementation class DialogueAction
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/user/msg" })
public class DialogueAction extends HttpServlet {
	
	private List<AsyncContext> contexts = new LinkedList<>();
	
	
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	response.setCharacterEncoding("UTF-8");
    	
        final AsyncContext asyncContext = request.startAsync(request, response);
        asyncContext.setTimeout(10 * 60 * 1000);
        contexts.add(asyncContext);
        System.out.println("Here is Get");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    	
    	request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		
        List<AsyncContext> asyncContexts = new ArrayList<>(this.contexts);
        this.contexts.clear();
        String send_id = request.getParameter("send_id");
        String p_message = request.getParameter("message");
        String message = URLDecoder.decode(p_message, "utf-8");
        String htmlMessage = send_id + "%" + message;
        int talk_seq = Integer.parseInt(request.getParameter("talk_seq"));
        
        
        LocalDate temp_date = LocalDate.now();
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    	String date = temp_date.format(formatter);
    	System.out.println("오늘 날짜 : " + date);
    	
    	LocalTime temp_time = LocalTime.now();
    	DateTimeFormatter formater = DateTimeFormatter.ofPattern("HH:mm:ss");

    	String time = temp_time.format(formater);
    	System.out.println("현재 시간 : " + time);
    	Dialogue_roomVO vo = new Dialogue_roomVO();
    	
    	vo.setTalk_seq(talk_seq);
    	vo.setContent(message);
    	vo.setSend_date(date);
    	vo.setSend_time(time);
    	vo.setSend_id(send_id);
    	
    	int result = Dialogue_roomDAO.getInstance().msg_insert(vo);

    	if(result == 0) {
    		System.out.println("으악 0이다!");
    		response.sendRedirect("deleted_page.jsp");
    	}
    	
    	else {
	        ServletContext sc = request.getServletContext();
	        if (sc.getAttribute("messages") == null) {
	            sc.setAttribute("messages", htmlMessage);
	        } else {
	            String currentMessages = (String) sc.getAttribute("messages");
	            sc.setAttribute("messages", htmlMessage + currentMessages);
	        }
	        for (AsyncContext asyncContext : asyncContexts) {
	            try (PrintWriter writer = asyncContext.getResponse().getWriter()) {
	                writer.println(htmlMessage);
	                writer.flush();
	                asyncContext.complete();
	            } catch (Exception ex) {
	            }
	        }
	
	    }
    }
}
