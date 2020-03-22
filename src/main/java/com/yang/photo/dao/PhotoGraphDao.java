package com.yang.photo.dao;

import com.yang.photo.pojo.PhotoGraph;
import org.springframework.stereotype.Repository;

@Repository
public interface PhotoGraphDao {

    int addPhotoGraph(PhotoGraph photoGraph);

    int deletePhotoGraphById(PhotoGraph photoGraph);
}
