package hanjiho.project.starbucks.service;

import java.util.List;

import hanjiho.project.starbucks.model.LikeMenu;

/**
 * 좋아요 데이터 관리 기능을 제공하기 위한 Service 계층 
 *
 */
public interface LikeMenuService {
	/**
	 * 좋아요 데이터 상세 조회
	 * @param LikeMenu 조회할 좋아요의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public LikeMenu getLikeMenuItem(LikeMenu input) throws Exception;
	/**
	 * 좋아요 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<LikeMenu> getLikeMenuList(LikeMenu input) throws Exception;
	/**
	 * 좋아요 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getLikeMenuCount(LikeMenu input) throws Exception;
	/**
	 * 메뉴를 좋아하는 사람 수 조회
	 * @return int
	 * @throws Exception
	 */
	public int countLike(LikeMenu input) throws Exception;
	/**
	 * 좋아요 데이터 등록하기
	 * @param LikeMenu 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addLikeMenu(LikeMenu input) throws Exception;
	/**
	 * 좋아요 데이터 수정하기
	 * @param LikeMenu 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editLikeMenu(LikeMenu input) throws Exception;
	/**
	 * 좋아요 데이터 삭제하기
	 * @param LikeMenu 삭제할 좋아요의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteLikeMenu(LikeMenu input) throws Exception;
}