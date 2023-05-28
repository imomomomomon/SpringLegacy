package com.bit.web.service;

import java.util.HashMap;
import java.util.List;

public interface Service {
    List<Object> selectList(HashMap<String,Object> map);
    List<String> selectCategory();
    int insertProduct(Object obj);
    int updateProduct(Object obj);
    String checkLogin(Object user);
    List<Object> selectReplyList(int no);
    Object selectReply(int no);
    int insertReply(Object obj);
    int updateReplyContents(HashMap<String,Object> map);
}
