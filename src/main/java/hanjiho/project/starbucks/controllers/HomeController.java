package hanjiho.project.starbucks.controllers;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 홈 컨트롤러
 */
@Controller
public class HomeController {
	
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
	public String search() {
		return "search";
	}
	
	/**
	 * 고객문의 컨트롤러
	 */
	@RequestMapping(value = "/voc", method = RequestMethod.GET)
	public String voc() {
		return "voc";
	}
	
}
