package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProfileImageDAO {

	private static ProfileImageDAO instance = null;
	
	public synchronized static ProfileImageDAO getInstance() {
		if(instance == null) {
			instance = new ProfileImageDAO();
		}
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}
	
	public String getSysName(String parentId) throws Exception {
		String sql = "select sysName from profile_image where parentId=?";
		
		try (
		Connection con = getConnection();
		PreparedStatement stat = con.prepareStatement(sql); ){
		stat.setString(1, parentId);
		try (
		ResultSet rs = stat.executeQuery(); ){
		rs.next();
		
		return rs.getString(1); }}
	}
	
}
