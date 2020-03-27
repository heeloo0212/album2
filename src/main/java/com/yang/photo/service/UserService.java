package com.yang.photo.service;

import com.yang.photo.pojo.User;

public interface UserService {

    User loginNameAndPassword(User user);

    int addUser(User user);
}
