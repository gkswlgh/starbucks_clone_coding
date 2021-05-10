package hanjiho.project.starbucks.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import hanjiho.project.starbucks.helper.RegexHelper;
import hanjiho.project.starbucks.helper.WebHelper;
import hanjiho.project.starbucks.model.Card;
import hanjiho.project.starbucks.model.Cart;
import hanjiho.project.starbucks.model.Gift;
import hanjiho.project.starbucks.model.LikeMenu;
import hanjiho.project.starbucks.model.Member;
import hanjiho.project.starbucks.model.Menu;
import hanjiho.project.starbucks.model.Voc;
import hanjiho.project.starbucks.service.CardService;
import hanjiho.project.starbucks.service.CartService;
import hanjiho.project.starbucks.service.GiftService;
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
	
    /** RegexHelper 주입 */
    @Autowired
    RegexHelper regexHelper;
	
	@Autowired
	MenuService menuService;
	@Autowired
	LikeMenuService likeMenuService;
	@Autowired
	VocService vocService;
	@Autowired
	CartService cartService;
	@Autowired
	GiftService giftService;
	@Autowired
	CardService cardService;

    /**
     * 선물하기 페이지
     */
    @RequestMapping(value = "/my/gift_step1", method = RequestMethod.GET)
    public ModelAndView gift_step1(Model model) {
    	
    	return new ModelAndView("my_starbucks/gift_step1");
    }
    
    /**
     * 선물하기 2 페이지 (정보 입력)
     */
    @RequestMapping(value = "/my/gift_step2", method = RequestMethod.GET)
    public ModelAndView gift_step2(Model model,
            @SessionAttribute(value = "member", required = false) Member member) {
    	
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
    	return new ModelAndView("my_starbucks/gift_step2");
    }
    
    /**
     * 선물하기 3 페이지 (정보 확인)
     */
    @RequestMapping(value = "/my/gift_step3", method = RequestMethod.POST)
    public ModelAndView gift_step3(Model model,
            @SessionAttribute(value = "member", required = false) Member member,
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "email1",     required = false) String email1,
            @RequestParam(value = "email2",     required = false) String email2,
            @RequestParam(value = "reqMsg",     required = false) String reqMsg,
            @RequestParam(value = "price",     required = false) String price,
            @RequestParam(value = "gopaymethod",     required = false) String gopaymethod) {

        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
        String userEmail = email1 + "@" + email2;
        int price_num = Integer.parseInt(price);
    	
    	Gift input = new Gift();
    	
    	if (member != null) {
        	input.setMember_id(member.getId());
    	}
    	input.setTo_mem_name(name);
    	input.setTo_mem_email(userEmail);
    	input.setMessage(reqMsg);
    	input.setGift_price(price_num);
    	input.setPay_method(gopaymethod);

        model.addAttribute("input", input);
    	return new ModelAndView("my_starbucks/gift_step3");
    }

    /**
     * 선물하기 4 페이지 (결제 완료)
     */
    @RequestMapping(value = "/my/gift_step4/{gift_id}", method = RequestMethod.GET)
    public ModelAndView gift_step4(Model model,
            @SessionAttribute(value = "member", required = false) Member member,
            @PathVariable(value = "gift_id") int gift_id) {

        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
    	Gift input = new Gift();
    	input.setGift_id(gift_id);

    	Gift output = new Gift();
    	try {
			output = giftService.getGiftItem(input);

	        // 비회원, 다른 회원으로 부터의 접근 제한
	    	if (member.getId() != output.getMember_id()) {
	        	return new ModelAndView ("page_none");
	    	}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
        model.addAttribute("output", output);
    	return new ModelAndView ("my_starbucks/gift_step4");
    }

    /**
     * 선물내역 페이지 GET
     */
    @RequestMapping(value = "/my/egift_card", method = RequestMethod.GET)
    public ModelAndView egift_card(Model model,
            @SessionAttribute(value = "member", required = false) Member member) {
    	
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
    	Gift input = new Gift();
    	input.setMember_id(member.getId());
    	
    	List<Gift> output = new ArrayList<Gift>();
    	try {
			output = giftService.getGiftList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

        model.addAttribute("pickPeriod", -1);
        model.addAttribute("output", output);
    	return new ModelAndView ("my_starbucks/egift_card");
    }
    
    /**
     * 선물내역 페이지 POST
     */
    @RequestMapping(value = "/my/egift_card", method = RequestMethod.POST)
    public ModelAndView egift_card(Model model,
            @SessionAttribute(value = "member", required = false) Member member,
            @RequestParam(value = "pickPeriod", defaultValue = "0") int pickPeriod) {

    	// 검색기간 (-1은 1달전 -12는 1년전)
    	if (pickPeriod == 0) {
    		pickPeriod = -1;
    	}
    	
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
    	Gift input = new Gift();
    	input.setMember_id(member.getId());
    	input.setPickPeriod(pickPeriod);
    	
    	List<Gift> output = new ArrayList<Gift>();
    	try {
			output = giftService.getGiftList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

        model.addAttribute("pickPeriod", pickPeriod);
        model.addAttribute("output", output);
    	return new ModelAndView ("my_starbucks/egift_card");
    }

    /**
     * 선물내역 상세 페이지
     */
    @RequestMapping(value = "/my/egift_card_view/{gift_id}", method = RequestMethod.GET)
    public ModelAndView egift_card_view(Model model,
            @SessionAttribute(value = "member", required = false) Member member,
            @PathVariable(value = "gift_id") int gift_id) {

        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
    	Gift input = new Gift();
    	input.setGift_id(gift_id);

    	Gift output = new Gift();
    	try {
			output = giftService.getGiftItem(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member.getId() != output.getMember_id()) {
        	return new ModelAndView ("page_none");
    	}
    	
        model.addAttribute("output", output);
    	return new ModelAndView ("my_starbucks/egift_card_view");
    }
    
    /**
     * 카드등록 페이지
     */
    @RequestMapping(value = "/my/mycard_info_input", method = RequestMethod.GET)
    public ModelAndView mycard_info_input(Model model,
            @SessionAttribute(value = "member", required = false) Member member) {
    	
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
    	return new ModelAndView ("my_starbucks/mycard_info_input");
    }
    
    /**
     * 보유카드 페이지
     */
    @RequestMapping(value = "/my/mycard_list", method = RequestMethod.GET)
    public ModelAndView mycard_list(Model model,
            @SessionAttribute(value = "member", required = false) Member member) {
    	
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	Card input = new Card();
    	input.setMember_id(member.getId());

    	List<Card> output = new ArrayList<Card>();
    	int cardCount = 0;
    	try {
    		cardCount = cardService.cardCount(input);
    		output = cardService.getCardList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	//만약 보유카드가 0장이라면
    	if (cardCount == 0) {
        	return new ModelAndView ("my_starbucks/mycard_none");
    	}
    	
        model.addAttribute("cardCount", cardCount);
        model.addAttribute("output", output);
    	return new ModelAndView ("my_starbucks/mycard_list");
    }
    

    /**
     * 보유카드 상세 페이지
     */
    @RequestMapping(value = "/my/mycard_view/{card_id}", method = RequestMethod.GET)
    public ModelAndView mycard_view(Model model,
            @SessionAttribute(value = "member", required = false) Member member,
            @PathVariable(value = "card_id") int card_id) {

        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
    	Card input = new Card();
    	input.setCard_id(card_id);

    	List<Card> cardList = new ArrayList<Card>();
    	Card output = new Card();
    	try {
    		output = cardService.getCardItem(input);
    		cardList = cardService.getCardListOut(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member.getId() != output.getMember_id()) {
        	return new ModelAndView ("page_none");
    	}
    	
    	model.addAttribute("cardList", cardList);
        model.addAttribute("output", output);
    	return new ModelAndView ("my_starbucks/mycard_view");
    }
    
    /**
     * 카드충전 페이지
     */
    @RequestMapping(value = "/my/mycard_charge", method = RequestMethod.GET)
    public ModelAndView mycard_charge(Model model,
            @SessionAttribute(value = "member", required = false) Member member) {
    	
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}

    	Card input = new Card();
    	input.setMember_id(member.getId());

    	List<Card> cardList = new ArrayList<Card>();
    	try {
    		cardList = cardService.getCardListOut(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

    	model.addAttribute("cardList", cardList);
    	return new ModelAndView ("my_starbucks/mycard_charge");
    }

    /**
     * 문의목록 페이지
     */
    @RequestMapping(value = "/my/voclist", method = RequestMethod.GET)
    public ModelAndView voclist(Model model,
            @SessionAttribute(value = "member", required = false) Member member) {

        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
        List<Voc> output = new ArrayList<Voc>();
    	Voc input = new Voc();
    	input.setMember_id(member.getId());

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
            @SessionAttribute(value = "member", required = false) Member member,
            @PathVariable(value = "voc_id") int voc_id) {
    	
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
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
        
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member.getId() != output.getMember_id()) {
        	return new ModelAndView ("page_none");
    	}
        
        model.addAttribute("voc", output);
        model.addAttribute("vocRe", output2);
    	return new ModelAndView ("my_starbucks/vocview");
    }
    
    /**
     * 내 메뉴 페이지
     */
    @RequestMapping(value = "/my/my_menu", method = RequestMethod.GET)
    public ModelAndView my_menu(Model model,
            @SessionAttribute(value = "member", required = false) Member member) {

        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
        List<LikeMenu> output = new ArrayList<LikeMenu>();
        LikeMenu input = new LikeMenu();
        
        input.setMember_id(member.getId());
        
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
    public ModelAndView cart_step1(HttpSession session, @SessionAttribute(value = "member", required = false) Member member, Model model) {
    	
    	Cart input = new Cart();
    	if (member != null) {
    		input.setMember_id(member.getId());
    	} else {
    		input.setSession_id(session.getId());
    	}
    	
    	List<Cart> output = new ArrayList<Cart>();
    	try {
			output = cartService.getCartList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

        model.addAttribute("output", output);
    	return new ModelAndView ("my_starbucks/cart_step1");
    }
    
    /**
     * 장바구니 2 페이지 - 주문서 입력
     */
    @RequestMapping(value = "/my/cart_step2", method = RequestMethod.GET)
    public ModelAndView cart_step2(HttpSession session, @SessionAttribute(value = "member", required = false) Member member, Model model) {

        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
    	Cart input = new Cart();
    	if (member != null) {
    		input.setMember_id(member.getId());
    	}
    	
    	List<Cart> output = new ArrayList<Cart>();
    	try {
			output = cartService.getCartList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

        model.addAttribute("output", output);
    	return new ModelAndView ("my_starbucks/cart_step1");
    }
    
    /**
     * 주문내역 페이지
     */
    @RequestMapping(value = "/my/order_list", method = RequestMethod.GET)
    public ModelAndView order_list(Model model,
            @SessionAttribute(value = "member", required = false) Member member) {
    	
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
    	return new ModelAndView ("my_starbucks/order_list");
    }
}
