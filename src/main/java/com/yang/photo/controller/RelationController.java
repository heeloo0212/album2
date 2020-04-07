package com.yang.photo.controller;

import com.yang.photo.pojo.Relation;
import com.yang.photo.pojo.User;
import com.yang.photo.service.RelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class RelationController {

    @Autowired
    private RelationService relationService;

    @RequestMapping("/getAllFriend")
    public String getAllFriend(HttpSession session, Model model){
        User user = (User)session.getAttribute("loginUser");
        Relation relation = new Relation();
        relation.setUserId(user.getId());
        List<Relation> relationList = relationService.getAllFriendByUserId(relation);
        model.addAttribute("relationList",relationList);
        return "friends";
    }
}
