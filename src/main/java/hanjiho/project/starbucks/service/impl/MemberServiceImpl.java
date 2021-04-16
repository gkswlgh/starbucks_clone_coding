package  hanjiho.project.starbucks.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import  hanjiho.project.starbucks.model.Member;
import  hanjiho.project.starbucks.service.MemberService;


@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	
	/*MyBatis 세션 객체 주입 설정*/
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 회원 데이터 상세 조회
	 * @param Member 조회할 회원의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Member getMemberItem(Member input) throws Exception {
		Member result = null;
		try {
		    result = sqlSession.selectOne("MemberMapper.selectItem", input);

		    if (result == null) {
		        throw new NullPointerException("result=null");
		    }
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
		    throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
		    throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/**
	 * 회원 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Member> getMemberList(Member input) throws Exception {
		List<Member> result = null;
		
		try {
			result = sqlSession.selectList("MemberMapper.selectList", input);
			
			if (result == null) {
		        throw new NullPointerException("result=null");
		    }
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
		    throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
		    throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/**
	 * 회원 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getMemberCount(Member input) throws Exception {
		int result=0;
		
		try {
			result = sqlSession.selectOne("MemberMapper.selectCountAll", input);
			
		} catch (Exception e) {
		    log.error(e.getLocalizedMessage());
		    throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/**
	 * 회원 데이터 등록하기
	 * @param Member 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addMember(Member input) throws Exception {
		int result=0;
		
		// 중복검사 기능을 먼저 호출한다. --> 예외가 발생할 경우 이 메서드가 정의하는 throws문에 의해 컨트롤러로 예외가 전달된다.
        this.idUniqueCheck(input);
        this.emailUniqueCheck(input);
        
		try {
		    result = sqlSession.insert("MemberMapper.insertItem", input);

		    if (result == 0) {
		        throw new NullPointerException("result=0");
		    }
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
		    throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
		    throw new Exception("데이터 저장에 실패했습니다.");
		}
		return result;
	}

	/**
	 * 회원 데이터 수정하기
	 * @param Member 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editMember(Member input) throws Exception {
		int result=0;
		try {
		    result = sqlSession.update("MemberMapper.updateItem", input);

		    if (result == 0) {
		        throw new NullPointerException("result=0");
		    }
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
		    throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
		    throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}

	/**
	 * 회원 데이터 삭제하기
	 * @param Member 삭제할 회원의 일련번호를 담고 있는 Beans
	 * @return String
	 * @throws Exception
	 */
	@Override
	public String deleteMember() throws Exception { 
		int result=0;
		try {
		    result = sqlSession.delete("MemberMapper.deleteItem");

		    if (result == 0) {
		    	return "삭제된 회원이 없습니다>>" + result;
		    }
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
		    throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
		    throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return "삭제된 회원 수>>" + result;
	}
	
	/**
	 * 회원 탈퇴시 컬럼 갱신하기
	 * @param Member 갱신할 회원의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int joinOut(Member input) throws Exception {
		int result=0;
		try {
		    result = sqlSession.delete("MemberMapper.joinOut", input);

		    if (result == 0) {
		        throw new NullPointerException("result=0");
		    }
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
		    throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
		    throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return result;
	}
	

    /**
     * 아이디 중복검사
     * @param input
     * @throws Exception
     */
    @Override
    public void idUniqueCheck(Member input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.selectOne("MemberMapper.idUniqueCheck", input);
            if (result > 0) {
                throw new NullPointerException("result=" + result);
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("이미 사용중인 아이디 입니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("아이디 중복검사에 실패했습니다.");
        }
    }

    /**
     * 이메일 중복검사
     * @param input
     * @throws Exception
     */
    @Override
    public void emailUniqueCheck(Member input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.selectOne("MemberMapper.emailUniqueCheck", input);
            if (result > 0) {
                throw new NullPointerException("result=" + result);
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("이미 사용중인 이메일 입니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("이메일 중복검사에 실패했습니다.");
        }
    }


    /**
     * 로그인
     * @param input
     * @throws Exception
     */
    @Override
    public Member login(Member input) throws Exception {
        Member result = null;
        try {
            result = sqlSession.selectOne("MemberMapper.login", input);

            if (result == null) {
                throw new NullPointerException("result=null");
            }
            
            // 조회에 성공하면 result에 저장되어 있는 PK를 활용하여 로그인 시간을 갱신한다.
            sqlSession.update("MemberMapper.updateLoginDate", result);
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("아이디나 비밀번호가 잘못되었습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
    }

    /**
     * 비번검사
     * @param input
     * @throws Exception
     */
    @Override
    public int checkPw(Member input) throws Exception {
        int result = 0;
        try {
            result = sqlSession.selectOne("MemberMapper.checkPw", input);
            if (result != 1) {
                throw new NullPointerException("result=" + result);
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("비밀번호가 잘못되었습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        return result;
    }
    
    /**
	 * 이메일 정보로 아이디 찾기
	 * @param Member 조회할 회원의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Member find_id(Member input) throws Exception {
		Member result = null;
		try {
		    result = sqlSession.selectOne("MemberMapper.find_id", input);

		    if (result == null) {
		        throw new NullPointerException("result=null");
		    }
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
		    throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
		    throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
}