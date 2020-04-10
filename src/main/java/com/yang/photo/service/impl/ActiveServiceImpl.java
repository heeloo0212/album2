package com.yang.photo.service.impl;

import com.yang.photo.dao.ActiveDao;
import com.yang.photo.dao.CommentDao;
import com.yang.photo.dao.ShowPhotoDao;
import com.yang.photo.pojo.Active;
import com.yang.photo.pojo.Comment;
import com.yang.photo.pojo.ShowPhoto;
import com.yang.photo.service.ActiveService;
import com.yang.photo.service.ShowPhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActiveServiceImpl implements ActiveService {

    @Autowired
    private ActiveDao activeDao;

    @Autowired
    private ShowPhotoDao showPhotoDao;

    @Autowired
    private ShowPhotoService showPhotoService;

    @Autowired
    private CommentDao commentDao;

    @Override public List<Active> getActiveList() {
        List<Active> activeList = activeDao.getActiveList();
        ShowPhoto showPhoto = new ShowPhoto();
        Comment comment = new Comment();
        for(Active a : activeList){
            showPhoto.setActiveId(a.getId());
            List<ShowPhoto> showPhotoList = showPhotoDao.getShowPhoto(showPhoto);

            comment.setActiveId(a.getId());
            List<Comment> commentList = commentDao.getComments(comment);

            a.setShowPhotoList(showPhotoList);
            a.setCommentList(commentList);
        }
        return activeList;
    }

    @Override public int addActive(Active active,List<ShowPhoto> showPhotoList) {
        int result = activeDao.addActive(active);
        int activeId = active.getId();
        for(ShowPhoto showPhoto : showPhotoList){
            showPhoto.setActiveId(activeId);
        }
        showPhotoService.batchAddShowPhoto(showPhotoList);
        return result;
    }

    @Override public Active getActiveById(int id) {
        return activeDao.getActiveById(id);
    }
}
