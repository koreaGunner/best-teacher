package reference_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jisik_vo.LoginVO;
import service.DBService;

public class MypageDAO {
	// single-ton pattern:
	// 객체1개만생성해서 지속적으로 서비스하자
	static MypageDAO single = null;

	public static MypageDAO getInstance() {
		// 생성되지 않았으면 생성
		if (single == null)
			single = new MypageDAO();
		// 생성된 객체정보를 반환
		return single;
	}

	// 내캐시 출력
	public List<LoginVO> showmycash(String id) {

		List<LoginVO> showmycash = new ArrayList<LoginVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT point FROM user_total"
				+ " WHERE id = ? ";
		
		try {
			// 1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			// 2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			// 3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				LoginVO vo = new LoginVO();
				// 현재레코드값=>Vo저장
				vo.setPoint(rs.getInt("point"));
				
				// ArrayList추가
				showmycash.add(vo);
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

		return showmycash;
	}

}
