package hanjiho.project.starbucks.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import hanjiho.project.starbucks.helper.PageData;
import hanjiho.project.starbucks.helper.WebHelper;
import hanjiho.project.starbucks.model.Card;
import hanjiho.project.starbucks.model.Cart;
import hanjiho.project.starbucks.model.Gift;
import hanjiho.project.starbucks.model.LikeMenu;
import hanjiho.project.starbucks.model.Member;
import hanjiho.project.starbucks.model.Menu;
import hanjiho.project.starbucks.model.Order;
import hanjiho.project.starbucks.model.OrderMenuList;
import hanjiho.project.starbucks.model.Voc;
import hanjiho.project.starbucks.service.CardService;
import hanjiho.project.starbucks.service.CartService;
import hanjiho.project.starbucks.service.GiftService;
import hanjiho.project.starbucks.service.LikeMenuService;
import hanjiho.project.starbucks.service.MemberService;
import hanjiho.project.starbucks.service.MenuService;
import hanjiho.project.starbucks.service.OrderMenuListService;
import hanjiho.project.starbucks.service.OrderService;
import hanjiho.project.starbucks.service.VocService;

/**
 * 로그인 후 사용가능 컨트롤러
 * (마이페이지 메인 컨트롤러는 HomeController에)
 */
@Controller
public class MyController {
	
	@Autowired
	WebHelper webHelper;

	@Autowired
	MemberService memberService;
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
	@Autowired
	OrderService orderService;
	@Autowired
	OrderMenuListService orderMenuListService;

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
     * 선물내역 페이지 GET (페이징)
     */
    @RequestMapping(value = "/my/egift_card", method = RequestMethod.GET)
    public ModelAndView egift_card(Model model,HttpServletResponse response, HttpServletRequest request,
            @SessionAttribute(value = "member", required = false) Member member,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage,
			// 검색할 기간 (-1은 1달전 -12는 1년전)
            @RequestParam(value = "pickPeriod", defaultValue = "-1") int pickPeriod) {

		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한페이지당 표시할 목록수
		int pageCount = 5; // 한그룹당 표시할 페이지 번호수
		
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
    	Gift input = new Gift();
    	input.setMember_id(member.getId());
    	input.setPickPeriod(pickPeriod);
    	
    	List<Gift> output = new ArrayList<Gift>();
		PageData pageData = null;
    	try {
    		// 전체 게시글 수 조회
			totalCount = giftService.getGiftCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			// SQL의 limit절에서 사용될 값을 Beans의 static변수에 저장
    		Gift.setOffset(pageData.getOffset());
    		Gift.setListCount(pageData.getListCount());
			
			//데이터조회
			output = giftService.getGiftList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

        model.addAttribute("pickPeriod", pickPeriod);
        model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
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
     * 보유카드 페이지 (페이징)
     */
    @RequestMapping(value = "/my/mycard_list", method = RequestMethod.GET)
    public ModelAndView mycard_list(Model model, HttpServletResponse response, HttpServletRequest request,
            @SessionAttribute(value = "member", required = false) Member member,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		int totalCount = 0; // 전체 게시글 수
		int listCount = 6; // 한페이지당 표시할 목록수
		int pageCount = 5; // 한그룹당 표시할 페이지 번호수

        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	Card input = new Card();
    	input.setMember_id(member.getId());

    	List<Card> output = new ArrayList<Card>();
		PageData pageData = null;

    	try {
			// 전체 게시글 수 조회
			totalCount = cardService.getCardCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 limit절에서 사용될 값을 Beans의 static변수에 저장
			Card.setOffset(pageData.getOffset());
			Card.setListCount(pageData.getListCount());

			// 데이터조회
    		output = cardService.getCardList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	//만약 보유카드가 0장이라면
    	if (totalCount == 0) {
        	return new ModelAndView ("my_starbucks/mycard_none");
    	}
    	
        model.addAttribute("cardCount", totalCount);
        model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
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
    	input.setMember_id(member.getId());

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
            @SessionAttribute(value = "member", required = false) Member member,
			// 드롭박스에 selected될 card_id
			@RequestParam(value = "param_card_id", defaultValue = "0") int param_card_id
            ) {
    	
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}

    	Card input = new Card();
    	input.setMember_id(member.getId());

    	List<Card> cardList = new ArrayList<Card>();
    	int cardCount = 0;
    	try {
    		cardCount = cardService.getCardCount(input);
    		cardList = cardService.getCardList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	if (cardCount == 0) {
        	return new ModelAndView ("my_starbucks/mycard_none");
    	}

    	model.addAttribute("cardList", cardList);
    	model.addAttribute("param_card_id", param_card_id);
    	return new ModelAndView ("my_starbucks/mycard_charge");
    }

    /**
     * 문의목록 페이지 (페이징)
     */
    @RequestMapping(value = "/my/voclist", method = RequestMethod.GET)
    public ModelAndView voclist(Model model, HttpServletResponse response, HttpServletRequest request,
            @SessionAttribute(value = "member", required = false) Member member,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한페이지당 표시할 목록수
		int pageCount = 5; // 한그룹당 표시할 페이지 번호수
		
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
        List<Voc> output = new ArrayList<Voc>();
		PageData pageData = null;
		
    	Voc input = new Voc();
    	input.setMember_id(member.getId());

        try {
			// 전체 게시글 수 조회
			totalCount = vocService.getVocCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 limit절에서 사용될 값을 Beans의 static변수에 저장
			Voc.setOffset(pageData.getOffset());
			Voc.setListCount(pageData.getListCount());

			// 데이터조회
			output = vocService.getVocList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

        model.addAttribute("vocList", output);
		model.addAttribute("pageData", pageData);
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
     * 내 메뉴 페이지 (페이징)
     */
    @RequestMapping(value = "/my/my_menu", method = RequestMethod.GET)
    public ModelAndView my_menu(Model model, HttpServletResponse response, HttpServletRequest request,
            @SessionAttribute(value = "member", required = false) Member member,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {
    	
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한페이지당 표시할 목록수
		int pageCount = 5; // 한그룹당 표시할 페이지 번호수

        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}

        /** 1) 결과 저장할 리스트 준비 */
        List<LikeMenu> output = new ArrayList<LikeMenu>(); //menuList - 내가 좋아하는 메뉴 리스트 
        List<OrderMenuList> output2 = new ArrayList<OrderMenuList>(); //oftList - 자주 주문한 메뉴 순위 1~10위 리스트 
		PageData pageData = null;

        /** 2) 좋아하는 메뉴 리스트 조회 */
        LikeMenu input = new LikeMenu();
        input.setMember_id(member.getId());
        try {
			// 전체 게시글 수 조회
			totalCount = likeMenuService.getLikeMenuCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 limit절에서 사용될 값을 Beans의 static변수에 저장
			LikeMenu.setOffset(pageData.getOffset());
			LikeMenu.setListCount(pageData.getListCount());

			// 데이터조회
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
            
            /** 3) 가장 많이 이용한 메뉴 10건 조회 */
            OrderMenuList input2 = new OrderMenuList();
            input2.setMember_id(member.getId());
            output2 = orderMenuListService.orderOft(input2);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        
		/** 4) 그래프 출력을 위한 JS코드에서 사용할 문자열 만들기 */
		int size = output2.size();					//리스트의 길이 저장
		String[] name = new String[size];		//메뉴 이름을 저장할 배열
		String[] sumOrder = new String[size];	//주문 횟수를 저장할 배열
		
		for (int i=0; i<size; i++) {						//길이만큼 반복
			OrderMenuList item = output2.get(i);			//List에서 i번째 항목 추출
			name[i] = "'"+item.getName()+"'";				//메뉴 이름을 배열에 원소로 저장
			sumOrder[i] = String.valueOf(item.getSum_order());	//주문 횟수를 배열에 원소로 저장
		}
		
		String nameStr = String.join(",", name);			//메뉴 이름 배열을 콤마(,)를 기준으로 문자열로 연결
		String sumOrderStr = String.join(",", sumOrder);	//주문 횟수 배열을 콤마(,)를 기준으로 문자열로 연결

		//그래프에 적용할 메뉴 이름 배열
		model.addAttribute("nameStr", nameStr);		
		//그래프에 적용할 주문 횟수 배열
		model.addAttribute("sumOrderStr", sumOrderStr);	
		
        model.addAttribute("menuList", output); //menuList - 내가 좋아하는 메뉴 리스트 
        model.addAttribute("oftList", output2); //oftList - 자주 주문한 메뉴 순위 1~10위 리스트 
		model.addAttribute("pageData", pageData);
        return new ModelAndView ("my_starbucks/my_menu");
    }
    
    /**
     * 장바구니 페이지
     */
    @RequestMapping(value = "/my/cart_step1", method = RequestMethod.GET)
    public ModelAndView cart_step1(HttpSession session, 
    		@SessionAttribute(value = "member", required = false) Member member, 
    		Model model) {
    	
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
     * [LIST | 장바구니구매] 장바구니 2 페이지 - 주문서 입력
     */
    @RequestMapping(value = "/my/cart_step2", method = RequestMethod.POST)
    public ModelAndView cart_step2(HttpSession session, 
    		@SessionAttribute(value = "member", required = false) Member member, 
    		Model model,
            @RequestParam(value = "cart_id_list", required = false) String cart_id_list) {

        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
    	List<Card> cardList = new ArrayList<Card>();
    	try {
			//보유카드 드롭박스 리스트
	    	Card tmp = new Card();
	    	tmp.setMember_id(member.getId());
    		cardList = cardService.getCardList(tmp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
        model.addAttribute("cardList", cardList);
        model.addAttribute("cart_id_list", cart_id_list); // cart_id_list는 String 그대로 넘기기 (처리는 step3에서)
    	return new ModelAndView ("my_starbucks/cart_step2");
    }

    /**
     * [LIST | 장바구니구매] 장바구니 3 페이지 - 결제
     */
    @RequestMapping(value = "/my/cart_step3", method = RequestMethod.POST)
    public ModelAndView cart_step3(HttpSession session, Model model,
    		@SessionAttribute(value = "member", required = false) Member member, 
            @RequestParam(value = "cart_id_list", required = false) String cart_id_list, //장바구니id
            @RequestParam(value = "card_id", defaultValue = "0") int card_id, //스타벅스카드id (null가능)
            @RequestParam(value = "gopaymethod", required = false) String pay_method, //결제수단
            @RequestParam(value = "zip", required = false) String postcode,
            @RequestParam(value = "address", required = false) String addr1,
            @RequestParam(value = "addressDetail", required = false) String addr2,
            @RequestParam(value = "add_addr", required = false) String add_addr//배송지 저장 여부 (안하면 null)
            ) {

        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) { return new ModelAndView ("page_none"); }
    	if (cart_id_list == null || cart_id_list == "") { return new ModelAndView ("page_none"); }
    	
    	// 사용할 order_price 변수 초기화
    	int order_price = 0;
    	
    	
    	/** 1) 카트 조회 - cartList에 저장, order_price(합계) 계산 */
        // cart_id,cart_id... 형식으로 저장된 String을 ',' 기준으로 잘라서 배열로 변환
    	String[] data = cart_id_list.split(",");

    	// 배열에서 cart_id꺼내서 List에 저장을 반복 (cart_id로 cart데이터조회)
    	List<Cart> cartList = new ArrayList<Cart>();
		for (String item: data) {   
			// 형변환 string to int
			int tmp = Integer.parseInt(item); 
	        try {
				// cart_id로 데이터조회
		        Cart input = new Cart();
				input.setCart_id(tmp);
				input = cartService.getCartItem(input);
				// cartList 리스트에 저장
				cartList.add(input);

		    	// 아래에서 저장할 order_price 미리 계산
				order_price += input.getMenu_qty() * input.getPrice();
		    	
	        } catch (Exception e) {
				e.printStackTrace();
	        }
		}

    	
    	/** 2) 카드 조회 - input2에 저장, 파라미터 add_addr존재 여부로 배송지 저장 */
		//카드 id 담은 input객체
    	Card input2 = new Card();
    	if (card_id != 0) {
        	input2.setCard_id(card_id);
    		try {
    			//파라미터로 받은 card_id로 카드(card)정보 조회
    			input2 = cardService.getCardItem(input2);
    			
        		//배송지 저장 (조건식)
        		if (add_addr != null && add_addr != "") {
            		Member tmp2 = new Member();
            		tmp2.setAddr1(addr1);
            		tmp2.setAddr2(addr2);
            		tmp2.setPostcode(postcode);
            		tmp2.setId(member.getId());
            		memberService.updateAddress(tmp2);
            		tmp2 = memberService.getMemberItem(tmp2);
                    // 4) 세션 생성 및 결과 표시
                    webHelper.setSession("member", tmp2);
        		}
    		} catch (Exception e1) {
    			e1.printStackTrace();
    		}
    	}
    	
    	
    	/** 3) 오더 객체 - input3에 저장(파라미터 저장, order_price에 배달비 추가) */
    	//주문input 객체 미리 생성
    	Order input3 = new Order();
    	input3.setMember_id(member.getId());
    	input3.setPay_method(pay_method);
    	input3.setPostcode(postcode);
    	input3.setAddr1(addr1);
    	input3.setAddr2(addr2);
	    	//배달비용 계산
	    	if (order_price < 20000) {
	    		order_price += 5000; // 배달비용 20000원 미만일때 5000
	    	}
    	input3.setOrder_price(order_price);
    	
    	
    	// cart_id_list를 또 String 그대로 넘기기 (페이지에서 버튼 조작으로 order할 때 order_menu_list도 insert해야함)
    	model.addAttribute("cart_id_list", cart_id_list); 
    	model.addAttribute("order_price", order_price); // 결제액 합계
        
        model.addAttribute("cartList", cartList); // 조회된cartList
        model.addAttribute("card", input2); // 스타벅스 카드 이용시에만 (신용카드일땐 null)
        model.addAttribute("order", input3); // order정보를 input객체에 미리 저장해서 넘겨줌 (order insert는 페이지에서 버튼 조작시에)
    	return new ModelAndView ("my_starbucks/cart_step3");
    }
    
    
    /**
     * [ITEM | 바로구매] 장바구니 2 페이지 - 주문서 입력
     */
    @RequestMapping(value = "/my/pay_step2", method = RequestMethod.POST)
    public ModelAndView pay_step2(HttpSession session, 
    		@SessionAttribute(value = "member", required = false) Member member, 
    		Model model,
            @RequestParam(value = "cart_id", required = false) int cart_id) {

        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
    	List<Card> cardList = new ArrayList<Card>();
    	try {
			//보유카드 드롭박스 리스트
	    	Card tmp = new Card();
	    	tmp.setMember_id(member.getId());
    		cardList = cardService.getCardList(tmp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
        model.addAttribute("cardList", cardList);
        model.addAttribute("cart_id", cart_id);
    	return new ModelAndView ("my_starbucks/pay_step2");
    }
    

    
    /**
     * [ITEM | 바로구매] 장바구니 3 페이지 - 결제
     */
    @RequestMapping(value = "/my/pay_step3", method = RequestMethod.POST)
    public ModelAndView pay_step3(HttpSession session, Model model,
    		@SessionAttribute(value = "member", required = false) Member member, 
            @RequestParam(value = "cart_id", defaultValue = "0") int cart_id, //장바구니id
            @RequestParam(value = "card_id", defaultValue = "0") int card_id, //스타벅스카드id (null가능)
            @RequestParam(value = "gopaymethod", required = false) String pay_method, //결제수단
            @RequestParam(value = "zip", required = false) String postcode,
            @RequestParam(value = "address", required = false) String addr1,
            @RequestParam(value = "addressDetail", required = false) String addr2,
            @RequestParam(value = "add_addr", required = false) String add_addr//배송지 저장 여부 (안하면 null)
            ) {

        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	if (cart_id == 0) { return new ModelAndView ("page_none"); }
    	
    	

    	/** 1) 카트, 카드 조회 - 각각 input, input2에 저장 */
    	Cart input = new Cart(); //장바구니 input 
    	Card input2 = new Card(); //카드 input2
    		try {
    			//파라미터로 받은 cart_id로 장바구니(cart)정보 조회
    	    	input.setCart_id(cart_id);
    	    	input = cartService.getCartItem(input);

    			//파라미터로 받은 card_id가 있다면 카드(card)정보 조회
    	    	if (card_id != 0) {
    	        	input2.setCard_id(card_id);
        			input2 = cardService.getCardItem(input2);
    	    	}

    	    	/** 2) 배송지 저장 - 파라미터 add_addr존재 여부로 배송지 저장 */
    	    	//배송지 저장 (조건식)
        		if (add_addr != null && add_addr != "") {
            		Member tmp = new Member();
            		tmp.setAddr1(addr1);
            		tmp.setAddr2(addr2);
            		tmp.setPostcode(postcode);
            		tmp.setId(member.getId());
            		memberService.updateAddress(tmp);
            		tmp = memberService.getMemberItem(tmp);
                    // 4) 세션 생성 및 결과 표시
                    webHelper.setSession("member", tmp);
        		}
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
    	

        /** 3) 오더 객체 - input3에 저장(파라미터 저장, order_price에 배달비 추가) */
    	// 주문input 객체 미리 생성
    	Order input3 = new Order();
    	input3.setMember_id(member.getId());
    	input3.setPay_method(pay_method);
    	input3.setPostcode(postcode);
    	input3.setAddr1(addr1);
    	input3.setAddr2(addr2);
	    	//저장할 order_price 계산
	    	int order_price = input.getMenu_qty() * input.getPrice();
	    	//배달비용 계산
	    	if (order_price < 20000) {
	    		order_price += 5000; // 배달비용 20000원 미만일때 5000
	    	}
    	input3.setOrder_price(order_price);

        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member.getId() != input.getMember_id()) {
        	return new ModelAndView ("page_none");
    	}

        
        model.addAttribute("cart", input); // 조회된cart
        model.addAttribute("card", input2); // 스타벅스 카드 이용시에만 (신용카드일땐 null)
        model.addAttribute("order", input3); // order정보를 input객체에 미리 저장해서 넘겨줌 (order insert는 페이지에서 버튼 조작시에)
    	return new ModelAndView ("my_starbucks/pay_step3");
    }
    
    /**
     * 장바구니 4 페이지 - 완료
     */
    @RequestMapping(value = "/my/cart_step4", method = RequestMethod.POST)
    public ModelAndView cart_step4(HttpSession session, 
    		@SessionAttribute(value = "member", required = false) Member member, 
    		Model model,
            @RequestParam(value = "order_id", defaultValue = "0") int order_id) {

        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
    	Order input = new Order();
    	input.setOrder_id(order_id);
    	try {
    		input = orderService.getOrderItem(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member.getId() != input.getMember_id()) {
        	return new ModelAndView ("page_none");
    	}
    	
        model.addAttribute("order", input);
    	return new ModelAndView ("my_starbucks/cart_step4");
    }
    


    /**
     * 주문내역 페이지 (페이징)
     */
    @RequestMapping(value = "/my/order_list", method = RequestMethod.GET)
    public ModelAndView order_list(Model model, HttpServletResponse response, HttpServletRequest request,
            @SessionAttribute(value = "member", required = false) Member member,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage,
            @RequestParam(value = "pickDate01", required = false) String pick_date01,  //시작날짜
            @RequestParam(value = "pickDate02", required = false) String pick_date02,  //끝날짜
            @RequestParam(value = "pay_method", required = false) String pay_method,   //결제수단
            @RequestParam(value = "order_type", required = false) String order_type) { //거래유형

		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한페이지당 표시할 목록수
		int pageCount = 5; // 한그룹당 표시할 페이지 번호수
		
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
    	System.out.println(pay_method +"  "+ order_type);
    	
    	Order input = new Order();
    	input.setMember_id(member.getId());
    	if (pay_method != null && order_type != null) {
        	//검색 조건인 파라미터 값이 "0"(전체검색)일경우 null 처리
        	if (!pay_method.equals("0")) { input.setPay_method(pay_method); }
        	if (!order_type.equals("0")) { input.setOrder_type(order_type); }
    	}
    	input.setPick_date01(pick_date01);
    	input.setPick_date02(pick_date02);
    	
    	List<Order> output = new ArrayList<Order>();
		PageData pageData = null;
    	try {
			// 전체 게시글 수 조회
			totalCount = orderService.getOrderCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 limit절에서 사용될 값을 Beans의 static변수에 저장
			Order.setOffset(pageData.getOffset());
			Order.setListCount(pageData.getListCount());

			// 데이터조회
    		output = orderService.getOrderList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
        model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		model.addAttribute("pick_date01", pick_date01);
		model.addAttribute("pick_date02", pick_date02);
		model.addAttribute("pay_method", pay_method);
		model.addAttribute("order_type", order_type);
    	return new ModelAndView ("my_starbucks/order_list");
    }
    

    /**
     * 주문내역 상세 페이지
     */
    @RequestMapping(value = "/my/order_view/{order_id}", method = RequestMethod.GET)
    public ModelAndView order_view(Model model,
            @SessionAttribute(value = "member", required = false) Member member,
            @PathVariable(value = "order_id") int order_id
            ) {
    	
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}

    	OrderMenuList input = new OrderMenuList();
    	input.setOrder_id(order_id);
    	
    	List<OrderMenuList> output = new ArrayList<OrderMenuList>();
    	try {
    		output = orderMenuListService.getOrderMenuListList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
        model.addAttribute("output", output);
    	return new ModelAndView ("my_starbucks/order_view");
    }
}
