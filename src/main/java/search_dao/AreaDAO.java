package search_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import search_vo.AreaVO;
import service.DBService;

public class AreaDAO {
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static AreaDAO single = null;

	public static AreaDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new AreaDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	public List<AreaVO> selectList(String city) {

		List<AreaVO> list = new ArrayList<AreaVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from DATA_AREA where CITY = ?";
		
		AreaVO v = new AreaVO();
		v.setCity(city);
		v.setCountry("전체");
		list.add(v);

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, city);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				AreaVO vo = new AreaVO();
				//현재레코드값=>Vo저장
				vo.setCity(rs.getString("city"));
				vo.setCountry(rs.getString("country"));

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
}
