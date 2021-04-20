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

import hanjiho.project.starbucks.helper.MailHelper;
import hanjiho.project.starbucks.helper.RegexHelper;
import hanjiho.project.starbucks.helper.WebHelper;
import hanjiho.project.starbucks.model.Member;
import hanjiho.project.starbucks.model.Voc;
import hanjiho.project.starbucks.service.VocService;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RestController
public class MyPageRestController {

    /** WebHelper 주입 */
    @Autowired
    WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired
    RegexHelper regexHelper;
    
    @Autowired
    MailHelper mailHelper;

    /** Service 패턴 구현체 주입 */
    @Autowired
    VocService vocService;

    /** 문의(voc) 저장 */
    @RequestMapping(value = "/rest/voc", method = RequestMethod.POST)
    public Map<String, Object> voc(
            @RequestParam(value = "id",				 required=false) Integer memberId,
            @RequestParam(value = "TP_VOC_DEMAND",      required = false) String vocDemand,
            @RequestParam(value = "CD_VOC_CAUSE",        required = false) String vocCause,
            @RequestParam(value = "email1",     required = false) String email1,
            @RequestParam(value = "email2",     required = false) String email2,
			@RequestParam(value = "phone1", 	required = false) String phone1,
			@RequestParam(value = "phone2", 	required = false) String phone2,
			@RequestParam(value = "phone3", 	required = false) String phone3,
            @RequestParam(value = "visit",       required = false) String visit, 
            @RequestParam(value = "visit_store",       required = false) String visit_store, 
            @RequestParam(value = "visit_date",       required = false) String visit_date, 
            @RequestParam(value = "voc_title",         required = false) String voc_title, 
            @RequestParam(value = "voc_txt",         required = false) String voc_txt) {

        /** 1) 유효성 검증 */
        // POSTMAN 등의 클라이언트 프로그램으로 백엔드에 직접 접속하는 경우를 방지하기 위해
        // REST컨트롤러에서도 프론트의 유효성 검증과 별개로 자체 유효성 검증을 수행해야 한다.
        if (!regexHelper.isValue(vocDemand)) { return webHelper.getJsonWarning("문의유형을 입력하세요."); }
        if (!regexHelper.isNum(vocDemand)) { return webHelper.getJsonWarning("문의유형엔 숫자만 입력 가능합니다."); }
        if (!regexHelper.isValue(vocCause)) { return webHelper.getJsonWarning("분류 항목을 입력하세요."); }
        if (!regexHelper.isNum(vocCause)) { return webHelper.getJsonWarning("분류 항목엔 숫자만 입력 가능합니다."); }
        
        //이메일 조립- 유효성검사
        String email = email1 + "@" + email2;
        if (!regexHelper.isValue(email1)) { return webHelper.getJsonWarning("이메일을 입력해주세요."); }
        if (!regexHelper.isValue(email2)) { return webHelper.getJsonWarning("이메일을 입력해주세요."); }
        if (!regexHelper.isEmail(email)) { return webHelper.getJsonWarning("이메일이 잘못되었습니다."); }
        
        // 전화번호 조립 - 유효성검사
        if (!regexHelper.isValue(phone1)) { return webHelper.getJsonWarning("휴대폰 번호를 입력해주세요."); }
        if (!regexHelper.isValue(phone2)) { return webHelper.getJsonWarning("휴대폰 번호를 입력해주세요."); }
        if (!regexHelper.isValue(phone3)) { return webHelper.getJsonWarning("휴대폰 번호를 입력해주세요."); }
     	String tel = phone1 + phone2 + phone3;
     	if (!regexHelper.isTel(tel)) {
     			return webHelper.getJsonWarning("전화번호 형식이 잘못되었습니다");
     		}
        if (!regexHelper.isValue(visit)) { return webHelper.getJsonWarning("매방 방문 여부를 선택하세요."); }
        if (visit == "Y") {
         	if (!regexHelper.isValue(visit_store)) { return webHelper.getJsonWarning("방문 매장명을 입력하세요."); }
         	if (!regexHelper.isValue(visit_date)) { return webHelper.getJsonWarning("매장 방문일을 입력하세요."); }
        }
        if (visit_date == "") {
        	visit_date = null;
        }
        if (visit_store == "") {
        	visit_store = null;
        }
     	if (!regexHelper.isValue(voc_title)) { return webHelper.getJsonWarning("제목을 입력하세요."); }
     	if (!regexHelper.isValue(voc_txt)) { return webHelper.getJsonWarning("내용을 입력하세요."); }
        
        // 전화번호 조립 - 최종
     		tel = phone1 + ")" + phone2 + "-" + phone3;
         
        /** 3) 데이터 저장 */
        Voc input = new Voc();
		input.setPhone(tel);
		input.setEmail(email);
		input.setVisit_store(visit);
		input.setStore_name(visit_store);
		input.setVisit_date(visit_date);
		input.setVoc_ttl(voc_title);
		input.setVoc_txt(voc_txt);
		input.setVoc_type(vocDemand);
		input.setVoc_type2(vocCause);
		input.setMember_id(memberId);

        try {
        	vocService.addVoc(input);
//            /** 4) 이메일 발송 */
//            String receiver = email;
//            String subject = "[스타벅스(한지호 포트폴리오)] 문의가 접수되었습니다.";
//            String content = "<p style='padding:20px;font-size:15px;'>"
//            		+"아래는 접수된 내용입니다.<hr><br>"
//            		+"제목: "+ voc_title
//            		+"<br>내용: "+ voc_txt + "</p>";
//            mailHelper.sendMail(receiver, subject, content);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 4) 결과 표시 */
        return webHelper.getJsonData();
    }
}
