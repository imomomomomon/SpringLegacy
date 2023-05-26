package com.bit.web.model;

public class UserDto {
    private String ID;
    private String PASSWORD;

    public UserDto() {
    }

    public UserDto(String ID, String PASSWORD) {
        this.ID = ID;
        this.PASSWORD = PASSWORD;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getPASSWORD() {
        return PASSWORD;
    }

    public void setPASSWORD(String PASSWORD) {
        this.PASSWORD = PASSWORD;
    }
}
