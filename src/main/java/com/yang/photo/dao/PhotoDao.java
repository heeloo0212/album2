package com.yang.photo.dao;

import com.yang.photo.pojo.Photo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PhotoDao {

    List<Photo> getPhotoListByGid(Photo photo);

    int batchAddPhoto(List<Photo> photo);

    int deletePhotoById(Photo photo);

}
