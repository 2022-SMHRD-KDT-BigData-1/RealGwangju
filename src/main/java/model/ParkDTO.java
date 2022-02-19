package model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // geter setter �޼ҵ� �ڵ����� ����
@NoArgsConstructor // �⺻������ ����
@AllArgsConstructor // ��� �ʵ庯���� �ʱ�ȭ�ϴ� ������ ����
public class ParkDTO {
	private String p_name;
	private String p_tel;
	private String p_ct;
	private String p_add;
	private int p_loc;
	private int p_views;
	private String p_lat;
	private String p_lng;
	
	ParkDTO(String p_name){
		this.p_name = p_name;
	}
}
