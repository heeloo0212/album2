package com.yang.photo.service;

import com.yang.photo.pojo.ShowPhoto;

import java.util.List;

public interface ShowPhotoService {
    int batchAddShowPhoto(List<ShowPhoto> showPhotoList);
    List<ShowPhoto> getShowPhoto(ShowPhoto showPhoto);
}
