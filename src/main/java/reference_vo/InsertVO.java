package reference_vo;

public class InsertVO {

	private String id;
	private String title;
	private String content_main;
	private String ref_route;
	
	private long fileSize;
	private String content;
	
	
	private String subject_middle;
	private String subject_bottom;
	
	
	
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	private int content_price;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent_main() {
		return content_main;
	}
	public void setContent_main(String content_main) {
		this.content_main = content_main;
	}
	public String getRef_route() {
		return ref_route;
	}
	public void setRef_route(String ref_route) {
		this.ref_route = ref_route;
	}
	public int getContent_price() {
		return content_price;
	}
	public void setContent_price(int content_price) {
		this.content_price = content_price;
	}
	public String getSubject_middle() {
		return subject_middle;
	}
	public void setSubject_middle(String subject_middle) {
		this.subject_middle = subject_middle;
	}
	public String getSubject_bottom() {
		return subject_bottom;
	}
	public void setSubject_bottom(String subject_bottom) {
		this.subject_bottom = subject_bottom;
	}
	
	
	
	
}
