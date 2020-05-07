package com.yang.photo.controller;

import com.yang.photo.pojo.*;
import com.yang.photo.service.ActiveService;
import com.yang.photo.service.PhotoGraphService;
import com.yang.photo.service.PhotoService;
import com.yang.photo.service.ShowPhotoService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

    @Autowired
    private PhotoGraphService photoGraphService;

    @Autowired
    private ActiveService activeService;

    @RequestMapping("/getPhotos")
    public String getPhotos(Integer gid, Model model){
        if(gid != 0) {
            Photo photo = new Photo();
            photo.setGid(gid);
            List<Photo> photoList = photoService.getPhotoListByGid(photo);
            model.addAttribute("photoList",photoList);
            model.addAttribute("gid",gid);
        }
        return "photos";
    }

    @RequestMapping(value = "/addPhoto",method = RequestMethod.POST)
    public String addPhoto(Photo photo,HttpSession session,@RequestParam(value="file",required=false) MultipartFile[] file) throws Exception{
        List<Photo> photos = new ArrayList<>();

        //将刚上传的图片存入到show_photo表中
        List<ShowPhoto> showPhotos = new ArrayList<>();
        ShowPhoto showPhoto;
        Active active = new Active();

        Photo photo1 =null;
        User user = (User)session.getAttribute("loginUser");
        int gid=photo.getGid();
        PhotoGraph photoGraph = photoGraphService.getPhotoGraphById(gid);
        for (MultipartFile mf : file) {
            photo1=new Photo();
            showPhoto = new ShowPhoto();
            if (!mf.isEmpty()) {
                // 使用UUID给图片重命名，并去掉四个“-”
                String name = UUID.randomUUID().toString().replaceAll("-", "");
                // 获取文件的扩展名
                String ext = FilenameUtils.getExtension(mf
                        .getOriginalFilename());
                // 设置图片上传路径
                String uploadFilePath = session.getServletContext().getRealPath("\\WEB-INF\\upload\\"+user.getName());

                //根据用户名创建文件夹
                File file1 = new File(uploadFilePath);
                if(!file1.exists()){
                    file1.mkdir();
                }

                // 以绝对路径保存重名命后的图片
                mf.transferTo(new File(uploadFilePath + "\\" + name + "." + ext));
                // 把图片存储路径保存到数据库
                String path = "upload\\" + user.getName() + "\\" + name + "." + ext;
                photo1.setImage(path);
                photo1.setGid(gid);
                photo1.setCreateTime(new Date());
                photos.add(photo1);

                //将刚上传的图片存入到show_photo表中
                showPhoto.setImage(path);
                showPhotos.add(showPhoto);

                //添加一条刚上传图片的动态
                active.setGraphId(gid);
                active.setUserName(user.getName());
                active.setGraphName(photoGraph.getName());
                active.setCreateTime(new Date());
            }
        }
        //插入多张图片
        photoService.batchAddPhoto(photos);

        activeService.addActive(active,showPhotos);

        //将上传的第一张图片设置为相册的封面
        PhotoGraph photoGraph1 = new PhotoGraph();
        photoGraph1.setId(gid);
        photoGraph1.setImage(photoService.getFirstImage(photoGraph).getImage());
        photoGraphService.updatePhotoGraph(photoGraph1);
        return "forward:toMain";
    }

    @RequestMapping("/deletePhoto")
    @ResponseBody
    public ResponseResult deletePhoto(int id){
        ResponseResult responseResult = new ResponseResult();
        int result = 0;
        if(id != 0){
            Photo photo = new Photo();
            photo.setId(id);
            result = photoService.deletePhoto(photo);
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
