package hanjiho.project.starbucks.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 상품 관련 컨트롤러
 */
@Controller
public class ProductController {

    /**
     * 메뉴 목록 페이지
     */
    @RequestMapping(value = "/product/menu_list", method = RequestMethod.GET)
    public String menu_list() {
        return "menu_list";
    }

    /**
     * 메뉴 상세 페이지
     */
    @RequestMapping(value = "/product/menu_detail", method = RequestMethod.GET)
    public String menu_detail() {
        return "menu_detail";
    }
}
