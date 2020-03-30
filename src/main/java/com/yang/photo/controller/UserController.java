package com.yang.photo.controller;

import com.yang.photo.pojo.PhotoGraph;
import com.yang.photo.pojo.User;
import com.yang.photo.service.PhotoGraphService;
import com.yang.photo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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


}
