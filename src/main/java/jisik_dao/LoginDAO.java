package jisik_dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jisik_vo.LoginVO;
import service.DBService;

public class LoginDAO {
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static LoginDAO single = null;

	public static LoginDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new LoginDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	public LoginVO selectOne(String id) {

		LoginVO vo = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT id, pw, nickname FROM USER_TOTAL WHERE ID = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setString(1, id);
			
			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();
			
			//아이디가 없어서 아무것도 조회가 되지 않는다면 vo가 null값이다.
			if (rs.next()) {
				vo = new LoginVO(); //값이 있다면 vo메모리가 생성됨.
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw")); //값이 있다면 결과값인 pw를 가져올 수 있다.
				vo.setNickname(rs.getString("nickname"));
				//결론 : 조회가 잘 됐다면 vo는 null이 아니면서 id,pw,nickname 값 3개를 갖는다.
				//결론 : 조회가 안됐다면 vo값은 null 이다.
			}
			

		} catch (Exception e) {
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

		return vo;
	}
	
	
	public LoginVO kakao_login(String email_addr) {

		LoginVO vo = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT id, pw, nickname FROM USER_TOTAL WHERE kakao_email = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setString(1, email_addr);
			
			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();
			
			//아이디가 없어서 아무것도 조회가 되지 않는다면 vo가 null값이다.
			if (rs.next()) {
				vo = new LoginVO(); //값이 있다면 vo메모리가 생성됨.
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw")); //값이 있다면 결과값인 pw를 가져올 수 있다.
				vo.setNickname(rs.getString("nickname"));
				//결론 : 조회가 잘 됐다면 vo는 null이 아니면서 id,pw,nickname 값 3개를 갖는다.
				//결론 : 조회가 안됐다면 vo값은 null 이다.
			}
			

		} catch (Exception e) {
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

		return vo;
	}
	
	
	public int kakao_email_update(LoginVO vo) {
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "UPDATE USER_TOTAL SET kakao_email = ? WHERE id= ? and pw = ? ";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setString(1, vo.getKakao_email());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getPw());
			
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
