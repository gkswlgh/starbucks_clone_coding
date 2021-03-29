package hanjiho.project.starbucks.model;
import lombok.Data;

//테이블 구조에 맞춘 JavaBeans 생성
@Data
public class Cart {
	private int cart_id;
	private String session_id;
	private int menu_qty;
	private String reg_date;
	private String edit_date;
	private Integer member_id;
	private int menu_id;
}