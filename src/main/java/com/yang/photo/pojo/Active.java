package com.yang.photo.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Active implements Serializable {

    private int id;

    private int graphId;

    private String graphName;

    private String userName;

    private String info;

    private int click;

    private Date createTime;

    private List<ShowPhoto> showPhotoList;

    private List<Comment> commentList;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGraphId() {
        return graphId;
    }

    public void setGraphId(int graphId) {
        this.graphId = graphId;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public int getClick() {
        return click;
    }

    public void setClick(int click) {
        this.click = click;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public List<ShowPhoto> getShowPhotoList() {
        return showPhotoList;
    }

    public void setShowPhotoList(List<ShowPhoto> showPhotoList) {
        this.showPhotoList = showPhotoList;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public String getGraphName() {
        return graphName;
    }

    public void setGraphName(String graphName) {
        this.graphName = graphName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override public String toString() {
        return "Active{" + "id=" + id + ", graphId=" + graphId + ", graphName='" + graphName + '\'' + ", userName='"
            + userName + '\'' + ", info='" + info + '\'' + ", click=" + click + ", createTime=" + createTime
            + ", showPhotoList=" + showPhotoList + ", commentList=" + commentList + '}';
    }
}
