package com.yang.photo.controller;

import com.yang.photo.pojo.Active;
import com.yang.photo.pojo.PhotoGraph;
import com.yang.photo.pojo.ShowPhoto;
import com.yang.photo.pojo.User;
import com.yang.photo.service.ActiveService;
import com.yang.photo.service.PhotoGraphService;
import com.yang.photo.service.ShowPhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ActiveController {

    @Autowired
    private ActiveService activeService;

    @Autowired
    private ShowPhotoService showPhotoService;

    @Autowired
    private PhotoGraphService photoGraphService;

    @RequestMapping("/toShowAllPhotos")
    public String toShowAllPhotos(Model model, HttpSession session){
        List<Active> activeList = activeService.getActiveList();
        if(activeList != null) {
            model.addAttribute("activeList", activeList);
        }
        return  "showAllPhotos";
    }
}
