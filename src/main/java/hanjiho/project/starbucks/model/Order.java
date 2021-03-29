package hanjiho.project.starbucks.model;
import lombok.Data;

//테이블 구조에 맞춘 JavaBeans 생성
@Data
public class Order {
	private int order_id;
	private int member_id;
	private int order_price;
	private String pay_method;
	private String receive_complete;
	private String reg_date;
	private String postcode;
	private String addr1;
	private String addr2;
}