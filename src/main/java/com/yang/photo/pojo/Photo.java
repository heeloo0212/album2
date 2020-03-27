package com.yang.photo.pojo;

import java.io.Serializable;
import java.util.Date;

public class Photo implements Serializable {
    private int id;
    private String name;
    /**
     * 相册id
     * */
    private int gid;
    private int click;
    private String info;
    private Date buildTime;
    private String comment;
    private String image;
    private String style;

    public Photo(int id, String name, int gid, int click, String info, Date buildTime) {
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }
}
