package  hanjiho.project.starbucks.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import  hanjiho.project.starbucks.model.OrderMenuList;
import  hanjiho.project.starbucks.service.OrderMenuListService;


@Slf4j
@Service
public class OrderMenuListServiceImpl implements OrderMenuListService {
	
	/*MyBatis 세션 객체 주입 설정*/
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 주문상세 데이터 상세 조회
	 * @param OrderMenuList 조회할 주문상세의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public OrderMenuList getOrderMenuListItem(OrderMenuList input) throws Exception {
		OrderMenuList result = null;
		try {
		    result = sqlSession.selectOne("OrderMenuListMapper.selectItem", input);

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
	 * 주문상세 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<OrderMenuList> getOrderMenuListList(OrderMenuList input) throws Exception {
		List<OrderMenuList> result = null;
		
		try {
			result = sqlSession.selectList("OrderMenuListMapper.selectList", input);
			
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
	 * 가장 많이 이용한 메뉴 조회 - menu_id별 데이터 수 조회하기
	 * @param member_id의 일련번호를 담고있는 Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<OrderMenuList> orderOft(OrderMenuList input) throws Exception {
		List<OrderMenuList> result= null;
		
		try {
			result = sqlSession.selectList("OrderMenuListMapper.orderOft", input);
			
		} catch (Exception e) {
		    log.error(e.getLocalizedMessage());
		    throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/**
	 * 주문상세 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getOrderMenuListCount(OrderMenuList input) throws Exception {
		int result=0;
		
		try {
			result = sqlSession.selectOne("OrderMenuListMapper.selectCountAll", input);
			
		} catch (Exception e) {
		    log.error(e.getLocalizedMessage());
		    throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/**
	 * 주문상세 데이터 등록하기
	 * @param OrderMenuList 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addOrderMenuList(OrderMenuList input) throws Exception {
		int result=0;
		try {
		    result = sqlSession.insert("OrderMenuListMapper.insertItem", input);

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
	 * 주문상세 데이터 수정하기
	 * @param OrderMenuList 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editOrderMenuList(OrderMenuList input) throws Exception {
		int result=0;
		try {
		    result = sqlSession.update("OrderMenuListMapper.updateItem", input);

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
	 * 주문상세 데이터 삭제하기
	 * @param OrderMenuList 삭제할 주문상세의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteOrderMenuList(OrderMenuList input) throws Exception {
		int result=0;
		try {
		    result = sqlSession.delete("OrderMenuListMapper.deleteItem", input);

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