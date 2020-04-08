package com.yang.photo.dao;

import com.yang.photo.pojo.ValidaMes;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ValidaMesDao {

    List<ValidaMes> getValidaMes(ValidaMes validaMes);

    int addValidaMes(ValidaMes validaMes);

    int updateValidaMes(ValidaMes validaMes);
}
