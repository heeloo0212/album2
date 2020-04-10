package com.yang.photo.controller;

import com.yang.photo.common.Constans;
import com.yang.photo.dao.CommentDao;
import com.yang.photo.pojo.*;
import com.yang.photo.service.ActiveService;
import com.yang.photo.service.CommentService;
import com.yang.photo.service.PhotoGraphService;
import com.yang.photo.service.ShowPhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class ActiveController {

    @Autowired
    private ActiveService activeService;

    @Autowired
    private CommentDao commentDao;

    @RequestMapping("/toShowAllPhotos")
    public String toShowAllPhotos(Model model, HttpSession session){
        List<Active> activeList = activeService.getActiveList();
        if(activeList != null) {
            model.addAttribute("activeList", activeList);
        }
        return  "showAllPhotos";
    }

    @RequestMapping("/addComment")
    @ResponseBody
    public ResponseResult addComment(Comment comment,HttpSession session){
        ResponseResult responseResult = new ResponseResult();
        User user = SessionCommon.getUserSession(session);
        Comment comment1 = new Comment();
        comment1.setActiveId(comment.getActiveId());
        comment1.setBeCommentor(comment.getBeCommentor());
        comment1.setContent(comment.getContent());
        comment1.setCommentor(user.getName());
        comment1.setCommentTime(new Date());
        Active active = activeService.getActiveById(comment.getActiveId());
        if(active.getUserName().equals(comment.getBeCommentor())){
            comment1.setStatus(Constans.BE_COMMENTOR_IS_ACTIVER);
        }else{
            comment1.setStatus(Constans.BE_COMMENTOR_NOT_ACTIVER);
        }
        int result = commentDao.addComment(comment1);
        if(result > 0){
            responseResult.setStatus(1);
        }else{
            responseResult.setStatus(0);
        }
        return responseResult;
    }
}
