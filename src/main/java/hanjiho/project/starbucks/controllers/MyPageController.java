package hanjiho.project.starbucks.controllers;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String mypage(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "my_starbucks​";
	}
	
	/**
	 * 나의 문의내역 컨트롤러
	 */
	@RequestMapping(value = "/my_starbucks/voclist", method = RequestMethod.GET)
	public String voclist(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "voclist​";
	}
	
	/**
	 * 장바구니 컨트롤러
	 */
	@RequestMapping(value = "/my_starbucks/mycart_step1", method = RequestMethod.GET)
	public String mycart_step1(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "mycart_step1​";
	}
}
