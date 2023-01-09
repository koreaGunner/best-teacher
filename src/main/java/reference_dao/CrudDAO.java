package reference_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import reference_vo.InsertVO;
import service.DBService;

public class CrudDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static CrudDAO single = null;
	
	public static CrudDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new CrudDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
		// 글쓰기 (insert)
		public int insert(InsertVO vo) {
			// TODO Auto-generated method stub
			int res = 0;

			Connection conn = null;
			PreparedStatement pstmt = null;

			String sql = "INSERT INTO reference_data"
					+ " VALUES (ref_seq.nextval, ?, ?, ?, ?, 0, ?, 0, ?, ?, ?, ? )";
			try {
				//1.Connection획득
				conn = DBService.getInstance().getConnection();
				//2.명령처리객체 획득
				pstmt = conn.prepareStatement(sql);

				//3.pstmt parameter 채우기
				pstmt.setString(1, vo.getTitle());
				pstmt.setString(2, vo.getId());
				pstmt.setString(3, vo.getContent_main());
				pstmt.setString(4, vo.getRef_route());
				pstmt.setInt(5, vo.getContent_price());
				pstmt.setString(6, vo.getSubject_middle());
				pstmt.setString(7, vo.getSubject_bottom());
				pstmt.setString(8, vo.getContent());
				pstmt.setLong(9, vo.getFileSize());
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
		
		
		
		
		//delete
		public int delete(int ref_seq) {
			// TODO Auto-generated method stub
			int res = 0;

			Connection conn = null;
			PreparedStatement pstmt = null;

			String sql = "DELETE FROM reference_data WHERE ref_seq=?";

			try {
				//1.Connection획득
				conn = DBService.getInstance().getConnection();
				//2.명령처리객체 획득
				pstmt = conn.prepareStatement(sql);
				//3.pstmt parameter 채우기
				pstmt.setInt(1, ref_seq);
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
