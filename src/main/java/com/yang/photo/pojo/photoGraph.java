package com.yang.photo.pojo;

import java.util.Date;

public class photoGraph {
    private int id;
    private String name;
    private String info;
    private Date createId;

    public photoGraph(int id, String name, String info, Date createId) {
        this.id = id;
        this.name = name;
        this.info = info;
        this.createId = createId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Date getCreateId() {
        return createId;
    }

    public void setCreateId(Date createId) {
        this.createId = createId;
    }
}
