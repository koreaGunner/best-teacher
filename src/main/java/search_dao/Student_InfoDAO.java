package search_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import search_vo.Student_SearchVO;
import service.DBService;

public class Student_InfoDAO {
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static Student_InfoDAO single = null;

	public static Student_InfoDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new Student_InfoDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	public List<Student_SearchVO> info(String id) {

		List<Student_SearchVO> list = new ArrayList<Student_SearchVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from Student_Search where id = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Student_SearchVO vo = new Student_SearchVO();
				//현재레코드값=>Vo저장
				vo.setId(rs.getString("id"));
				vo.setNickname(rs.getString("nickname"));
				vo.setIntroduce(rs.getString("introduce"));
				vo.setGender(rs.getString("gender"));
				vo.setSubject(rs.getString("subject"));
				vo.setAddr(rs.getString("addr"));
				vo.setGrade(rs.getString("grade"));
				vo.setHashtag(rs.getString("hashtag"));
				vo.setMyn("비대면 " + rs.getString("myn"));
				vo.setHyn(rs.getString("hyn"));

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
