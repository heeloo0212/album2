package com.yang.photo.controller;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.yang.photo.pojo.ResponseResult;
import com.yang.photo.pojo.User;
import com.yang.photo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private Producer captchaProducer;

    @RequestMapping("/toIndex")
    public String toLogin(){
        return "login";
    }

    @PostMapping("/loginPage")
    public String login(User user, HttpSession session,HttpServletRequest request){
        if(user != null){
            User user1=userService.getUser(user);
            session.setAttribute("loginUser",user1);
            String captchaId = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
            String code = request.getParameter("code");
            if(user1 != null && captchaId.equals(code)){
                return "forward:toMain";
            }else{
                return "error";
            }
        }else{
            return "error";
        }
    }

    @RequestMapping("/register")
    public String toRegister(){
        return "userRegister";
    }

    @RequestMapping("/addUser")
    public String addUser(User user){
        if(user != null){
            userService.addUser(user);
            return "login";
        }
        return "error";
    }

    @RequestMapping("/toPersonInfo")
    public String toPersonInfo(HttpSession session,Model model){
        User user = (User) session.getAttribute("loginUser");
        User user1 = new User();
        user1.setId(user.getId());
        User user2 = userService.getUser(user1);
        if(user2 != null){
            session.setAttribute("user",user2);
            return "personInfo";
        }
        return "error";
    }

    @RequestMapping("/modifyUser")
    @ResponseBody
    public ResponseResult modifyUser(User user,HttpSession session){
        ResponseResult responseResult = new ResponseResult();
        User user1 = (User) session.getAttribute("loginUser");
        user.setId(user1.getId());
        int result = 0;
        if(user != null){
            result = userService.modifyUser(user);
        }
        if(result > 0){
            responseResult.setStatus(1);
            responseResult.setMessage("修改成功");
        }else{
            responseResult.setStatus(0);
            responseResult.setMessage("修改失败");
        }
        return responseResult;
    }

    @RequestMapping("/getUser")
    @ResponseBody
    public ResponseResult getUser(String name){
        ResponseResult responseResult = new ResponseResult();
        User user = new User();
        user.setName(name);
        User user1 = userService.getUser(user);
        responseResult.setData(user1);
        return responseResult;
    }

    @RequestMapping("/modifyUserPassword")
    @ResponseBody
    public ResponseResult modifyUserPassword(String oldPassword,String newPassword,HttpSession session){
        ResponseResult responseResult = new ResponseResult();
        User user = new User();
        User user1 = SessionCommon.getUserSession(session);
        User user2 = new User();
        user2.setPassword(oldPassword);
        int result = 0;
        if(userService.getUser(user2) != null) {
            user.setId(user1.getId());
            user.setPassword(newPassword);
            result = userService.modifyUser(user);
        }
        if(result > 0){
            responseResult.setStatus(1);
            responseResult.setMessage("修改密码成功，请重新登录");
        }else{
            responseResult.setStatus(0);
            responseResult.setMessage("修改密码失败");
        }
        return responseResult;
    }

    @RequestMapping("/checkName")
    @ResponseBody
    public Map<String,Object> checkName(String name){
        Map<String,Object> map = new HashMap<>();
        User user1 = new User();
        user1.setName(name);
        User user = userService.getUser(user1);
        if(user == null){
            map.put("valid",true);
        }else{
            map.put("valid",false);
            map.put("message", "用户（" + name + "）已存在");
        }
        return map;
    }

    @RequestMapping(value = "verification", method = RequestMethod.GET)
    public ModelAndView verification(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setDateHeader("Expires", 0);
        // Set standard HTTP/1.1 no-cache headers.
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        // Set standard HTTP/1.0 no-cache header.
        response.setHeader("Pragma", "no-cache");
        // return a jpeg
        response.setContentType("image/jpeg");
        // create the text for the image
        String capText = captchaProducer.createText();
        // store the text in the session
        request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
        // create the image with the text
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream out = response.getOutputStream();
        // write the data out
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
        return null;
    }


    @RequestMapping("/toFriends")
    public String toFriends(){
        return "friends";
    }

}
