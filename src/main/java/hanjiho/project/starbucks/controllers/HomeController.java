package hanjiho.project.starbucks.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import hanjiho.project.starbucks.helper.WebHelper;
import hanjiho.project.starbucks.model.Card;
import hanjiho.project.starbucks.model.Member;
import hanjiho.project.starbucks.model.Menu;
import hanjiho.project.starbucks.model.OrderMenuList;
import hanjiho.project.starbucks.service.CardService;
import hanjiho.project.starbucks.service.MenuService;
import hanjiho.project.starbucks.service.OrderMenuListService;

/**
 * 홈 컨트롤러
 */
@Controller
public class HomeController {

	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	MenuService menuService;
	@Autowired
	CardService cardService;
	@Autowired
	OrderMenuListService orderMenuListService;
	
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
	 * 마이페이지 메인 컨트롤러
	 */
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView mypage(Model model,
            @SessionAttribute(value = "member", required = false) Member member,
			@RequestParam(value = "gender", required=false, defaultValue="F") String gender) {

        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
    	/** 카드 리스트 (+ 총개수) */
    	Card input = new Card();
    	input.setMember_id(member.getId());

    	List<Card> output = new ArrayList<Card>();
    	int cardCount = 0;
    	try {
    		cardCount = cardService.getCardCount(input);
    		output = cardService.getCardList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	/** 전체 메뉴 순위 리스트 */
    	List<List<OrderMenuList>> list2= new ArrayList<List<OrderMenuList>>();
    	List<OrderMenuList> list =  new ArrayList<OrderMenuList>();
    	try {
    		// 데이터 조회
        	OrderMenuList tmp = new OrderMenuList();
    		// menu_class 0~ 8 돌림
    		for (int i=0; i<9; i++) {
	    		tmp.setMenu_class(i+"");
	    		tmp.setGender(gender);
	    		list = orderMenuListService.orderOftAll(tmp);
	    		list2.add(list);
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}

        model.addAttribute("gender", gender); //검색조건
        model.addAttribute("cardCount", cardCount); //카드 총 개수
        model.addAttribute("output", output); // 카드 리스트
        model.addAttribute("list", list2); // 전체 메뉴 순위 리스트 (리스트(list2) 안에 리스트(list)임)
    	return new ModelAndView ("mypage");
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
