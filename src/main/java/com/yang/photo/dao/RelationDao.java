package com.yang.photo.dao;

import com.yang.photo.pojo.Relation;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RelationDao {

    List<Relation> getAllFriendByUserId(Relation relation);

    int addFriend(Relation relation);

    int deleteFriend(Relation relation);

    int updateRelation(Relation relation);

    Relation getRelationByUIdAndFId(Relation relation);
}
