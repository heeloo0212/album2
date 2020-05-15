package com.yang.photo.dao;

import com.yang.photo.pojo.Active;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ActiveDao {
    List<Active> getActiveList();
    int addActive(Active active);
    Active getActiveById(int id);
    int deleteActive(int id);
}
