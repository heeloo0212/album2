package com.yang.photo.controller;

import com.yang.photo.pojo.PhotoGraph;
import com.yang.photo.pojo.User;
import com.yang.photo.service.PhotoGraphService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @RequestMapping("/addPhotograph")
    public String addPhotoGraph(PhotoGraph photoGraph){
        if (photoGraph != null){
            photoGraph.setCreateTime(new Date());
            int result = photoGraphService.addPhotoGraph(photoGraph);
        }
        return "main";
    }

    @RequestMapping("/toMain")
    public String toMain(Model model, HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        System.out.println(user);
        if(user != null) {
            List<PhotoGraph> photoGraphList = photoGraphService.getPhotoGraphByUserId(user.getId());
            System.out.println(photoGraphList);
            for (PhotoGraph p : photoGraphList) {
                System.out.println("photoGraph:" + p);
            }
            model.addAttribute("photoGraphList", photoGraphList);
            String userName = user.getName();
            model.addAttribute("userName", userName);
        }
        return "main";
    }

}
