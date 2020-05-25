package com.yang.photo.controller;

import com.yang.photo.pojo.User;
import com.yang.photo.pojo.Video;
import com.yang.photo.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class VideoController {

    @Autowired
    private VideoService videoService;

    @RequestMapping("/getVideo")
    public String getVideoList(HttpSession session, Model model){
        User user = SessionCommon.getUserSession(session);
        if(user != null){
            List<Video> videoList = videoService.getVideoList(user.getId());
            model.addAttribute("videoList",videoList);
        }else{
            return "error";
        }
        return "video";
    }

}
