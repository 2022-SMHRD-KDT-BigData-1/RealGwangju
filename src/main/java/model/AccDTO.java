package model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // geter setter �޼ҵ� �ڵ����� ����
@NoArgsConstructor // �⺻������ ����
@AllArgsConstructor // ��� �ʵ庯���� �ʱ�ȭ�ϴ� ������ ����
public class AccDTO {
	private String acc_name;
	private String acc_tel;
	private String acc_time;
	private String acc_ct;
	private String acc_add;
	private int acc_loc;
	private String acc_img;
	private String acc_info;
	private int acc_views;
	private String acc_lat;
	private String acc_lng;
	
	AccDTO(String acc_name, String acc_img){
		this.acc_name = acc_name;
		this.acc_img = acc_img;
	}
}
