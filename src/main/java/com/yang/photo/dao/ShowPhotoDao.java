package com.yang.photo.dao;

import com.yang.photo.pojo.ShowPhoto;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShowPhotoDao {
    int batchAddShowPhoto(List<ShowPhoto> showPhotoList);
    List<ShowPhoto> getShowPhoto(ShowPhoto showPhoto);
}
