package hanjiho.project.starbucks.service;

import java.util.List;

import hanjiho.project.starbucks.model.Member;

/**
 * 회원 데이터 관리 기능을 제공하기 위한 Service 계층 
 *
 */
public interface MemberService {
	/**
	 * 회원 데이터 상세 조회
	 * @param Member 조회할 회원의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Member getMemberItem(Member input) throws Exception;
	/**
	 * 회원 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Member> getMemberList(Member input) throws Exception;
	/**
	 * 회원 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getMemberCount(Member input) throws Exception;
	/**
	 * 회원 데이터 등록하기
	 * @param Member 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addMember(Member input) throws Exception;
	/**
	 * 회원 데이터 수정하기
	 * @param Member 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editMember(Member input) throws Exception;
	/**
	 * 회원 데이터 삭제하기
	 * @param Member 삭제할 회원의 일련번호를 담고 있는 Beans
	 * @return String
	 * @throws Exception
	 */
	public String deleteMember() throws Exception;
	/**
	 * 회원 탈퇴시 컬럼 갱신하기
	 * @param Member 갱신할 회원의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int joinOut(Member input) throws Exception;
    /**
     * 아이디 중복검사
     * @param input
     * @throws Exception
     */
    public void idUniqueCheck(Member input) throws Exception;
    
    /**
     * 이메일 중복검사
     * @param input
     * @throws Exception
     */
    public void emailUniqueCheck(Member input) throws Exception;
    
    /**
     * 로그인
     * @param input
     * @throws Exception
     */
    public Member login(Member input) throws Exception;
    
    /**
     * 비번확인
     * @param input
     * @throws Exception
     */
    public int checkPw(Member input) throws Exception;

    /**
     * 이메일 정보로 아이디 찾기
	 * @param Member 조회할 회원의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
     */
    public Member find_id(Member input) throws Exception;

    /**
     * 인증번호 갱신
     * @param input
     * @throws Exception
     */
    public void updateAuNum(Member input) throws Exception;

    /**
     * 비밀번호 갱신
     * @param input
     * @throws Exception
     */
    public void updatePw(Member input) throws Exception;

    /**
     * 회원 주소 추가
     * @param input
     * @throws Exception
     */
    public void updateAddress(Member input) throws Exception;
    
}