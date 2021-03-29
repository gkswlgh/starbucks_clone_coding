package hanjiho.project.starbucks.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 커피파인더 관련 컨트롤러
 */
@Controller
public class CoffeeFinderController {

    /**
     * 커피파인더 폼 페이지
     */
    @RequestMapping(value = "/coffee_finder", method = RequestMethod.GET)
    public String coffee_finder() {
        return "coffee_finder";
    }

    /**
     * 커피파인더 상세 페이지
     */
    @RequestMapping(value = "/coffee_finder/product", method = RequestMethod.GET)
    public String coffee_finder_product() {
        return "coffee_finder_product";
    }
}
