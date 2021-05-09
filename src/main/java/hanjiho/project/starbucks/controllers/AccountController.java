package hanjiho.project.starbucks.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import hanjiho.project.starbucks.helper.MailHelper;
import hanjiho.project.starbucks.helper.Util;
import hanjiho.project.starbucks.helper.WebHelper;
import hanjiho.project.starbucks.model.Card;
import hanjiho.project.starbucks.model.Member;
import hanjiho.project.starbucks.service.CardService;
import hanjiho.project.starbucks.service.MemberService;

/**
 * 회원 정보 처리 관련 컨트롤러
 */
@Controller
public class AccountController {
	
    /** WebHelper 주입 */
    @Autowired
    WebHelper webHelper;
    
    @Autowired
    Util util;
    
    @Autowired
    MailHelper mailHelper;

    /** Service 패턴 구현체 주입 */
    @Autowired
    MemberService memberService;
    @Autowired
    CardService cardService;

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
     * 아이디 찾기 완료 페이지
     */
    @RequestMapping(value = "/account/find_id_ok", method = RequestMethod.POST)
    public ModelAndView find_id_ok(Model model,
    		@RequestParam(value = "id", required = false) int id) {

        /** 2) 데이터 조회 */
        Member input = new Member();
        input.setId(id);
        
        /** 3) 아이디 찾기 */
        Member output = new Member();
        try {
            output = memberService.getMemberItem(input);
			
        } catch (Exception e) {
        }

        /** 4) view */
        model.addAttribute("output", output);
        return new ModelAndView ("find_id_ok");
    }
    
    /**
     * 비번찾기 페이지1
     */
    @RequestMapping(value = "/account/find_pw", method = RequestMethod.GET)
    public String find_pw() {
        return "find_pw";
    }
    
    /**
     * 비번찾기 페이지2 - 이메일인증
     */
    @RequestMapping(value = "/account/find_pw_au", method = RequestMethod.POST)
    public ModelAndView find_pw_au(Model model,
    		@RequestParam(value = "id", required = false) int id) {

        /** 1) 데이터 조회 */
        Member input = new Member();
        input.setId(id);
        
        /** 2) 회원조회 */
        Member output = new Member();
        try {
            output = memberService.getMemberItem(input);
            
        } catch (Exception e) {
			e.printStackTrace();
        }
        
        /** 5) view */
        model.addAttribute("output", output);
        return new ModelAndView ("find_pw_au");
    }
    
    /**
     * 비번찾기 페이지3 - 비번교체
     */
    @RequestMapping(value = "/account/change_pw", method = RequestMethod.POST)
    public ModelAndView change_pw(Model model,
    		@RequestParam(value = "id", required = false) int id) {

        /** 2) 데이터 조회 */
        Member output = new Member();
        output.setId(id);
        
        /** 4) view */
        model.addAttribute("output", output);
        return new ModelAndView ("change_pw");
    }
    
    /**
     * 비번찾기 페이지4 - 완료
     */
    @RequestMapping(value = "/account/find_pw_ok", method = RequestMethod.POST)
    public ModelAndView find_pw_ok(Model model,
    		@RequestParam(value = "id", required = false) int id) {

        /** 2) 데이터 조회 */
        Member input = new Member();
        input.setId(id);

        Member output = new Member();
        try {
			output = memberService.getMemberItem(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        /** 4) view */
        model.addAttribute("output", output);
    	return new ModelAndView ("find_pw_ok");
    }
    

    /**
     * 회원정보수정 페이지
     */
    @RequestMapping(value = "/account/myinfo_modify", method = RequestMethod.GET)
    public ModelAndView modify(Model model,
            @SessionAttribute(value = "member", required = false) Member member) {
    	
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
    	return new ModelAndView ("my_starbucks/myinfo_modify");
    }
    
    /**
     * 탈퇴 페이지
     */
    @RequestMapping(value = "/account/join_out", method = RequestMethod.GET)
    public ModelAndView join_out(Model model,
            @SessionAttribute(value = "member", required = false) Member member) {
    	
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
        return new ModelAndView ("my_starbucks/join_out_mem");
    }
    
    /**
     * 탈퇴 페이지2 (비번검사)
     */
    @RequestMapping(value = "/account/join_out2", method = RequestMethod.GET)
    public ModelAndView join_out2(Model model,
            @SessionAttribute(value = "member", required = false) Member member) {
    	
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
        return new ModelAndView ("my_starbucks/join_out_mem2");
    }
    
    /**
     * 비밀번호 수정 페이지
     */
    @RequestMapping(value = "/account/myinfo_change_pw", method = RequestMethod.GET)
    public ModelAndView myinfo_change_pw(Model model,
            @SessionAttribute(value = "member", required = false) Member member) {
    	
        // 비회원, 다른 회원으로 부터의 접근 제한
    	if (member == null) {
        	return new ModelAndView ("page_none");
    	}
    	
        return new ModelAndView ("my_starbucks/myinfo_change_pw");
    }
}
