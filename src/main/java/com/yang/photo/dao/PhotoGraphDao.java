package com.yang.photo.dao;

import com.yang.photo.pojo.PhotoGraph;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PhotoGraphDao {

    /**
     * 根据用户id查询所有的相册
     * */
    List<PhotoGraph> getPhotoGraphByUserId(int id);

    int addPhotoGraph(PhotoGraph photoGraph);

    /**
     * 根据ID查询相册
     * */
    PhotoGraph getPhotoGraphById(int id);

    int deletePhotoGraphById(PhotoGraph photoGraph);

    int updatePhotoGraph(PhotoGraph photoGraph);
}
