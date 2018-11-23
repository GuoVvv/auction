package com.baizhi.auction.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

//竞拍记录
public class Record {


    private int id;//竞拍记录编号
    private int  user_id;//竞拍者编号
    private int auction_id;//拍卖品编号
   /* @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")*/
    private Date auction_time;//拍卖品时间
    private Double auction_price;//竞拍价格

    //外键

    private List<User> userList;//竞拍者编号

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getAuction_id() {
        return auction_id;
    }

    public void setAuction_id(int auction_id) {
        this.auction_id = auction_id;
    }

    public Date getAuction_time() {
        return auction_time;
    }

    public void setAuction_time(Date auction_time) {
        this.auction_time = auction_time;
    }

    public Double getAuction_price() {
        return auction_price;
    }

    public void setAuction_price(Double auction_price) {
        this.auction_price = auction_price;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    @Override
    public String toString() {
        return "Record [id=" + id + ", user_id=" + user_id + ", auction_id=" + auction_id + ", auction_time="
                + auction_time + ", auction_price=" + auction_price + ", userList=" + userList + "]";
    }

    public Record(int id, int user_id, int auction_id, Date auction_time, Double auction_price, List<User> userList) {
        super();
        this.id = id;
        this.user_id = user_id;
        this.auction_id = auction_id;
        this.auction_time = auction_time;
        this.auction_price = auction_price;
        this.userList = userList;
    }

    public Record(Date auction_time, Double auction_price) {
        super();
        this.auction_time = auction_time;
        this.auction_price = auction_price;
    }



    public Record() {
        super();
    }
}
