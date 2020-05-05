package com.yang.photo.service.impl;

import com.yang.photo.dao.PhotoDao;
import com.yang.photo.pojo.Photo;
import com.yang.photo.pojo.PhotoGraph;
import com.yang.photo.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

@Service
public class PhotoServiceImpl implements PhotoService {

    @Autowired
    private PhotoDao photoDao;

    @Override
    public List<Photo> getPhotoListByGid(Photo photo) {
        return photoDao.getPhotoListByGid(photo);
    }

    @Override
    public int batchAddPhoto(List<Photo> photos) {
        return photoDao.batchAddPhoto(photos);
    }

    @Override public int deletePhoto(Photo photo){
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes)RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = requestAttributes.getRequest();
        String path = request.getSession().getServletContext().getRealPath("/");

        //删除文件存的照片
        Photo photo1 = photoDao.getPhotoById(photo.getId());
        String deletePath = path + "WEB-INF\\" + photo1.getImage();
        File deleteFile = new File(deletePath);
        if(deleteFile.exists()){
            if(deleteFile.delete()){
                System.out.println("删除成功" + deletePath);
            }else{
                System.out.println("删除失败" + deletePath);
            }
        }
        return photoDao.deletePhoto(photo);
    }

    @Override public Photo getFirstImage(PhotoGraph photoGraph) {
        return photoDao.getFirstImage(photoGraph);
    }

}
