package user_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import service.DBService;
import user_vo.ID_checkVO;

public class ID_checkDAO {
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static ID_checkDAO single = null;

	public static ID_checkDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new ID_checkDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	
	public ID_checkVO selectOne(String id) {

		ID_checkVO vo = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT id FROM USER_TOTAL WHERE ID=?";

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
				vo = new ID_checkVO();
				vo.setId(rs.getString("id"));
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
