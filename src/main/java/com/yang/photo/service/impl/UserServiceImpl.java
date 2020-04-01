package com.yang.photo.service.impl;

import com.yang.photo.dao.UserDao;
import com.yang.photo.pojo.User;
import com.yang.photo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User getUser(User user) {
        User user1 = new User();
        if(user != null){
            user1 = userDao.getUser(user);
        }
        return user1;
    }

    @Override
    public int addUser(User user){
        if(user != null){
            return userDao.addUser(user);
        }
        return 0;
    }

    @Override
    public int modifyUser(User user) {
        return userDao.modifyUser(user);
    }
}
