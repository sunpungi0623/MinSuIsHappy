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
	public String submitLogin(LoginVO vo, HttpServletRequest req, Model model, HttpServletResponse response)
			throws Exception {

		HttpSession session = req.getSession();
		LoginVO member = ldao.login(vo);
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		String userId = req.getParameter("userId");
		String userPhone = req.getParameter("userPhone");
		String mode = req.getParameter("mode");

		if (mode == null) {
			return "board/login";

		} else if (mode.equals("register")) {
			LoginVO lVo = new LoginVO();
			lVo.setID(userId);
			lVo.setPassword(password);
			lVo.setTYPE("student");
			lVo.setUserName(userName);
			lVo.setUserPhone(userPhone);
			ldao.SignUp(lVo);
			return "board/login";

		} else if (mode.equals("login")) {
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
				model.addAttribute("result", result);
				model.addAttribute("objList", objList);

				if (result.getTYPE().equals("manager")) {

					return "board/managerListAll";
				}
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

		if (mode.equals("sort")) {
			if (brand.equals("samsung")) {
				List<ObjectVO> objList = odao.showSamsungs();
				model.addAttribute("objList", objList);
			}

			if (brand.equals("lg")) {
				List<ObjectVO> objList = odao.showLGs();
				model.addAttribute("objList", objList);
			}

			if (brand.equals("msi")) {
				List<ObjectVO> objList = odao.showMSIs();
				model.addAttribute("objList", objList);
			}

			if (brand.equals("apple")) {
				List<ObjectVO> objList = odao.showApples();
				model.addAttribute("objList", objList);
			}
			if (brand.equals("All")) {
				List<ObjectVO> objList = odao.showObjects();
				model.addAttribute("objList", objList);
			}
		} else if (mode.equals("rent")) {
			String oname = req.getParameter("oname");
			String ocode = req.getParameter("ocode");
			LoginVO ses = (LoginVO) session.getAttribute("LoginVO");
			ObjectVO temp = new ObjectVO();
			ldao.Rent(ses);
			temp.setName(oname);
			temp.setCode(ocode);
			temp.setUserID(ses.getID());
			temp.setUserPhone(ses.getUserPhone());
			temp.setStatus("승인대기중");
//			temp.setRentDate(now.toString());
//			temp.setReturnDate(now.plusMonths(1).toString());
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
		LoginVO l2vo = (LoginVO) session.getAttribute("LoginVO");
		List<ObjectVO> o2vo = odao.showMyObjects(l2vo);

		model.addAttribute("userList", l2vo);
		model.addAttribute("objList", o2vo);

		return "board/mypage";
	}

	@RequestMapping(value = "/notebookList", method = RequestMethod.GET)
	public String getnotebookList(HttpServletRequest req) throws Exception {

		return "board/notebookList";
	}

	@RequestMapping(value = "/Info", method = RequestMethod.GET)
	public String openInfo(HttpServletRequest req) throws Exception {
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

		return "board/notebookList";
	}

	@RequestMapping(value = "/addObject", method = RequestMethod.GET)
	public String addObject(HttpServletRequest req) throws Exception {

		return "board/addObject";
	}

	@RequestMapping(value = "/managerListAll", method = RequestMethod.GET)
<<<<<<< Updated upstream
	public String showManagerListAll(HttpServletRequest req, Model model, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		String brand = req.getParameter("brand");
		String mode = req.getParameter("mode");
		String code = req.getParameter("code");
		String name = req.getParameter("name");

		
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
					// 에러처리!!
					return "board/addObject";
				}
			}
		}
		else if (mode.equals("sort")) {
			if (brand.equals("samsung")) {
				List<ObjectVO> objList = odao.showSamsungs();
				model.addAttribute("objList", objList);
				return "board/managerListAll";
			}

			if (brand.equals("lg")) {
				List<ObjectVO> objList = odao.showLGs();
				model.addAttribute("objList", objList);
				return "board/managerListAll";
			}

			if (brand.equals("msi")) {
				List<ObjectVO> objList = odao.showMSIs();
				model.addAttribute("objList", objList);
				return "board/managerListAll";
			}

			if (brand.equals("apple")) {
				List<ObjectVO> objList = odao.showApples();
				model.addAttribute("objList", objList);
				return "board/managerListAll";
			}
			if (brand.equals("All")) {
				List<ObjectVO> objList = odao.showObjects();
				model.addAttribute("objList", objList);
				return "board/managerListAll";
			}
		} 
		else if (mode.equals("delete")) {
			ObjectVO obj = new ObjectVO();
			obj.setCode(code);
			ObjectVO delObj = odao.showObject(obj);
			odao.deleteObject(delObj);
		}
		
		else {
			
		}
		
		List<ObjectVO> objList = odao.showObjects();
		model.addAttribute("objList", objList);
		return "board/managerListAll";
	}

=======
	   public String showManagerListAll(HttpServletRequest req, Model model, HttpServletResponse res) throws Exception {
	      HttpSession session = req.getSession();
	      String brand = req.getParameter("brand");
	      String mode = req.getParameter("mode");
	      String code = req.getParameter("code");
	      String name = req.getParameter("name");

	      
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
	               // 에러처리!!
	               return "board/addObject";
	            }
	         }
	      }
	      else if (mode.equals("sort")) {
	         if (brand.equals("samsung")) {
	            List<ObjectVO> objList = odao.showSamsungs();
	            model.addAttribute("objList", objList);
	            return "board/managerListAll";
	         }

	         if (brand.equals("lg")) {
	            List<ObjectVO> objList = odao.showLGs();
	            model.addAttribute("objList", objList);
	            return "board/managerListAll";
	         }

	         if (brand.equals("msi")) {
	            List<ObjectVO> objList = odao.showMSIs();
	            model.addAttribute("objList", objList);
	            return "board/managerListAll";
	         }

	         if (brand.equals("apple")) {
	            List<ObjectVO> objList = odao.showApples();
	            model.addAttribute("objList", objList);
	            return "board/managerListAll";
	         }
	         if (brand.equals("All")) {
	            List<ObjectVO> objList = odao.showObjects();
	            model.addAttribute("objList", objList);
	            return "board/managerListAll";
	         }
	      } 
	      else if (mode.equals("delete")) {
	         ObjectVO obj = new ObjectVO();
	         obj.setCode(code);
	         ObjectVO delObj = odao.showObject(obj);
	         odao.deleteObject(delObj);
	      }
	      
	      else {
	         
	      }
	      
	      List<ObjectVO> objList = odao.showObjects();
	      model.addAttribute("objList", objList);
	      return "board/managerListAll";
	   }
>>>>>>> Stashed changes
	@RequestMapping(value = "/reqList", method = RequestMethod.GET)
	public String reqList(HttpServletRequest req, Model model) throws Exception {

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
		}

		List<ObjectVO> objList = odao.showReqObjects();
		model.addAttribute("objList", objList);

		return "board/reqList";
	}

	@RequestMapping(value = "/rentList", method = RequestMethod.GET)
	public String rentList(HttpServletRequest req, Model model) throws Exception {
		String mode = req.getParameter("mode");
		String code = req.getParameter("pcode");
		String userID = req.getParameter("uid");

		if (mode.equals("return")) {
			ldao.returnObj(userID);

			ObjectVO ovo = new ObjectVO();
			ovo.setCode(code);
			ObjectVO temp = odao.showObject(ovo);
			temp.setStatus("대여가능");
			temp.setRentDate(null);
			temp.setReturnDate(null);
			temp.setUserID(null);
			temp.setUserPhone(null);
			odao.updateObject(temp);
		}

		List<ObjectVO> objList = odao.showRentObjects();
		model.addAttribute("objList", objList);

		return "board/rentList";
	}
	   @RequestMapping(value = "/logout", method = RequestMethod.GET)
	   public String logout(HttpServletRequest req) {
	       HttpSession session1 = req.getSession();
	      session1.invalidate();
	      return "redirect:/login";
	   }

}