package hanjiho.project.starbucks.service;

import java.util.List;

import hanjiho.project.starbucks.model.Card;

/**
 * 카드 데이터 관리 기능을 제공하기 위한 Service 계층 
 *
 */
public interface CardService {
	/**
	 * 카드 데이터 상세 조회
	 * @param Card 조회할 카드의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Card getCardItem(Card input) throws Exception;
	/**
	 * 카드 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Card> getCardList(Card input) throws Exception;
	/**
	 * 카드 데이터가 저장되어 있는 갯수 조회 (검사)
	 * @return int
	 * @throws Exception
	 */
	public int getCardCount(Card input) throws Exception;
	/**
	 * 카드 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int cardCount(Card input) throws Exception;
	/**
	 * 카드 데이터 등록하기
	 * @param Card 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addCard(Card input) throws Exception;
	/**
	 * 카드 데이터 수정하기
	 * @param Card 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editCard(Card input) throws Exception;
	/**
	 * 카드 데이터 삭제하기
	 * @param Card 삭제할 카드의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteCard(Card input) throws Exception;
	/**
	 * 핀번호 검사
	 * @param Card 조회할 카드의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Card pinCheck(Card input) throws Exception;
}