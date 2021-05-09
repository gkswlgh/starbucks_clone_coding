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

import hanjiho.project.starbucks.helper.MailHelper;
import hanjiho.project.starbucks.helper.RegexHelper;
import hanjiho.project.starbucks.helper.WebHelper;
import hanjiho.project.starbucks.model.Card;
import hanjiho.project.starbucks.model.LikeMenu;
import hanjiho.project.starbucks.model.Member;
import hanjiho.project.starbucks.model.Voc;
import hanjiho.project.starbucks.service.CardService;
import hanjiho.project.starbucks.service.LikeMenuService;
import hanjiho.project.starbucks.service.MenuService;
import hanjiho.project.starbucks.service.VocService;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RestController
public class CardRestController {

    /** WebHelper 주입 */
    @Autowired
    WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired
    RegexHelper regexHelper;

    /** Service 패턴 구현체 주입 */
	@Autowired
	CardService cardService;

    /** 카드 등록 - Card update */
    @RequestMapping(value = "/my/rest/mycard_info_input", method = RequestMethod.POST)
    public Map<String, Object> del_like_menu(Model model,
            @SessionAttribute(value = "member", required = false) Member member,
            @RequestParam(value = "card_name",  required = false) String card_name,
            @RequestParam(value = "card_num1",  defaultValue = "0") int card_num1,
            @RequestParam(value = "card_num2",  defaultValue = "0") int card_num2,
            @RequestParam(value = "card_num3",  defaultValue = "0") int card_num3,
            @RequestParam(value = "card_num4",  defaultValue = "0") int card_num4,
            @RequestParam(value = "pin_num",  defaultValue = "0") int pin_num) {

    	//유효성검사
        if (!regexHelper.isValue(card_name)) { return webHelper.getJsonWarning("카드이름을 입력해주세요."); }
    	if (card_num1 == 0) { return webHelper.getJsonWarning("카드번호를 입력해주세요."); }
    	if (card_num2 == 0) { return webHelper.getJsonWarning("카드번호를 입력해주세요."); }
    	if (card_num3 == 0) { return webHelper.getJsonWarning("카드번호를 입력해주세요."); }
    	if (card_num4 == 0) { return webHelper.getJsonWarning("카드번호를 입력해주세요."); }
    	if (pin_num == 0) { return webHelper.getJsonWarning("핀번호를 입력해주세요."); }
    	if (member == null) { return webHelper.getJsonWarning("로그인 정보가 없습니다."); }
    	
    	String card_num = card_num1 + "" + card_num2 + "" + card_num3 + "" + card_num4;
    	
    	Card input = new Card();
    	input.setCard_num(card_num);
    	input.setPin_num(pin_num);

    	Card output = new Card();
    	try {
    		output = cardService.pinCheck(input);
    		// member_id , card_name 등록
        	output.setMember_id(member.getId());
        	output.setCard_name(card_name);
    		// editCard (update)
			cardService.editCard(output);
		} catch (Exception e) {
			e.printStackTrace();
		}

        return webHelper.getJsonData();
    }
}
