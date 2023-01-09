package user_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import service.DBService;
import user_vo.JoinVO;

public class JoinDAO {
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static JoinDAO single = null;

	public static JoinDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new JoinDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	
//회원가입 시 total 테이블에 insert=============================================================
	public int insert_user_total(JoinVO vo) {
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO USER_TOTAL VALUES (?, ?, ?, ?, ?, ?, '학생', 0,'')";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getNickname());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getEmailaddr());
			
			//4.DB로 전송(res:처리된행수)
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return res;
	}
	
	
//회원가입 시 학생 테이블에 insert ==============================================================
	public int insert_user_student(JoinVO vo) {
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO USER_STUDENT VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, '가능')";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getHope_yn());
			pstmt.setString(3, vo.getGrade());
			pstmt.setString(4, vo.getAddr());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getHope_subject());
			pstmt.setString(7, vo.getHope_time());
			pstmt.setString(8, vo.getHashtag());
			pstmt.setString(9, vo.getIntroduce());
			//4.DB로 전송(res:처리된행수)
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return res;
	}
	
	
//아래부터는 학생 계정 정보수정시 사용되는 class
	public int update_user_total(JoinVO vo) {
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "UPDATE USER_TOTAL SET PW = ?, NAME = ?, PHONE = ? WHERE ID= ?";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setString(1, vo.getPw());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getId());
			
			//4.DB로 전송(res:처리된행수)
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return res;
	}
	
	
//회원가입 시 학생 테이블에 insert ==============================================================
	public int update_user_student(JoinVO vo) {
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "UPDATE USER_STUDENT SET GRADE = ?, ADDR = ?, GENDER = ?, HOPE_SUBJECT = ?, HOPE_TIME = ?, HASHTAG = ?, INTRODUCE = ? WHERE ID = ?";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setString(1, vo.getGrade());
			pstmt.setString(2, vo.getAddr());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getHope_subject());
			pstmt.setString(5, vo.getHope_time());
			pstmt.setString(6, vo.getHashtag());
			pstmt.setString(7, vo.getIntroduce());
			pstmt.setString(8, vo.getId());
			//4.DB로 전송(res:처리된행수)
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return res;
	}
	
}
