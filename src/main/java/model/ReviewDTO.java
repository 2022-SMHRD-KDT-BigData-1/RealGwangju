package model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data  //geter setter �޼ҵ� �ڵ����� ����
@NoArgsConstructor //�⺻������ ����
@AllArgsConstructor // ��� �ʵ庯���� �ʱ�ȭ�ϴ� ������ ����
public class ReviewDTO {
	private String visit_name;
	private String mem_nick;
	private String re_title;
	private String re_content;
	private String re_img;
	private String re_date;
	private int re_num;
}
