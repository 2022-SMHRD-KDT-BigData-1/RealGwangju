package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ParkDAO {
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
	
	public ArrayList<ParkDTO> pAddress(){
		ArrayList<ParkDTO> list = new ArrayList<ParkDTO>();
		connect();
		
		sql = "select p_name, p_tel, p_ct, p_add, p_lat, p_lng from p";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String p_name = rs.getString(1);
				String p_tel = rs.getString(2);
				String p_ct = rs.getString(3);
				String p_add = rs.getString(4);
				String p_lat = rs.getString(5);
				String p_lng = rs.getString(6);
				
				ParkDTO p = new ParkDTO(p_name, p_tel, p_ct, p_add, 0, 0, p_lat, p_lng);
				list.add(p);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
}
