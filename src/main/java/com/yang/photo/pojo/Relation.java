package com.yang.photo.pojo;

import java.io.Serializable;
import java.util.List;

public class Relation implements Serializable {

    private int id;

    private int userId;

    private int friendId;

    private String talkRoom;

    private String status;

    private String friendGroup;

    private List<User> userList;

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

    public String getFriendGroup() {
        return friendGroup;
    }

    public void setFriendGroup(String friendGroup) {
        this.friendGroup = friendGroup;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }
}
