package hanjiho.project.starbucks.controllers;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import hanjiho.project.starbucks.helper.WebHelper;
import hanjiho.project.starbucks.model.LikeMenu;
import hanjiho.project.starbucks.model.Menu;
import hanjiho.project.starbucks.model.Voc;
import hanjiho.project.starbucks.service.LikeMenuService;
import hanjiho.project.starbucks.service.MenuService;
import hanjiho.project.starbucks.service.VocService;

/**
 * 로그인 후 사용가능 컨트롤러
 */
@Controller
public class MyController {
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	MenuService menuService;
	@Autowired
	LikeMenuService likeMenuService;
	@Autowired
	VocService vocService;
	
    /**
     * 선물하기 페이지
     */
    @RequestMapping(value = "/my/gift_step1", method = RequestMethod.GET)
    public String gift_step1() {
        return "my_starbucks/gift_step1";
    }

    /**
     * 선물내역 페이지
     */
    @RequestMapping(value = "/my/egift_card", method = RequestMethod.GET)
    public String egift_card() {
        return "my_starbucks/egift_card";
    }
    
    /**
     * 카드등록 페이지
     */
    @RequestMapping(value = "/my/mycard_info_input", method = RequestMethod.GET)
    public String mycard_info_input() {
        return "my_starbucks/mycard_info_input";
    }
    
    /**
     * 보유카드 페이지
     */
    @RequestMapping(value = "/my/mycard_list", method = RequestMethod.GET)
    public String mycard_list() {
        return "my_starbucks/mycard_list";
    }
    
    /**
     * 카드충전 페이지
     */
    @RequestMapping(value = "/my/mycard_charge", method = RequestMethod.GET)
    public String mycard_charge() {
        return "my_starbucks/mycard_charge";
    }

    /**
     * 문의목록 페이지
     */
    @RequestMapping(value = "/my/voclist/{member_id}", method = RequestMethod.GET)
    public ModelAndView voclist(Model model,
            @PathVariable(value = "member_id") int member_id) {

        List<Voc> output = new ArrayList<Voc>();
    	Voc input = new Voc();
    	input.setMember_id(member_id);

        try {
			output = vocService.getVocList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

        model.addAttribute("vocList", output);
    	return new ModelAndView ("my_starbucks/voclist");
    }

    /**
     * 문의상세 페이지
     */
    @RequestMapping(value = "/my/vocview/{voc_id}", method = RequestMethod.GET)
    public ModelAndView vocview(Model model,
            @PathVariable(value = "voc_id") int voc_id) {
    	
    	Voc input = new Voc();
    	input.setVoc_id(voc_id);

    	//voc객체
    	Voc output = new Voc();
    	//vocRE객체
    	Voc output2 = new Voc();
        try {
			output = vocService.getVocItem(input);
			//re_ok가 Y라면
			if (output.getRe_ok().equals("Y")) {
				//vocRE에 담기
				output2.setRe_reg_date(output.getRe_reg_date());
				output2.setVoc_re_txt(output.getVoc_re_txt());
			} else {
				output2 = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        model.addAttribute("voc", output);
        model.addAttribute("vocRe", output2);
    	return new ModelAndView ("my_starbucks/vocview");
    }
    
    /**
     * 내 메뉴 페이지
     */
    @RequestMapping(value = "/my/my_menu/{member_id}", method = RequestMethod.GET)
    public ModelAndView my_menu(Model model,
            @PathVariable(value = "member_id") int member_id) {

        List<LikeMenu> output = new ArrayList<LikeMenu>();
        LikeMenu input = new LikeMenu();
        
        input.setMember_id(member_id);
        
        try {
            output = likeMenuService.getLikeMenuList(input);
            
            int index = 0;
            for (LikeMenu item : output) {
	        	int menu_id = item.getMenu_id();
	        	
	        	Menu tmp = new Menu();
	        	tmp.setId(menu_id);
	        	
	        	//menu_id로 메뉴명 꺼내기
	        	tmp = menuService.getMenuItem(tmp);
	            String menu_name = tmp.getName();
	            
	            //output의 index번째 like_menu객체에 menu_name 세팅
	            output.get(index).setMenu_name(menu_name);
	            
	            index++;
	        }
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        
	       

        model.addAttribute("menuList", output);
        return new ModelAndView ("my_starbucks/my_menu");
    }
    
    /**
     * 장바구니 페이지
     */
    @RequestMapping(value = "/my/cart_step1", method = RequestMethod.GET)
    public String cart_step1() {
        return "my_starbucks/cart_step1";
    }
    
    /**
     * 주문내역 페이지
     */
    @RequestMapping(value = "/my/order_list", method = RequestMethod.GET)
    public String order_list() {
        return "my_starbucks/order_list";
    }
}
