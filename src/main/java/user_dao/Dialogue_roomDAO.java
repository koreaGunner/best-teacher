package user_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import user_vo.Dialogue_roomVO;

public class Dialogue_roomDAO {
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static Dialogue_roomDAO single = null;

	public static Dialogue_roomDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new Dialogue_roomDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	
	public Dialogue_roomVO login_id_select(String id) {

		Dialogue_roomVO login_id = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT gubun FROM USER_TOTAL WHERE ID=?";

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
				login_id = new Dialogue_roomVO();
				login_id.setGubun(rs.getString("gubun"));
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

		return login_id;
	}
	
	
//===============================================================================================================================================	
	// 로그인한 아이디가 '선생님' 인 경우 메시지 상대인 학생의 정보를 받아온다.
	public Dialogue_roomVO student_info(int talk_seq) {

		Dialogue_roomVO opponent_info = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT C.talk_seq,A.id, A.nickname, A.gubun, B.addr, B.hope_subject FROM USER_TOTAL A, USER_STUDENT B, TALK_LIST C WHERE A.ID= c.student_id  AND B.ID = c.student_id AND C.TALK_SEQ = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setInt(1, talk_seq);

			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				opponent_info = new Dialogue_roomVO();
				//현재레코드값=>Vo저장
				opponent_info.setTalk_seq(rs.getInt("talk_seq"));
				opponent_info.setNickname(rs.getString("nickname"));
				opponent_info.setGubun(rs.getString("gubun"));
				opponent_info.setAddr(rs.getString("addr"));
				opponent_info.setSubject(rs.getString("hope_subject"));
				opponent_info.setStudent_id(rs.getString("id"));

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

		return opponent_info;
	}
	
	public List<Dialogue_roomVO> teacher_msg_select(int talk_seq) {

		List<Dialogue_roomVO> msg_content_list = new ArrayList<Dialogue_roomVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT C.*, A.nickname, A.gubun, B.addr, B.hope_subject FROM USER_TOTAL A, USER_STUDENT B, TALK_CONTENT C WHERE A.ID= c.student_id  AND B.ID = c.student_id AND C.TALK_SEQ = ? ORDER BY MSG_SEQ ASC";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, talk_seq);
			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Dialogue_roomVO vo = new Dialogue_roomVO();
				//현재레코드값=>Vo저장
				
				vo.setMsg_seq(rs.getInt("msg_seq"));
				vo.setTalk_seq(rs.getInt("talk_seq"));
				vo.setTeacher_id(rs.getString("teacher_id"));
				vo.setStudent_id(rs.getString("student_id"));
				vo.setYour_id(rs.getString("student_id"));
				vo.setContent(rs.getString("content"));
				vo.setSend_date(rs.getString("send_date"));
				vo.setSend_time(rs.getString("send_time"));
				vo.setRead_info(rs.getInt("read_info"));
				vo.setSend_id(rs.getString("send_id"));
				vo.setNickname(rs.getString("nickname"));
				vo.setGubun(rs.getString("gubun"));
				vo.setAddr(rs.getString("addr"));
				vo.setSubject(rs.getString("hope_subject"));
				
				
				//ArrayList추가
				msg_content_list.add(vo);
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return msg_content_list;
	}
	
//======================================================================================================================================================
	// 로그인한 아이디가 '학생' 인 경우 메시지 상대인 선생님의 정보를 받아온다.
	public Dialogue_roomVO teacher_info(int talk_seq) {

		Dialogue_roomVO opponent_info = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT C.talk_seq, A.id, A.nickname, A.gubun, B.addr, B.subject FROM USER_TOTAL A, USER_TEACHER B, TALK_LIST C WHERE A.ID= c.teacher_id  AND B.ID = c.teacher_id AND C.TALK_SEQ = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setInt(1, talk_seq);
			
			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				opponent_info = new Dialogue_roomVO();
				//현재레코드값=>Vo저장
				opponent_info.setTalk_seq(rs.getInt("talk_seq"));
				opponent_info.setNickname(rs.getString("nickname"));
				opponent_info.setGubun(rs.getString("gubun"));
				opponent_info.setAddr(rs.getString("addr"));
				opponent_info.setSubject(rs.getString("subject"));
				opponent_info.setTeacher_id(rs.getString("id"));
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

		return opponent_info;
	}
	
	
	public List<Dialogue_roomVO> student_msg_select(int talk_seq) {

		List<Dialogue_roomVO> msg_content_list = new ArrayList<Dialogue_roomVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT C.*, A.nickname, A.gubun, B.addr, B.subject FROM USER_TOTAL A, USER_TEACHER B, TALK_CONTENT C WHERE A.ID= c.teacher_id  AND B.ID = c.teacher_id AND C.TALK_SEQ = ? ORDER BY MSG_SEQ ASC";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, talk_seq);
			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();
				while (rs.next()) {
				Dialogue_roomVO vo = new Dialogue_roomVO();
				//현재레코드값=>Vo저장
				
				vo.setMsg_seq(rs.getInt("msg_seq"));
				vo.setTalk_seq(rs.getInt("talk_seq"));
				vo.setTeacher_id(rs.getString("teacher_id"));
				vo.setYour_id(rs.getString("teacher_id"));
				vo.setStudent_id(rs.getString("student_id"));
				vo.setContent(rs.getString("content"));
				vo.setSend_date(rs.getString("send_date"));
				vo.setSend_time(rs.getString("send_time"));
				vo.setRead_info(rs.getInt("read_info"));
				vo.setSend_id(rs.getString("send_id"));
				vo.setNickname(rs.getString("nickname"));
				vo.setGubun(rs.getString("gubun"));
				vo.setAddr(rs.getString("addr"));
				vo.setSubject(rs.getString("subject"));
				
				//ArrayList추가
				msg_content_list.add(vo);
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return msg_content_list;
	}
	
//====================================================================================================================================================
	
	public int msg_insert(Dialogue_roomVO vo) {
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO TALK_CONTENT VALUES (TALK_CONTENT_SEQ.nextVal, ?, (SELECT TEACHER_ID FROM TALK_LIST WHERE TALK_SEQ = ?), (SELECT STUDENT_ID FROM TALK_LIST WHERE TALK_SEQ = ?), ?, ?, ?, 0, ?)";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setInt(1, vo.getTalk_seq());
			pstmt.setInt(2, vo.getTalk_seq());
			pstmt.setInt(3, vo.getTalk_seq());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getSend_date());
			pstmt.setString(6, vo.getSend_time());
			pstmt.setString(7, vo.getSend_id());

			//4.DB로 전송(res:처리된행수)
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				return 0;
			}
		}
		System.out.println("이번엔 : " + res);
		return res;
	}
	
	
	
	public int msg_update(int talk_seq, String login_id) {
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "UPDATE TALK_CONTENT SET READ_INFO = -1 WHERE TALK_SEQ = ? and NOT SEND_ID = ?";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setInt(1, talk_seq);
			pstmt.setString(2, login_id);

			//4.DB로 전송(res:처리된행수)
			res = pstmt.executeUpdate();

		} catch (Exception e) {
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
	
	
	
	public int review_select(String teacher_id, String student_id) {

		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT REVIEW_AUTH_SEQ FROM TEACHER_REVIEW_AUTH WHERE TEACHER_ID = ? AND STUDENT_ID = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정

			pstmt.setString(1, teacher_id);
			pstmt.setString(2, student_id);
			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				res = rs.getInt("REVIEW_AUTH_SEQ");
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
		return res;
	}
	
	//학생에게 후기 권한주기
	public int review_insert(String teacher_id, String student_id) {
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO TEACHER_REVIEW_AUTH VALUES (REVIEW_AUTH_SEQ.nextVal, ?, ?, 0)";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기

			pstmt.setString(1, teacher_id);
			pstmt.setString(2, student_id);
			
			//4.DB로 전송(res:처리된행수)
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return res;
	}
	
	
	
	//후기 작성 했는지 안했는지 확인!!
	public int review_infoSelect(String teacher_id, String student_id) {

//		int vo = null;
		int review_info = -1;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT REVIEW_info FROM TEACHER_REVIEW_AUTH WHERE TEACHER_ID = ? AND STUDENT_ID = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setString(1, teacher_id);
			pstmt.setString(2, student_id);

			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			if (rs.next()) {
//				vo = new int();
				//현재레코드값=>Vo저장
				review_info = rs.getInt("review_info");

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

		return review_info;
	}
}
