package hanjiho.project.starbucks.controllers.rest;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import hanjiho.project.starbucks.helper.MailHelper;
import hanjiho.project.starbucks.helper.RegexHelper;
import hanjiho.project.starbucks.helper.WebHelper;
import hanjiho.project.starbucks.model.LikeMenu;
import hanjiho.project.starbucks.model.Member;
import hanjiho.project.starbucks.model.Voc;
import hanjiho.project.starbucks.service.LikeMenuService;
import hanjiho.project.starbucks.service.MenuService;
import hanjiho.project.starbucks.service.VocService;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RestController
public class MyRestController {

    /** WebHelper 주입 */
    @Autowired
    WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired
    RegexHelper regexHelper;

    /** Service 패턴 구현체 주입 */
	@Autowired
	MenuService menuService;
	@Autowired
	LikeMenuService likeMenuService;
	
    /** likemenu 삭제 */
    @RequestMapping(value = "/rest/my/del_like_menu", method = RequestMethod.POST)
    public Map<String, Object> del_like_menu(
            // 메뉴일련번호
            @RequestParam(value = "like_id_list", required = false) String like_id_list) {

    	//유효성검사
    	if (!regexHelper.isValue(like_id_list)) {
			return webHelper.getJsonWarning("좋아요 일련번호가 누락되었습니다.");
		}
    	
    	String[] data = like_id_list.split(",");

    	// 데이터조회+삭제
        LikeMenu input = new LikeMenu();
		for (String item: data) {
			//형변환 string to int
			int tmp = Integer.parseInt(item);
			// 데이터삭제
			input.setLike_id(tmp);
	        try {
	        	likeMenuService.deleteLikeMenu(input);
	        } catch (Exception e) {
	            return webHelper.getJsonError(e.getLocalizedMessage());
	        }
		}
		
        return webHelper.getJsonData();
    }
}
