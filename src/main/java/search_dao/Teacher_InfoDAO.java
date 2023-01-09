package search_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import search_vo.Teacher_ReviewVO;
import search_vo.Teacher_SearchVO;
import search_vo.Teacher_VideoVO;
import service.DBService;

public class Teacher_InfoDAO {

	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static Teacher_InfoDAO single = null;

	public static Teacher_InfoDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new Teacher_InfoDAO();
		//생성된 객체정보를 반환
		return single;
	}

	public List<Teacher_SearchVO> info_profile(String id) {

		List<Teacher_SearchVO> list = new ArrayList<Teacher_SearchVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from Teacher_Search where id = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Teacher_SearchVO vo = new Teacher_SearchVO();
				//현재레코드값=>Vo저장
				vo.setId(rs.getString("id"));
				vo.setNickname(rs.getString("nickname"));
				vo.setIntroduce(rs.getString("introduce"));
				vo.setProfile(rs.getString("profile"));
				vo.setGender(rs.getString("gender"));
				vo.setSubject(rs.getString("subject"));
				vo.setArea(rs.getString("area"));
				vo.setHashtag(rs.getString("hashtag"));
				vo.setMbti(rs.getString("mbti"));
				vo.setMyn("비대면 " + rs.getString("myn"));

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

	public List<Teacher_VideoVO> info_video(String id) {

		List<Teacher_VideoVO> list = new ArrayList<Teacher_VideoVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from TEACHER_VIDEO where id = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Teacher_VideoVO vo = new Teacher_VideoVO();
				//현재레코드값=>Vo저장

				vo.setTitle(rs.getString("title"));

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

	public List<Teacher_ReviewVO> info_review(String id) {

		List<Teacher_ReviewVO> list = new ArrayList<Teacher_ReviewVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from TEACHER_REVIEW tr, user_total ut WHERE tr.student_id = ut.id AND tr.teacher_id = ? order by write_date DESC";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Teacher_ReviewVO vo = new Teacher_ReviewVO();
				//현재레코드값=>Vo저장
				vo.setJumsu(rs.getInt("jumsu"));
				vo.setReview(rs.getString("review"));
				vo.setStudent_nickname(rs.getString("nickname"));
				vo.setWrite_date(rs.getString("write_date"));

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

	public int w_check(String t_id, String s_id) {

		int check = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from teacher_wishlist where teacher_id = ? and student_id = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t_id);
			pstmt.setString(2, s_id);

			//3.pstmt parameter 설정

			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			if (rs.next()) {							
				check = 1;
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

		return check;
	}

	public int w_insert(String t_id, String s_id) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into teacher_wishlist VALUES (TEACHER_WISHLIST_SEQ.nextval, ?, ?)";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t_id);
			pstmt.setString(2, s_id);

			//3.pstmt parameter 채우기

			//4.DB로 전송(res:처리된행수)
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return res;
	}

	public String avg_jumsu(String t_id) {

		int sum = 0;
		int num = 0;
		String avg_jumsu = "";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select jumsu from TEACHER_REVIEW where TEACHER_ID = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setString(1, t_id);

			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				sum += rs.getInt("jumsu");
				num++;
			}

			if(sum == 0) {
				avg_jumsu = "null";
			}
			else {
				avg_jumsu = String.format("%.1f", (float)sum/num);
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

		return avg_jumsu;
	}

	public int insert_review(String t_id, String s_id, int jumsu, String review) {
		// TODO Auto-generated method stub
		int res = 0;

		LocalDate temp_date = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String date = temp_date.format(formatter);

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into TEACHER_REVIEW values(TEACHER_REVIEW_SEQ.nextval, ?, ?, ?, ?, ?)";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setString(1, t_id);
			pstmt.setString(2, s_id);
			pstmt.setInt(3, jumsu);
			pstmt.setString(4, review);
			pstmt.setString(5, date);

			//4.DB로 전송(res:처리된행수)
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return res;
	}
	
	
	

	public int r_check(String t_id, String s_id) {

		int r_check = -1;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from TEACHER_REVIEW_AUTH where TEACHER_ID = ? and STUDENT_ID = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setString(1, t_id);
			pstmt.setString(2, s_id);

			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				r_check = rs.getInt("REVIEW_INFO");
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

		return r_check;
	}

	//후기 작성하면 review_info 1로 업데이트
	public int r_update(String t_id, String s_id) {

		int r_update = -1;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update TEACHER_REVIEW_AUTH set REVIEW_INFO = 1 where TEACHER_ID = ? and STUDENT_ID = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setString(1, t_id);
			pstmt.setString(2, s_id);

			//4.결과행 처리객체 얻어오기
			r_update = pstmt.executeUpdate();

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

		return r_update;
	}





	public int w_delete(String t_id, String s_id) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from teacher_wishlist where teacher_id = ? and student_id = ?";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t_id);
			pstmt.setString(2, s_id);

			//3.pstmt parameter 채우기

			//4.DB로 전송(res:처리된행수)
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return res;
	}



}
