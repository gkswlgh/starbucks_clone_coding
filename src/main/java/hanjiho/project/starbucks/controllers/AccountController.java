package hanjiho.project.starbucks.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 회원 정보 처리 관련 컨트롤러
 */
@Controller
public class AccountController {

    /**
     * 회원가입 페이지
     */
    @RequestMapping(value = "/account/join", method = RequestMethod.GET)
    public String join() {
        return "join_mem";
    }

    /**
     * 로그인 페이지
     */
    @RequestMapping(value = "/account/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }
    
    /**
     * 로그인 페이지
     */
    @RequestMapping(value = "/account/find_id", method = RequestMethod.GET)
    public String find_id() {
        return "find_id";
    }
    
    /**
     * 로그인 페이지
     */
    @RequestMapping(value = "/account/find_pw", method = RequestMethod.GET)
    public String find_pw() {
        return "find_pw";
    }
    
    /**
     * 로그아웃 컨트롤러
     */
    @RequestMapping(value = "/account/logout", method = RequestMethod.GET)
    public String logout() {
        return "index";
    }
}
