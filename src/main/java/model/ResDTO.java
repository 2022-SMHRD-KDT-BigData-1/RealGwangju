package model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // geter setter �޼ҵ� �ڵ����� ����
@NoArgsConstructor // �⺻������ ����
@AllArgsConstructor // ��� �ʵ庯���� �ʱ�ȭ�ϴ� ������ ����
public class ResDTO {
	private String res_name;
	private String res_tel;
	private String res_time;
	private String res_ct;
	private String res_add;
	private int res_loc;
	private String res_img;
	private String res_info;
	private int res_views;

	ResDTO(String res_name, String res_img){
		this.res_name = res_name;
		this.res_img = res_img;
	}
}
