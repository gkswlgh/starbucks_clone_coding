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
    
    //페이지 구현이 필요한 경우 아래 속성들을 추가한다. (static)
  	private static int offset; //limit절에서 사용할 검색 시작 위치
  	private static int listCount; //limit절에서 사용할 검색할 데이터 수
  	
  	public static int getOffset() {
		return offset;
	}
	public static void setOffset(int offset) {
		Cart.offset = offset;
	}
	public static int getListCount() {
		return listCount;
	}
	public static void setListCount(int listCount) {
		Cart.listCount = listCount;
	}
}