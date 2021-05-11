package hanjiho.project.starbucks.model;
import java.util.List;

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
	private String is_direct_order;

    /** JOIN을 위한 컬럼 추가 */
	private String name;
	private String list_img;
	private int price;
	
    /** 대량 삭제를 위한 일련번호 배열 */
    private int[] idArr;
}