package controller;

import java.io.PrintWriter;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import dao.LoginDAO;
import dao.ObjectDAO;
import dao.RecordDAO;

import domain.LoginVO;
import domain.ObjectVO;
import domain.RecordVO;

@RequestMapping("/API")
@Controller
public class APIController {

    @Inject
    private ObjectDAO odao;

    @Inject
    private LoginDAO ldao;

    @Inject
    private RecordDAO rdao;



    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginAPI(HttpServletRequest req) throws Exception {

        System.out.println("API request listen.");
        HttpSession session = req.getSession();
        String password = req.getParameter("password");
        String userId = req.getParameter("userId");

        LoginVO lVo = new LoginVO();
        lVo.setID(userId);
        lVo.setPassword(password);
        LoginVO result = ldao.login(lVo);

        if (result ==null) {
            req.setAttribute("json", "error");
        }
        else if (result != null) {
            String json = "{ \"id\" : \"" + result.getID() + "\" ,"
                    + "\"Type\" : \"" + result.getTYPE() + "\" ,"
                    + "\"password\" : \"" + result.getPassword() + "\" ,"
                    + "\"userName\" : \"" + result.getUserName() + "\" ,"
                    + "\"userPhone\" : \"" + result.getUserPhone() + "\" ,"
                    + "\"isRented\" : \"" + result.getIsRented() + "\" "
                    + "}";
            req.setAttribute("json", json);

        }


        return "board/APILogin";
    }

    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public String info(HttpServletRequest req) throws Exception {

        return "board/info";
    }

}