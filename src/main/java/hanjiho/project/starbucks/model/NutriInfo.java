package hanjiho.project.starbucks.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class NutriInfo {
	private String nutri_volume;
	private String kcal;
	private String fat;
	private String protein;
	private String salt;
	private String sugars;
	private String caffeine;
	private String trigger_str;
	
	private List<String> trigger_list = new ArrayList<String>();
}
