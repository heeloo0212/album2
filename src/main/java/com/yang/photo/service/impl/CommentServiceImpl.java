package com.yang.photo.service.impl;

import com.yang.photo.dao.CommentDao;
import com.yang.photo.pojo.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentDao {

    @Autowired
    private CommentDao commentDao;

    @Override public int addComment(Comment comment) {
        return commentDao.addComment(comment);
    }

    @Override public List<Comment> getComments(Comment comment) {
        return commentDao.getComments(comment);
    }
}
