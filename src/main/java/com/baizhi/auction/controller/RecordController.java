package com.baizhi.auction.controller;


import com.baizhi.auction.entity.Record;
import com.baizhi.auction.entity.User;
import com.baizhi.auction.service.AuctionService;
import com.baizhi.auction.service.RecordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class RecordController {

    @Autowired
    private RecordService recservice;
    @Autowired
    private AuctionService auctservice;
    Logger logger= LoggerFactory.getLogger(RecordController.class);

    @RequestMapping("/showw")
    public String show(Map map, int id){
        logger.debug("要竞价的id   "+id);
        logger.debug("要竞价的货品   "+auctservice.selectOne(id));
        logger.debug("要竞价的信息   "+recservice.select(id));

        map.put("auction", auctservice.selectOne(id));
        map.put("list", recservice.select(id));
        return "forward:/bidder.jsp";
    }

    @RequestMapping("/reg")
    public String regrec(Record record, HttpSession session, Map map){
        User user=(User) session.getAttribute("user");
        logger.debug("竞价要的user     "+user);

        int userid=user.getUser_id();
        logger.debug("竞价userid     "+userid);
        record.setUser_id(userid);
        recservice.insert(record);
        logger.debug("竞价record     "+record);
        logger.debug("-------------------------------------");
        return "redirect:/showw.action?id="+record.getAuction_id();
    }
}

