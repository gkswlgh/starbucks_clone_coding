package hanjiho.project.starbucks.controllers.rest;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import hanjiho.project.starbucks.helper.MailHelper;
import hanjiho.project.starbucks.helper.RegexHelper;
import hanjiho.project.starbucks.helper.WebHelper;
import hanjiho.project.starbucks.model.Card;
import hanjiho.project.starbucks.model.LikeMenu;
import hanjiho.project.starbucks.model.Member;
import hanjiho.project.starbucks.model.Voc;
import hanjiho.project.starbucks.service.CardService;
import hanjiho.project.starbucks.service.LikeMenuService;
import hanjiho.project.starbucks.service.MenuService;
import hanjiho.project.starbucks.service.VocService;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RestController
public class CardRestController {

    /** WebHelper 주입 */
    @Autowired
    WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired
    RegexHelper regexHelper;

    /** Service 패턴 구현체 주입 */
	@Autowired
	CardService cardService;

    /** 카드 등록 - Card update */
    @RequestMapping(value = "/rest/card", method = RequestMethod.POST)
    public Map<String, Object> del_like_menu(Model model,
            @SessionAttribute(value = "member", required = false) Member member) {

        return webHelper.getJsonData();
    }
}
