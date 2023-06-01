package com.bit.web.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class DaoImpl implements Dao{
    private final static String ns_product = "productMapper.";
    private final static String ns_reply = "replyMapper.";
    private final static String ns_user = "userMapper.";
    @Autowired
    private SqlSessionTemplate sqlSession;
    @Override
    public List<Object> selectList(HashMap<String,Object> map) {
        return sqlSession.selectList(ns_product+"select",map);
    }

    @Override
    public List<String> selectCategory() {
        return sqlSession.selectList(ns_product+"selectCategory");
    }

    @Override
    public int insertProduct(Object obj) {
        return sqlSession.insert(ns_product+"insert",obj);
    }

    @Override
    public int updateProduct(Object obj) {
        return sqlSession.update(ns_product+"update",obj);
    }

    @Override
    public int deleteProduct(int product_no) {
        return sqlSession.delete(ns_product+"delete",product_no);
    }

    @Override
    public String checkLogin(Object user) {
        return sqlSession.selectOne(ns_user+"checkLogin",user);
    }

    @Override
    public List<Object> selectReplyList(int board_no) {
        return sqlSession.selectList(ns_reply+"selectReplyList",board_no);
    }

    @Override
    public Object selectReply(int no) {
        return sqlSession.selectOne(ns_reply+"selectReply",no);
    }

    @Override
    public int insertReply(Object obj) {
        return sqlSession.insert(ns_reply+"insertReply",obj);
    }

    @Override
    public int updateReplyContents(HashMap<String,Object> map) {
        return sqlSession.update(ns_reply+"updateReplyContents",map);
    }

    @Override
    public int deleteReply(int reply_no) {
        return sqlSession.delete(ns_reply+"deleteReply",reply_no);
    }

    @Override
    public List<Object> selectProductInCart(HashMap<String,Object> map) {
        return sqlSession.selectList(ns_product+"selectProductInCart",map);
    }

    @Override
    public int insertProductInCart(HashMap<String,Object> map) {
        return sqlSession.insert(ns_product+"insertProductInCart",map);
    }

    @Override
    public int deleteProductInCart(int product_no) {
        return sqlSession.delete(ns_product+"deleteProductInCart",product_no);
    }
}
