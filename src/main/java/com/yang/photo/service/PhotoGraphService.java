package com.yang.photo.service;

import com.yang.photo.pojo.PhotoGraph;

import java.util.List;

public interface PhotoGraphService {

    List<PhotoGraph> getPhotoGraphByUserId(int id);
    int addPhotoGraph(PhotoGraph photoGraph);
    /**
     * 根据ID查询相册
     * */
    PhotoGraph getPhotoGraphById(int id);

    int updatePhotoGraph(PhotoGraph photoGraph);

}
