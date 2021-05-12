package hanjiho.project.starbucks.scheduler;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import hanjiho.project.starbucks.model.Card;
import hanjiho.project.starbucks.service.CardService;
import hanjiho.project.starbucks.service.CartService;
import hanjiho.project.starbucks.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SimpleScheduler {
	@Autowired
	MemberService memberService;
	@Autowired
	CardService cardService;
	@Autowired
	CartService cartService;
	
	/**
	 * 매일 자정 실행되는 작업
	 * @throws Exception
	 */
	public void everyMidnight() throws Exception {
		
		/* 1) 탈퇴회원 삭제 */
		log.debug("매일 자정에 실행되는 작업 - 탈퇴회원삭제 >> " + memberService.deleteMember());
		
		/* 2) 자동 충전 */
		//자동충전기능을 사용중이고 충전일이 오늘인 카드 조회
		List<Card> autoList = new ArrayList<Card>();
		autoList = cardService.autoList();
		if (autoList != null) {
			for (Card item: autoList) {
				//충전후 잔액합계
				int cash = item.getCash();
				int autoCash = item.getCharge_cash();
				item.setCash(cash+autoCash);
				log.debug("매일 자정에 실행되는 작업 - 자동충전 (카드ID:"+item.getCard_id()+",충전액:"+autoCash+") >> " + cardService.chargeSchedule(item));
			}
		}
		
		/* 3) 일주일 지난 장바구니(cart) 삭제 */
		log.debug("매일 자정에 실행되는 작업 - 장바구니삭제 >> " + cartService.deleteWeek());
		
	}
}