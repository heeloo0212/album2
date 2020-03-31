package com.yang.photo.controller;

import com.yang.photo.pojo.Photo;
import com.yang.photo.pojo.PhotoGraph;
import com.yang.photo.pojo.ResponseResult;
import com.yang.photo.pojo.User;
import com.yang.photo.service.PhotoGraphService;
import com.yang.photo.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * &lt;一句话功能简述&gt;
 * &lt;功能详细描述&gt;
 * @since [产品/模块版本]
 * @author yangqingfang@qding.com
 * @version v1.0
 * Date:2020/3/27 15:06
 */
@Controller
public class PhotoGraphController {

    @Autowired
    private PhotoGraphService photoGraphService;

    @Autowired
    private PhotoService photoService;

    @RequestMapping("/addPhotograph")
    @ResponseBody
    public ResponseResult addPhotoGraph(PhotoGraph photoGraph,HttpSession session){
        ResponseResult responseResult = new ResponseResult();
        User user = (User)session.getAttribute("loginUser");
        if (photoGraph != null && user != null){
            photoGraph.setUserId(user.getId());
            photoGraph.setCreateTime(new Date());
            int result = photoGraphService.addPhotoGraph(photoGraph);
            if (result > 0){
                responseResult.setStatus(1);
                responseResult.setMessage("创建成功");
            }else{
                responseResult.setStatus(0);
                responseResult.setMessage("创建失败");
            }
        }
        return responseResult;
    }

    @RequestMapping("/toMain")
    public String toMain(Model model, HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        if(user != null) {
            List<PhotoGraph> photoGraphList = photoGraphService.getPhotoGraphByUserId(user.getId());
            model.addAttribute("photoGraphList", photoGraphList);
            String userName = user.getName();
            model.addAttribute("userName", userName);
        }
        return "main";
    }

    @RequestMapping("/deletePhotoGraph")
    @ResponseBody
    public ResponseResult deletePhotoGraph(int id){
        ResponseResult responseResult = new ResponseResult();
        int result = 0;
        if(id != 0){
            Photo photo = new Photo();
            PhotoGraph photoGraph = new PhotoGraph();
            photo.setGid(id);
            photoGraph.setId(id);
            result = photoGraphService.deletePhotoGraphById(photoGraph) + photoService.deletePhoto(photo);
        }
        if(result > 1){
            responseResult.setStatus(1);
            responseResult.setMessage("删除相册成功");
        }else{
            responseResult.setStatus(0);
            responseResult.setMessage("删除相册失败");
        }
        return responseResult;
    }

    @RequestMapping("/modifyPhotoGraph")
    @ResponseBody
    public ResponseResult modifyPhotoGraph(PhotoGraph photoGraph){
        ResponseResult responseResult =new ResponseResult();
        int result = 0;
        if(photoGraph != null){
            result = photoGraphService.updatePhotoGraph(photoGraph);
        }
        if(result > 0){
            responseResult.setStatus(1);
            responseResult.setMessage("修改成功");
        }else{
            responseResult.setStatus(0);
            responseResult.setMessage("修改失败");
        }
        return responseResult;
    }
}
