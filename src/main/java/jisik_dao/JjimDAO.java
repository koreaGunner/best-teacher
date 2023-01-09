package jisik_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jisik_vo.JjimVO;
import service.DBService;

public class JjimDAO {
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static JjimDAO single = null;

	public static JjimDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new JjimDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	//jjim 추가!!!
	public int insert_jjim(int idx, String id) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into jjim_jisik values(seq_jjim_num.nextval, ?, ?)";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setInt(1, idx);
			pstmt.setString(2, id);

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
	
	
	//jjim 삭제!!!!!
	public int delete_jjim(int idx, String id) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from jjim_jisik where jjim_idx=? and jjim_id=?";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setInt(1, idx);
			pstmt.setString(2, id);

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
	
	
	//찜표시를 위한 idx 가져오기!!!!!
	public List<JjimVO> select_JjimIdx(String id) {

		List<JjimVO> list = new ArrayList<JjimVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from jjim_jisik where jjim_id = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JjimVO vo = new JjimVO();
				//현재레코드값=>Vo저장
				vo.setJjim_id(rs.getString("jjim_id"));
				vo.setJjim_idx(rs.getInt("jjim_idx"));
				vo.setJjim_num(rs.getInt("jjim_num"));

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
