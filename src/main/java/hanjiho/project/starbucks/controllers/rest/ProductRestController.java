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
import hanjiho.project.starbucks.service.LikeMenuService;
import hanjiho.project.starbucks.service.MenuService;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RestController
public class ProductRestController {

    /** WebHelper 주입 */
    @Autowired
    WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired
    RegexHelper regexHelper;

    /** Service 패턴 구현체 주입 */
	@Autowired
	LikeMenuService likeMenuService;
    

    /** 아이디 중복검사 */
    @RequestMapping(value = "/rest/product/like_menu", method = RequestMethod.POST)
    public Map<String, Object> likemenu(
            // 회원일련번호
            @RequestParam(value = "member_id", defaultValue = "0") int member_id,
            // 메뉴일련번호
            @RequestParam(value = "menu_id", defaultValue = "0") int menu_id) {

    	//유효성검사
		if (member_id == 0) {
			return webHelper.getJsonWarning("회원일련번호를 입력하세요");
		}
		if (menu_id == 0) {
			return webHelper.getJsonWarning("메뉴일련번호를 입력하세요");
		}
		
    	// 데이터조회
        LikeMenu input = new LikeMenu();
        input.setMember_id(member_id);
        input.setMenu_id(menu_id);
         
        // 데이터등록
        try {
        	likeMenuService.addLikeMenu(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        return webHelper.getJsonData();
    }

}
