package controller;

import java.io.PrintWriter;
import java.util.List;
import java.time.LocalDate;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.LoginDAO;
import dao.ObjectDAO;
import domain.LoginVO;
import domain.ObjectVO;

@RequestMapping("/")
@Controller
public class HomeController {

	@Inject
	private ObjectDAO odao;

	@Inject
	private LoginDAO ldao;

	 
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String submitLogin(LoginVO vo, HttpServletRequest req, Model model, HttpServletResponse response) throws Exception {

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
				response.setContentType("text/html; charset=euc-kr");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('로그인실패! 아이디 또는 패스워드를 확인해주세요.'); </script>");
	            out.flush();
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
	
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public String getList(HttpServletRequest req, Model model) throws Exception {
		
		String brand = req.getParameter("brand");
		String mode = req.getParameter("mode");
		HttpSession session = req.getSession();
		
		LocalDate now = LocalDate.now();
		

		if(mode.equals("sort")) {
			if(brand.equals("samsung")) {
				List<ObjectVO> objList = odao.showSamsungs();
				model.addAttribute("objList", objList);
			}
			
			if(brand.equals("lg")) {
				List<ObjectVO> objList = odao.showLGs();
				model.addAttribute("objList", objList);
			}
			
			if(brand.equals("msi")) {
				List<ObjectVO> objList = odao.showMSIs();
				model.addAttribute("objList", objList);
			}
			
			if(brand.equals("apple")) {
				List<ObjectVO> objList = odao.showApples();
				model.addAttribute("objList", objList);
			}
		}
		else if (mode.equals("rent")) {
			String oname = req.getParameter("oname");
			String ocode = req.getParameter("ocode");
			LoginVO ses = (LoginVO)session.getAttribute("LoginVO");
			ObjectVO temp = new ObjectVO();
			temp.setName(oname);
			temp.setCode(ocode);
			temp.setUserName(ses.getUserName());
			temp.setUserPhone(ses.getUserPhone());
			temp.setStatus("대여중");
			temp.setRentDate(now.toString());
			temp.setReturnDate(now.plusMonths(1).toString());
			odao.updateObject(temp);
			
			List<ObjectVO> objList = odao.showObjects();
			model.addAttribute("objList", objList);
			
		}
		
		
		return "board/listAll";
	}


	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister(HttpServletRequest req) throws Exception {

		return "board/register";
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
    public String getMypage(HttpServletRequest req, Model model) throws Exception {
       HttpSession session = req.getSession();
       LoginVO l2vo = (LoginVO)session.getAttribute("LoginVO");
       List<ObjectVO> o2vo = odao.showMyObjects(l2vo);
       
       model.addAttribute("userList", l2vo);
       model.addAttribute("objList", o2vo);
       
       
       return "board/mypage";
    }
	

}