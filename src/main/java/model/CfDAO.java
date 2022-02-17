package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CfDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private String sql;

	public void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user = "campus_f_3_0115";
			String password = "smhrd3";
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			// OracleDriver Ŭ������ �ش� ��ġ�� ���°��(ojdbc6.jar ������)
			// �ذ���: WEB-INF->lib->ojdbc6.jar ����

			// 2. OracleDriver ��ΰ� ��Ÿ�ΰ��
			e.printStackTrace();
		} catch (SQLException e) {
			// DB���� ������ ��Ȯ���� ���� ���

			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<CfDTO> cfAddress(){
		ArrayList<CfDTO> list = new ArrayList<CfDTO>();
		connect();
		
		sql = "select cf_name, cf_tel, cf_time, cf_add, cf_img from cf";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String cf_name = rs.getString(1);
				String cf_tel = rs.getString(2);
				String cf_time = rs.getString(3);
				String cf_add = rs.getString(4);
				String cf_img = rs.getString(5);
				
				CfDTO cf = new CfDTO(cf_name, cf_tel, cf_time, null, cf_add, 0, cf_img, null, 0);
				list.add(cf);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
}
