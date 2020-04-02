package com.yang.photo.pojo;

import java.io.Serializable;
import java.util.Date;

public class Comment implements Serializable {

    private int id;
    private String content;
    private String showFlag;
    private String status;
    private String commentor;
    private String beCommentor;
    private Date commentTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getShowFlag() {
        return showFlag;
    }

    public void setShowFlag(String showFlag) {
        this.showFlag = showFlag;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCommentor() {
        return commentor;
    }

    public void setCommentor(String commentor) {
        this.commentor = commentor;
    }

    public String getBeCommentor() {
        return beCommentor;
    }

    public void setBeCommentor(String beCommentor) {
        this.beCommentor = beCommentor;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }
}
