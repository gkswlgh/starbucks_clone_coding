package hanjiho.project.starbucks.model;
import lombok.Data;

//테이블 구조에 맞춘 JavaBeans 생성
@Data
public class Voc {
	private int voc_id;
	private String phone;
	private String email;
	private String visit_store;
	private String store_name;
	private String visit_date;
	private String voc_ttl;
	private String voc_txt;
	private String reg_date;
	private String voc_type;
	private String voc_type2;
	private Integer member_id;
	private String re_ok;
	private String voc_re_txt;
	private String re_reg_date;
    
    //페이지 구현이 필요한 경우 아래 속성들을 추가한다. (static)
  	private static int offset; //limit절에서 사용할 검색 시작 위치
  	private static int listCount; //limit절에서 사용할 검색할 데이터 수
  	
  	public static int getOffset() {
		return offset;
	}
	public static void setOffset(int offset) {
		Voc.offset = offset;
	}
	public static int getListCount() {
		return listCount;
	}
	public static void setListCount(int listCount) {
		Voc.listCount = listCount;
	}
}