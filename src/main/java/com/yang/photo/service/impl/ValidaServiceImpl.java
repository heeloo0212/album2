package com.yang.photo.service.impl;

import com.yang.photo.dao.UserDao;
import com.yang.photo.dao.ValidaMesDao;
import com.yang.photo.pojo.User;
import com.yang.photo.pojo.ValidaMes;
import com.yang.photo.service.ValidaMesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ValidaServiceImpl implements ValidaMesService {

    @Autowired
    private ValidaMesDao validaMesDao;

    @Autowired
    private UserDao userDao;

    @Override public List<ValidaMes> getValidaMes(ValidaMes validaMes) {
        List<ValidaMes> validaMesList = validaMesDao.getValidaMes(validaMes);
        for(ValidaMes v : validaMesList){
            User user = new User();
            user.setId(v.getFriendId());
            User user1 = userDao.getUser(user);
            v.setUser(user1);
        }
        return validaMesList;
    }

    @Override public int addValidaMes(ValidaMes validaMes) {
        return validaMesDao.addValidaMes(validaMes);
    }

    @Override public int updateValidaMes(ValidaMes validaMes) {
        return validaMesDao.updateValidaMes(validaMes);
    }
}
