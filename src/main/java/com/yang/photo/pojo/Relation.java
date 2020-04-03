package com.yang.photo.pojo;

import java.io.Serializable;

public class Relation implements Serializable {

    private int id;

    private int userId;

    private int friendId;

    private String talkRoom;

    private String status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getFriendId() {
        return friendId;
    }

    public void setFriendId(int friendId) {
        this.friendId = friendId;
    }

    public String getTalkRoom() {
        return talkRoom;
    }

    public void setTalkRoom(String talkRoom) {
        this.talkRoom = talkRoom;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
