package hanjiho.project.starbucks.model;
import lombok.Data;

//테이블 구조에 맞춘 JavaBeans 생성
@Data
public class LikeMenu {
	private int like_id;
	private int member_id;
	private int menu_id;
}