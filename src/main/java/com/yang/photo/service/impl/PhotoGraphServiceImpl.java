package com.yang.photo.service.impl;

import com.yang.photo.dao.PhotoDao;
import com.yang.photo.dao.PhotoGraphDao;
import com.yang.photo.pojo.Photo;
import com.yang.photo.pojo.PhotoGraph;
import com.yang.photo.service.PhotoGraphService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * &lt;一句话功能简述&gt;
 * &lt;功能详细描述&gt;
 * @since [产品/模块版本]
 * @author yangqingfang@qding.com
 * @version v1.0
 * Date:2020/3/27 15:03
 */
@Service
public class PhotoGraphServiceImpl implements PhotoGraphService {

    @Autowired
    private PhotoGraphDao photoGraphDao;

    @Autowired
    private PhotoDao photoDao;

    @Override public List<PhotoGraph> getPhotoGraphByUserId(int id) {
        List<PhotoGraph> photoGraphList = photoGraphDao.getPhotoGraphByUserId(id);
        return photoGraphList;
    }

    @Override public int addPhotoGraph(PhotoGraph photoGraph) {
        if(photoGraph != null){
            return photoGraphDao.addPhotoGraph(photoGraph);
        }
        return 0;
    }

    @Override public PhotoGraph getPhotoGraphById(int id) {
        return photoGraphDao.getPhotoGraphById(id);
    }

    @Override public int updatePhotoGraph(PhotoGraph photoGraph) {
        return photoGraphDao.updatePhotoGraph(photoGraph);
    }

    @Override public int deletePhotoGraphById(PhotoGraph photoGraph) {
        int result = deletePhotoGraphById(photoGraph);
        //删除相册下的相片
        if(result > 0){
            Photo photo = new Photo();
            photo.setGid(photoGraph.getId());
            result += photoDao.deletePhoto(photo);
        }
        return result;
    }

}
