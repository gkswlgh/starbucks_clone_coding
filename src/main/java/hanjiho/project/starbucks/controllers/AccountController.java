package hanjiho.project.starbucks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import hanjiho.project.starbucks.helper.MailHelper;
import hanjiho.project.starbucks.helper.Util;
import hanjiho.project.starbucks.helper.WebHelper;
import hanjiho.project.starbucks.model.Member;
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
    @RequestMapping(value = "/account/find_id_ok/{id}", method = RequestMethod.GET)
    public ModelAndView find_id_ok(Model model,
    		@PathVariable(value = "id") int id) {

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
     * 비번찾기 페이지
     */
    @RequestMapping(value = "/account/find_pw", method = RequestMethod.GET)
    public String find_pw() {
        return "find_pw";
    }
    
    /**
     * 비번찾기 페이지2 - 이메일인증
     */
    @RequestMapping(value = "/account/find_pw_au/{id}", method = RequestMethod.GET)
    public ModelAndView find_pw_au(Model model,
    		@PathVariable(value = "id") int id) {

        /** 1) 데이터 조회 */
        Member input = new Member();
        input.setId(id);
        
        /** 2) 회원조회 */
        Member output = new Member();
        int auNum = 0;
        try {
            output = memberService.getMemberItem(input);
            
            /** 3) 인증번호 생성 */
            auNum = util.random(100000, 999999);
            output.setAu_num(auNum);
            
            memberService.updateAuNum(output);
            
            /** 4) 이메일 발송 */
            String receiver = output.getUser_email();
            String subject = "[스타벅스(한지호 포트폴리오)] 인증번호를 확인해주세요.";
            String content = "<p style='margin:10px;border:1px solid #ddd;padding:20px;font-size:15px;'>"
            		+"<br> 이메일 인증페이지로 돌아가 다음 6자리 숫자를 입력해주세요.<br>" 
            		+"<span style='font-size:22px;'>"
            		+ auNum +"</span></p>";
            mailHelper.sendMail(receiver, subject, content);
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
        }
        
        /** 5) view */
        model.addAttribute("output", output);
        return new ModelAndView ("find_pw_au");
    }
    
    /**
     * 비번찾기 페이지3 - 비번교체
     */
    @RequestMapping(value = "/account/change_pw/{id}", method = RequestMethod.GET)
    public ModelAndView change_pw(Model model,
    		@PathVariable(value = "id") int id) {

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
    @RequestMapping(value = "/account/find_pw_ok/{id}", method = RequestMethod.GET)
    public ModelAndView find_pw_ok(Model model,
    		@PathVariable(value = "id") int id) {

        /** 2) 데이터 조회 */
        Member input = new Member();
        input.setId(id);

        Member output = new Member();
        try {
			output = memberService.getMemberItem(input);
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
    public String modify() {
        return "my_starbucks/myinfo_modify";
    }
    
    /**
     * 탈퇴 페이지
     */
    @RequestMapping(value = "/account/join_out", method = RequestMethod.GET)
    public String join_out() {
        return "my_starbucks/join_out_mem";
    }
    
    /**
     * 탈퇴 페이지2 (비번검사)
     */
    @RequestMapping(value = "/account/join_out2", method = RequestMethod.GET)
    public String join_out2() {
        return "my_starbucks/join_out_mem2";
    }
    
    /**
     * 비밀번호 수정 페이지
     */
    @RequestMapping(value = "/account/myinfo_change_pw", method = RequestMethod.GET)
    public String myinfo_change_pw() {
        return "my_starbucks/myinfo_change_pw";
    }
}
