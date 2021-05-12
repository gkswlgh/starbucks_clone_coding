package hanjiho.project.starbucks.model;
import lombok.Data;

//테이블 구조에 맞춘 JavaBeans 생성
@Data
public class Order {
	private int order_id;
	private Integer member_id;
	private String order_type;
	private int order_price;
	private String pay_method;
	private String receive_complete;
	private String reg_date;
	private String postcode;
	private String addr1;
	private String addr2;
	
	/** 주문내역의 검색 조건 폼을 위한 검색조건 변수 */
	private String pick_date01;
	private String pick_date02;
    
    //페이지 구현이 필요한 경우 아래 속성들을 추가한다. (static)
  	private static int offset; //limit절에서 사용할 검색 시작 위치
  	private static int listCount; //limit절에서 사용할 검색할 데이터 수
  	
  	public static int getOffset() {
		return offset;
	}
	public static void setOffset(int offset) {
		Order.offset = offset;
	}
	public static int getListCount() {
		return listCount;
	}
	public static void setListCount(int listCount) {
		Order.listCount = listCount;
	}
}