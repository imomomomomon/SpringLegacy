package com.bit.web.controller;

import com.bit.web.model.ProductDto;
import com.bit.web.service.Service;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/product")
public class ProductController {
    @Resource(name = "serviceImpl")
    Service service;

    @GetMapping("/getProductList")
    public List<Object> selectProductList(String id){
        HashMap<String, Object> map = new HashMap<String, Object>();
        {
            if(id != null)
                map.put("product_seller",id);
        }
        return service.selectList(map);
    }
    @GetMapping("/getProduct/{no}")
    public Object selectProduct(@PathVariable("no") int no){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("no",no);
        return service.selectList(map).size()==0?null:service.selectList(map).get(0);
    }

    @GetMapping("/getProduct/{no}/{id}")
    public Object selectProductToId(@PathVariable("no") int no,
                                @PathVariable("id") String id){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("no",no);
        map.put("product_seller",id);
        return service.selectList(map).size()==0?null:service.selectList(map).get(0);
    }

    @GetMapping("/searchProductList")
    public List<Object> searchProductList(@RequestParam(required = false)String query,
                                          @RequestParam(required = false)String data){
        HashMap<String, Object> map = new HashMap<String, Object>();
        switch (query){
            case "name":
                map.put("product_name",data);
                break;
            case "location":
                map.put("product_location",data);
                break;
            case "category":
                map.put("product_category",data);
                break;
            default:
                break;
        }
        return service.selectList(map);
    }

    @GetMapping("/getCategory")
    public List<String> selectCategory(){
        return service.selectCategory();
    }

    @PostMapping("/insertProduct")
    public int insertProduct(ProductDto dto, HttpSession session) {
        String id = (String) session.getAttribute("id");
        if(id == null) return -1;
        dto.setProduct_seller(id);
        return service.insertProduct(dto);
    }

    @PostMapping("/updateProduct")
    public int updateProduct(ProductDto dto) {
        return service.updateProduct(dto);
    }

    @PostMapping("/deleteProduct/{product_no}")
    public int deleteProduct(@PathVariable("product_no") int product_no){
        return service.deleteProduct(product_no);
    }

    @GetMapping("/getProductInCart")
    public List<Object> selectProductInCart(HttpSession session){
        String id = (String) session.getAttribute("id");
        if(id == null) return null;

        HashMap<String,Object> map = new HashMap<>();
        map.put("id",id);
        return service.selectProductInCart(map);
    }

    @GetMapping("/checkProductInCart/{product_no}")
    public int checkProductInCart(@PathVariable("product_no") int product_no,HttpSession session){
        String id = (String) session.getAttribute("id");
        if(id == null) return -1;

        HashMap<String,Object> map = new HashMap<>();
        map.put("id",id);
        map.put("product_no",product_no);
        if(service.selectProductInCart(map).isEmpty())
            return 0;
        return 1;
    }

    @GetMapping("/insertProductInCart/{product_no}")
    public int insertProductInCart(@PathVariable("product_no") int product_no,HttpSession session) {
        String id = (String) session.getAttribute("id");
        if(id == null) return -1;

        HashMap<String,Object> map = new HashMap<>();
        map.put("id",id);
        map.put("product_no",product_no);
        return service.insertProductInCart(map);
    }

    @GetMapping("/deleteProductInCart/{product_no}")
    public int deleteProductInCart(@PathVariable("product_no") int product_no) {
        return service.deleteProductInCart(product_no);
    }

    @GetMapping("/deleteArrayInCart")
    public int deleteProductInCart(@RequestParam("deleteArr[]")List<String> deleteArr) {
        return service.deleteArrayInCart(deleteArr);
    }

    @GetMapping("/updateQuantityInCart")
    public int updateQuantityInCart(@RequestParam("product_no") int product_no,
                                    @RequestParam("quantity") int quantity,
                                    HttpSession session) {
        String id = (String) session.getAttribute("id");
        if(id == null) return -1;

        HashMap<String,Object> map = new HashMap<>();
        map.put("id",id);
        map.put("product_no",product_no);
        map.put("quantity",quantity);

        return service.updateQuantityInCart(map);
    }
}
