package com.bit.web.config;

public enum Config {
    FILEUPLOAD("D:\\Intelij\\SpringLegacy\\src\\main\\webapp\\resources\\upload\\");

    private final String url;

    Config(String url) {
        this.url = url;
    }
    public String url() {
        return url;
    }
}
