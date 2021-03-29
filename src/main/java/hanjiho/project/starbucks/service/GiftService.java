package hanjiho.project.starbucks.service;

import java.util.List;

import hanjiho.project.starbucks.model.Gift;

/**
 * 선물 데이터 관리 기능을 제공하기 위한 Service 계층 
 *
 */
public interface GiftService {
	/**
	 * 선물 데이터 상세 조회
	 * @param Gift 조회할 선물의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Gift getGiftItem(Gift input) throws Exception;
	/**
	 * 선물 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Gift> getGiftList(Gift input) throws Exception;
	/**
	 * 선물 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getGiftCount(Gift input) throws Exception;
	/**
	 * 선물 데이터 등록하기
	 * @param Gift 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addGift(Gift input) throws Exception;
	/**
	 * 선물 데이터 수정하기
	 * @param Gift 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editGift(Gift input) throws Exception;
	/**
	 * 선물 데이터 삭제하기
	 * @param Gift 삭제할 선물의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteGift(Gift input) throws Exception;
}