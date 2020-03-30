package com.yang.photo.service;

import com.yang.photo.pojo.Photo;
import com.yang.photo.pojo.PhotoGraph;

import java.util.List;

public interface PhotoService {

    List<Photo> getPhotoListByGid(Photo photo);

    int batchAddPhoto(List<Photo> photos);

    int deletePhotoById(Photo photo);

    Photo getFirstImage(PhotoGraph photoGraph);
}
