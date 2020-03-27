package com.yang.photo.controller;

import com.yang.photo.pojo.User;
import com.yang.photo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/toIndex")
    public String toLogin(){
        return "login";
    }

    @PostMapping("/loginPage")
    public String login(User user){
        System.out.println(user.getName());
        User user1=new User();
        if(user != null){
            System.out.println(user.getPassword());
            user1=userService.loginNameAndPassword(user);
            if(user1 != null){
                return "main";
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
        return null;
    }


}
