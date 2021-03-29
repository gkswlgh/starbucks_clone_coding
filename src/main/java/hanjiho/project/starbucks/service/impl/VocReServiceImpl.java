package  hanjiho.project.starbucks.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import  hanjiho.project.starbucks.model.VocRe;
import  hanjiho.project.starbucks.service.VocReService;


@Slf4j
@Service
public class VocReServiceImpl implements VocReService {
	
	/*MyBatis 세션 객체 주입 설정*/
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 문의답변 데이터 상세 조회
	 * @param VocRe 조회할 문의답변의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public VocRe getVocReItem(VocRe input) throws Exception {
		VocRe result = null;
		try {
		    result = sqlSession.selectOne("VocReMapper.selectItem", input);

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
	 * 문의답변 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<VocRe> getVocReList(VocRe input) throws Exception {
		List<VocRe> result = null;
		
		try {
			result = sqlSession.selectList("VocReMapper.selectList", input);
			
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
	 * 문의답변 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getVocReCount(VocRe input) throws Exception {
		int result=0;
		
		try {
			result = sqlSession.selectOne("VocReMapper.selectCountAll", input);
			
		} catch (Exception e) {
		    log.error(e.getLocalizedMessage());
		    throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/**
	 * 문의답변 데이터 등록하기
	 * @param VocRe 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addVocRe(VocRe input) throws Exception {
		int result=0;
		try {
		    result = sqlSession.insert("VocReMapper.insertItem", input);

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
	 * 문의답변 데이터 수정하기
	 * @param VocRe 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editVocRe(VocRe input) throws Exception {
		int result=0;
		try {
		    result = sqlSession.update("VocReMapper.updateItem", input);

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
	 * 문의답변 데이터 삭제하기
	 * @param VocRe 삭제할 문의답변의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteVocRe(VocRe input) throws Exception {
		int result=0;
		try {
		    result = sqlSession.delete("VocReMapper.deleteItem", input);

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
	
}