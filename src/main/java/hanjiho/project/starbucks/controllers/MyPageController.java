package hanjiho.project.starbucks.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 마이페이지 컨트롤러
 */
@Controller
public class MyPageController {
	
	/**
	 * 마이페이지 메인 컨트롤러
	 */
	@RequestMapping(value = "/my_starbucks", method = RequestMethod.GET)
	public String mypage() {
		return "my_starbucks/my_starbucks​";
	}
	
	/**
	 * 나의 문의내역 컨트롤러
	 */
	@RequestMapping(value = "/my_starbucks/voclist", method = RequestMethod.GET)
	public String voclist() {
		return "my_starbucks/voclist​";
	}
	
	/**
	 * 나의 문의상세 컨트롤러
	 */
	@RequestMapping(value = "/my_starbucks/vocview", method = RequestMethod.GET)
	public String vocview() {
		return "my_starbucks/vocview​";
	}
	
	/**
	 * 장바구니 컨트롤러
	 */
	@RequestMapping(value = "/my_starbucks/cart_step1", method = RequestMethod.GET)
	public String cart_step1() {
		return "my_starbucks/cart_step1​";
	}
	
	/**
	 * 나만의메뉴/좋아하는메뉴 컨트롤러
	 */
	@RequestMapping(value = "/my_starbucks/my_menu", method = RequestMethod.GET)
	public String my_menu() {
		return "my_starbucks/my_menu​";
	}
}
