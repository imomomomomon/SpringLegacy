package com.bit.web.service;

import com.bit.web.Config.Config;
import com.bit.web.model.ProductDto;
import com.bit.web.repository.Dao;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@org.springframework.stereotype.Service
public class ServiceImpl implements Service{
    @Resource(name = "daoImpl")
    private Dao dao;
    @Override
    public List<Object> selectList(HashMap<String,Object> map) {
        return dao.selectList(map);
    }

    @Override
    public List<String> selectCategory() {
        return dao.selectCategory();
    }

    @Override
    public int insertProduct(Object obj) {
        return uploadFileAtProductDto((ProductDto) obj)?dao.insertProduct(obj):0;
    }

    @Override
    public int updateProduct(Object obj) {
        return uploadFileAtProductDto((ProductDto) obj)?dao.updateProduct(obj):0;
    }

    @Override
    public int deleteProduct(int product_no) {
        return dao.deleteProduct(product_no);
    }

    @Override
    public String checkLogin(Object user) {
        return dao.checkLogin(user);
    }

    private boolean uploadFileAtProductDto(ProductDto dto){
        if(!dto.getImgfile().isEmpty()) {
            File file = new File(Config.FILEUPLOAD.url(),dto.getImgfile().getOriginalFilename());
            try {
                dto.getImgfile().transferTo(file);
                dto.setProduct_imgname(file.getName());
                return true;
            } catch (IOException e) {
                e.printStackTrace();
            }
            return false;
        }
        return true;
    }

    @Override
    public List<Object> selectReplyList(int board_no) {
        return dao.selectReplyList(board_no);
    }

    @Override
    public Object selectReply(int no) {
        return dao.selectReply(no);
    }

    @Override
    public int insertReply(Object obj) {
        return dao.insertReply(obj);
    }

    @Override
    public int updateReplyContents(HashMap<String, Object> map) {
        return dao.updateReplyContents(map);
    }

    @Override
    public int deleteReply(int reply_no) {
        return dao.deleteReply(reply_no);
    }
}
