package com.yang.photo.service;

import com.yang.photo.pojo.PhotoGraph;

import java.util.List;

public interface PhotoGraphService {

    List<PhotoGraph> getPhotoGraphByUserId(int id);
    int addPhotoGraph(PhotoGraph photoGraph);

}
