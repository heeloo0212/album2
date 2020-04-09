package com.yang.photo.service;

import com.yang.photo.pojo.Relation;

import java.util.List;

public interface RelationService {

    List<Relation> getAllFriendByUserId(Relation relation);

    int addFriend(Relation relation);

    int deleteFriend(Relation relation);

    int updateRelation(Relation relation);

    Relation getRelationByUIdAndFId(int userId, int friendId);
}
