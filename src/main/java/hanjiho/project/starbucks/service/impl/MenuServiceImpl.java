package  hanjiho.project.starbucks.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import  hanjiho.project.starbucks.model.Menu;
import  hanjiho.project.starbucks.service.MenuService;


@Slf4j
@Service
public class MenuServiceImpl implements MenuService {
	
	/*MyBatis 세션 객체 주입 설정*/
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 메뉴 데이터 상세 조회
	 * @param Menu 조회할 메뉴의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Menu getMenuItem(Menu input) throws Exception {
		Menu result = null;
		try {
		    result = sqlSession.selectOne("MenuMapper.selectItem", input);

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
	 * 메뉴 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Menu> getMenuList(Menu input) throws Exception {
		List<Menu> result = null;
		
		try {
			result = sqlSession.selectList("MenuMapper.selectList", input);
			
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
	 * 메뉴 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getMenuCount(Menu input) throws Exception {
		int result=0;
		
		try {
			result = sqlSession.selectOne("MenuMapper.selectCountAll", input);
			
		} catch (Exception e) {
		    log.error(e.getLocalizedMessage());
		    throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/**
	 * 메뉴 데이터 등록하기
	 * @param Menu 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addMenu(Menu input) throws Exception {
		int result=0;
		try {
		    result = sqlSession.insert("MenuMapper.insertItem", input);

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
	 * 메뉴 데이터 수정하기
	 * @param Menu 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editMenu(Menu input) throws Exception {
		int result=0;
		try {
		    result = sqlSession.update("MenuMapper.updateItem", input);

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
	 * 메뉴 데이터 삭제하기
	 * @param Menu 삭제할 메뉴의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteMenu(Menu input) throws Exception {
		int result=0;
		try {
		    result = sqlSession.delete("MenuMapper.deleteItem", input);

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