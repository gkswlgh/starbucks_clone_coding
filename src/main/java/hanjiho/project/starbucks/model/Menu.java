package hanjiho.project.starbucks.model;
import lombok.Data;

//테이블 구조에 맞춘 JavaBeans 생성
@Data
public class Menu {
	private int id;
	private String menu_class;
	private String name;
	private String eng_name;
	private int price;
	private String is_open;
	private String list_img;
	private String main_img;
	private String description;
	private String content;
	private String nutri_info;
	private String reg_date;
	private String edit_date;
	
	private String kcal;
	private String fat;
	private String protein;
	private String salt;
	private String sugars;
	private String caffeine;
}