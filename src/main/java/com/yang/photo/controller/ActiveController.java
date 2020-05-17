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
        User user = SessionCommon.getUserSession(session);
        List<Active> activeList = activeService.getActiveList();
        if(activeList != null) {
            model.addAttribute("activeList", activeList);
            model.addAttribute("user",user);
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
        /*Active active = activeService.getActiveById(comment.getActiveId());*/
        if("null".equals(comment.getBeCommentor())){
            comment1.setStatus(Constans.COMMENT);
        }else{
            comment1.setStatus(Constans.APPLY);
        }
        int result = commentDao.addComment(comment1);
        if(result > 0){
            responseResult.setStatus(1);
            responseResult.setData(comment1);
        }else{
            responseResult.setStatus(0);
        }
        return responseResult;
    }

    @RequestMapping("/deleteActive")
    @ResponseBody
    public ResponseResult deleteActive(int id){
        ResponseResult responseResult = new ResponseResult();
        int result = 0;
        if(id != 0){
            result = activeService.deletActive(id);
        }
        if(result > 2){
            responseResult.setStatus(1);
            responseResult.setMessage("删除成功");
        }else{
            responseResult.setStatus(0);
            responseResult.setMessage("删除失败");
        }
        return responseResult;
    }

    @RequestMapping("addClick")
    @ResponseBody
    public ResponseResult addClick(int id){
        ResponseResult responseResult = new ResponseResult();
        int result = 0;
        Active active = new Active();
        if(id != 0){
            active.setId(id);
            result = activeService.updateActive(active);
        }
        Active active1 = activeService.getActiveById(id);
        if(result > 0){
            responseResult.setData(active1);
            responseResult.setStatus(1);
        }else{
            responseResult.setStatus(0);
        }
        return responseResult;
    }
}
