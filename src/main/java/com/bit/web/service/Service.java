package com.bit.web.service;

import java.util.HashMap;
import java.util.List;

public interface Service {
    List<Object> selectList(HashMap<String,Object> map);
    List<String> selectCategory();
    int insertDto(Object obj);
    int updateDto(Object obj);
    String checkLogin(Object user);
}
