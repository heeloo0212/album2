package com.yang.photo.service.impl;

import com.yang.photo.dao.RelationDao;
import com.yang.photo.pojo.Relation;
import com.yang.photo.service.RelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RelationServiceImpl implements RelationService {

    @Autowired
    private RelationDao relationDao;

    @Override public List<Relation> getAllFriendByUserId(Relation relation) {
        return relationDao.getAllFriendByUserId(relation);
    }

    @Override public int addFriend(Relation relation) {
        return relationDao.addFriend(relation);
    }

    @Override public int deleteFriend(Relation relation) {
        return relationDao.deleteFriend(relation);
    }

    @Override public int updateRelation(Relation relation) {
        return relationDao.updateRelation(relation);
    }

    @Override public Relation getRelationByUIdAndFId(int userId, int friendId) {
        Relation relation = new Relation();
        if(userId != 0 && friendId != 0) {
            relation.setUserId(userId);
            relation.setFriendId(friendId);
        }
        return relationDao.getRelationByUIdAndFId(relation);
    }
}
