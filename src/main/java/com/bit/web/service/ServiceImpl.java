package com.bit.web.service;

import com.bit.web.model.ProductDto;
import com.bit.web.repository.Dao;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@org.springframework.stereotype.Service
public class ServiceImpl implements Service{
    private final static String uploadSrc = "D:\\Intelij\\SpringLegacy\\src\\main\\webapp\\resources\\upload";
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
    public int insertDto(Object obj) {
        return uploadFileAtProductDto((ProductDto) obj)?dao.insertDto(obj):0;
    }

    @Override
    public int updateDto(Object obj) {
        return uploadFileAtProductDto((ProductDto) obj)?dao.updateDto(obj):0;
    }

    @Override
    public String checkLogin(Object user) {
        return dao.checkLogin(user);
    }

    private boolean uploadFileAtProductDto(ProductDto dto){
        if(!dto.getImgfile().isEmpty()) {
            File file = new File(uploadSrc,dto.getImgfile().getOriginalFilename());
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
}
