package controller;

import java.io.FileInputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.LoginDAO;
import dao.ObjectDAO;
import dao.RecordDAO;

import domain.LoginVO;
import domain.ObjectVO;
import domain.RecordVO;

@Controller
public class HomeController {

	@Inject
	private ObjectDAO odao;

	@Inject
	private LoginDAO ldao;

	@Inject
	private RecordDAO rdao;

	FCMService firebaseCloudMessageService = new FCMService();

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String welcome(LoginVO vo, HttpServletRequest req, Model model, HttpServletResponse response) throws Exception {


		return "redirect:/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String submitLogin(LoginVO vo, HttpServletRequest req, Model model, HttpServletResponse response) throws Exception {

		HttpSession session = req.getSession();
		LoginVO member = ldao.login(vo);
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		String userId = req.getParameter("userId");
		String userPhone = req.getParameter("userPhone");
		String mode = req.getParameter("mode");



		if (mode == null) {
			return "board/login";

		}
		else if (mode.equals("register")) {
			LoginVO lVo = new LoginVO();
			lVo.id = userId;
			if (userId.trim().length() != 7) {
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('학번을 다시 입력해주세요.'); </script>");
				out.flush();
				return "board/register";
			}
			int num = ldao.idChk(lVo);
			System.out.println(num);
			if (num != 0) {
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('이미 회원가입된 학번입니다.'); </script>");
				out.flush();
				return "board/register";
			}
			userPhone = userPhone.replace("-", "");
			userPhone = userPhone.replace(" ", "");

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

			if (result == null) {

				response.setContentType("text/html; charset=euc-kr");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그인실패! 아이디 또는 패스워드를 확인해주세요.'); </script>");
				out.flush();
				System.out.println("로그인 실패");
				return "board/login";
			} else if (result != null) {

				session.setAttribute("LoginVO", result);
				List<ObjectVO> objList = odao.showObjects();
				model.addAttribute("listCount", objList.size());
				objList = objList.subList(0, 15);
				model.addAttribute("result", result);
				model.addAttribute("objList", objList);
				model.addAttribute("brand", "All");
				model.addAttribute("page", 1);
				

				if (result.getTYPE().equals("manager")) {
					objList = odao.showObjects();
					model.addAttribute("objList", objList);
					return "board/managerListAll";
				}

				return "board/listAll";

			}
		}
		return "";

	}

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public String getList(HttpServletRequest req, Model model, HttpServletResponse response) throws Exception {

		String brand = req.getParameter("brand");
		String mode = req.getParameter("mode");
		int page;
		try {
			page = Integer.parseInt(req.getParameter("page"));
		}catch(Exception e) {
		    page = 1; 
		}
		
		page--;
		HttpSession session = req.getSession();
		LoginVO ses = (LoginVO) session.getAttribute("LoginVO");
		List<ObjectVO> objList = new ArrayList<ObjectVO>();

		if (mode.equals("sort")) {
			if (brand.equals("samsung"))  objList= odao.showSamsungs();
			
			if (brand.equals("lg")) objList = odao.showLGs();
			
			if (brand.equals("msi")) objList = odao.showMSIs();
			
			if (brand.equals("apple")) objList = odao.showApples();
			
			if (brand.equals("All")) objList = odao.showObjects();
			
			model.addAttribute("brand", brand);
			model.addAttribute("listCount", objList.size());
			int start = page * 15;
			int end = 15 + page * 15;
			try {
			objList = objList.subList(start, end);					
			} catch(Exception e){
				end = objList.size();
				objList = objList.subList(start, end);
			}
			model.addAttribute("objList", objList);
			
			
		} else if (mode.equals("rent")) {
			String oname = req.getParameter("oname");
			String ocode = req.getParameter("ocode");
			ObjectVO temp = new ObjectVO();
			ldao.Rent(ses);
			LoginVO sesTemp = ldao.login(ses);
			session.setAttribute("LoginVO", sesTemp);
			temp.setName(oname);
			temp.setCode(ocode);
			temp.setUserID(ses.getID());
			temp.setUserPhone(ses.getUserPhone());
			temp.setStatus("승인대기중");

			odao.updateObject(temp);

			objList = odao.showObjects();
			model.addAttribute("listCount", objList.size());
			objList = objList.subList(0, 15);
			model.addAttribute("objList", objList);
			model.addAttribute("brand", "All");

		}

		ses = (LoginVO) session.getAttribute("LoginVO");
		model.addAttribute("result", ses);
		if (ses == null) {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('세션이 만료되었습니다. 다시 로그인 해주세요.'); </script>");
			out.flush();
			return "board/login";
		}
		model.addAttribute("page", page+1);
		return "board/listAll";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister(HttpServletRequest req) throws Exception {

		return "board/register";
	}

	@RequestMapping(value = "/recopage", method = RequestMethod.GET)
	public String getRecopage(HttpServletRequest req, HttpServletResponse response) throws Exception {
		HttpSession session = req.getSession();

		LoginVO ses = (LoginVO) session.getAttribute("LoginVO");
		if (ses == null) {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('세션이 만료되었습니다. 다시 로그인 해주세요.'); </script>");
			out.flush();
			return "board/login";
		}

		return "board/recopage";
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String getMypage(HttpServletRequest req, Model model, HttpServletResponse response) throws Exception {
		HttpSession session = req.getSession();
		LoginVO ses = (LoginVO) session.getAttribute("LoginVO");

		String mode = req.getParameter("mode");
		String code = req.getParameter("ocode");

		if (mode == null) {
			
			if (ses == null) {
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('세션이 만료되었습니다. 다시 로그인 해주세요.'); </script>");
				out.flush();
				return "board/login";
			}
			
			List<ObjectVO> o2vo = odao.showMyObjects(ses);
			model.addAttribute("userList", ses);
			model.addAttribute("objList", o2vo);

			return "board/mypage";
		} else {
			ldao.returnObj(ses.getID());
			ObjectVO ovo = new ObjectVO();
			ovo.setCode(code);
			ObjectVO temp = odao.showObject(ovo);

			temp.setStatus("대여가능");
			temp.setUserID(null);
			temp.setUserPhone(null);
			odao.updateObject(temp);
			
			ldao.newsession(ses); // isRent 1 -> 0

			LoginVO sesTemp = ldao.login(ses);
			session.setAttribute("LoginVO", sesTemp);
			model.addAttribute("userList", sesTemp);
			List<ObjectVO> o3vo = odao.showMyObjects(sesTemp);
			model.addAttribute("objList", o3vo);

			return "board/mypage";
		}
	}

	@RequestMapping(value = "/notebookList", method = RequestMethod.GET)
	public String getnotebookList(HttpServletRequest req, HttpServletResponse response, Model model) throws Exception {
		HttpSession session = req.getSession();
		LoginVO ses = (LoginVO) session.getAttribute("LoginVO");
	      model.addAttribute("userList", ses);

		if (ses == null) {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('세션이 만료되었습니다. 다시 로그인 해주세요.'); </script>");
			out.flush();
			return "board/login";
		}

		return "board/notebookList";
	}

	@RequestMapping(value = "/Info", method = RequestMethod.GET)
	public String openInfo(HttpServletRequest req, HttpServletResponse response) throws Exception {
		HttpSession session = req.getSession();
		String model = (String) req.getParameter("model");
		System.out.println("#########" + model);

		if (model.equals("삼성Odyssey, NT800G5W-XD71")) {
			return "/board/od_xd71";
		} else if (model.equals("삼성Odyssey, NT800G5W-XD7S")) {
			return "/board/od_xd7s";
		} else if (model.equals("삼성Odyssey, NT800G5W-GD7A")) {
			return "/board/od_gd7a";
		} else if (model.equals("삼성Odyssey, NT801G5H-X01/C")) {
			return "/board/od_x01c";
		} else if (model.equals("애플MacBookPro, MVVJ2KH/A")) {
			return "/board/mac_pro";
		} else if (model.equals("MSI소드, GF66-A11UD")) {
			return "/board/msi";
		} else if (model.equals("LG그램15, 15Z90N-VP70ML")) {
			return "/board/lg_gram";
		} else if (model.equals("애플MacBookAir, MGN63KH/A")) {
			return "/board/mac_air";
		}

		LoginVO ses = (LoginVO) session.getAttribute("LoginVO");
		if (ses == null) {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('세션이 만료되었습니다. 다시 로그인 해주세요.'); </script>");
			out.flush();
			return "board/login";
		}

		return "board/notebookList";
	}

	@RequestMapping(value = "/addObject", method = RequestMethod.GET)
	public String addObject(HttpServletRequest req, HttpServletResponse response) throws Exception {
		HttpSession session = req.getSession();

		LoginVO ses = (LoginVO) session.getAttribute("LoginVO");
		if (ses == null) {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('세션이 만료되었습니다. 다시 로그인 해주세요.'); </script>");
			out.flush();
			return "board/login";
		}

		return "board/addObject";
	}

	@RequestMapping(value = "/managerListAll", method = RequestMethod.GET)
	public String showManagerListAll(HttpServletRequest req, Model model, HttpServletResponse response) throws Exception {
		HttpSession session = req.getSession();
		String brand = req.getParameter("brand");
		String mode = req.getParameter("mode");
		String code = req.getParameter("code");
		String name = req.getParameter("name");
		List<ObjectVO> objList = new ArrayList<ObjectVO>();

		if (mode == null) {
			if (code != null && name != null) {
				ObjectVO addObj = new ObjectVO();

				addObj.setCode(code);
				addObj.setName(name);
				addObj.setStatus("대여가능");
				ObjectVO isBeing = odao.showObject(addObj);
				if (isBeing == null) {
					odao.insertObject(addObj);
				} else {
					response.setContentType("text/html; charset=euc-kr");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('이미 존재하는 코드입니다.'); </script>");
					out.flush();
					return "board/addObject";
				}
			}
		} else if (mode.equals("sort")) {
			if (brand.equals("samsung"))objList = odao.showSamsungs();
			
			if (brand.equals("lg")) objList = odao.showLGs();
			
			if (brand.equals("msi")) objList = odao.showMSIs();
			
			if (brand.equals("apple")) objList = odao.showApples();
			
			if (brand.equals("All")) objList = odao.showObjects();
			
			model.addAttribute("objList", objList);
			return "board/managerListAll";
		}
		 else if (mode.equals("delete")) {
			ObjectVO obj = new ObjectVO();
			obj.setCode(code);
			ObjectVO delObj = odao.showObject(obj);
			odao.deleteObject(delObj);
		}

		objList = odao.showObjects();
		model.addAttribute("objList", objList);
		return "board/managerListAll";

	}

	@RequestMapping(value = "/reqList", method = RequestMethod.GET)
	public String reqList(HttpServletRequest req, Model model, HttpServletResponse response) throws Exception {
		HttpSession session = req.getSession();

		LoginVO ses = (LoginVO) session.getAttribute("LoginVO");
		if (ses == null) {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('세션이 만료되었습니다. 다시 로그인 해주세요.'); </script>");
			out.flush();
			return "board/login";
		}

		String mode = req.getParameter("mode");
		String code = req.getParameter("code");

		LocalDate now = LocalDate.now();

		if (mode.equals("ack")) {
			ObjectVO ovo = new ObjectVO();
			ovo.setCode(code);
			ObjectVO temp = odao.showObject(ovo);
			temp.setStatus("대여중");
			temp.setRentDate(now.toString());
			temp.setReturnDate(now.plusMonths(1).toString());
			odao.updateObject(temp);
			firebaseCloudMessageService.sendMessageTo(ses.getToken(), "대여 승인", temp.getName()+" 승인 완료되었습니다. 과 사무실을 방문하세요.");


		}

		List<ObjectVO> objList = odao.showReqObjects();
		model.addAttribute("objList", objList);

		return "board/reqList";
	}

	@RequestMapping(value = "/rentList", method = RequestMethod.GET)
	public String rentList(HttpServletRequest req, Model model, HttpServletResponse response) throws Exception {
		HttpSession session = req.getSession();

		String mode = req.getParameter("mode");
		String code = req.getParameter("pcode");
		String userID = req.getParameter("uid");
		LocalDate now = LocalDate.now();

		if (mode.equals("return")) {
			ldao.returnObj(userID);
			RecordVO rvo = new RecordVO();

			ObjectVO ovo = new ObjectVO();
			ovo.setCode(code);
			ObjectVO temp = odao.showObject(ovo);
			rvo.setCode(temp.getCode());
			rvo.setName(temp.getName());
			rvo.setUserID(temp.getUserID());
			rvo.setUserPhone(temp.getUserPhone());
			rvo.setRentDate(temp.getRentDate());
			rvo.setReturnDate(now.toString());
			rdao.insertRecord(rvo);

			temp.setStatus("대여가능");
			temp.setRentDate(null);
			temp.setReturnDate(null);
			temp.setUserID(null);
			temp.setUserPhone(null);
			odao.updateObject(temp);
		}

		List<ObjectVO> objList = odao.showRentObjects();
		model.addAttribute("objList", objList);

		LoginVO ses = (LoginVO) session.getAttribute("LoginVO");
		if (ses == null) {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('세션이 만료되었습니다. 다시 로그인 해주세요.'); </script>");
			out.flush();
			return "board/login";
		}

		return "board/rentList";
	}

	@RequestMapping(value = "/returnpage", method = RequestMethod.GET)
	public String showReturns(HttpServletRequest req, Model model, HttpServletResponse response) throws Exception {
		HttpSession session = req.getSession();

		LoginVO ses = (LoginVO) session.getAttribute("LoginVO");
		if (ses == null) {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('세션이 만료되었습니다. 다시 로그인 해주세요.'); </script>");
			out.flush();
			return "board/login";
		}

		List<RecordVO> objList = rdao.showRecords();
		model.addAttribute("objList", objList);

		return "board/returnpage";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		HttpSession session1 = req.getSession();
		session1.invalidate();
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info(HttpServletRequest req) throws Exception {

		return "board/info";
	}

}