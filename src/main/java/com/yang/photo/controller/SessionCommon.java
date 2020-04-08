package com.yang.photo.controller;

import com.yang.photo.pojo.User;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;

@Controller
public class SessionCommon {

    public static final User getUserSession(HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        return user;
    }
}
