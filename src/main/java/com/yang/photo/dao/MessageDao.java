package com.yang.photo.dao;

import com.yang.photo.pojo.Message;
import org.springframework.stereotype.Repository;

@Repository
public interface MessageDao {

    int addMessage(Message message);
}
