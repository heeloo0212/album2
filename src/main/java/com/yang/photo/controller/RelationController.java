package com.yang.photo.controller;

import com.yang.photo.common.Constans;
import com.yang.photo.pojo.*;
import com.yang.photo.service.MessageService;
import com.yang.photo.service.RelationService;
import com.yang.photo.service.ValidaMesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class RelationController {

    @Autowired
    private RelationService relationService;

    @Autowired
    private ValidaMesService validaMesService;

    @Autowired
    private MessageService messageService;

    @RequestMapping("/getAllFriend")
    public String getAllFriend(HttpSession session, Model model){
        User user = (User)session.getAttribute("loginUser");

        //关联表
        Relation relation = new Relation();
        /*relation.setFriendGroup(friendGroup);*/
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
    public ResponseResult addFriend(String friendGroup,Integer id,HttpSession session){
        ResponseResult responseResult = new ResponseResult();
        int result = 0;
        System.out.println(id);
        if(friendGroup != null && id != 0) {
            String uuid = UUID.randomUUID().toString();
            User user = (User)session.getAttribute("loginUser");

            Relation relation2 = relationService.getRelationByUIdAndFId(user.getId(), id);
            if (relation2 == null) {
                Relation relation = new Relation();
                relation.setUserId(user.getId());
                relation.setFriendId(id);
                relation.setFriendGroup(friendGroup);
                relation.setTalkRoom(uuid);
                relation.setStatus(Constans.WAITING_VALIDATION);
                result = relationService.addFriend(relation);
            }

            Relation relation3 = relationService.getRelationByUIdAndFId(id, user.getId());
            if (relation3 == null) {
                Relation relation1 = new Relation();
                relation1.setUserId(id);
                relation1.setFriendId(user.getId());
                relation1.setFriendGroup(friendGroup);
                relation1.setTalkRoom(uuid);
                relation1.setStatus(Constans.WAITING_VALIDATION);
                result += relationService.addFriend(relation1);
            }

            //增加验证消息
            ValidaMes validaMes1 = validaMesService.getValidaMesByUIdAndFid(id, user.getId());
            if (validaMes1 == null) {
                ValidaMes validaMes = new ValidaMes();
                //关系表的朋友id就是验证消息的用户id
                validaMes.setUserId(id);
                validaMes.setFriendId(user.getId());
                validaMes.setMes(Constans.REQUEST_MES_VALIDA);
                validaMes.setStatus(Constans.WAITING_VALIDATION);
                result += validaMesService.addValidaMes(validaMes);
            }
            //同时添加一个聊天室
            Message message = new Message();
            message.setTalkRoom(uuid);
            message.setCreateTime(new Date());
            result += messageService.addMessage(message);

            System.out.println(result);
        }
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

    @RequestMapping("/deleteFriend")
    @ResponseBody
    public ResponseResult deleteFriend(HttpSession session,int friendId){
        ResponseResult responseResult = new ResponseResult();
        User user = SessionCommon.getUserSession(session);

        Relation relation = new Relation();
        relation.setFriendId(friendId);
        relation.setUserId(user.getId());

        int result = relationService.deleteFriend(relation);
        if(result > 0){
            responseResult.setStatus(1);
            responseResult.setMessage("删除好友成功");
        }else{
            responseResult.setStatus(0);
            responseResult.setMessage("删除好友失败");
        }
        return responseResult;
    }

    @RequestMapping("/addMessage")
    @ResponseBody
    public ResponseResult addMessage(HttpSession session,String content,String talkRoom){
        ResponseResult responseResult = new ResponseResult();
        User user = SessionCommon.getUserSession(session);

        Message message = new Message();
        message.setTalker(user.getName());
        message.setContent(content);
        message.setTalkRoom(talkRoom);
        message.setCreateTime(new Date());
        int result = messageService.addMessage(message);
        if(result > 1){
            responseResult.setData(message);
        }
        return responseResult;
    }

    @RequestMapping("/getMessage")
    @ResponseBody
    public ResponseResult getMessage(String talkRoom){
        ResponseResult responseResult = new ResponseResult();
        Message message = new Message();
        message.setTalkRoom(talkRoom);
        List<Message> messageList = messageService.getMessage(message);
        if(messageList != null){
            responseResult.setData(messageList);
        }
        return responseResult;
    }
}
