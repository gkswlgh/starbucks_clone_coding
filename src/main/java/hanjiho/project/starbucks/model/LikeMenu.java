package hanjiho.project.starbucks.model;
import lombok.Data;

//테이블 구조에 맞춘 JavaBeans 생성
@Data
public class LikeMenu {
	private int like_id;
	private Integer member_id;
	private int menu_id;
	private String reg_date;

	//저장용
	private String menu_name;
    
    //페이지 구현이 필요한 경우 아래 속성들을 추가한다. (static)
  	private static int offset; //limit절에서 사용할 검색 시작 위치
  	private static int listCount; //limit절에서 사용할 검색할 데이터 수
  	
  	public static int getOffset() {
		return offset;
	}
	public static void setOffset(int offset) {
		LikeMenu.offset = offset;
	}
	public static int getListCount() {
		return listCount;
	}
	public static void setListCount(int listCount) {
		LikeMenu.listCount = listCount;
	}
}