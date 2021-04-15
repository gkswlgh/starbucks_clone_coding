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
     * 아이디찾기 페이지
     */
    @RequestMapping(value = "/account/find_id", method = RequestMethod.GET)
    public String find_id() {
        return "find_id";
    }
    
    /**
     * 비번찾기 페이지
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

    /**
     * 회원정보수정 컨트롤러
     */
    @RequestMapping(value = "/account/myinfo_modify", method = RequestMethod.GET)
    public String modify() {
        return "my_starbucks/myinfo_modify";
    }
    
    /**
     * 탈퇴 컨트롤러
     */
    @RequestMapping(value = "/account/join_out", method = RequestMethod.GET)
    public String join_out() {
        return "my_starbucks/join_out_mem";
    }
    
    /**
     * 비밀번호 수정 컨트롤러
     */
    @RequestMapping(value = "/account/myinfo_change_pw", method = RequestMethod.GET)
    public String myinfo_change_pw() {
        return "my_starbucks/myinfo_change_pw";
    }
}
