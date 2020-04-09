package com.yang.photo.service;

import com.yang.photo.pojo.Message;

import java.util.List;

public interface MessageService {

    int addMessage(Message message);

    List<Message> getMessage(Message message);
}
