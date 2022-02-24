package model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // geter setter �޼ҵ� �ڵ����� ����
@NoArgsConstructor // �⺻������ ����
@AllArgsConstructor // ��� �ʵ庯���� �ʱ�ȭ�ϴ� ������ ����
public class CourseDTO {
	private int theme_num;
	private String theme_name;
	private String theme_ct;
	private String theme_course;
	private String theme_dis;
	private String theme_img;
	
	CourseDTO(String acc_name, String acc_img){
		this.theme_name = acc_name;
		this.theme_img = acc_img;
	}
}
