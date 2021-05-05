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
import hanjiho.project.starbucks.model.Cart;
import hanjiho.project.starbucks.model.LikeMenu;
import hanjiho.project.starbucks.model.Member;
import hanjiho.project.starbucks.service.CartService;
import hanjiho.project.starbucks.service.LikeMenuService;
import hanjiho.project.starbucks.service.MenuService;
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
    

    /** likemenu 저장 */
    @RequestMapping(value = "/rest/product/like_menu", method = RequestMethod.POST)
    public Map<String, Object> likemenu(
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
         
        // 데이터등록
        try {
        	likeMenuService.addLikeMenu(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        return webHelper.getJsonData();
    }
    

    /** cart insert 장바구니 담기 */
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
		
        try {
        	cartService.addCart(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }
		
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("cart_id", input.getCart_id());
        return webHelper.getJsonData(map);
    }
    
    

    /** cart update 장바구니 수정 */    @RequestMapping(value = "/rest/product/edit_cart", method = RequestMethod.POST)
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
		
		if (menu_qty != 0) {
			input.setMenu_qty(menu_qty);
        }
		
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

}
