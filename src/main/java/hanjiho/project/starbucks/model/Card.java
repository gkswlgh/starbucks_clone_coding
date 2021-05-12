package hanjiho.project.starbucks.model;
import lombok.Data;

//테이블 구조에 맞춘 JavaBeans 생성
@Data
public class Card {
	private int card_id;
	private String card_num;
	private Integer member_id;
	private int gift_mem_id;
	private int pin_num;
	private int cash;
	private String card_name;
	private String reg_date;
	private String edit_date;
	private String charge_auto;
	private String charge_schedule;
	private Integer charge_cash;
	
	//카드 충전 할 때 Order테이블 생성을 위해서 서비스패턴으로 넘길 정보 담을 객체
	private int order_price;
    
    //페이지 구현이 필요한 경우 아래 속성들을 추가한다. (static)
  	private static int offset; //limit절에서 사용할 검색 시작 위치
  	private static int listCount; //limit절에서 사용할 검색할 데이터 수
  	
  	public static int getOffset() {
		return offset;
	}
	public static void setOffset(int offset) {
		Card.offset = offset;
	}
	public static int getListCount() {
		return listCount;
	}
	public static void setListCount(int listCount) {
		Card.listCount = listCount;
	}
}