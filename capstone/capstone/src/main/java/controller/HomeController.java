package controller;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import domain.LoginVO;
import domain.ObjectVO;
import dao.ObjectDAO;
import service.LoginService;
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
	private ObjectDAO dao;

	@Inject
	private LoginService service;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String submitLogin(LoginVO vo, HttpServletRequest req) throws Exception {

		HttpSession session = req.getSession();
		LoginVO member = service.login(vo);
		String name = req.getParameter("username");
		String password = req.getParameter("password");
		System.out.println(name + " " + password);

		if (member == null) {
			session.setAttribute("login", null);
			return "board/login";
		} else {
			session.setAttribute("login", member);
			// LoginVo vo = dao.login("?");
			// if(vo == null) {로그인 실패 return "board/logn"}
			// else if (vo != null) {return "board/listPage?num=1";}

			return "board/listPage?num=1";

		}

	}

	@RequestMapping(value = "/listAll")
	public String showObjects(Model model) {
		List<ObjectVO> objList = dao.showObjects();
		objList.get(0).getCode();
		System.out.println(objList.get(0).getCode());
		model.addAttribute("objList", objList);

		return "board/listAll";
	}

}