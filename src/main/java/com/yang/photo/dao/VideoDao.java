package com.yang.photo.dao;

import com.yang.photo.pojo.Video;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VideoDao {

    List<Video> getVideoList(int userId);

    Video getVideoById(int id);

    int addVideo(Video video);

    int deleteVideoById(int id);

    int updateVideo(Video video);
}
