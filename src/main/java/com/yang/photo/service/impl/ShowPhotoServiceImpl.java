package com.yang.photo.service.impl;

import com.yang.photo.dao.ShowPhotoDao;
import com.yang.photo.pojo.ShowPhoto;
import com.yang.photo.service.ShowPhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShowPhotoServiceImpl implements ShowPhotoService {

    @Autowired
    private ShowPhotoDao showPhotoDao;

    @Override public int batchAddShowPhoto(List<ShowPhoto> showPhotoList) {
        return showPhotoDao.batchAddShowPhoto(showPhotoList);
    }

    @Override public List<ShowPhoto> getShowPhoto(ShowPhoto showPhoto) {
        return showPhotoDao.getShowPhoto(showPhoto);
    }
}
