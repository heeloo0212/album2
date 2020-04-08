package com.yang.photo.controller;

import com.yang.photo.common.Constans;
import com.yang.photo.pojo.Relation;
import com.yang.photo.pojo.ResponseResult;
import com.yang.photo.pojo.User;
import com.yang.photo.pojo.ValidaMes;
import com.yang.photo.service.RelationService;
import com.yang.photo.service.ValidaMesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.UUID;

@Controller
public class RelationController {

    @Autowired
    private RelationService relationService;

    @Autowired
    private ValidaMesService validaMesService;

    @RequestMapping("/getAllFriend")
    public String getAllFriend(HttpSession session, Model model){
        User user = (User)session.getAttribute("loginUser");

        //关联表
        Relation relation = new Relation();
        relation.setUserId(user.getId());
        List<Relation> relationList = relationService.getAllFriendByUserId(relation);

        //验证表
        ValidaMes validaMes = new ValidaMes();
        validaMes.setUserId(user.getId());
        List<ValidaMes> validaMesList = validaMesService.getValidaMes(validaMes);

        model.addAttribute("relationList",relationList);
        model.addAttribute("validaMesList",validaMesList);
        return "friends";
    }

    @RequestMapping("/addFriend")
    @ResponseBody
    public ResponseResult addFriend(String friendGroup,String id,HttpSession session){
        ResponseResult responseResult = new ResponseResult();
        String uuid = UUID.randomUUID().toString();
        User user = (User)session.getAttribute("loginUser");

        Relation relation = new Relation();
        relation.setUserId(user.getId());
        relation.setFriendId(Integer.parseInt(id));
        relation.setFriendGroup(friendGroup);
        relation.setTalkRoom(uuid);
        relation.setStatus(Constans.WAITING_VALIDATION);

        Relation relation1 = new Relation();
        relation1.setUserId(Integer.parseInt(id));
        relation1.setFriendId(user.getId());
        relation1.setFriendGroup(friendGroup);
        relation1.setTalkRoom(uuid);
        relation1.setStatus(Constans.WAITING_VALIDATION);

        //增加验证消息
        ValidaMes validaMes = new ValidaMes();
        //关系表的朋友id就是验证消息的用户id
        validaMes.setUserId(Integer.parseInt(id));
        validaMes.setFriendId(user.getId());
        validaMes.setMes(Constans.REQUEST_MES_VALIDA);
        validaMes.setStatus(Constans.WAITING_VALIDATION);

        int result = relationService.addFriend(relation) + relationService.addFriend(relation1) + validaMesService.addValidaMes(validaMes);
        if(result > 2){
            responseResult.setStatus(1);
            responseResult.setMessage("添加成功,等待对方验证");
        }else{
            responseResult.setStatus(0);
            responseResult.setMessage("添加失败");
        }
        return responseResult;
    }

    @RequestMapping("/modifyValidaMes")
    @ResponseBody
    public ResponseResult modifyValidaMes(int userId,int friendId){
        ResponseResult responseResult = new ResponseResult();
        Relation relation = new Relation();
        relation.setStatus(Constans.SUCCESS_VALIDATION);
        relation.setFriendId(userId);
        relation.setUserId(friendId);

        Relation relation1 = new Relation();
        relation1.setStatus(Constans.SUCCESS_VALIDATION);
        relation1.setFriendId(friendId);
        relation1.setUserId(userId);

        ValidaMes validaMes = new ValidaMes();
        validaMes.setMes(Constans.SUCCESS_MES_VALIDA);
        validaMes.setStatus(Constans.SUCCESS_VALIDATION);
        validaMes.setUserId(userId);
        validaMes.setFriendId(friendId);
        int result = validaMesService.updateValidaMes(validaMes) + relationService.updateRelation(relation) + relationService.updateRelation(relation1);
        if(result > 2){
            responseResult.setStatus(1);
            responseResult.setMessage("添加好友成功");
        }else{
            responseResult.setStatus(0);
            responseResult.setMessage("添加好友失败");
        }
        return responseResult;
    }
}
