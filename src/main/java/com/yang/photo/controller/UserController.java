package com.yang.photo.controller;

import com.yang.photo.pojo.PhotoGraph;
import com.yang.photo.pojo.ResponseResult;
import com.yang.photo.pojo.User;
import com.yang.photo.service.PhotoGraphService;
import com.yang.photo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private PhotoGraphService photoGraphService;

    @RequestMapping("/toIndex")
    public String toLogin(){
        return "login";
    }

    @PostMapping("/loginPage")
    public String login(User user, HttpSession session){
        if(user != null){
            User user1=userService.loginNameAndPassword(user);
            session.setAttribute("loginUser",user1);
            if(user1 != null){
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
        System.out.println(user.getSex() + "  " +user.getEmail());
        if(user != null){
            userService.addUser(user);
            return "login";
        }
        return "error";
    }

    @RequestMapping("/toPersonInfo")
    public String toPersonInfo(HttpSession session,Model model){
        User user = (User) session.getAttribute("loginUser");
        model.addAttribute("user",user);
        return "personInfo";
    }

    @RequestMapping("/modifyUser")
    @ResponseBody
    public ResponseResult modifyUser(User user){
        ResponseResult responseResult = new ResponseResult();
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


}
