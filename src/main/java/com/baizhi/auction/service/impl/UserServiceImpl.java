package com.baizhi.auction.service.impl;


import com.baizhi.auction.controller.UserController;
import com.baizhi.auction.dao.UserDao;
import com.baizhi.auction.entity.User;
import com.baizhi.auction.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("service")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;



    @Override
    public void insert(User user) {
        // TODO 自动生成的方法存根
        userDao.insert(user);
    }

    @Override
    public User login(User User) {
        // TODO 自动生成的方法存根

        User user=userDao.login(User);

        return user;

    }



}

