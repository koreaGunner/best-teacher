package jisik_vo;

public class JisikTableVO {
	private int idx, readhit, likehit, del_info, success_info,reply_info;
	private String subject, id, content, regidate, gubun, grade;
	
	private int ocr_idx;
	private String filename, ocr_data;
	
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	private String nickname;
	
	private String path;
	
	private int like_check;
	
	
	public int getLike_check() {
		return like_check;
	}
	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getOcr_idx() {
		return ocr_idx;
	}
	public void setOcr_idx(int ocr_idx) {
		this.ocr_idx = ocr_idx;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getOcr_data() {
		return ocr_data;
	}
	public void setOcr_data(String ocr_data) {
		this.ocr_data = ocr_data;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getReadhit() {
		return readhit;
	}
	public void setReadhit(int readhit) {
		this.readhit = readhit;
	}
	public int getLikehit() {
		return likehit;
	}
	public void setLikehit(int likehit) {
		this.likehit = likehit;
	}
	public int getDel_info() {
		return del_info;
	}
	public void setDel_info(int del_info) {
		this.del_info = del_info;
	}
	public int getSuccess_info() {
		return success_info;
	}
	public void setSuccess_info(int success_info) {
		this.success_info = success_info;
	}
	public int getReply_info() {
		return reply_info;
	}
	public void setReply_info(int reply_info) {
		this.reply_info = reply_info;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	
	
	
	
}
