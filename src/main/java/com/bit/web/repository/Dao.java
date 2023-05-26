package com.bit.web.repository;

import com.bit.web.model.ProductDto;

import java.util.HashMap;
import java.util.List;

public interface Dao {
    List<Object> selectList(HashMap<String,Object> map);
    List<String> selectCategory();
    int insertDto(Object obj);
    int updateDto(Object obj);
    String checkLogin(Object user);
}
