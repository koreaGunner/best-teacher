package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBService {
	// 싱글톤 : 객체를 하나만 생성해서 메모리 낭비없이 지속적으로 사용하기 위함.
	// 한번만 getInstance로 호출되면 그 때 메모리에 할당하고, 그 뒤에 호출하는 getInstance 는 처음 만든것을 그대로 사용한다.
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static DBService single = null;

	public static DBService getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new DBService();
		//생성된 객체정보를 반환
		return single;
	}
	
	//JNDI의 리소스정보를 가져오는 메소드
	DataSource ds;
	
	private DBService() {

		try {
			InitialContext ic = new InitialContext();
			Context ctx = (Context)ic.lookup("java:comp/env");
			ds = (DataSource)ctx.lookup("jdbc/oracle_test");
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	//DB접속
	public Connection getConnection() {
		
		Connection conn = null;
		
		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;		
	}
	
}
