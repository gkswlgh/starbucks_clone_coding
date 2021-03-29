package hanjiho.project.starbucks.model;
import lombok.Data;

//테이블 구조에 맞춘 JavaBeans 생성
@Data
public class VocRe {
	private int re_id;
	private String voc_re_ttl;
	private String voc_re_txt;
	private String reg_date;
	private int voc_id;
}