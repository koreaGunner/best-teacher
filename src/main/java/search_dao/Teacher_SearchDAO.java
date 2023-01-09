package search_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import search_vo.Teacher_SearchVO;
import service.DBService;

public class Teacher_SearchDAO {
	
	static String finalSql = "";
	
	static ArrayList<String> subjectSelect = new ArrayList<String>();	// 과목
	static ArrayList<String> areaSelect = new ArrayList<String>();		// 지역
	static ArrayList<String> meetSelect = new ArrayList<String>();		// 비대면가능여부
	static ArrayList<String> genderSelect = new ArrayList<String>();	// 성별
	static ArrayList<String> mbtiSelect = new ArrayList<String>();		// MBTI
	static ArrayList<String> hashTagSelect = new ArrayList<String>();	// 해시태그
	
	static String subjects = "";
	static String areas = "";
	static String myns = "";
	static String genders = "";
	static String mbtis = "";
	static String hashtags = "";
	
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static Teacher_SearchDAO single = null;

	public static Teacher_SearchDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new Teacher_SearchDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	

	
	public ArrayList<String> subject(ArrayList<String> list) {		
		subjectSelect = list;
		return subjectSelect;
	}
	
	public ArrayList<String> area(ArrayList<String> list) {		
		areaSelect = list;
		return areaSelect;
	}
		
	public ArrayList<String> myn(ArrayList<String> list) {		
		meetSelect = list;
		return meetSelect;
	}
	
	public ArrayList<String> gender(ArrayList<String> list) {		
		genderSelect = list;
		return genderSelect;
	}
	
	public ArrayList<String> mbti(ArrayList<String> list) {		
		mbtiSelect = list;
		return mbtiSelect;
	}
	
	public ArrayList<String> hashtag(ArrayList<String> list) {		
		hashTagSelect = list;
		return hashTagSelect;
	}
	
	public String subjects(String subject) {
		subjects = "";
		subjects += subject;
		return subjects;
	}
	
	public String areas(String area) {
		areas = "";
		areas += area;
		return areas;
	}
	
	public String myns(String myn) {
		myns = "";
		myns += myn;
		return myns;
	}
	
	public String genders(String gender) {
		genders = "";
		genders += gender;
		return genders;
	}
	
	public String mbtis(String mbti) {
		mbtis = "";
		mbtis += mbti;
		return mbtis;
	}
	
	public String hashtags(String hashtag) {
		hashtags = "";
		hashtags += hashtag;
		return hashtags;
	}
	
	public String subject() {
		return subjects;
	}
	
	public String area() {
		return areas;
	}
	
	public String myn() {
		return myns;
	}
	
	public String gender() {
		return genders;
	}
	
	public String mbti() {
		return mbtis;
	}
	
	public String hashtag() {
		return hashtags;
	}
	
	public List<Teacher_SearchVO> selectList() {

		List<Teacher_SearchVO> list = new ArrayList<Teacher_SearchVO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder finalQ = new StringBuilder();
		finalQ.append("select * from TEACHER_SEARCH WHERE ");

		if(!subjectSelect.isEmpty()) { // ArrayList가 비어있지 않다면
			finalQ.append("(");
			for(int i = 0; i < subjectSelect.size(); i++) {
				finalQ.append("subject LIKE '%").append(subjectSelect.get(i)).append("%' OR "); // 과목끼리는 OR 추가
				if(i == subjectSelect.size()-1) {	// 마지막 과목이라면
					finalQ.delete(finalQ.length()-3, finalQ.length());	// OR 빼고 저장	
				}
			}
		}
		else {	// ArrayList가 비어있으면
			finalQ.append("(subject LIKE '%%'");	// 빈값 넣기
		}

		finalQ.append(") AND ");	// 다음 과목으로 넘어갈 때는 AND 추가


		if(!areaSelect.isEmpty()) {
			finalQ.append("(");
			for(int i = 0; i < areaSelect.size(); i++) {
				finalQ.append("area LIKE '%").append(areaSelect.get(i)).append("%' OR ");
				if(i == areaSelect.size()-1) {
					finalQ.delete(finalQ.length()-3, finalQ.length());
				}
			}
		}
		else {
			finalQ.append("(area LIKE '%%'");
		}

		finalQ.append(") AND ");

		if(!meetSelect.isEmpty()) {
			finalQ.append("(");
			for(int i = 0; i < meetSelect.size(); i++) {
				finalQ.append("myn = '").append(meetSelect.get(i)).append("' OR ");
				if(i == meetSelect.size()-1) {
					finalQ.delete(finalQ.length()-3, finalQ.length());
				}
			}
		}
		else {
			finalQ.append("(myn LIKE '%%'");
		}

		finalQ.append(") AND ");

		if(!genderSelect.isEmpty()) {
			finalQ.append("(");
			for(int i = 0; i < genderSelect.size(); i++) {
				finalQ.append("gender = '").append(genderSelect.get(i)).append("' OR ");
				if(i == genderSelect.size()-1) {
					finalQ.delete(finalQ.length()-3, finalQ.length());
				}
			}
		}
		else {
			finalQ.append("(gender LIKE '%%'");
		}

		finalQ.append(") AND ");

		if(!mbtiSelect.isEmpty()) {
			finalQ.append("(");
			for(int i = 0; i < mbtiSelect.size(); i++) {
				finalQ.append("MBTI = '").append(mbtiSelect.get(i)).append("' OR ");
				if(i == mbtiSelect.size()-1) {
					finalQ.delete(finalQ.length()-3, finalQ.length());
				}
			}
		}
		else {
			finalQ.append("(MBTI LIKE '%%'");
		}

		finalQ.append(") AND ");

		if(!hashTagSelect.isEmpty()) {
			finalQ.append("(");
			for(int i = 0; i < hashTagSelect.size(); i++) {
				finalQ.append("hashtag LIKE '%").append(hashTagSelect.get(i)).append("%' OR ");
				if(i == hashTagSelect.size()-1) {
					finalQ.delete(finalQ.length()-3, finalQ.length());
				}
			}
		}
		else {
			finalQ.append("(hashtag LIKE '%%'");
		}

		finalQ.append(")");
		finalSql = finalQ.toString();
		
		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
						
			pstmt = conn.prepareStatement(finalSql);
			
			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Teacher_SearchVO vo = new Teacher_SearchVO();
				//현재레코드값=>Vo저장
				vo.setId(rs.getString("id"));
				vo.setBadge1(rs.getString("badge1"));
				vo.setBadge2(rs.getString("badge2"));
				vo.setBadge3(rs.getString("badge3"));
				vo.setNickname(rs.getString("nickname"));
				vo.setGender(rs.getString("gender"));
				vo.setSubject(rs.getString("subject"));
				vo.setArea(rs.getString("area"));
				vo.setHashtag(rs.getString("hashtag"));
				vo.setMbti(rs.getString("mbti"));
				vo.setMyn("비대면 " + rs.getString("myn"));
				vo.setProfile(rs.getString("profile"));
				
//				System.out.println(rs.getString("id"));
//				String title = video_selectOne(rs.getString("id"));
//				vo.setTitle(title);

				//ArrayList추가
				list.add(vo);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}
	
	public List<Teacher_SearchVO> first() {
		
		subjectSelect.clear(); 
		areaSelect.clear(); 
		meetSelect.clear(); 
		genderSelect.clear(); 
		mbtiSelect.clear(); 
		hashTagSelect.clear(); 
		
		subjects = "";
		areas = "";
		myns = "";
		genders = "";
		mbtis = "";
		hashtags = "";

		List<Teacher_SearchVO> list = new ArrayList<Teacher_SearchVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from TEACHER_SEARCH";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Teacher_SearchVO vo = new Teacher_SearchVO();
				//현재레코드값=>Vo저장
				vo.setId(rs.getString("id"));
				vo.setBadge1(rs.getString("badge1"));
				vo.setBadge2(rs.getString("badge2"));
				vo.setBadge3(rs.getString("badge3"));
				vo.setNickname(rs.getString("nickname"));
				vo.setGender(rs.getString("gender"));
				vo.setSubject(rs.getString("subject"));
				vo.setArea(rs.getString("area"));
				vo.setHashtag(rs.getString("hashtag"));
				vo.setMbti(rs.getString("mbti"));
				vo.setMyn("비대면 " + rs.getString("myn"));
//				System.out.println(rs.getString("id"));
//				String title = video_selectOne(rs.getString("id"));
//				vo.setTitle(title);
//				System.out.println(title);

				//ArrayList추가
				list.add(vo);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}
	
	
	
	public String video_selectOne(String id) {

//		String vo = null;
		String title="";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select title"
				+ " from teacher_video"
				+ " where video_seq = (select min(video_seq) from teacher_video where id=?)";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setString(1, id);

			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			if (rs.next()) {
//				vo = new String();
				//현재레코드값=>Vo저장
				title = rs.getString("title");
				
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return title;
	}
	
	
	
}
