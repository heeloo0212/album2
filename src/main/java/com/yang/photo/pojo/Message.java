package com.yang.photo.pojo;

import java.util.Date;

public class Message {

    private int id;

    private String content;

    private String talkRoom;

    private Date createTime;

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

    public String getTalkRoom() {
        return talkRoom;
    }

    public void setTalkRoom(String talkRoom) {
        this.talkRoom = talkRoom;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
