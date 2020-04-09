package com.yang.photo.dao;

import com.yang.photo.pojo.Message;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageDao {

    int addMessage(Message message);

    List<Message> getMessage(Message message);
}
