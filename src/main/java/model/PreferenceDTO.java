package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data  //geter setter �޼ҵ� �ڵ����� ����
@NoArgsConstructor //�⺻������ ����
@AllArgsConstructor // ��� �ʵ庯���� �ʱ�ȭ�ϴ� ������ ����
public class PreferenceDTO {
	
	private int mem_num;
	private String mem_id;
	private String mem_like;
	
}
