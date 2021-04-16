package hanjiho.project.starbucks.controllers.rest;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import hanjiho.project.starbucks.helper.RegexHelper;
import hanjiho.project.starbucks.helper.WebHelper;
import hanjiho.project.starbucks.model.Member;
import hanjiho.project.starbucks.service.MemberService;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RestController
public class AccountRestController {

    /** WebHelper 주입 */
    @Autowired
    WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired
    RegexHelper regexHelper;

    /** Service 패턴 구현체 주입 */
    @Autowired
    MemberService memberService;
            
    /** 아이디 중복검사 */
    @RequestMapping(value = "/rest/account/id_unique_check", method = RequestMethod.POST)
    public Map<String, Object> idUniqueCheck(
            // 아이디
            @RequestParam(value = "user_id", required = false) String userId) {

        if (!regexHelper.isValue(userId)) {
            return webHelper.getJsonWarning("아이디를 입력하세요.");
        }
        
        Member input = new Member();
        
        input.setUser_id(userId);   
         
        try {
            memberService.idUniqueCheck(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        return webHelper.getJsonData();
    }
    
    /** 아이디 중복검사 (jQuery Form Validate 플러그인용) */
    // controller에서 out 객체의 출력결과를 웹브라우저에게 전달할 수 있게 하는 옵션
    @ResponseBody
    @RequestMapping(value = "/rest/account/id_unique_check_jquery", method = RequestMethod.POST)
    public void idUniqueCheckjQuery(HttpServletResponse response,
            // 아이디
            @RequestParam(value = "user_id", required = false) String userId) {
        
        Member input = new Member();
        input.setUser_id(userId);
        String result = "true";
        
        try {
            memberService.idUniqueCheck(input);
        } catch (Exception e) {
            result = "false";
        }

        // out객체를 생성하여 문자열을 직접 출력함
        try {
            response.getWriter().print(result);
        } catch (IOException e) {}
    }
    
    
    /** 이메일 중복검사 */
    @RequestMapping(value = "/rest/account/email_unique_check", method = RequestMethod.POST)
    public Map<String, Object> emailUniqueCheck(
            // email
            @RequestParam(value = "user_email",     required = false) String userEmail) {
    	
        //이메일 조립- 유효성검사
        if (!regexHelper.isEmail(userEmail)) { return webHelper.getJsonWarning("이메일 형식이 잘못되었습니다."); }

        if (!regexHelper.isValue(userEmail)) {
            return webHelper.getJsonWarning("이메일을 입력하세요.");
        }
        
        if (!regexHelper.isEmail(userEmail)) {
            return webHelper.getJsonWarning("이메일 주소가 잘못되었습니다.");
        }
        
        Member input = new Member();
        input.setUser_email(userEmail);
        
        try {
            memberService.emailUniqueCheck(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        return webHelper.getJsonData();
    }
    
    /** 이메일 중복검사 (jQuery Form Validate 플러그인용) */
    // controller에서 out 객체의 출력결과를 웹브라우저에게 전달할 수 있게 하는 옵션
    @ResponseBody
    @RequestMapping(value = "/rest/account/email_unique_check_jquery", method = RequestMethod.POST)
    public void emailUniqueCheckjQuery(HttpServletResponse response,
            // 아이디
            @RequestParam(value = "email", required = false) String email) {
        
        Member input = new Member();
        input.setUser_email(email);
        String result = "true";
        
        try {
            memberService.emailUniqueCheck(input);
        } catch (Exception e) {
            result = "false";
        }

        // out객체를 생성하여 문자열을 직접 출력함
        try {
            response.getWriter().print(result);
        } catch (IOException e) {}
    }

    /** 회원가입 */
    @RequestMapping(value = "/rest/account/join", method = RequestMethod.POST)
    public Map<String, Object> join(
            @RequestParam(value = "user_id",        required = false) String userId,
            @RequestParam(value = "user_pw",        required = false) String userPw,
            @RequestParam(value = "user_pw_re",required = false) String userPwConfirm,
            @RequestParam(value = "user_name",      required = false) String userName,
            @RequestParam(value = "email1",     required = false) String email1,
            @RequestParam(value = "email2",     required = false) String email2,
			@RequestParam(value = "phone1", 	required = false) String phone1,
			@RequestParam(value = "phone2", 	required = false) String phone2,
			@RequestParam(value = "phone3", 	required = false) String phone3,
            @RequestParam(value = "birthdate",       required = false) String birthdate, 
            @RequestParam(value = "gender",         required = false) String gender
//            ,
//            @RequestParam(value = "postcode",       required = false) String postcode,
//            @RequestParam(value = "addr1",          required = false) String addr1,
//            @RequestParam(value = "addr2",          required = false) String addr2
            ) {

        /** 1) 유효성 검증 */
        // POSTMAN 등의 클라이언트 프로그램으로 백엔드에 직접 접속하는 경우를 방지하기 위해
        // REST컨트롤러에서도 프론트의 유효성 검증과 별개로 자체 유효성 검증을 수행해야 한다. 
        if (!regexHelper.isValue(userId)) { return webHelper.getJsonWarning("아이디를 입력하세요."); }
        if (!regexHelper.isEngNum(userId)) { return webHelper.getJsonWarning("아이디는 영어,숫자만 입력 가능합니다."); }
        if (userId.length() < 4 || userId.length() > 30) { return webHelper.getJsonWarning("아이디는 4~30글자로 입력 가능합니다."); }
        if (!regexHelper.isValue(userName)) { return webHelper.getJsonWarning("이름을 입력하세요."); }
        if (!regexHelper.isKor(userName)) { return webHelper.getJsonWarning("이름은 한글만 입력 가능합니다."); }
        
        if (!regexHelper.isValue(userPw)) { return webHelper.getJsonWarning("비밀번호를 입력하세요."); }
        if (userPw.length() < 4 || userPw.length() > 30) { return webHelper.getJsonWarning("비밀번호는 4~30글자로 입력 가능합니다."); }
        if (!userPw.equals(userPwConfirm)) { return webHelper.getJsonWarning("비밀번호는 확인이 잘못되었습니다."); }
        
        //이메일 조립- 유효성검사
        String userEmail = email1 + "@" + email2;
        if (!regexHelper.isValue(email1)) { return webHelper.getJsonWarning("이메일을 입력해주세요."); }
        if (!regexHelper.isValue(email2)) { return webHelper.getJsonWarning("이메일을 입력해주세요."); }
        if (!regexHelper.isEmail(userEmail)) { return webHelper.getJsonWarning("이메일이 잘못되었습니다."); }
        
        // 전화번호 조립 - 유효성검사
     	String tel = phone1 + phone2 + phone3;
     	if (!regexHelper.isTel(tel)) {
     			return webHelper.getJsonWarning("전화번호 형식이 잘못되었습니다");
     		}
        if (!regexHelper.isValue(gender)) { return webHelper.getJsonWarning("성별을 입력하세요."); }
     	if (!regexHelper.isValue(birthdate)) { return webHelper.getJsonWarning("생년월일을 입력하세요."); }
//        if (postcode.length() < 5 || postcode.length() > 5 || !regexHelper.isNum(postcode)) { return webHelper.getJsonWarning("우편번호 형식이 잘못되었습니다."); }
//        if (!regexHelper.isValue(addr1)) { return webHelper.getJsonWarning("주소1을 입력하세요."); }
//        if (!regexHelper.isValue(addr2)) { return webHelper.getJsonWarning("주소2를 입력하세요."); }
        
        
        // 전화번호 조립 - 최종
     		tel = phone1 + ")" + phone2 + "-" + phone3;
        
        /** 3) 데이터 저장 */
        Member input = new Member();
		input.setUser_id(userId);
		input.setUser_pw(userPw);
		input.setUser_name(userName);
		input.setUser_email(userEmail);
		input.setPhone(tel);
		input.setBirthdate(birthdate);
		input.setGender(gender);
		input.setIs_out("N"); // 탈퇴아님 --> 탈퇴시 'Y'로 업데이트
		input.setPostcode(null);
		input.setAddr1(null);
		input.setAddr2(null);
        
        try {
            memberService.addMember(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 4) 결과 표시 */
        return webHelper.getJsonData();
    }
    

    /** 이메일로 아이디 찾기 */
    @RequestMapping(value = "/rest/account/find_id", method = RequestMethod.POST)
    public Map<String, Object> find_id(
            @RequestParam(value = "txt_user_email",     required = false) String email) {

        /** 1) 유효성 검증 */
        // POSTMAN 등의 클라이언트 프로그램으로 백엔드에 직접 접속하는 경우를 방지하기 위해
        // REST컨트롤러에서도 프론트의 유효성 검증과 별개로 자체 유효성 검증을 수행해야 한다. 
        if (!regexHelper.isValue(email)) { return webHelper.getJsonWarning("이메일을 입력해주세요."); }
        if (!regexHelper.isEmail(email)) { return webHelper.getJsonWarning("이메일이 잘못되었습니다."); }

        /** 2) 데이터 조회 */
        Member input = new Member();
        input.setUser_email(email);
        
        /** 3) 로그인 */
        Member output = null;
        Map<String, Object> data = new HashMap<String, Object>();
        
        try {
            output = memberService.find_id(input);
            
            //json에 담아 넘길 유저 일련번호 저장
            data.put("id", output.getId());
			
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }
        
        /** 4) 결과 표시 */
        return webHelper.getJsonData(data);
    }

    /** 로그인 */
    @RequestMapping(value = "/rest/account/login", method = RequestMethod.POST)
    public Map<String, Object> login(
            @RequestParam(value = "user_id",        required = false) String userId,
            @RequestParam(value = "user_pw",        required = false) String userPw) {

        /** 1) 유효성 검증 */
        // POSTMAN 등의 클라이언트 프로그램으로 백엔드에 직접 접속하는 경우를 방지하기 위해
        // REST컨트롤러에서도 프론트의 유효성 검증과 별개로 자체 유효성 검증을 수행해야 한다. 
        if (!regexHelper.isValue(userId)) { return webHelper.getJsonWarning("아이디를 입력하세요."); }
        if (!regexHelper.isValue(userPw)) { return webHelper.getJsonWarning("비밀번호를 입력하세요."); }

        /** 2) 데이터 조회 */
        Member input = new Member();
        input.setUser_id(userId);
        input.setUser_pw(userPw);
        
        /** 3) 로그인 */
        Member output = null;
        
        try {
            output = memberService.login(input);
            
			//phone자르기
			String tel = output.getPhone();
			output.setPhone1(tel.substring(0, tel.lastIndexOf(")")));
			output.setPhone2(tel.substring(tel.lastIndexOf(")")+1, tel.lastIndexOf("-")));
			output.setPhone3(tel.substring(tel.lastIndexOf("-")+1));
			
			//email자르기
			String email = output.getUser_email();
			output.setEmail1(email.substring(0, email.lastIndexOf("@")));
			output.setEmail2(email.substring(email.lastIndexOf("@")+1));
			
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }
        

        /** 4) 세션 생성 및 결과 표시 */
        webHelper.setSession("member", output);
        log.debug("세션 저장 완료");
        return webHelper.getJsonData();
    }

    /** 로그아웃 */
    @RequestMapping(value = "/rest/account/logout", method = RequestMethod.GET)
    public Map<String, Object> logout() {
        webHelper.removeAllSession();
        return webHelper.getJsonData();
    }
    
    /** 회원정보수정 */
    @RequestMapping(value = "/rest/account/myinfo_modify", method = RequestMethod.POST)
    public Map<String, Object> modify(
            @RequestParam(value = "id",        required = false) int id,
            @RequestParam(value = "user_name",      required = false) String userName,
			@RequestParam(value = "phone1", 	required = false) String phone1,
			@RequestParam(value = "phone2", 	required = false) String phone2,
			@RequestParam(value = "phone3", 	required = false) String phone3,
            @RequestParam(value = "birthdate",       required = false) String birthdate, 
            @RequestParam(value = "gender",         required = false) String gender) {

        /** 1) 유효성 검증 */
        // POSTMAN 등의 클라이언트 프로그램으로 백엔드에 직접 접속하는 경우를 방지하기 위해
        // REST컨트롤러에서도 프론트의 유효성 검증과 별개로 자체 유효성 검증을 수행해야 한다. 
        if (!regexHelper.isValue(userName)) { return webHelper.getJsonWarning("이름을 입력하세요."); }
        if (!regexHelper.isKor(userName)) { return webHelper.getJsonWarning("이름은 한글만 입력 가능합니다."); }
        
        // 전화번호 조립 - 유효성검사
     	String tel = phone1 + phone2 + phone3;
     	if (!regexHelper.isTel(tel)) {
     			return webHelper.getJsonWarning("전화번호 형식이 잘못되었습니다");
     		}
        if (!regexHelper.isValue(gender)) { return webHelper.getJsonWarning("성별을 입력하세요."); }
     	if (!regexHelper.isValue(birthdate)) { return webHelper.getJsonWarning("생년월일을 입력하세요."); }
        
        
        // 전화번호 조립 - 최종
     		tel = phone1 + ")" + phone2 + "-" + phone3;
        
        /** 3) 데이터 저장 */
        Member input = new Member();
		input.setId(id);
		input.setUser_name(userName);
		input.setPhone(tel);
		input.setBirthdate(birthdate);
		input.setGender(gender);
		
        Member output = new Member();
        
        try {
            memberService.editMember(input);
            output = memberService.getMemberItem(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }


        /** 4) 세션 생성 및 결과 표시 */
        webHelper.setSession("member", output);
        log.debug("세션 저장 완료");
        return webHelper.getJsonData();
    }
    
    /** 회원탈퇴 */
    @RequestMapping(value = "/rest/account/join_out", method = RequestMethod.POST)
    public Map<String, Object> join_out(
            @RequestParam(value = "id",        required = false) int id,
            @RequestParam(value = "user_id",        required = false) String userId,
            @RequestParam(value = "user_pw",   required = false) String userPw) {

        /** 데이터 저장 */
        Member input = new Member();
		input.setId(id);
		input.setUser_id(userId);
		input.setUser_pw(userPw);
        
        try {
            int result = memberService.checkPw(input);
            if (result == 1) {
                memberService.joinOut(input);
            } else {
                return webHelper.getJsonError("데이터 조회 실패.");
            }
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }
        
        /**로그아웃*/
        webHelper.removeAllSession();

        /** 결과 표시 */
        return webHelper.getJsonData();
    }
    
}
