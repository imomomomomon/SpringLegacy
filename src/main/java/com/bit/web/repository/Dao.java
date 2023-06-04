package com.bit.web.repository;

import java.util.HashMap;
import java.util.List;

public interface Dao {
    List<Object> selectList(HashMap<String,Object> map);
    List<String> selectCategory();
    int insertProduct(Object obj);
    int updateProduct(Object obj);
    int deleteProduct(int product_no);
    //로그인-----------------------------------------------------
    String checkLogin(Object user);
    //답글-----------------------------------------------------
    List<Object> selectReplyList(int board_no);
    Object selectReply(int no);
    int insertReply(Object obj);
    int updateReplyContents(HashMap<String,Object> map);
    int deleteReply(int reply_no);
    List<Object> selectProductInCart(HashMap<String,Object> map);
    int insertProductInCart(HashMap<String,Object> map);
    int deleteProductInCart(int product_no);
    int deleteArrayInCart(List<String> list);
    int updateQuantityInCart(HashMap<String,Object> map);
}
