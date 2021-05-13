package hanjiho.project.starbucks.model;
import lombok.Data;

//테이블 구조에 맞춘 JavaBeans 생성
@Data
public class OrderMenuList {
	private int order_menu_id;
	private int menu_id;
	private int member_id;
	private int order_id;
	private int menu_qty;
	
	/*join - menu*/
	private String list_img;
	private String name;
	private int price;
	
	/*sql 집계함수 - 가장 많이 이용한 메뉴 10건 조회할 때 */
	private Integer sum_order;
}