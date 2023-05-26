package com.bit.web.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class DaoImpl implements Dao{
    private final static String ns_product = "productMapper.";
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
    public int insertDto(Object obj) {
        return sqlSession.insert(ns_product+"insert",obj);
    }

    @Override
    public int updateDto(Object obj) {
        return sqlSession.update(ns_product+"update",obj);
    }

    @Override
    public String checkLogin(Object user) {
        return sqlSession.selectOne(ns_user+"checkLogin",user);
    }
}
