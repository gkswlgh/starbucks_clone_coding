package hanjiho.project.starbucks.service;

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
import hanjiho.project.starbucks.model.VocRe;

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
public class VocReServiceTest {

	/* Service 객체 주입 설정 */
	// -> import org.springframework.beans.factory.annotation.Autowired;
	@Autowired
	private VocReService vocReService;

	// 단일행 조회 테스트
	@Test
	public void testA() {
		// -> import hanjiho.project.starbucks.model.VocRe;
		VocRe input = new VocRe();
		input.setRe_id(1);
		VocRe output = null;

		try {
			output = vocReService.getVocReItem(input);
			log.debug(output.toString());
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}

	// 다중행 조회 테스트
	@Test
	public void testB() {
		// -> import hanjiho.project.starbucks.model.VocRe;
		VocRe input = new VocRe();
		input.setVoc_id(2);

		List<VocRe> output = null;

		try {
			output = vocReService.getVocReList(input);

			for (VocRe item : output) {
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
			count = vocReService.getVocReCount(null);
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

		VocRe input = new VocRe();
		input.setVoc_id(2);

		try {
			count = vocReService.getVocReCount(input);
			log.debug("문의번호 2에대한 답변 데이터 수: " + count);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}

//	// 데이터 저장 테스트
//	@Test
//	public void testE() {
//		VocRe input = new VocRe();
//		input.setVoc_re_ttl("신규");
//		input.setVoc_re_txt("신규");
//		input.setVoc_id(2);
//
//		int output = 0;
//
//		try {
//			output = vocReService.addVocRe(input);
//			log.debug("저장된 데이터 수: " + output);
//			// [중요] 생성된 PK값은 MyBatis에 의해 입력 파라미터의 해당 멤버변수에 셋팅된다.
//			log.debug("생성된 PK값: " + input.getRe_id());
//		} catch (Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
//
//	// 데이터 수정 테스트
//	@Test
//	public void testF() {
//		VocRe input = new VocRe();
//		input.setRe_id(1);
//		input.setVoc_re_ttl("신규");
//		input.setVoc_re_txt("신규");
//		input.setVoc_id(2);
//
//		int output = 0;
//
//		try {
//			output = vocReService.editVocRe(input);
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
//		VocRe input = new VocRe();
//		input.setRe_id(1);
//
//		int output = 0;
//
//		try {
//			output = vocReService.deleteVocRe(input);
//			log.debug("삭제된 데이터 수: " + output);
//		} catch (Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
}