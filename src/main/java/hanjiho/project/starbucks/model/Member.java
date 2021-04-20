package hanjiho.project.starbucks.model;
import lombok.Data;

//테이블 구조에 맞춘 JavaBeans 생성
@Data
public class Member {
	private int id;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_email;
	private String phone;
	private String birthdate;
	private String gender;
	private String is_out;
	private String login_date;
	private String reg_date;
	private String edit_date;
	private String postcode;
	private String addr1;
	private String addr2;
	private String del_date;
	private int au_num;

	private String user_pw_confirm;
	
	private String phone1;
	private String phone2;
	private String phone3;

	private String email1;
	private String email2;
}