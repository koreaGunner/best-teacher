package ocr;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;

import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class OcrReturn{


	public String ocrtest(String realpath, String filename) throws Exception,IOException {
		
		
		String filePath = realpath + filename;
		String result = "";

		List<AnnotateImageRequest> requests = new ArrayList<>();
		ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
		AnnotateImageRequest request = 
				AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);


		try(ImageAnnotatorClient client = ImageAnnotatorClient.create()){
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

			for(AnnotateImageResponse res : responses) {
				if(res.hasError()) {
					return "";
				}

				for(EntityAnnotation annotation : res.getTextAnnotationsList()) {
					result = res.getTextAnnotationsList().get(0).getDescription();

				}

			}

		}




		return result;

	}


}































