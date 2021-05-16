package hanjiho.project.starbucks.controllers.rest;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import hanjiho.project.starbucks.helper.RegexHelper;
import hanjiho.project.starbucks.helper.WebHelper;
import hanjiho.project.starbucks.model.Card;
import hanjiho.project.starbucks.model.Member;
import hanjiho.project.starbucks.service.CardService;
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
    public Map<String, Object> mycard_info_input(Model model,
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
		} catch (Exception e) {
			e.printStackTrace();
			return webHelper.getJsonWarning("카드번호 혹은 PIN번호를 다시 한번 확인해주세요.");
		}
    	try {
    		// editCard (update -> pin_num은 null로 / member_id, card_name 등록)
			cardService.editCard(output);
		} catch (Exception e) {
			e.printStackTrace();
			return webHelper.getJsonWarning("카드 등록에 실패했습니다.");
		}

        return webHelper.getJsonData();
    }
    
    
    /** 카드 이름 변경 - Card update */
    @RequestMapping(value = "/my/rest/editcard_name", method = RequestMethod.POST)
    public Map<String, Object> editcard_name(Model model,
            @SessionAttribute(value = "member", required = false) Member member,
            @RequestParam(value = "card_name",  required = false) String card_name,
            @RequestParam(value = "card_id",  required = false) int card_id) {

    	//유효성검사
        if (!regexHelper.isValue(card_name)) { return webHelper.getJsonWarning("카드이름을 입력해주세요."); }
    	if (member == null) { return webHelper.getJsonWarning("로그인 정보가 없습니다."); }
    	if (card_id == 0) { return webHelper.getJsonWarning("카드 정보가 없습니다."); }
    	
    	Card input = new Card();
    	input.setCard_id(card_id);
    	input.setCard_name(card_name);
    	
    	try {
			cardService.editName(input);

		} catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
		}

        return webHelper.getJsonData();
    }
    

    /** 카드 충전 (잔액 변경) - Card update */
    @RequestMapping(value = "/my/rest/charge", method = RequestMethod.POST)
    public Map<String, Object> charge(Model model,
            @SessionAttribute(value = "member", required = false) Member member,
            @RequestParam(value = "card_id",  required = false) int card_id,
            @RequestParam(value = "cash",  required = false) int cash) {

    	//유효성검사
    	if (member == null) { return webHelper.getJsonWarning("로그인 정보가 없습니다."); }
    	if (card_id == 0) { return webHelper.getJsonWarning("카드 정보가 없습니다."); }
    	if (cash == 0) { return webHelper.getJsonWarning("충전액 정보가 없습니다."); }
    	
    	Card input = new Card();
    	input.setCard_id(card_id);

    	//잔액확인
    	Card output = new Card();
    	try {
    		output = cardService.getCardItem(input);
		} catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
		}

    	//충전
    	int sum = output.getCash() + cash;
    	input.setCash(sum);
    	input.setOrder_price(cash);
    	try {
    		cardService.charge(input);
		} catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
		}

        Map<String, Object> data = new HashMap<String, Object>();
        //json에 담아 넘길 카드 일련번호 저장
        data.put("card_id", card_id);
        return webHelper.getJsonData(data);
    }
    


    /** 카드 자동 충전 (설정 변경) - Card update */
    @RequestMapping(value = "/my/rest/auto_charge", method = RequestMethod.POST)
    public Map<String, Object> auto_charge(Model model,
            @SessionAttribute(value = "member", required = false) Member member,
            @RequestParam(value = "card_id",  required = false) int card_id,
            @RequestParam(value = "charge_schedule",  required = false) String charge_schedule,
            @RequestParam(value = "charge_cash",  required = false) int charge_cash) {

    	//유효성검사
        if (!regexHelper.isValue(charge_schedule)) { return webHelper.getJsonWarning("충전일을 입력해주세요."); }
    	if (member == null) { return webHelper.getJsonWarning("로그인 정보가 없습니다."); }
    	if (card_id == 0) { return webHelper.getJsonWarning("카드 정보가 없습니다."); }
    	if (charge_cash == 0) { return webHelper.getJsonWarning("충전액 정보가 없습니다."); }
    	
    	Card input = new Card();
    	input.setCard_id(card_id);
    	input.setCharge_schedule(charge_schedule);
    	input.setCharge_cash(charge_cash);

    	//설정변경
    	try {
    		cardService.autoCharge(input);
		} catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
		}

        Map<String, Object> data = new HashMap<String, Object>();
        //json에 담아 넘길 카드 일련번호 저장
        data.put("card_id", card_id);
        return webHelper.getJsonData(data);
    }

    /** 카드 자동 충전 해지 (설정 변경) - Card update */
    @RequestMapping(value = "/my/rest/auto_cancel", method = RequestMethod.POST)
    public Map<String, Object> auto_cancel(Model model,
            @SessionAttribute(value = "member", required = false) Member member,
            @RequestParam(value = "card_id",  required = false) int card_id) {

    	//유효성검사
    	if (member == null) { return webHelper.getJsonWarning("로그인 정보가 없습니다."); }
    	if (card_id == 0) { return webHelper.getJsonWarning("카드 정보가 없습니다."); }
    	
    	Card input = new Card();
    	input.setCard_id(card_id);

    	//설정변경
    	try {
    		cardService.autoChargeCancel(input);
		} catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
		}

        Map<String, Object> data = new HashMap<String, Object>();
        //json에 담아 넘길 카드 일련번호 저장
        data.put("card_id", card_id);
        return webHelper.getJsonData(data);
    }
    

    /** 카드 잔액 이전 - Card update */
    @RequestMapping(value = "/my/rest/balance_trs", method = RequestMethod.POST)
    public Map<String, Object> balance_trs(Model model,
            @SessionAttribute(value = "member", required = false) Member member,
            @RequestParam(value = "card_id",  required = false) int card_id,
            @RequestParam(value = "card_id_new",  required = false) int card_id_new) {

    	//유효성검사
    	if (member == null) { return webHelper.getJsonWarning("로그인 정보가 없습니다."); }
    	if (card_id == 0) { return webHelper.getJsonWarning("카드 정보가 없습니다."); }
    	if (card_id_new == 0) { return webHelper.getJsonWarning("이전할 카드 정보가 없습니다."); }
    	
    	//기존카드 데이터입력
    	Card input = new Card();
    	input.setCard_id(card_id);
    	//이전할카드 데이터입력
    	Card input2 = new Card();
    	input2.setCard_id(card_id_new);
    	
    	int tmp = 0;
    	int tmp2 = 0;

    	//잔액확인
    	Card output = new Card();
    	try {
    		output = cardService.getCardItem(input);
    		tmp = output.getCash(); 
    		output = cardService.getCardItem(input2);
    		tmp2 = output.getCash(); 
		} catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
		}

    	//충전
    	tmp += tmp2;
    	input2.setCash(tmp);
    	input.setCash(0);
    	try {
    		//cash에 tmp저장
    		cardService.charge(input2);
    		//cash에 0저장
    		cardService.charge(input);
		} catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
		}
    	
        return webHelper.getJsonData();
    }


    /** 카드 삭제 - Card delete */
    @RequestMapping(value = "/my/rest/del_card", method = RequestMethod.POST)
    public Map<String, Object> del_card(Model model,
            @SessionAttribute(value = "member", required = false) Member member,
            @RequestParam(value = "card_id",  required = false) int card_id) {

    	//유효성검사
    	if (member == null) { return webHelper.getJsonWarning("로그인 정보가 없습니다."); }
    	if (card_id == 0) { return webHelper.getJsonWarning("카드 정보가 없습니다."); }
    	
    	Card input = new Card();
    	input.setCard_id(card_id);

    	Card output = new Card();
    	try {
    		//로그인정보로 본인확인
    		output = cardService.getCardItem(input);
	    	if (member.getId() != output.getMember_id()) { return webHelper.getJsonWarning("잘못된 접근 방식입니다."); }
			//삭제
	    	cardService.deleteCard(input);
		} catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
		}

        return webHelper.getJsonData();
    }


}
