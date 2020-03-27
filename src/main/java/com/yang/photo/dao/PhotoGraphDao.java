package com.yang.photo.dao;

import com.yang.photo.pojo.PhotoGraph;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PhotoGraphDao {

    List<PhotoGraph> getPhotoGraphByUserId(int id);

    int addPhotoGraph(PhotoGraph photoGraph);

    int deletePhotoGraphById(PhotoGraph photoGraph);
}
