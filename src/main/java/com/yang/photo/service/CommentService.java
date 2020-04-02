package com.yang.photo.service;

import com.yang.photo.pojo.Comment;

import java.util.List;

public interface CommentService {

    int addComment(Comment comment);

    List<Comment> getComments(Comment comment);

}
