package com.yang.photo.controller;

import com.yang.photo.pojo.Photo;
import com.yang.photo.service.PhotoService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class PhotoController {

    @Autowired
    private PhotoService photoService;

    @RequestMapping(value = "/addPhoto",method = RequestMethod.POST)
    public String addPhoto(HttpSession session,@RequestParam(value="file",required=false) MultipartFile[] file) throws Exception{
        List<Photo> photos = new ArrayList<>();
        Photo photo1 =new Photo();
        System.out.println(file.toString());
        for (MultipartFile mf : file) {
            if (!mf.isEmpty()) {
                // 使用UUID给图片重命名，并去掉四个“-”
                String name = UUID.randomUUID().toString().replaceAll("-", "");
                // 获取文件的扩展名
                String ext = FilenameUtils.getExtension(mf
                        .getOriginalFilename());
                // 设置图片上传路径
                String uploadFilePath = session.getServletContext().getRealPath("/WEB-INF/upload/admin");
                System.out.println(uploadFilePath);
                // 以绝对路径保存重名命后的图片
                mf.transferTo(new File(uploadFilePath + "/" + name + "." + ext));
                // 把图片存储路径保存到数据库
                String path = "upload/" + name + "." + ext;
                photo1.setImage(path);
                photo1.setGid(1);
                photo1.setCreateTime(new Date());
            }
            photos.add(photo1);
        }
        photoService.batchAddPhoto(photos);
        return "main";
    }

}
