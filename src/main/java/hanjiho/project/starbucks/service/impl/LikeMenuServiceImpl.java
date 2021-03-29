package  hanjiho.project.starbucks.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import  hanjiho.project.starbucks.model.LikeMenu;
import  hanjiho.project.starbucks.service.LikeMenuService;


@Slf4j
@Service
public class LikeMenuServiceImpl implements LikeMenuService {
	
	/*MyBatis 세션 객체 주입 설정*/
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 좋아요 데이터 상세 조회
	 * @param LikeMenu 조회할 좋아요의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public LikeMenu getLikeMenuItem(LikeMenu input) throws Exception {
		LikeMenu result = null;
		try {
		    result = sqlSession.selectOne("LikeMenuMapper.selectItem", input);

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
	 * 좋아요 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<LikeMenu> getLikeMenuList(LikeMenu input) throws Exception {
		List<LikeMenu> result = null;
		
		try {
			result = sqlSession.selectList("LikeMenuMapper.selectList", input);
			
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
	 * 좋아요 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getLikeMenuCount(LikeMenu input) throws Exception {
		int result=0;
		
		try {
			result = sqlSession.selectOne("LikeMenuMapper.selectCountAll", input);
			
		} catch (Exception e) {
		    log.error(e.getLocalizedMessage());
		    throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/**
	 * 좋아요 데이터 등록하기
	 * @param LikeMenu 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addLikeMenu(LikeMenu input) throws Exception {
		int result=0;
		try {
		    result = sqlSession.insert("LikeMenuMapper.insertItem", input);

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
	 * 좋아요 데이터 수정하기
	 * @param LikeMenu 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editLikeMenu(LikeMenu input) throws Exception {
		int result=0;
		try {
		    result = sqlSession.update("LikeMenuMapper.updateItem", input);

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
	 * 좋아요 데이터 삭제하기
	 * @param LikeMenu 삭제할 좋아요의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteLikeMenu(LikeMenu input) throws Exception {
		int result=0;
		try {
		    result = sqlSession.delete("LikeMenuMapper.deleteItem", input);

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