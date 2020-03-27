package com.yang.photo.controller;

import com.yang.photo.pojo.PhotoGraph;
import com.yang.photo.service.PhotoGraphService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
            int result = photoGraphService.addPhotoGraph(photoGraph);
        }
        return "main";
    }

}
