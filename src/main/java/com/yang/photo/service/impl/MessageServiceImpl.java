package com.yang.photo.service.impl;

import com.yang.photo.dao.MessageDao;
import com.yang.photo.pojo.Message;

import com.yang.photo.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageDao messageDao;

    @Override public int addMessage(Message message) {
        return messageDao.addMessage(message);
    }

    @Override public List<Message> getMessage(Message message) {
        return messageDao.getMessage(message);
    }
}
