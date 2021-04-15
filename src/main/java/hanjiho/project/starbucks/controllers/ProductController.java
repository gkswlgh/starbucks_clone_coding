package hanjiho.project.starbucks.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import hanjiho.project.starbucks.helper.WebHelper;
import hanjiho.project.starbucks.model.Menu;
import hanjiho.project.starbucks.model.NutriInfo;
import hanjiho.project.starbucks.service.MenuService;
import lombok.extern.slf4j.Slf4j;


/**
 * 상품 관련 컨트롤러
 */
@Slf4j
@Controller
public class ProductController {
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	MenuService menuService;
	

    /**
     * 메뉴 목록 페이지
     */
    @RequestMapping(value = "/product/menu_list", method = RequestMethod.GET)
    public ModelAndView menu_list(Model model) {

        List<Menu> output = new ArrayList<Menu>();
        Menu input = new Menu();
        
        input.setIs_open("Y");
        
        try {
            output = menuService.getMenuList(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        
        List<List<Menu>> menuList = new ArrayList<List<Menu>>();
        
        int i;
        for (i=0; i < 9; i++) {
        	List<Menu> tmp = new ArrayList<Menu>();
	        for (Menu item : output) {
	        	String tmp_str = String.valueOf(i);
	        	String tmp_class = item.getMenu_class();
	        	if (tmp_class.equals(tmp_str)) {
	        		
	        		/* JSON 파싱 */
		        	//json 형식의 문자열
		            String nutri = item.getNutri_info();

		            //문자열로 받은 json을 json형태로 변환
		            JSONParser parser = new JSONParser();
		            JSONObject jsonObj = new JSONObject();
		            
		            try {
		            	jsonObj = (JSONObject)parser.parse(nutri);
		            	
		                JSONObject detail = (JSONObject)jsonObj.get("nutri_details");
		                String kcal = (String)detail.get("kcal");
		                String fat = (String)detail.get("fat");
		                String protein = (String)detail.get("protein");
		                String salt = (String)detail.get("salt");
		                String sugars = (String)detail.get("sugars");
		                String caffeine = (String)detail.get("caffeine");
		                
		                item.setKcal(kcal);
		                item.setFat(fat);
		                item.setProtein(protein);
		                item.setSalt(salt);
		                item.setSugars(sugars);
		                item.setCaffeine(caffeine);
		                
		           } catch (ParseException e) {
		                e.printStackTrace();
		           }// JSON 파싱 끝
	        		
	        		tmp.add(item);
	        	}
	        }
	        menuList.add(tmp);
        }
        
        
        
        
        model.addAttribute("menuList", menuList);
        
        return new ModelAndView ("menu_list");
    }

    /**
     * 메뉴 상세 페이지
     */
    @RequestMapping(value = "/product/menu_detail/{productId}", method = RequestMethod.GET)
    public ModelAndView menu_detail(Model model,
            @PathVariable(value = "productId") int productId) {
    	
    	Menu input = new Menu();
        
        input.setId(productId);
        
        Menu output = null;
        
        try {
            output = menuService.getMenuItem(input);
        } catch (Exception e) {
            webHelper.redirect(null, e.getLocalizedMessage());
        }
        
        
        //json 형식의 문자열
        String nutri = output.getNutri_info();
        log.debug(nutri);

        //문자열로 받은 json을 json형태로 변환
        JSONParser parser = new JSONParser();
        JSONObject jsonObj = new JSONObject();
        JSONArray jsonArrayList = new JSONArray();

        log.debug(output.toString());
        
        NutriInfo nutriInfo = null;
        
        try {
        	jsonObj = (JSONObject)parser.parse(nutri);
        	
        	String volume = (String)jsonObj.get("nutri_volume"); 
        	
            JSONObject detail = (JSONObject)jsonObj.get("nutri_details");
            String kcal = (String)detail.get("kcal");
            String fat = (String)detail.get("fat");
            String protein = (String)detail.get("protein");
            String salt = (String)detail.get("salt");
            String sugars = (String)detail.get("sugars");
            String caffeine = (String)detail.get("caffeine");
            
            jsonArrayList = (JSONArray)jsonObj.get("allergic_trigger");
            
            // loop array - list(add)
            List<String> allergic_trigger = new ArrayList<String>();
            for(int i=0; i < jsonArrayList.size(); i++) { 
            	String trigger = (String) jsonArrayList.get(i); 
            	allergic_trigger.add(trigger);
            }
            
            // loop array - str
            String trigger_str = "";
            for(int i=0; i < allergic_trigger.size(); i++) { 
            	trigger_str += allergic_trigger.get(i);
            	if (i < allergic_trigger.size()-1) {
            		trigger_str += " / ";
            	}
            }
            
            nutriInfo = new NutriInfo();
            nutriInfo.setNutri_volume(volume);
            nutriInfo.setKcal(kcal);
            nutriInfo.setFat(fat);
            nutriInfo.setProtein(protein);
            nutriInfo.setSalt(salt);
            nutriInfo.setSugars(sugars);
            nutriInfo.setCaffeine(caffeine);
            nutriInfo.setTrigger_str(trigger_str);
            
       } catch (ParseException e) {
            e.printStackTrace();
       }
        
        
        model.addAttribute("nutriInfo", nutriInfo);
        model.addAttribute("output", output);
        
    	return new ModelAndView ("menu_detail");
    }
}
