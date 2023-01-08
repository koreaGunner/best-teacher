package jisik_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jisik_vo.JisikTableVO;
import service.DBService;

public class JisikTableDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static JisikTableDAO single = null;

	public static JisikTableDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new JisikTableDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	
	//지식테이블 전체 조회!!
	public List<JisikTableVO> selectList() {

		List<JisikTableVO> list = new ArrayList<JisikTableVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select u.nickname, j.*"
				+ " from user_total u, jisiktable j"
				+ " where u.id = j.id order by j.idx DESC";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JisikTableVO vo = new JisikTableVO();
				//현재레코드값=>Vo저장
				vo.setIdx(rs.getInt("idx"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadhit(rs.getInt("readhit"));
				vo.setLikehit(rs.getInt("likehit"));
				vo.setDel_info(rs.getInt("del_info"));
				vo.setSuccess_info(rs.getInt("success_info"));
				vo.setReply_info(rs.getInt("reply_info"));
				vo.setNickname(rs.getString("nickname"));
				vo.setRegidate(rs.getString("regidate"));
				vo.setId(rs.getString("id"));
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
	
	
	
	
	//지식테이블 추가!!!
	public int insert(JisikTableVO vo) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into jisiktable values(seq_jisik_idx.nextVal, ?, sysdate, ?, 0, 0, 0, 0, 0, ?)";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setString(1, vo.getSubject());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getId());

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
	
	
	//ocr데이터를 위한 idx 가져오기!!!!
	public int selectOne() {

		int idx = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select max(idx) max "
				+ "from jisiktable";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정

			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				idx = rs.getInt("max");

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

		return idx;
	}
	
	
	
	
	
	
	//ocr데이터 추가!!!!
	public int insertOCR(JisikTableVO vo) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into ocr values(seq_ocr_idx.nextVal,?,?,?)";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setInt(1, vo.getIdx());
			pstmt.setString(2, vo.getFilename());
			pstmt.setString(3, vo.getOcr_data());

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
	
	
	//view에 해당하는 리스트 뽑기!!!!!
	public JisikTableVO selectOne(int idx) {

		JisikTableVO vo = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select j.*, u.nickname, u.gubun "
				+ "from jisiktable j, user_total u "
				+ "where j.id = u.id and j.idx = "+idx;

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정

			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new JisikTableVO();
				//현재레코드값=>Vo저장
				vo.setIdx(rs.getInt("idx"));
				vo.setSubject(rs.getString("subject"));
				vo.setRegidate(rs.getString("regidate"));
				vo.setContent(rs.getString("content"));
				vo.setReply_info(rs.getInt("reply_info"));
				vo.setNickname(rs.getString("nickname"));
				vo.setId(rs.getString("id"));
				vo.setLikehit(rs.getInt("likehit"));
				vo.setReadhit(rs.getInt("readhit"));
				vo.setGubun(rs.getString("gubun"));
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

		return vo;
	}
	
	
	//뷰를 위한 클릭시 조회수 업데이트!!!!!!
	public int updateReadhit(int idx) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update jisiktable set readhit = readhit + 1 where idx=" + idx;

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

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
	
	
	//댓글 달렸을때 원본글 댓글 갯수 업데이트!!!!!
	public int updateReplyInfo(int idx) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update jisiktable set reply_info = reply_info + 1 where idx="+idx;

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

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
	
	
	
	//검색어로 검색한 리스트 뿌리기!!!!
	public List<JisikTableVO> searchTextselectList( String search_content ) {

		List<JisikTableVO> list = new ArrayList<JisikTableVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select j.*, u.nickname"
				+ " from jisiktable j, ocr o, user_total u"
				+ " where j.idx = o.idx and j.id = u.id and (j.content like '%'||?||'%' or o.ocr_data like '%'||?||'%')"
				+ " order by j.idx DESC";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, search_content);
			pstmt.setString(2, search_content);
			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JisikTableVO vo = new JisikTableVO();
				//현재레코드값=>Vo저장
				vo.setIdx(rs.getInt("idx"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadhit(rs.getInt("readhit"));
				vo.setLikehit(rs.getInt("likehit"));
				vo.setDel_info(rs.getInt("del_info"));
				vo.setSuccess_info(rs.getInt("success_info"));
				vo.setReply_info(rs.getInt("reply_info"));
				vo.setNickname(rs.getString("nickname"));
				vo.setRegidate(rs.getString("regidate"));
				vo.setId(rs.getString("id"));

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
	
	
	//이미지 검색으로 나온 리스트 뿌리기!!!
	public List<JisikTableVO> searchImgselectList( String part1,String part2,String part3,String part4 ) {

		List<JisikTableVO> list = new ArrayList<JisikTableVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select j.*, u.nickname"
				+ " from jisiktable j, ocr o, user_total u"
				+ " where j.idx = o.idx and j.id = u.id"
				+ " and (o.ocr_data like '%'||?||'%' or o.ocr_data like '%'||?||'%'"
				+ " or o.ocr_data like '%'||?||'%' or o.ocr_data like '%'||?||'%')";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, part1);
			pstmt.setString(2, part2);
			pstmt.setString(3, part3);
			pstmt.setString(4, part4);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JisikTableVO vo = new JisikTableVO();
				//현재레코드값=>Vo저장
				vo.setIdx(rs.getInt("idx"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadhit(rs.getInt("readhit"));
				vo.setLikehit(rs.getInt("likehit"));
				vo.setDel_info(rs.getInt("del_info"));
				vo.setSuccess_info(rs.getInt("success_info"));
				vo.setReply_info(rs.getInt("reply_info"));
				vo.setNickname(rs.getString("nickname"));
				vo.setRegidate(rs.getString("regidate"));
				vo.setId(rs.getString("id"));
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
	
	
	//원본글 수정!!!!!
	public int jisik_update(JisikTableVO vo) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update jisiktable set content = ?, subject = ?, regidate = sysdate"
				+ " where idx=?";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setString(1, vo.getContent());
			pstmt.setString(2, vo.getSubject());
			pstmt.setInt(3, vo.getIdx());
			

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
	
	
	//원본글 수정을 위한 ocr데이터 삭제!!!!!(원본글 삭제도 겸)
	public int ocr_delete(int idx) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from ocr where idx ="+idx;

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

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
	
	
	//원본글 삭제!!!!
	public int jisik_delete(int idx) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from jisiktable where idx="+idx;

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

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
	
	
	
	//좋아요 숫자 +1 업데이트!!!
	public int plusLikehit(int idx) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update jisiktable set likehit = likehit + 1 where idx = ?";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setInt(1, idx);

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
	
	
	
	//좋아요 숫자 -1업데이트!!!
	public int minusLikehit(int idx) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update jisiktable set likehit = likehit - 1 where idx = ?";

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 채우기
			pstmt.setInt(1, idx);

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
	
	
	
	
	//좋아요 수 ajax를 위한 select!!!!!!!
	public int selectLikehit(int idx) {

//		int vo = null;
		int likehit = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select likehit from jisiktable where idx = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setInt(1, idx);

			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			if (rs.next()) {
//				vo = new int();
				//현재레코드값=>Vo저장
				likehit = rs.getInt("likehit");

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

		return likehit;
	}
	
	
	//찜한 목록 뽑아오기!!!!!!!
	public List<JisikTableVO> searchJjimselectList(String id) {

		List<JisikTableVO> list = new ArrayList<JisikTableVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select j.*, u.nickname"
				+ " from jisiktable j, user_total u, jjim_jisik jjim"
				+ " where j.id = u.id and j.idx = jjim.jjim_idx and jjim.jjim_id = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JisikTableVO vo = new JisikTableVO();
				//현재레코드값=>Vo저장
				vo.setIdx(rs.getInt("idx"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadhit(rs.getInt("readhit"));
				vo.setLikehit(rs.getInt("likehit"));
				vo.setDel_info(rs.getInt("del_info"));
				vo.setSuccess_info(rs.getInt("success_info"));
				vo.setReply_info(rs.getInt("reply_info"));
				vo.setNickname(rs.getString("nickname"));
				vo.setRegidate(rs.getString("regidate"));
				vo.setId(rs.getString("id"));

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
	
	
	//내가 쓴글 보기!!!!!!!!
	public List<JisikTableVO> searchMyList( String id ) {

		List<JisikTableVO> list = new ArrayList<JisikTableVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select j.*, u.nickname"
				+ " from jisiktable j, user_total u"
				+ " where j.id = u.id and j.id = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JisikTableVO vo = new JisikTableVO();
				//현재레코드값=>Vo저장
				vo.setIdx(rs.getInt("idx"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadhit(rs.getInt("readhit"));
				vo.setLikehit(rs.getInt("likehit"));
				vo.setDel_info(rs.getInt("del_info"));
				vo.setSuccess_info(rs.getInt("success_info"));
				vo.setReply_info(rs.getInt("reply_info"));
				vo.setNickname(rs.getString("nickname"));
				vo.setRegidate(rs.getString("regidate"));
				vo.setId(rs.getString("id"));

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
	
	
	//과목 검색!!!!!
	public List<JisikTableVO> searchSubejctselectList(String subject) {

		List<JisikTableVO> list = new ArrayList<JisikTableVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select j.*, u.nickname"
				+ " from jisiktable j, user_total u"
				+ " where j.id = u.id and j.subject = ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, subject);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JisikTableVO vo = new JisikTableVO();
				//현재레코드값=>Vo저장
				
				vo.setIdx(rs.getInt("idx"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadhit(rs.getInt("readhit"));
				vo.setLikehit(rs.getInt("likehit"));
				vo.setDel_info(rs.getInt("del_info"));
				vo.setSuccess_info(rs.getInt("success_info"));
				vo.setReply_info(rs.getInt("reply_info"));
				vo.setNickname(rs.getString("nickname"));
				vo.setRegidate(rs.getString("regidate"));
				vo.setId(rs.getString("id"));

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
	
	
	//페이지처리 한 원본글 뿌리기!!!!!
	public List<JisikTableVO> pageSelectList(int start, int end) {

		List<JisikTableVO> list = new ArrayList<JisikTableVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from"
				+ " (select Rank() over( order by regidate DESC ) no, ji.*"
				+ " from (select j.*, u.nickname"
				+ " from jisiktable j, user_total u"
				+ " where j.id=u.id) ji )"
				+ " where no between ? and ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JisikTableVO vo = new JisikTableVO();
				//현재레코드값=>Vo저장
				vo.setIdx(rs.getInt("idx"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadhit(rs.getInt("readhit"));
				vo.setLikehit(rs.getInt("likehit"));
				vo.setDel_info(rs.getInt("del_info"));
				vo.setSuccess_info(rs.getInt("success_info"));
				vo.setReply_info(rs.getInt("reply_info"));
				vo.setNickname(rs.getString("nickname"));
				vo.setRegidate(rs.getString("regidate"));
				vo.setId(rs.getString("id"));

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
	
	
	//검색어 없는 원본글 갯수!!!!!!!
	public int row_Num() {

//		int vo = null;
		int row_num = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) \"row\" from"
				+ " (select Rank() over( order by regidate DESC ) no, ji.*"
				+ " from (select j.*, u.nickname"
				+ " from jisiktable j, user_total u"
				+ " where j.id=u.id) ji )";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정

			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			if (rs.next()) {
//				vo = new int();
				//현재레코드값=>Vo저장
				row_num = rs.getInt("row");
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

		return row_num;
	}
	
	
	
	//페이지 처리를 한 이미지 검색!!!!
	public List<JisikTableVO> page_searchImgselectList( String part1 , String part2, String part3, String part4,
														int start, int end) {

		List<JisikTableVO> list = new ArrayList<JisikTableVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from"
				+ " (select Rank() over( order by regidate DESC ) no, ji.*"
				+ " from (select j.*, u.nickname"
				+ " from jisiktable j, ocr o, user_total u"
				+ " where j.idx = o.idx and j.id = u.id\r\n"
				+ " and (o.ocr_data like '%'||?||'%' or o.ocr_data like '%'||?||'%'"
				+ " or o.ocr_data like '%'||?||'%' or o.ocr_data like '%'||?||'%')) ji )"
				+ " where no between ? and ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, part1);
			pstmt.setString(2, part2);
			pstmt.setString(3, part3);
			pstmt.setString(4, part4);
			pstmt.setInt(5, start);
			pstmt.setInt(6, end);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JisikTableVO vo = new JisikTableVO();
				//현재레코드값=>Vo저장
				vo.setIdx(rs.getInt("idx"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadhit(rs.getInt("readhit"));
				vo.setLikehit(rs.getInt("likehit"));
				vo.setDel_info(rs.getInt("del_info"));
				vo.setSuccess_info(rs.getInt("success_info"));
				vo.setReply_info(rs.getInt("reply_info"));
				vo.setNickname(rs.getString("nickname"));
				vo.setRegidate(rs.getString("regidate"));
				vo.setId(rs.getString("id"));

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
	
	
	//이미지 검색 페이지 처리를 위한 행 갯수!!!!!!
	public int row_Num_Img( String part1, String part2, String part3, String part4 ) {

//		int vo = null;
		int row_num = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) \"row\" from"
				+ " (select Rank() over( order by regidate DESC ) no, ji.*"
				+ " from (select j.*, u.nickname"
				+ " from jisiktable j, ocr o, user_total u"
				+ " where j.idx = o.idx and j.id = u.id\r\n"
				+ " and (o.ocr_data like '%'||?||'%' or o.ocr_data like '%'||?||'%'"
				+ " or o.ocr_data like '%'||?||'%' or o.ocr_data like '%'||?||'%')) ji )";
		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setString(1, part1);
			pstmt.setString(2, part2);
			pstmt.setString(3, part3);
			pstmt.setString(4, part4);

			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			if (rs.next()) {
//				vo = new int();
				//현재레코드값=>Vo저장
				row_num = rs.getInt("row");
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

		return row_num;
	}
	
	
	//페이지 처리를 한 text검색 뿌리기!!!!!!!
	public List<JisikTableVO> page_searchTextselectList(String search_content, int start, int end) {

		List<JisikTableVO> list = new ArrayList<JisikTableVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from\r\n"
				+ "(select Rank() over( order by regidate DESC ) no, ji.*\r\n"
				+ "from ( select j.*, u.nickname\r\n"
				+ "from jisiktable j, user_total u\r\n"
				+ "where j.id = u.id and j.idx in (select idx\r\n"
				+ "from jisiktable\r\n"
				+ "where content like '%'||?||'%'\r\n"
				+ "union\r\n"
				+ "select j.idx\r\n"
				+ "from jisiktable j, ocr o\r\n"
				+ "where j.idx = o.idx and (j.content like '%'||?||'%' or o.ocr_data like '%'||?||'%')) ) ji )\r\n"
				+ "where no between ? and ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search_content);
			pstmt.setString(2, search_content);
			pstmt.setString(3, search_content);
			pstmt.setInt(4, start);
			pstmt.setInt(5, end);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JisikTableVO vo = new JisikTableVO();
				//현재레코드값=>Vo저장
				vo.setIdx(rs.getInt("idx"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadhit(rs.getInt("readhit"));
				vo.setLikehit(rs.getInt("likehit"));
				vo.setDel_info(rs.getInt("del_info"));
				vo.setSuccess_info(rs.getInt("success_info"));
				vo.setReply_info(rs.getInt("reply_info"));
				vo.setNickname(rs.getString("nickname"));
				vo.setRegidate(rs.getString("regidate"));
				vo.setId(rs.getString("id"));

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
	
	//페이징 처리를 위한 Text검색 행 갯수 뿌리기!!!!
	public int row_Num_Text( String search_content ) {

		int row_num = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) \"row\" from\r\n"
				+ "(select Rank() over( order by regidate DESC ) no, ji.*\r\n"
				+ "from ( select j.*, u.nickname\r\n"
				+ "from jisiktable j, user_total u\r\n"
				+ "where j.id = u.id and j.idx in (select idx\r\n"
				+ "from jisiktable\r\n"
				+ "where content like '%'||?||'%'\r\n"
				+ "union\r\n"
				+ "select j.idx\r\n"
				+ "from jisiktable j, ocr o\r\n"
				+ "where j.idx = o.idx and (j.content like '%'||?||'%' or o.ocr_data like '%'||?||'%')) ) ji )";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setString(1, search_content);
			pstmt.setString(2, search_content);
			pstmt.setString(3, search_content);

			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				//현재레코드값=>Vo저장
				row_num = rs.getInt("row");

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

		return row_num;
	}
	
	
	//페이지 처리를 한 찜 목록 가져오기!!!!!!!!
	public List<JisikTableVO> page_searchJjimselectList(String id, int start, int end) {

		List<JisikTableVO> list = new ArrayList<JisikTableVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from"
				+ " (select Rank() over( order by regidate DESC ) no, ji.*"
				+ " from (select j.*, u.nickname"
				+ " from jisiktable j, user_total u, jjim_jisik jjim"
				+ " where j.id = u.id and j.idx = jjim.jjim_idx and jjim.jjim_id = ?) ji )"
				+ " where no between ? and ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JisikTableVO vo = new JisikTableVO();
				//현재레코드값=>Vo저장
				vo.setIdx(rs.getInt("idx"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadhit(rs.getInt("readhit"));
				vo.setLikehit(rs.getInt("likehit"));
				vo.setDel_info(rs.getInt("del_info"));
				vo.setSuccess_info(rs.getInt("success_info"));
				vo.setReply_info(rs.getInt("reply_info"));
				vo.setNickname(rs.getString("nickname"));
				vo.setRegidate(rs.getString("regidate"));
				vo.setId(rs.getString("id"));

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
	
	
	//페이징 처리한 찜목록 행 갯수 갖고와!!!!
	public int row_Num_jjim(String id) {

//		int vo = null;
		int row_num = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) \"row\" from"
				+ " (select Rank() over( order by regidate DESC ) no, ji.*"
				+ " from (select j.*, u.nickname"
				+ " from jisiktable j, user_total u, jjim_jisik jjim"
				+ " where j.id = u.id and j.idx = jjim.jjim_idx and jjim.jjim_id = ?) ji )";

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
//				vo = new int();
				//현재레코드값=>Vo저장
				row_num = rs.getInt("row");

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

		return row_num;
	}
	
	
	//페이징 처리를 한 내가 쓴글 뿌리기!!!!!!!!
	public List<JisikTableVO> page_searchMyList(String id, int start, int end) {

		List<JisikTableVO> list = new ArrayList<JisikTableVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from"
				+ " (select Rank() over( order by regidate DESC ) no, ji.*"
				+ " from (select j.*, u.nickname"
				+ " from jisiktable j, user_total u"
				+ " where j.id = u.id and j.id = ?) ji )"
				+ " where no between ? and ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JisikTableVO vo = new JisikTableVO();
				//현재레코드값=>Vo저장
				vo.setIdx(rs.getInt("idx"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadhit(rs.getInt("readhit"));
				vo.setLikehit(rs.getInt("likehit"));
				vo.setDel_info(rs.getInt("del_info"));
				vo.setSuccess_info(rs.getInt("success_info"));
				vo.setReply_info(rs.getInt("reply_info"));
				vo.setNickname(rs.getString("nickname"));
				vo.setRegidate(rs.getString("regidate"));
				vo.setId(rs.getString("id"));

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
	
	
	//페이징 처리를 한 내가 쓴글 갯수 가져와!!!!
	public int row_Num_MyList(String id) {

//		int vo = null;
		int row_num = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) \"row\" from"
				+ " (select Rank() over( order by regidate DESC ) no, ji.*"
				+ " from (select j.*, u.nickname"
				+ " from jisiktable j, user_total u"
				+ " where j.id = u.id and j.id = ?) ji )";

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
//				vo = new int();
				//현재레코드값=>Vo저장
				row_num = rs.getInt("row");

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

		return row_num;
	}
	
	
	
	//페이징 처리를 한 과목 검색 리스트 뿌리기!!!!!!
	public List<JisikTableVO> page_searchSubejctselectList( String subject, int start, int end ) {

		List<JisikTableVO> list = new ArrayList<JisikTableVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from"
				+ " (select Rank() over( order by regidate DESC ) no, ji.*"
				+ " from (select j.*, u.nickname"
				+ " from jisiktable j, user_total u"
				+ " where j.id = u.id and j.subject = ?) ji )"
				+ " where no between ? and ?";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, subject);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JisikTableVO vo = new JisikTableVO();
				//현재레코드값=>Vo저장
				vo.setIdx(rs.getInt("idx"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadhit(rs.getInt("readhit"));
				vo.setLikehit(rs.getInt("likehit"));
				vo.setDel_info(rs.getInt("del_info"));
				vo.setSuccess_info(rs.getInt("success_info"));
				vo.setReply_info(rs.getInt("reply_info"));
				vo.setNickname(rs.getString("nickname"));
				vo.setRegidate(rs.getString("regidate"));
				vo.setId(rs.getString("id"));

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
	
	
	
	//페이징 처리한 과목 검색 행 가져와!!!!
	public int row_Num_Subject(String subject) {

//		int vo = null;
		int row_num = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) \"row\" from"
				+" (select Rank() over( order by regidate DESC ) no, ji.*"
				+ "	from (select j.*, u.nickname"
				+ "	from jisiktable j, user_total u"
				+ "	where j.id = u.id and j.subject = ?) ji )";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter 설정
			pstmt.setString(1, subject);

			//4.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			if (rs.next()) {
//				vo = new int();
				//현재레코드값=>Vo저장
				row_num = rs.getInt("row");

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

		return row_num;
	}
	
	
	//댓글 삭제시 원본글 댓글 갯수 업데이트
	public int deleteReplyInfo(int idx) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update jisiktable set reply_info = reply_info-1 where idx="+idx;

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

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
	
	
	//원본글 삭제를 위한 찜 삭제!!!!
	public int jjim_delete(int idx) {
		// TODO Auto-generated method stub
		int res = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from jjim_jisik where jjim_idx="+idx;

		try {
			//1.Connection획득
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체 획득
			pstmt = conn.prepareStatement(sql);

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
