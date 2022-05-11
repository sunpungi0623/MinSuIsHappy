package controller;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import domain.*;
import dao.*;
import service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequestMapping("/")
@Controller
public class HomeController {

	@Inject
	private ObjectDAO odao;

	@Inject
	private LoginDAO ldao;

	 
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String submitLogin(LoginVO vo, HttpServletRequest req, Model model) throws Exception {

		HttpSession session = req.getSession();
		LoginVO member = ldao.login(vo);
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		String userId = req.getParameter("userId");
		String userPhone = req.getParameter("userPhone");
		String mode = req.getParameter("mode");

		
		if(mode == null) {
			return "board/login";

		}
		else if (mode.equals("register")) {
			LoginVO lVo = new LoginVO();
			lVo.setID(userId);
			lVo.setPassword(password);
			lVo.setTYPE("student");
			lVo.setUserName(userName);
			lVo.setUserPhone(userPhone);
			ldao.SignUp(lVo);
			return "board/login";

		}
		else if (mode.equals("login")) {
			LoginVO lVo = new LoginVO();
			lVo.setID(userId);
			lVo.setPassword(password);
			LoginVO result = ldao.login(lVo);
			System.out.println(lVo.getID()+" "+lVo.getPassword());


			if (result == null) {
				//alert 로그인실패!
				System.out.println("로그인 실패");
				return "board/login";
			}
			else if (result != null) {
				session.setAttribute("LoginVO", result);
				List<ObjectVO> objList = odao.showObjects();
				model.addAttribute("objList", objList);
				
				
				
				return "board/listAll";

			}
		}
		return "";

	}


	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister(HttpServletRequest req) throws Exception {

		return "board/register";
	}

}