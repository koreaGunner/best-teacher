package jisik_vo;

public class JisikReplyVO {
	private int reply_idx, idx, likehit, del_info, ref, replynum;
	private String regidate, content, reorder, id, grade, gubun;
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	private String nickname;
	
	//컬럼에 없음
	private String baseNickname;
	private int reOrderLength;
	
	private int reply_like_check;
	
	
	
	
	public int getReply_like_check() {
		return reply_like_check;
	}
	public void setReply_like_check(int reply_like_check) {
		this.reply_like_check = reply_like_check;
	}
	public int getReOrderLength() {
		return reOrderLength;
	}
	public void setReOrderLength(int reOrderLength) {
		this.reOrderLength = reOrderLength;
	}
	public String getBaseNickname() {
		return baseNickname;
	}
	public void setBaseNickname(String baseNickname) {
		this.baseNickname = baseNickname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReorder() {
		return reorder;
	}
	public void setReorder(String reorder) {
		this.reorder = reorder;
	}
	
	

}
