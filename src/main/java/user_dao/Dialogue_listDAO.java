package user_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import user_vo.Dialogue_listVO;

public class Dialogue_listDAO {

	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static Dialogue_listDAO single = null;

	public static Dialogue_listDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new Dialogue_listDAO();
		//생성된 객체정보를 반환
		return single;
	}
	public Dialogue_listVO selectOne(String id) {

		Dialogue_listVO selected_id = null;

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
				selected_id = new Dialogue_listVO();
				selected_id.setGubun(rs.getString("gubun"));
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

		return selected_id;
	}
	
	//로그인 된 아이디가 '학생' 인경우 선생님 계정 테이블에서 메시지 상대의 정보를 받아온다.
	public List<Dialogue_listVO> teacher_dial_info(String id) {
		List<Dialogue_listVO> list = new ArrayList<Dialogue_listVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select d.*, u.nickname, ut.profile, ut.area from (select rownum, 'a'||rownum r_row, A.*\r\n"
				+ "from (select * from talk_list where student_id=? and last_send_id != ? and read_info = 0\r\n"
				+ "order by read_info DESC, last_send_date DESC, last_send_time DESC) A\r\n"
				+ "union\r\n"
				+ "select rownum, 'b'||rownum r_row, B.*\r\n"
				+ "from(select * from talk_list where student_id=? and not (last_send_id != ? and read_info = 0)\r\n"
				+ "order by last_send_date DESC, last_send_time DESC ) B\r\n"
				+ "union\r\n"
				+ "select rownum, 'c'||rownum r_row, c.*\r\n"
				+ "from (select * from talk_list where student_id=? and last_send_id is null\r\n"
				+ "order by last_send_date DESC, last_send_time DESC) c) d, user_total u, user_teacher ut\r\n"
				+ "where d.teacher_id = u.id and u.id = ut.id\r\n"
				+ "order by d.r_row";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			pstmt.setString(3, id);
			pstmt.setString(4, id);
			pstmt.setString(5, id);
			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Dialogue_listVO vo = new Dialogue_listVO();
				//현재레코드값=>Vo저장
				vo.setTalk_seq(rs.getInt("talk_seq"));
				vo.setTeacher_id(rs.getString("teacher_id"));
				vo.setStudent_id(rs.getString("student_id"));
				vo.setContent(rs.getString("content"));
				vo.setLast_send_date(rs.getString("last_send_date"));
				vo.setLast_send_time(rs.getString("last_send_time"));
				vo.setRead_info(rs.getInt("read_info"));
				vo.setLast_send_id(rs.getString("last_send_id"));
				vo.setProfile(rs.getString("profile"));
				vo.setAddr(rs.getString("area"));
				vo.setNickname(rs.getString("nickname"));
				
				//ArrayList추가
				list.add(vo);
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
		return list;
	}
	
	
	public List<Dialogue_listVO> wish_teacher_dial_info(String id) {
		List<Dialogue_listVO> wish_list = new ArrayList<Dialogue_listVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select d.*, u.nickname, ut.profile, ut.area from (select rownum, 'a'||rownum r_row, A.* from (select AA.* from talk_list AA, teacher_wishlist BB where AA.student_id=? and AA.last_send_id != ? and AA.read_info = 0 and AA.teacher_id = BB.teacher_id and AA.student_id = BB.student_id order by AA.read_info DESC, AA.last_send_date DESC, AA.last_send_time DESC) A union select rownum, 'b'||rownum r_row, B.* from (select CC.* from talk_list CC, teacher_wishlist DD where CC.student_id=? and not (CC.last_send_id != ? and CC.read_info = 0) and CC.teacher_id = DD.teacher_id and CC.student_id = DD.student_id order by CC.last_send_date DESC, CC.last_send_time DESC ) B union select rownum, 'c'||rownum r_row, c.* from (select EE.* from talk_list EE, teacher_wishlist FF where EE.student_id = ? and EE.last_send_id is null and EE.teacher_id = FF.teacher_id and EE.student_id = FF.student_id order by EE.last_send_date DESC, EE.last_send_time DESC) c) d, user_total u, user_teacher ut where d.teacher_id = u.id and u.id = ut.id order by d.r_row";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, id);
			pstmt.setString(3, id);
			pstmt.setString(4, id);
			pstmt.setString(5, id);
			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Dialogue_listVO vo_w = new Dialogue_listVO();
				//현재레코드값=>Vo저장
				vo_w.setTalk_seq(rs.getInt("talk_seq"));
				vo_w.setTeacher_id(rs.getString("teacher_id"));
				vo_w.setStudent_id(rs.getString("student_id"));
				vo_w.setContent(rs.getString("content"));
				vo_w.setLast_send_date(rs.getString("last_send_date"));
				vo_w.setLast_send_time(rs.getString("last_send_time"));
				vo_w.setRead_info(rs.getInt("read_info"));
				vo_w.setLast_send_id(rs.getString("last_send_id"));
				vo_w.setProfile(rs.getString("profile"));
				vo_w.setAddr(rs.getString("area"));
				vo_w.setNickname(rs.getString("nickname"));
				
				//ArrayList추가
				wish_list.add(vo_w);
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
		return wish_list;
	}
	
	//로그인 된 아이디가 '선생님' 인경우 학생 계정 테이블에서 메시지 상대의 정보를 받아온다.
	public List<Dialogue_listVO> student_dial_info(String id) {
		List<Dialogue_listVO> list = new ArrayList<Dialogue_listVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select d.*, u.nickname, us.addr from (select rownum, 'a'||rownum r_row, A.*\r\n"
				+ "from (select * from talk_list where teacher_id=? and last_send_id != ? and read_info = 0\r\n"
				+ "order by read_info DESC, last_send_date DESC, last_send_time DESC) A\r\n"
				+ "union\r\n"
				+ "select rownum, 'b'||rownum r_row, B.*\r\n"
				+ "from(select * from talk_list where teacher_id=? and not (last_send_id != ? and read_info = 0)\r\n"
				+ "order by last_send_date DESC, last_send_time DESC ) B\r\n"
				+ "union\r\n"
				+ "select rownum, 'c'||rownum r_row, c.*\r\n"
				+ "from (select * from talk_list where teacher_id=? and last_send_id is null\r\n"
				+ "order by last_send_date DESC, last_send_time DESC) c) d, user_total u, user_student us\r\n"
				+ "where d.student_id = u.id and u.id = us.id\r\n"
				+ "order by d.r_row";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			pstmt.setString(3, id);
			pstmt.setString(4, id);
			pstmt.setString(5, id);
			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Dialogue_listVO vo = new Dialogue_listVO();
				//현재레코드값=>Vo저장
				vo.setTalk_seq(rs.getInt("talk_seq"));
				vo.setTeacher_id(rs.getString("teacher_id"));
				vo.setStudent_id(rs.getString("student_id"));
				vo.setContent(rs.getString("content"));
				vo.setLast_send_date(rs.getString("last_send_date"));
				vo.setLast_send_time(rs.getString("last_send_time"));
				vo.setRead_info(rs.getInt("read_info"));
				vo.setLast_send_id(rs.getString("last_send_id"));
				vo.setProfile("img/account.png");
				vo.setAddr(rs.getString("addr"));
				vo.setNickname(rs.getString("nickname"));
				
				//ArrayList추가
				list.add(vo);
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
		return list;
	}
	

	public int msg_delete(int talk_seq) {
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "{call TALK_DELETE_PROC(?) }";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setInt(1, talk_seq);

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
				e.printStackTrace();
			}
		}
		return res;
	}
	
	
	
	
//마이페이지에 찜한 선생 정보 받아오기
	public List<Dialogue_listVO> wish_teacher_info(String id) {
		List<Dialogue_listVO> wish_teacher_list = new ArrayList<Dialogue_listVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT DISTINCT B.id, B.nickname, C.profile, C.addr, C.subject FROM USER_TOTAL B, USER_TEACHER C, TEACHER_WISHLIST D WHERE D.student_id = ? and  D.TEACHER_ID = B.ID AND D.TEACHER_ID = C.ID";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Dialogue_listVO vo_w = new Dialogue_listVO();
				//현재레코드값=>Vo저장
				vo_w.setId(rs.getString("id"));
				vo_w.setProfile(rs.getString("profile"));
				vo_w.setAddr(rs.getString("addr"));
				vo_w.setNickname(rs.getString("nickname"));
				vo_w.setSubject(rs.getString("subject"));
				
				//ArrayList추가
				wish_teacher_list.add(vo_w);
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
		return wish_teacher_list;
	}
}
