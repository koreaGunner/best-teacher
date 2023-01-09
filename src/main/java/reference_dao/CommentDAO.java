package reference_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;


public class CommentDAO {
	// single-ton pattern:
	// 객체1개만생성해서 지속적으로 서비스하자
	static CommentDAO single = null;

	public static CommentDAO getInstance() {
		// 생성되지 않았으면 생성
		if (single == null)
			single = new CommentDAO();
		// 생성된 객체정보를 반환
		return single;
	}	
		
				public int insert_comment(int ref_seq, String content, String id, int score) {
					int res = 0;
					Connection conn = null;
					PreparedStatement pstmt = null;
					String sql = "INSERT INTO reference_comment VALUES(COMMENT_SEQ.nextval,?,?,?,?,sysdate)";
					

					try {
						//1.Connection획득
						conn = DBService.getInstance().getConnection();
						//2.명령처리객체 획득
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, ref_seq);
						pstmt.setString(2, content);
						pstmt.setString(3, id);
						pstmt.setInt(4, score);

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
