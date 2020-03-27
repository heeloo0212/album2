package com.yang.photo.service.impl;

import com.yang.photo.dao.PhotoGraphDao;
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

    @Override public List<PhotoGraph> getPhotoGraphByUserId(int id) {
        return null;
    }

    @Override public int addPhotoGraph(PhotoGraph photoGraph) {
        if(photoGraph != null){
            return photoGraphDao.addPhotoGraph(photoGraph);
        }
        return 0;
    }
}
