package hanjiho.project.starbucks.model;
import lombok.Data;

//테이블 구조에 맞춘 JavaBeans 생성
@Data
public class Gift {
	private int gift_id;
	private Integer member_id;
	private String to_mem_email;
	private String to_mem_name;
	private String message;
	private int gift_price;
	private String pay_method;
	private String reg_date;

	/** sql에서 기간(INTERVAL) 조건으로 검색 (선물 내역 기간 검색) */  
	private int pickPeriod;
    
    //페이지 구현이 필요한 경우 아래 속성들을 추가한다. (static)
  	private static int offset; //limit절에서 사용할 검색 시작 위치
  	private static int listCount; //limit절에서 사용할 검색할 데이터 수
  	
  	public static int getOffset() {
		return offset;
	}
	public static void setOffset(int offset) {
		Gift.offset = offset;
	}
	public static int getListCount() {
		return listCount;
	}
	public static void setListCount(int listCount) {
		Gift.listCount = listCount;
	}
}