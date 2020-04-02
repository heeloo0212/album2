package com.yang.photo.pojo;

import java.io.Serializable;
import java.util.Date;

public class ShowPhoto implements Serializable {
    private int id;
    private String image;
    private int activeId;
    private int photoId;
    private int graphId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getActiveId() {
        return activeId;
    }

    public void setActiveId(int activeId) {
        this.activeId = activeId;
    }

    public int getPhotoId() {
        return photoId;
    }

    public void setPhotoId(int photoId) {
        this.photoId = photoId;
    }

    public int getGraphId() {
        return graphId;
    }

    public void setGraphId(int graphId) {
        this.graphId = graphId;
    }

}
