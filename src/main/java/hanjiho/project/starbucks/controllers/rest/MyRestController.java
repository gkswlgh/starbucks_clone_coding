package hanjiho.project.starbucks.controllers.rest;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import hanjiho.project.starbucks.helper.MailHelper;
import hanjiho.project.starbucks.helper.RegexHelper;
import hanjiho.project.starbucks.helper.Util;
import hanjiho.project.starbucks.helper.WebHelper;
import hanjiho.project.starbucks.model.Card;
import hanjiho.project.starbucks.model.Gift;
import hanjiho.project.starbucks.model.LikeMenu;
import hanjiho.project.starbucks.model.Member;
import hanjiho.project.starbucks.model.Voc;
import hanjiho.project.starbucks.service.CardService;
import hanjiho.project.starbucks.service.GiftService;
import hanjiho.project.starbucks.service.LikeMenuService;
import hanjiho.project.starbucks.service.MenuService;
import hanjiho.project.starbucks.service.VocService;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RestController
public class MyRestController {

    /** WebHelper 주입 */
    @Autowired
    WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired
    RegexHelper regexHelper;
    
    @Autowired
    Util util;
    
    @Autowired
    MailHelper mailHelper;

    /** Service 패턴 구현체 주입 */
	@Autowired
	MenuService menuService;
	@Autowired
	LikeMenuService likeMenuService;
	@Autowired
	GiftService giftService;
	@Autowired
	CardService cardService;
	
    /** likemenu 삭제 */
    @RequestMapping(value = "/rest/my/del_like_menu", method = RequestMethod.POST)
    public Map<String, Object> del_like_menu(
            // 메뉴일련번호
            @RequestParam(value = "like_id_list", required = false) String like_id_list) {

    	//유효성검사
    	if (!regexHelper.isValue(like_id_list)) {
			return webHelper.getJsonWarning("체크된 상품이 없습니다.");
		}
    	
    	String[] data = like_id_list.split(",");

    	// 데이터조회+삭제
        LikeMenu input = new LikeMenu();
		for (String item: data) {   
			//형변환 string to int
			int tmp = Integer.parseInt(item); 
			// 데이터삭제
			input.setLike_id(tmp);
	        try {
	        	likeMenuService.deleteLikeMenu(input);
	        } catch (Exception e) {
	            return webHelper.getJsonError(e.getLocalizedMessage());
	        }
		}
		
        return webHelper.getJsonData();
    }
    

    /**
     * 선물하기 3 페이지 (정보 저장) Gift insert
     */
    @RequestMapping(value = "/my/rest/gift_step3", method = RequestMethod.POST)
    public Map<String, Object> gift_step3(Model model,
            @SessionAttribute(value = "member", required = false) Member member,
            @RequestParam(value = "to_mem_name", required = false) String name,
            @RequestParam(value = "to_mem_email",     required = false) String email,
            @RequestParam(value = "message",     required = false) String message,
            @RequestParam(value = "gift_price",     defaultValue = "0") int price) {

        //유효성검사
        if (!regexHelper.isValue(name)) { return webHelper.getJsonWarning("이름을 입력해주세요."); }
        if (!regexHelper.isValue(email)) { return webHelper.getJsonWarning("이메일을 입력해주세요."); }
        if (!regexHelper.isEmail(email)) { return webHelper.getJsonWarning("이메일이 잘못되었습니다."); }
        if (!regexHelper.isValue(message)) { return webHelper.getJsonWarning("메시지를 입력해주세요."); }
        if (price == 0) { return webHelper.getJsonWarning("금액을 지정해주세요."); }

    	/** 1) 선물 정보 저장할 input */
    	Gift input = new Gift();

    	//input에 저장
    	if (member != null) {
        	input.setMember_id(member.getId());
    	} else {
    		return webHelper.getJsonWarning("로그인 정보가 없습니다.");
    	}
    	input.setTo_mem_name(name);
    	input.setTo_mem_email(email);
    	input.setMessage(message);
    	input.setGift_price(price);


    	/** 2) 카드 정보 생성할 input2 */
    	Card input2 = new Card();
    	
    	/** 3) 카드ID, 인증번호 생성 */
    	String cardId1 = "";
        String cardId2 = "";
        String cardId3 = "";
        String cardId4 = "";
        int pinNum = 0;
    	while (true) {
    		int count = 0;
    		//카드번호
            cardId1 = util.random(1000, 9999)+"";
            cardId2 = util.random(1000, 9999)+"";
            cardId3 = util.random(1000, 9999)+"";
            cardId4 = util.random(1000, 9999)+"";
            String cardId = cardId1+cardId2+cardId3+cardId4;
            //검사
        	Card tmp = new Card();
        	tmp.setCard_num(cardId);
        	try {
        		count += cardService.pinCheckCount(tmp);
            } catch (Exception e) {
                return webHelper.getJsonError(e.getLocalizedMessage());
            }

        	//핀번호
            pinNum = util.random(10000000, 99999999);
            //검사
        	Card tmp2 = new Card();
        	tmp2.setPin_num(pinNum);
        	try {
        		count += cardService.pinCheckCount(tmp2);
            } catch (Exception e) {
                return webHelper.getJsonError(e.getLocalizedMessage());
            }
        	
            if (count == 0) {
            	//input2에 저장 - 1
            	input2.setCard_num(cardId);
            	input2.setPin_num(pinNum);
                break; //강제종료
            }
        }

    	//input2에 저장 - 2
    	input2.setGift_mem_id(member.getId());
    	input2.setCash(price);

    	
        Map<String, Object> data = new HashMap<String, Object>();
    	try {
        	giftService.addGift(input);
        	cardService.addCard(input2);
        	
            //json에 담아 넘길 유저 일련번호 저장
            data.put("gift_id", input.getGift_id());
        	
        	/** 4) 이메일 발송 */
            String receiver = email;
            String subject = "[스타벅스(한지호 포트폴리오)]"+ member.getUser_name() + "님으로부터 스타벅스 eGift Card 선물 도착.";
            String content = "<p style='margin:10px;border:1px solid #ddd;padding:20px;font-size:15px;'>"
            		+"<br>선물 받은 카드는 홈페이지에서 로그인 후 카드 등록 페이지에서 등록하면 사용하실 수 있습니다.<br>" 
            		+"<span style='font-size:22px;'> 카드번호(16자리) : "
            		+ cardId1 + " - " + cardId2 + " - " + cardId3 + " - " + cardId4 + "<br>PIN 번호 : "
            		+ pinNum +"</span></p>";
            mailHelper.sendMail(receiver, subject, content);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }
    	
        return webHelper.getJsonData(data);
    }
}
