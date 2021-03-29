package hanjiho.project.starbucks.model;
import lombok.Data;

//테이블 구조에 맞춘 JavaBeans 생성
@Data
public class Gift {
	private int gift_id;
	private int member_id;
	private String to_mem_email;
	private String to_mem_name;
	private String message;
	private int gift_price;
	private String pay_method;
	private String reg_date;
}