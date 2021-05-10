package hanjiho.project.starbucks.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;
import hanjiho.project.starbucks.model.Card;

//Lombok의 Log4j객체
//->import lombok.extern.slf4j.Slf4j;
@Slf4j

//JUnit에 의한 테스트 클래스로 정의
//->import org.junit.runner.RunWith;
//->import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)

//Spring의 설정 파일들을 읽어들이도록 설정 (**은 '모든'이라는 의미)
//-> import org.springframework.test.context.ContextConfiguration;
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })

//웹 어플리케이션임을 명시
//-> import org.springframework.test.context.web.WebAppConfiguration;
@WebAppConfiguration

//메서드 이름 순서로 실행하도록 설정 (설정하지 않을 경우 무작위 순서로 실행됨)
//-> import org.junit.FixMethodOrder;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CardServiceTest {

	/* Service 객체 주입 설정 */
	// -> import org.springframework.beans.factory.annotation.Autowired;
	@Autowired
	private CardService cardService;

	// 단일행 조회 테스트
	@Test
	public void testA() {
		// -> import hanjiho.project.starbucks.model.Card;
		Card input = new Card();
		input.setCard_id(4);
		Card output = null;

		try {
			output = cardService.getCardItem(input);
			log.debug(output.toString());
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}

	// 다중행 조회 테스트
	@Test
	public void testB() {
		// -> import hanjiho.project.starbucks.model.Card;
		Card input = new Card();
		input.setCard_name("신규");

		List<Card> output = null;

		try {
			output = cardService.getCardList(input);

			for (Card item : output) {
				log.debug(item.toString());
			}
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}

	// 전체 데이터 수 조회
	@Test
	public void testC() {
		int count = 0;

		try {
			count = cardService.getCardCount(null);
			log.debug("전체 데이터 수: " + count);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}

	// 조건에 따른 데이터 수 조회
	@Test
	public void testD() {
		int count = 0;

		Card input = new Card();
		input.setCard_name("신규");

		try {
			count = cardService.getCardCount(input);
			log.debug("신규를 포함하는 카드이름을 갖는 데이터 수: " + count);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}

//	// 데이터 저장 테스트
//	@Test
//	public void testE() {
//		Card input = new Card();
//		input.setGift_mem_id(2);
//		input.setPin_num("1111222233339999");
//		input.setCash(60000);
//		input.setCard_name("신규");
//		input.setCharge_auto("0");
//
//		int output = 0;
//
//		try {
//			output = cardService.addCard(input);
//			log.debug("저장된 데이터 수: " + output);
//			// [중요] 생성된 PK값은 MyBatis에 의해 입력 파라미터의 해당 멤버변수에 셋팅된다.
//			log.debug("생성된 PK값: " + input.getCard_id());
//		} catch (Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
//
//	// 데이터 수정 테스트
//	@Test
//	public void testF() {
//		Card input = new Card();
//		input.setCard_id(1);
//		input.setMember_id(2);
//		input.setGift_mem_id(2);
//		input.setPin_num("1111222233334444");
//		input.setCash(60000);
//		input.setCard_name("신규");
//		input.setCharge_auto("1");
//		input.setCharge_schedule("신규");
//		input.setCharge_limit(50000);
//		input.setCharge_cash(50000);
//
//		int output = 0;
//
//		try {
//			output = cardService.editCard(input);
//			log.debug("수정된 데이터 수: " + output);
//		} catch (Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
//
//	// 데이터 삭제 테스트
//	@Test
//	public void testG() {
//		Card input = new Card();
//		input.setCard_id(1);
//
//		int output = 0;
//
//		try {
//			output = cardService.deleteCard(input);
//			log.debug("삭제된 데이터 수: " + output);
//		} catch (Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
//	
//	// 스케쥴러 테스트
//	@Test
//	public void testH() {
//		/* 2) 자동 충전 */
//		//자동충전기능을 사용중이고 충전일이 오늘인 카드 조회
//		List<Card> autoList = new ArrayList<Card>();
//		try {
//			autoList = cardService.autoList();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		if (autoList != null) {
//			for (Card input: autoList) {
//				//충전후 잔액합계
//				int cash = input.getCash();
//				int autoCash = input.getCharge_cash();
//				System.out.println(cash);
//				System.out.println(autoCash);
//				input.setCash(cash+autoCash);
//				System.out.println(input.getCard_id());
//				System.out.println(input.getCash());
//				try {
//					cardService.chargeSchedule(input);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		}
//	}
	
}