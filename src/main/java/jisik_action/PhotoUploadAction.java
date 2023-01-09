package jisik_action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ocr.OcrReturn;

/**
 * Servlet implementation class PhotoUploadAction
 */
@WebServlet("/jisik/upload.do")
public class PhotoUploadAction extends HttpServlet {
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

		MultipartRequest mr = new MultipartRequest( request,
				path,
				max_size,
				"utf-8",
				new DefaultFileRenamePolicy());


		int length = Integer.parseInt(mr.getParameter("length"));
		String content = mr.getParameter("content");
		String param = "file";

		String filename = "";
		String ocrResult = "";

		List<String> filenameArr = new ArrayList<String>();


		for(int i = 0; i < length; i++) {
			param = param + i;

			File f = mr.getFile(param);
			if( f != null ) {
				filename = f.getName();
				filenameArr.add(filename);
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
				
				filename ="";
				param = "file";
				
			}//if
			


		}//for
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
