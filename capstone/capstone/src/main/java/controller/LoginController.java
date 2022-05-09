package controller;
 
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import domain.LoginVO;
import service.LoginService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
@RequestMapping("/board/")
@Controller
public class LoginController {
    
    @Inject
    private LoginService service;
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String submitLogin(LoginVO vo, HttpServletRequest req) throws Exception {
    		
    	HttpSession session = req.getSession();
    	LoginVO member = service.login(vo);

    	if (member == null) {
    		session.setAttribute("login", null);
    		return "board/login";
    	}
    	else {
    		session.setAttribute("login", member);
    		return "board/listPage?num=1";
    	}		
    }

}