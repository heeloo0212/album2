package com.yang.photo.service;

import com.yang.photo.pojo.User;

public interface UserService {

    User getUser(User user);

    int addUser(User user);

    int modifyUser(User user);
}
