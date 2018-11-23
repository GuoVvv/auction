package com.baizhi.auction.dao;


import com.baizhi.auction.entity.User;

public interface UserDao {
    //注册用户
    void insert(User user);

    //登录
    User login(User User);
}
