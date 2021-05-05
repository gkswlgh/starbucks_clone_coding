package hanjiho.project.starbucks.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import hanjiho.project.starbucks.helper.RegexHelper;
import hanjiho.project.starbucks.helper.WebHelper;
import hanjiho.project.starbucks.model.Cart;
import hanjiho.project.starbucks.model.Member;
import hanjiho.project.starbucks.service.CartService;

@Controller
public class ShoppingController {
    /** WebHelper 주입 */
    @Autowired
    WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired
    RegexHelper regexHelper;

    /** Service 패턴 구현체 주입 */
    @Autowired
    CartService cartService;

    @RequestMapping(value = "/shopping/cart", method=RequestMethod.GET)
    public ModelAndView cart(Model model, HttpSession session, @SessionAttribute(value = "member", required = false) Member member) {
        
        Cart input = new Cart();
        // 비회원인 경우 클라이언트를 식별하기 위한 JSESSION-ID -> 모든 브라우저마다 고유한 값으로 할당된다.
        input.setSession_id(session.getId());
        
        if (member != null) {
            input.setMember_id(member.getId());
        }
        
        List<Cart> output = null;
        
        try {
            output = cartService.getCartList(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        
        if (output != null) {
            for (Cart item : output) {
                System.out.println(item.toString());
                
            }
        }
        
        model.addAttribute("output", output);
        return new ModelAndView("shopping/cart");
    }
    
    @RequestMapping(value = "/shopping/order", method=RequestMethod.POST)
    public ModelAndView cart(Model model, HttpSession session, 
            @SessionAttribute(value = "member", required = false) Member member,
            @RequestParam(value = "cart_id[]") int[] cartId) {
        
        Cart input = new Cart();
        // 비회원인 경우 클라이언트를 식별하기 위한 JSESSION-ID -> 모든 브라우저마다 고유한 값으로 할당된다.
        input.setSession_id(session.getId());
        
        if (member != null) {
            input.setMember_id(member.getId());
        }
        
        //input.setIdArr(cartId);
        
        List<Cart> output = null;
        
        try {
            output = cartService.getCartList(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        
        if (output != null) {
            for (Cart item : output) {
                System.out.println(item.toString());
            }
        }
        
        model.addAttribute("output", output);
        
        return new ModelAndView("shopping/order");
    }
}
