package com.yang.photo.service;

import com.yang.photo.pojo.Video;

import java.util.List;

public interface VideoService {

    List<Video> getVideoList(int userId);

    Video getVideoById(int id);

    int addVideo(Video video);

    int deleteVideoById(int id);

    int updateVideo(Video video);
}
