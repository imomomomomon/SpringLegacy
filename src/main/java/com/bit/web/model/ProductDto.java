package com.bit.web.model;

import org.springframework.web.multipart.MultipartFile;

public class ProductDto {
    int product_no;
    String product_name;
    String product_imgname;
    String product_location;
    int product_price;
    String product_category;
    String product_date;
    String product_seller;
    MultipartFile imgfile;

    public ProductDto() {
    }

    public int getProduct_no() {
        return product_no;
    }

    public void setProduct_no(int product_no) {
        this.product_no = product_no;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_imgname() {
        return product_imgname;
    }

    public void setProduct_imgname(String product_imgname) {
        this.product_imgname = product_imgname;
    }

    public String getProduct_location() {
        return product_location;
    }

    public void setProduct_location(String product_location) {
        this.product_location = product_location;
    }

    public int getProduct_price() {
        return product_price;
    }

    public void setProduct_price(int product_price) {
        this.product_price = product_price;
    }

    public String getProduct_category() {
        return product_category;
    }

    public void setProduct_category(String product_category) {
        this.product_category = product_category;
    }

    public String getProduct_date() {
        return product_date;
    }

    public void setProduct_date(String product_date) {
        this.product_date = product_date;
    }

    public String getProduct_seller() {
        return product_seller;
    }

    public void setProduct_seller(String product_seller) {
        this.product_seller = product_seller;
    }

    public MultipartFile getImgfile() {
        return imgfile;
    }

    public void setImgfile(MultipartFile imgfile) {
        this.imgfile = imgfile;
    }

    @Override
    public String toString() {
        return "ProductDto{" +
                "product_no=" + product_no +
                ", product_name='" + product_name + '\'' +
                ", product_imgname='" + product_imgname + '\'' +
                ", product_location='" + product_location + '\'' +
                ", product_price=" + product_price +
                ", product_category='" + product_category + '\'' +
                ", product_date='" + product_date + '\'' +
                ", product_seller='" + product_seller + '\'' +
                ", imgfile=" + imgfile +
                '}';
    }
}
