package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data  //geter setter �޼ҵ� �ڵ����� ����
@NoArgsConstructor //�⺻������ ����
@AllArgsConstructor // ��� �ʵ庯���� �ʱ�ȭ�ϴ� ������ ����
public class MemberDTO {
	private String mem_id;
	private String mem_pw;
	private String mem_nick;
	private int mem_age;
	private String mem_gen;
	
}
