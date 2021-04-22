package hanjiho.project.starbucks.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 카드 정보 처리 관련 컨트롤러
 */
@Controller
public class CardController {

    /**
     * 카드 소개 페이지
     */
    @RequestMapping(value = "/starbucks_card/about_card", method = RequestMethod.GET)
    public String about_card() {
        return "about_card";
    }

    /**
     * 선물 소개 페이지
     */
    @RequestMapping(value = "/starbucks_card/about_egift", method = RequestMethod.GET)
    public String about_egift() {
        return "about_egift";
    }
}
