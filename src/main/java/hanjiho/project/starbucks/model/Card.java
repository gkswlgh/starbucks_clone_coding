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
}