package com.baizhi.auction.service;


import com.baizhi.auction.entity.User;

public interface UserService {

    //注册用户
    void insert(User user);

    //登录
    User login(User User);
}
