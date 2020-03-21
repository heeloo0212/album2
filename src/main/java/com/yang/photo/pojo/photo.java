package com.yang.photo.pojo;

import java.util.Date;

public class photo {
    private int id;
    private String name;
    private int gid;
    private int click;
    private String info;
    private Date buildTime;

    public photo(int id, String name, int gid, int click, String info, Date buildTime) {
        this.id = id;
        this.name = name;
        this.gid = gid;
        this.click = click;
        this.info = info;
        this.buildTime = buildTime;
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

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public int getClick() {
        return click;
    }

    public void setClick(int click) {
        this.click = click;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Date getBuildTime() {
        return buildTime;
    }

    public void setBuildTime(Date buildTime) {
        this.buildTime = buildTime;
    }
}
