package com.yang.photo.service;

import com.yang.photo.pojo.Active;
import com.yang.photo.pojo.ShowPhoto;

import java.util.List;

public interface ActiveService {
    List<Active> getActiveList(Active active,int pageNum,int pageSize);
    int addActive(Active active,List<ShowPhoto> showPhotoList);
    Active getActiveById(int id);
    int deletActive(int id);
    int updateActive(Active active);
}
