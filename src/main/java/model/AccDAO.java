package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AccDAO {
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
			// OracleDriver 클래스가 해당 위치에 없는경우(ojdbc6.jar 미포함)
			// 해결방안: WEB-INF->lib->ojdbc6.jar 저장

			// 2. OracleDriver 경로가 오타인경우
			e.printStackTrace();
		} catch (SQLException e) {
			// DB연결 정보가 정확하지 않을 경우

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
	
	public ArrayList<AccDTO> accAddress(){
		ArrayList<AccDTO> list = new ArrayList<AccDTO>();
		connect();
		
		sql = "select accom_name, accom_tel, accom_time, accom_ct, accom_add, accom_img, accom_info from accom";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String accom_name = rs.getString(1);
				String accom_tel = rs.getString(2);
				String accom_time = rs.getString(3);
				String accom_ct = rs.getString(4);
				String accom_add = rs.getString(5);
				String accom_img = rs.getString(6);
				String accom_info = rs.getString(7);
				
				AccDTO acc = new AccDTO(accom_name, accom_tel, accom_time, accom_ct, accom_add, 0, accom_img, accom_info, 0);
				list.add(acc);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
}
