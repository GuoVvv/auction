package com.baizhi.auction.controller;


import com.baizhi.auction.entity.User;
import com.baizhi.auction.service.UserService;
import com.google.code.kaptcha.Producer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService service;
    @Autowired
    private Producer producer;
    Logger logger= LoggerFactory.getLogger(UserController.class);

    @RequestMapping("/loginn")
    public String login(User user, HttpSession session, String yzm){
        logger.debug(yzm+"     "+user);
        String yanzhnegma=(String) session.getAttribute("kaptcha");
        if(yanzhnegma.equalsIgnoreCase(yzm)){
            if(service.login(user)!=null){


                user=service.login(user);
                logger.debug("登录的user   "+user);
                session.setAttribute("user", user);
                return "forward:/selectall.action?pa=1";
            }else{
                return "redirect:/login.jsp";
            }
        }else{
            return "redirect:/login.jsp";
        }

    }

    @RequestMapping("/insertUser")
    public String inser(User user, String yzm, HttpSession session){
        System.out.println(yzm+"     "+user);
        String yanzhnegma=(String) session.getAttribute("kaptcha");
        if(yanzhnegma.equalsIgnoreCase(yzm)){
            logger.debug("注册的user   "+user);
            service.insert(user);
            return "forward:/selectall.action";
        }else{
            return "redirect:/addUser.jsp";
        }

    }

    @RequestMapping("/removeUser")
    public String remove(HttpSession session){
        session.removeAttribute("user");
        return "redirect:/login.jsp";
    }


}
