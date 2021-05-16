package hanjiho.project.starbucks.service;

import java.util.ArrayList;
import java.util.List;

import hanjiho.project.starbucks.model.OrderMenuList;

/**
 * 주문상세 데이터 관리 기능을 제공하기 위한 Service 계층 
 *
 */
public interface OrderMenuListService {
	/**
	 * 주문상세 데이터 상세 조회
	 * @param OrderMenuList 조회할 주문상세의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public OrderMenuList getOrderMenuListItem(OrderMenuList input) throws Exception;
	/**
	 * 주문상세 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<OrderMenuList> getOrderMenuListList(OrderMenuList input) throws Exception;
	/**
	 * 가장 많이 이용한 메뉴 조회 - menu_id별 데이터 수 조회하기
	 * @param member_id의 일련번호를 담고있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<OrderMenuList> orderOft(OrderMenuList input) throws Exception;
	/**
	 * 전체 회원 기준 가장 많이 이용한 메뉴 조회 - (menu_class 0 ~ 8지정)
	 * @param menu_class를 담고있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<OrderMenuList> orderOftAll(OrderMenuList input) throws Exception;
	/**
	 * 주문상세 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getOrderMenuListCount(OrderMenuList input) throws Exception;
	/**
	 * 주문상세 데이터 등록하기
	 * @param OrderMenuList 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addOrderMenuList(OrderMenuList input) throws Exception;
	/**
	 * 주문상세 데이터 수정하기
	 * @param OrderMenuList 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editOrderMenuList(OrderMenuList input) throws Exception;
	/**
	 * 주문상세 데이터 삭제하기
	 * @param OrderMenuList 삭제할 주문상세의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteOrderMenuList(OrderMenuList input) throws Exception;
}