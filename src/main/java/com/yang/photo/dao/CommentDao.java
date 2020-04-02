package com.yang.photo.dao;

import com.yang.photo.pojo.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentDao {

    int addComment(Comment comment);

    List<Comment> getComments(Comment comment);
}
