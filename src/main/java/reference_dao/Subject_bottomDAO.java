package reference_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import reference_vo.ContentVO;
import service.DBService;



public class Subject_bottomDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static Subject_bottomDAO single = null;
	
	public static Subject_bottomDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new Subject_bottomDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	//소과목 해당 리스트 거르기
	
	public List<ContentVO> selectList_subject_bottom_content(String subject_bottom){
		List<ContentVO> list_content = new ArrayList<ContentVO>();
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		
		String sql1 = "SELECT d.ref_seq,d.ref_route,d.id, u.nickname, d.title, d.content_price, d.download_cnt, d.content, d.filesize"
				+ " FROM reference_data d, reference_comment c, user_total u" 
				+ " WHERE u.id=d.id AND d.subject_bottom=?"
				+ " GROUP BY d.id, u.nickname, d.title, d.content_price, d.download_cnt, d.ref_seq, d.ref_route, d.content, d.filesize";
		
				
		try {
			// 1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
		
			
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setString(1, subject_bottom);
			rs1 = pstmt1.executeQuery();
			
			
			while (rs1.next()) {
				ContentVO vo = new ContentVO();
				// 현재레코드값=>Vo저장
				vo.setRef_seq(rs1.getInt("ref_seq"));
				vo.setRef_route(rs1.getString("ref_route"));
				vo.setId(rs1.getString("id"));
				vo.setNickname(rs1.getString("nickname"));
				vo.setTitle(rs1.getString("title"));
				vo.setContent_price(rs1.getInt("content_price"));
				vo.setDownload_cnt(rs1.getInt("download_cnt"));
				vo.setContent(rs1.getString("content"));
				vo.setFileSize(rs1.getLong("fileSize"));
				
				int ref_seq = rs1.getInt("ref_seq");
				//System.out.println(ref_seq);
				
				String sql2 =  "SELECT NVL( round(avg(regist_score),1) , 0 ) avg_score  FROM reference_comment where ref_seq = ?";
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setInt(1, ref_seq);
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next()) {
					//평균점수 따로 뽑아오기
					vo.setAvg_score(rs2.getDouble("avg_score"));
				}
				rs2.close();
				pstmt2.close();
				// ArrayList추가
				list_content.add(vo);
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (rs1 != null)
					rs1.close();
				if (pstmt1 != null)
					pstmt1.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list_content;
	}

	
	//subjectbottom 항목들 pick해오기
		 @SuppressWarnings("unchecked")
		   public JSONArray selectList_subject_bottom(String subject_middle) {
			 	//System.out.println(subject_middle);
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      String sql = "SELECT subject_bottom FROM subject_2 WHERE subject_middle = ?";
		      JSONArray subject_bottom = new JSONArray();
		     
		      try {
		         //1.Connection얻어온다
		         conn = DBService.getInstance().getConnection();
		         
		         //2.명령처리객체정보를 얻어오기
		         pstmt = conn.prepareStatement(sql);
		         
		         // 처리할 도시이름 처리
		         pstmt.setString(1, subject_middle);

		         //3.결과행 처리객체 얻어오기
		         rs = pstmt.executeQuery();
		         
		         while (rs.next()) {
		            JSONObject obj = new JSONObject();
		            obj.put("subject_bottom",rs.getString("subject_bottom"));
		            subject_bottom.add(obj);
		            //System.out.println(rs.getString("subject_bottom"));
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

		      return subject_bottom;
		   }

		 
	
	
	
	
}
