package user_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import service.DBService;
import user_vo.NICKNAME_checkVO;

public class NICKNAME_checkDAO {
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static NICKNAME_checkDAO single = null;

	public static NICKNAME_checkDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new NICKNAME_checkDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	
	public NICKNAME_checkVO selectOne(String nickname) {

		NICKNAME_checkVO vo = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT nickname FROM USER_TOTAL WHERE nickname=?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setString(1, nickname);
			
			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new NICKNAME_checkVO();
				vo.setNickname(rs.getString("nickname"));
				//현재레코드값=>Vo저장

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
				e.printStackTrace();
			}
		}

		return vo;
	}

}
