package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;
import java.util.Optional;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import dao.NotiDAO;
import domain.NotiVO;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

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

    @Inject
    private NotiDAO ndao;


    FCMService firebaseCloudMessageService = new FCMService();


    @PostMapping("/fcm")
    public ResponseEntity pushMessage(@RequestParam String TargetToken, String Title, String Body) throws IOException {
        System.out.println(TargetToken + ", "+ Title + ", " + Body);

        firebaseCloudMessageService.sendMessageTo(TargetToken, Title, Body);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/fcm/set")
    public String setToken(HttpServletRequest req, @RequestParam String token, String userId, String password) throws Exception {
        LoginVO lVo = new LoginVO();
        lVo.setID(userId);
        lVo.setPassword(password);

        lVo = ldao.login(lVo);
        lVo.setToken(token);

        ldao.updateToken(lVo);

        req.setAttribute("json","{\"result\" : \"1\"}");
        return "board/APIPage";
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginAPI(HttpServletRequest req) throws Exception {

        System.out.println(req.getRequestURI());
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


        return "board/APIPage";
    }
    
    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String showAPI(HttpServletRequest req) throws Exception {
        System.out.println(req.getRequestURI());
        List<ObjectVO> objList = new ArrayList<ObjectVO>();
        String brand = req.getParameter("brand");
        String json = "";

        switch (brand) {
            case "samsung" :
                objList = odao.showSamsungs();
                break;
            case "lg" :
                objList = odao.showLGs();
                break;
            case "msi" :
                objList = odao.showMSIs();
                break;
            case "apple" :
                objList = odao.showApples();

        }

        int index = 0;
        json += "{ \"Data\": [";
        for(ObjectVO o: objList) {
            ///json += "\""+index+"\": {";
            json += "{ ";
            json += "\"code\":"+"\""+o.getCode()+"\", ";
            json += "\"rentDate\":"+"\""+o.getRentDate()+"\", ";
            json += "\"returnDate\":"+"\""+o.getReturnDate()+"\", ";
            json += "\"status\":"+"\""+o.getStatus()+"\", ";
            json += "\"name\":"+"\""+o.getName()+"\", ";
            json += "\"userId\":"+"\""+o.getUserID()+"\", ";
            json += "\"userPhone\":"+"\""+o.getUserPhone()+"\"";
            json += "}";

            if (index == objList.size()-1) {
                //json += ", \"size\":"+(index+1);
            }
            else {
                index++;
                json += ", ";
            }
        }
        json += " ]}";
        req.setAttribute("json", json);
        return "board/APIPage";
    }
    
    @RequestMapping(value = "/showLog", method = RequestMethod.GET)
    public String showSpecipicAPI(HttpServletRequest req) throws Exception {
        System.out.println(req.getRequestURI());
        String id = req.getParameter("userId");
        String json = "";

        
    	List<RecordVO> record = rdao.showSpecipicRecords(id);

        int index = 0;
        json += "{ \"Data\": [";
        for(RecordVO r : record) {
            ///json += "\""+index+"\": {";
            json += "{ ";
            json += "\"code\":"+"\""+r.getCode()+"\", ";
            json += "\"rentDate\":"+"\""+r.getRentDate()+"\", ";
            json += "\"returnDate\":"+"\""+r.getReturnDate()+"\", ";
            json += "\"name\":"+"\""+r.getName()+"\", ";
            json += "\"userId\":"+"\""+r.getUserID()+"\", ";
            json += "\"userPhone\":"+"\""+r.getUserPhone()+"\"";
            json += "}";
            
            if (index == record.size()-1) {
                //json += ", \"size\":"+(index+1);
            }
            else {
                index++;
                json += ", ";
            }
        }
        json += " ]}";
        req.setAttribute("json", json);
    	
    	return "board/APIPage";
    }

    @RequestMapping(value = "/Rent", method = RequestMethod.GET)
    public String checkAPI(HttpServletRequest req) throws Exception {
        System.out.println(req.getRequestURI());

        String code = req.getParameter("code");
        String userId = req.getParameter("userId");
        String userPhone = req.getParameter("userPhone");
        String rentDate = req.getParameter("rentDate");
        String returnDate = req.getParameter("returnDate");

        ObjectVO result = odao.checkObjects(code);
        LoginVO lvo = new LoginVO();
        lvo.setID(userId);


        if (result.getStatus().equals("대여가능")) {
            result.setStatus("승인대기중");
            result.setUserID(userId);
            result.setUserPhone(userPhone);
            result.setRentDate(rentDate);
            result.setReturnDate(returnDate);
            odao.updateObject(result);

            RecordVO rvo = new RecordVO();
            rvo.setCode(result.getCode());
            rvo.setName(result.getName());
            rvo.setUserID(userId);
            rvo.setUserPhone(userPhone);
            rvo.setRentDate(rentDate);
            rvo.setReturnDate(returnDate);
            rdao.insertRecord(rvo);
            ldao.Rent(lvo);
            req.setAttribute("json", "{\"result\" : \"1\"}");

        }
        else{
        	req.setAttribute("json", "{\"result\" : \"0\"}");
        }
        return "board/APIPage";
    }
    @RequestMapping(value = "/noti", method = RequestMethod.GET)
    public String notiAPI(HttpServletRequest req) throws Exception {
        System.out.println(req.getRequestURI());

        String id = req.getParameter("userId");
        String json = "";


        NotiVO temp = new NotiVO();
        temp.setUserId(id);

        List<NotiVO> noti = ndao.showNoti(temp);
        System.out.println(noti.size());

        int index = 0;
        json += "{ \"Data\": [";
        for(NotiVO n : noti) {
            ///json += "\""+index+"\": {";
            json += "{ ";
            json += "\"userId\":"+"\""+n.getUserId()+"\", ";
            json += "\"date\":"+"\""+n.getDate()+"\", ";
            json += "\"detail\":"+"\""+n.getDetail()+"\"";
            json += "}";

            if (index == noti.size()-1) {
                //json += ", \"size\":"+(index+1);
            }
            else {
                index++;
                json += ", ";
            }
        }
        json += " ]}";
        req.setAttribute("json", json);

        return "board/APIPage";
    }
}