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
}
