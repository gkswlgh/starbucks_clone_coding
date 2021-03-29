package hanjiho.project.starbucks.service;

import java.util.List;

import hanjiho.project.starbucks.model.Voc;

/**
 * 문의 데이터 관리 기능을 제공하기 위한 Service 계층 
 *
 */
public interface VocService {
	/**
	 * 문의 데이터 상세 조회
	 * @param Voc 조회할 문의의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Voc getVocItem(Voc input) throws Exception;
	/**
	 * 문의 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Voc> getVocList(Voc input) throws Exception;
	/**
	 * 문의 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getVocCount(Voc input) throws Exception;
	/**
	 * 문의 데이터 등록하기
	 * @param Voc 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addVoc(Voc input) throws Exception;
	/**
	 * 문의 데이터 수정하기
	 * @param Voc 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editVoc(Voc input) throws Exception;
	/**
	 * 문의 데이터 삭제하기
	 * @param Voc 삭제할 문의의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteVoc(Voc input) throws Exception;
}