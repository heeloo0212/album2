package com.yang.photo.service.impl;

import com.yang.photo.dao.VideoDao;
import com.yang.photo.pojo.Video;
import com.yang.photo.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VideoServiceImpl implements VideoService {

    @Autowired
    private VideoDao videoDao;

    @Override public List<Video> getVideoList(int userId) {
        return videoDao.getVideoList(userId);
    }

    @Override public Video getVideoById(int id) {
        return videoDao.getVideoById(id);
    }

    @Override public int addVideo(Video video) {
        return videoDao.addVideo(video);
    }

    @Override public int deleteVideoById(int id) {
        return videoDao.deleteVideoById(id);
    }

    @Override public int updateVideo(Video video) {
        return updateVideo(video);
    }
}
