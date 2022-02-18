package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // geter setter �޼ҵ� �ڵ����� ����
@NoArgsConstructor // �⺻������ ����
@AllArgsConstructor // ��� �ʵ庯���� �ʱ�ȭ�ϴ� ������ ����
public class CfDTO {
	private String cf_name;
	
	private String cf_tel;
	private String cf_time;
	private String cf_ct;
	private String cf_add;
	private int cf_loc;
	private String cf_img;
	private String cf_info;
	private int cf_views;
	
	CfDTO(String cf_name, String cf_img){
		this.cf_name = cf_name;
		this.cf_img = cf_img;
	}
}
