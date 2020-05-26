package com.yang.photo.controller;

import com.yang.photo.pojo.ResponseResult;
import com.yang.photo.pojo.User;
import com.yang.photo.pojo.Video;
import com.yang.photo.service.VideoService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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

    @RequestMapping("/addVideo")
    public String addVideo(Video video,MultipartFile videoFile,HttpSession session) throws Exception{
        Video video1 = new Video();
        User user = SessionCommon.getUserSession(session);
        if(video != null && videoFile != null){
            String address = UUID.randomUUID().toString().replaceAll("-", "");
            // 获取文件的扩展名
            String ext = FilenameUtils.getExtension(videoFile
                .getOriginalFilename());

            // 设置图片上传路径
            String uploadFilePath = session.getServletContext().getRealPath("\\WEB-INF\\upload\\video");
            videoFile.transferTo(new File(uploadFilePath + "\\" + address + "." + ext));

            //把视频信息上传到数据库里
            String path = "upload\\video\\" + address + "." + ext;
            video1.setName(video.getName());
            video1.setUserId(user.getId());
            video1.setVideoAddress(path);
            video1.setInfo(video.getInfo());
            video1.setCreateTime(new Date());

            videoService.addVideo(video1);
        }

        return "forward:getVideo";
    }

    @RequestMapping("/deleteVideo")
    @ResponseBody
    public ResponseResult deleteVideo(int id){
        ResponseResult responseResult = new ResponseResult();
        int result = 0;
        if(id != 0){
            result = videoService.deleteVideoById(id);
        }
        if(result > 0){
            responseResult.setStatus(1);
            responseResult.setMessage("删除成功");
        }else{
            responseResult.setStatus(0);
            responseResult.setMessage("删除失败");
        }
        return responseResult;
    }
}
