package hanjiho.project.starbucks.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hanjiho.project.starbucks.helper.WebHelper;
import hanjiho.project.starbucks.model.Menu;
import hanjiho.project.starbucks.service.MenuService;

/**
 * 홈 컨트롤러
 */
@Controller
public class HomeController {

	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	MenuService menuService;
	
	/**
	 * 인덱스 컨트롤러
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	/**
	 * 사이트맵 컨트롤러
	 */
	@RequestMapping(value = "/sitemap", method = RequestMethod.GET)
	public String sitemap() {
		return "sitemap";
	}
	
	/**
	 * 통합검색 컨트롤러
	 */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView search(Model model,
			@RequestParam(required=false, defaultValue="") String keyword) {
		
        List<Menu> output = new ArrayList<Menu>();
        
        if (keyword != "" || keyword != null) {
            Menu input = new Menu();
            input.setIs_open("Y");
    		input.setName(keyword);
    		input.setEng_name(keyword);
    		
            try {
                output = menuService.getMenuList(input);
            } catch (Exception e) {
                return webHelper.redirect(null, e.getLocalizedMessage());
            }
        } else {
        	output = null;
        	keyword = null;
        }

        model.addAttribute("output", output);
        model.addAttribute("keyword", keyword);
		return new ModelAndView ("search");
	}
	
	/**
	 * 고객문의 컨트롤러
	 */
	@RequestMapping(value = "/voc", method = RequestMethod.GET)
	public String voc() {
		return "voc";
	}

	/**
	 * 고객문의완료 컨트롤러
	 */
	@RequestMapping(value = "/voc_ok", method = RequestMethod.GET)
	public String voc_ok() {
		return "voc_ok";
	}

	/**
	 * 페이지없음 컨트롤러 
	 */
	@RequestMapping(value = "/page_none", method = RequestMethod.GET)
	public String page_none() {
		return "page_none";
	}
	
}
