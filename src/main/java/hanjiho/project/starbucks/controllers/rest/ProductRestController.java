package hanjiho.project.starbucks.controllers.rest;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import hanjiho.project.starbucks.helper.MailHelper;
import hanjiho.project.starbucks.helper.RegexHelper;
import hanjiho.project.starbucks.helper.WebHelper;
import hanjiho.project.starbucks.model.Card;
import hanjiho.project.starbucks.model.Cart;
import hanjiho.project.starbucks.model.LikeMenu;
import hanjiho.project.starbucks.model.Member;
import hanjiho.project.starbucks.model.Order;
import hanjiho.project.starbucks.model.OrderMenuList;
import hanjiho.project.starbucks.service.CardService;
import hanjiho.project.starbucks.service.CartService;
import hanjiho.project.starbucks.service.LikeMenuService;
import hanjiho.project.starbucks.service.MenuService;
import hanjiho.project.starbucks.service.OrderMenuListService;
import hanjiho.project.starbucks.service.OrderService;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RestController
public class ProductRestController {

    /** WebHelper 주입 */
    @Autowired
    WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired
    RegexHelper regexHelper;

    /** Service 패턴 구현체 주입 */
	@Autowired
	LikeMenuService likeMenuService;
	@Autowired
	CartService cartService;
	@Autowired
	CardService cardService;
	@Autowired
	OrderService orderService;
	@Autowired
	OrderMenuListService orderMenuListService;
    

    /** likemenu 저장 */
    @RequestMapping(value = "/rest/product/like_menu", method = RequestMethod.POST)
    public Map<String, Object> likemenu(
    		@SessionAttribute(value = "member", required = false) Member member,
            // 회원일련번호
            @RequestParam(value = "member_id", defaultValue = "0") int member_id,
            // 메뉴일련번호
            @RequestParam(value = "menu_id", defaultValue = "0") int menu_id) {

    	//유효성검사
		if (member_id == 0) {
			return webHelper.getJsonWarning("회원일련번호를 입력하세요");
		}
		if (menu_id == 0) {
			return webHelper.getJsonWarning("메뉴일련번호를 입력하세요");
		}
		
    	// 데이터조회
        LikeMenu input = new LikeMenu();
        input.setMember_id(member_id);
        input.setMenu_id(menu_id);
        try {
        	int count = 0;
        	count = likeMenuService.countLike(input);
        	if (count != 0) {
        		return webHelper.getJsonWarning("이미 좋아하는 메뉴로 등록되어있습니다. My메뉴에서 삭제할 수 있습니다.");
        	}
        	// 데이터등록
        	likeMenuService.addLikeMenu(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        return webHelper.getJsonData();
    }
    


    /** cart insert - 바로 주문하기 */
    @RequestMapping(value = "/rest/product/pay_now", method = RequestMethod.POST)
    public Map<String, Object> pay_now(HttpSession session, @SessionAttribute(value = "member", required = false) Member member,
            // 메뉴일련번호
            @RequestParam(value = "menu_id",  defaultValue = "0") int menu_id,
            // 수량
            @RequestParam(value = "menu_qty",  defaultValue = "0") int menu_qty) {

    	//유효성검사
		if (menu_id < 1) {
			return webHelper.getJsonWarning("선택된 상품이 없습니다.");
		}
		if (menu_qty < 1) {
			return webHelper.getJsonWarning("수량을 입력하세요");
		}
		
    	
    	// 데이터조회+삭제
        Cart input = new Cart();
        
        if (member != null) {
            input.setMember_id(member.getId());
        }
        
        // 비회원인 경우 클라이언트를 식별하기 위한 JSESSION-ID -> 모든 브라우저마다 고유한 값으로 할당된다.
        input.setSession_id(session.getId());
        
		input.setMenu_id(menu_id);
		input.setMenu_qty(menu_qty);
		//바로구매임 Y
		input.setIs_direct_order("Y");
		
        try {
        	cartService.addCart(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }
		
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("cart_id", input.getCart_id());
        return webHelper.getJsonData(map);
    }
    

    /** cart insert - 장바구니 담기 */
    @RequestMapping(value = "/rest/product/in_cart", method = RequestMethod.POST)
    public Map<String, Object> cart(HttpSession session, @SessionAttribute(value = "member", required = false) Member member,
            // 메뉴일련번호
            @RequestParam(value = "menu_id",  defaultValue = "0") int menu_id,
            // 수량
            @RequestParam(value = "menu_qty",  defaultValue = "0") int menu_qty) {

    	//유효성검사
		if (menu_id < 1) {
			return webHelper.getJsonWarning("선택된 상품이 없습니다.");
		}
		if (menu_qty < 1) {
			return webHelper.getJsonWarning("수량을 입력하세요");
		}
    	
    	// 데이터조회+삭제
        Cart input = new Cart();
        
        if (member != null) {
            input.setMember_id(member.getId());
        }
        
        // 비회원인 경우 클라이언트를 식별하기 위한 JSESSION-ID -> 모든 브라우저마다 고유한 값으로 할당된다.
        input.setSession_id(session.getId());
        
		input.setMenu_id(menu_id);
		input.setMenu_qty(menu_qty);
		//바로구매아님 N
		input.setIs_direct_order("N");
		
        try {
        	cartService.addCart(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }
		
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("cart_id", input.getCart_id());
        return webHelper.getJsonData(map);
    }
    
    

    /** cart update 장바구니 수정 */    
    @RequestMapping(value = "/rest/product/edit_cart", method = RequestMethod.POST)
    public Map<String, Object> cart_qty(HttpSession session, @SessionAttribute(value = "member", required = false) Member member,
            // 카트일련번호
            @RequestParam(value = "cart_id",  defaultValue = "0") int cart_id,
            // 수량
            @RequestParam(value = "menu_qty",  defaultValue = "0") int menu_qty) {

    	//유효성검사
		if (cart_id < 1) {
			return webHelper.getJsonWarning("선택된 장바구니가 없습니다.");
		}
    	
    	// 데이터조회+삭제
        Cart input = new Cart();
        
        if (member != null) {
            input.setMember_id(member.getId());
        }
        
        // 비회원인 경우 클라이언트를 식별하기 위한 JSESSION-ID -> 모든 브라우저마다 고유한 값으로 할당된다.
        input.setSession_id(session.getId());
        
		input.setCart_id(cart_id);
		input.setMenu_qty(menu_qty);
		//바로구매아님 N
		input.setIs_direct_order("N");
		
        try {
        	cartService.editCart(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }
		
        return webHelper.getJsonData();
    }
    
    /** 장바구니 삭제 */
    @RequestMapping(value = "/rest/product/del_cart", method = RequestMethod.POST)
    public Map<String, Object> deleteCart(HttpSession session, 
            @SessionAttribute(value = "member", required = false) Member member, 
            @RequestParam(value = "cart_id_list", required = false) String cart_id_list) {

    	//유효성검사
    	if (!regexHelper.isValue(cart_id_list)) {
			return webHelper.getJsonWarning("카트 일련번호가 누락되었습니다.");
		}

        Cart input = new Cart();
        
        // 비회원인 경우 클라이언트를 식별하기 위한 JSESSION-ID -> 모든 브라우저마다 고유한 값으로 할당된다.
        input.setSession_id(session.getId());

        if (member != null) {
            input.setMember_id(member.getId());
        }
        
    	String[] data = cart_id_list.split(",");

    	// 데이터조회+삭제
		for (String item: data) {   
			//형변환 string to int
			int tmp = Integer.parseInt(item); 
			// 데이터삭제
			input.setCart_id(tmp);
	        try {
	            cartService.deleteCart(input);
	        } catch (Exception e) {
	            return webHelper.getJsonError(e.getLocalizedMessage());
	        }
		}

        return webHelper.getJsonData();
    }
    

    /** [ITEM | 바로구매] order insert - 주문하기 */
    @RequestMapping(value = "/rest/product/pay_order", method = RequestMethod.POST)
    public Map<String, Object> order_item(HttpSession session, @SessionAttribute(value = "member", required = false) Member member,
    		@RequestParam(value = "cart_id", defaultValue = "0") int cart_id, //장바구니id
            @RequestParam(value = "card_id", defaultValue = "0") int card_id, //스타벅스카드id (null?0가능)
            @RequestParam(value = "pay_method", required = false) String pay_method, //결제수단
            @RequestParam(value = "postcode", required = false) String postcode,
            @RequestParam(value = "addr1", required = false) String addr1,
            @RequestParam(value = "addr2", required = false) String addr2,
            @RequestParam(value = "order_price", defaultValue = "0") int order_price // 주문 가격 합계
            ) {

    	//유효성검사
		if (cart_id < 1) {
			return webHelper.getJsonWarning("선택된 상품이 없습니다.");
		}
        if (member == null) {
        	return webHelper.getJsonWarning("로그인 정보가 없습니다.");
        }
    	if (!regexHelper.isValue(pay_method)) {return webHelper.getJsonWarning("결제 수단이 누락되었습니다.");}
    	if (!regexHelper.isValue(postcode)) {return webHelper.getJsonWarning("우편번호가 누락되었습니다.");}
    	if (!regexHelper.isValue(addr1)) {return webHelper.getJsonWarning("주소가 누락되었습니다.");}
    	if (!regexHelper.isValue(addr2)) {return webHelper.getJsonWarning("상세 주소가 누락되었습니다.");}
    	
    	// 데이터조회
        Order input = new Order();
        
        input.setMember_id(member.getId());
		input.setOrder_type("2");
		input.setReceive_complete("N");
		input.setOrder_price(order_price);
		input.setPay_method(pay_method);
    	input.setPostcode(postcode);
    	input.setAddr1(addr1);
    	input.setAddr2(addr2);
		
        try {
        	//order저장
        	orderService.addOrder(input);
        	
        	//cart 조회
        	Cart tmp = new Cart();
        	tmp.setCart_id(cart_id);
        	tmp = cartService.getCartItem(tmp);
        	
        	//order_menu_list 저장
        	OrderMenuList tmp2 = new OrderMenuList();
        	tmp2.setMember_id(member.getId());
        	tmp2.setMenu_id(tmp.getMenu_id());
        	tmp2.setMenu_qty(tmp.getMenu_qty());
        	tmp2.setOrder_id(input.getOrder_id());
        	orderMenuListService.addOrderMenuList(tmp2);

        	//card 잔액 수정 (order_price만큼 빼기 - 음수가 되지 않도록 주의)
        	if (card_id != 0) {
        		//조회
            	Card tmp3 = new Card();
            	tmp3.setCard_id(card_id);
            	tmp3 = cardService.getCardItem(tmp3);
            	//잔액계산
            	int cash = tmp3.getCash();
            	cash = cash - order_price;
            	if (cash < 0) {
            		return webHelper.getJsonWarning("카드 잔액이 부족합니다. 충전 후 다시 시도해주세요.");
            	}
            	//수정
            	tmp3.setCash(cash);
        		cardService.charge(tmp3);
        	}
        	
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }
		
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("order_id", input.getOrder_id());
        return webHelper.getJsonData(map);
    }
    

}
