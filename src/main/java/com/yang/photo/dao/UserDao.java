package com.yang.photo.dao;

import com.yang.photo.pojo.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {
    public User loginNameAndPassword(User user);
}
