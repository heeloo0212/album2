package com.yang.photo.service;

import com.yang.photo.pojo.ValidaMes;

import java.util.List;

public interface ValidaMesService {

    List<ValidaMes> getValidaMes(ValidaMes validaMes);

    int addValidaMes(ValidaMes validaMes);

    int updateValidaMes(ValidaMes validaMes);
}
