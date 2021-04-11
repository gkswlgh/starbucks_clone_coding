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
import hanjiho.project.starbucks.model.Voc;

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
public class VocServiceTest {

	/* Service 객체 주입 설정 */
	// -> import org.springframework.beans.factory.annotation.Autowired;
	@Autowired
	private VocService vocService;

	// 단일행 조회 테스트
	@Test
	public void testA() {
		// -> import hanjiho.project.starbucks.model.Voc;
		Voc input = new Voc();
		input.setVoc_id(1);
		Voc output = null;

		try {
			output = vocService.getVocItem(input);
			log.debug(output.toString());
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}

	// 다중행 조회 테스트
	@Test
	public void testB() {
		// -> import hanjiho.project.starbucks.model.Voc;
		Voc input = new Voc();
		input.setVoc_type("1");

		List<Voc> output = null;

		try {
			output = vocService.getVocList(input);

			for (Voc item : output) {
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
			count = vocService.getVocCount(null);
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

		Voc input = new Voc();
		input.setVoc_type("1");

		try {
			count = vocService.getVocCount(input);
			log.debug("문의 유형이 문의인 데이터 수: " + count);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}

	// 데이터 저장 테스트
	@Test
	public void testE() {
		Voc input = new Voc();
		input.setPhone("010)1111-1111");
		input.setEmail("sdf123@assd.as");
		input.setVisit_store("Y");
		input.setStore_name("강남어쩌구점");
		input.setVisit_date("2020-12-23");
		input.setVoc_ttl("신규");
		input.setVoc_txt("신규");
		input.setVoc_type("1");
		input.setVoc_type2("1");
		input.setMember_id(2);

		int output = 0;

		try {
			output = vocService.addVoc(input);
			log.debug("저장된 데이터 수: " + output);
			// [중요] 생성된 PK값은 MyBatis에 의해 입력 파라미터의 해당 멤버변수에 셋팅된다.
			log.debug("생성된 PK값: " + input.getVoc_id());
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}

//	// 데이터 수정 테스트
//	@Test
//	public void testF() {
//		Voc input = new Voc();
//		input.setVoc_id(1);
//		input.setPhone("010)1111-1111");
//		input.setEmail("sdf123@assd.as");
//		input.setVisit_store("N");
//		input.setStore_name("");
//		input.setVisit_date("");
//		input.setVoc_ttl("신규");
//		input.setVoc_txt("신규");
//		input.setVoc_type("1");
//		input.setVoc_type2("1");
//		input.setMember_id(2);
//
//		int output = 0;
//
//		try {
//			output = vocService.editVoc(input);
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
//		Voc input = new Voc();
//		input.setVoc_id(1);
//
//		int output = 0;
//
//		try {
//			output = vocService.deleteVoc(input);
//			log.debug("삭제된 데이터 수: " + output);
//		} catch (Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
}