package user_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import service.DBService;

public class Select_areaDAO {
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static Select_areaDAO single = null;

	public static Select_areaDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new Select_areaDAO();
		//생성된 객체정보를 반환
		return single;
	}

	
	@SuppressWarnings("unchecked")
	public JSONArray selectList(String city) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT city, country FROM DATA_AREA WHERE CITY=?";
		JSONArray arealist = new JSONArray();

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.결과행 처리객체 얻어오기
			pstmt.setString(1, city);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JSONObject obj = new JSONObject();
				
				obj.put("city",rs.getString("city"));
				obj.put("country",rs.getString("country"));
				arealist.add(obj);
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
		return arealist;
	}
}
