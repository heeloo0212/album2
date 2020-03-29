package com.yang.photo.service.impl;

import com.yang.photo.dao.PhotoDao;
import com.yang.photo.pojo.Photo;
import com.yang.photo.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PhotoServiceImpl implements PhotoService {

    @Autowired
    private PhotoDao photoDao;

    @Override
    public List<Photo> getPhotoListByGid(Photo photo) {
        return null;
    }

    @Override
    public int batchAddPhoto(List<Photo> photos) {
        return photoDao.batchAddPhoto(photos);
    }

    @Override
    public int deletePhotoById(Photo photo) {
        return 0;
    }
}
