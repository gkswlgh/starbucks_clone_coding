package hanjiho.project.starbucks.service;

import java.util.List;

import hanjiho.project.starbucks.model.Cart;

/**
 * 장바구니 데이터 관리 기능을 제공하기 위한 Service 계층 
 *
 */
public interface CartService {
	/**
	 * 장바구니 데이터 상세 조회
	 * @param Cart 조회할 장바구니의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Cart getCartItem(Cart input) throws Exception;
	/**
	 * 장바구니 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Cart> getCartList(Cart input) throws Exception;
	/**
	 * 장바구니 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getCartCount(Cart input) throws Exception;
	/**
	 * 장바구니 데이터 등록하기
	 * @param Cart 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addCart(Cart input) throws Exception;
	/**
	 * 장바구니 데이터 수정하기
	 * @param Cart 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editCart(Cart input) throws Exception;
	/**
	 * 로그인 시 세션장바구니 회원정보추가
	 * @param Cart 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int loginCart(Cart input) throws Exception;
	/**
	 * 장바구니 데이터 삭제하기
	 * @param Cart 삭제할 장바구니의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteCart(Cart input) throws Exception;
	/**
	 * 일주일 지난 장바구니 데이터 삭제하기 (스케줄러)
	 * @return String
	 * @throws Exception
	 */
	public String deleteWeek() throws Exception;
}