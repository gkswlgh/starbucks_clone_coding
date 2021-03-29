package hanjiho.project.starbucks.model;
import lombok.Data;

//테이블 구조에 맞춘 JavaBeans 생성
@Data
public class OrderMenuList {
	private int order_menu_id;
	private int menu_id;
	private int order_id;
	private int menu_qty;
}