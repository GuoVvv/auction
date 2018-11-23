package com.baizhi.auction.service.impl;


import com.baizhi.auction.dao.AuctionDao;
import com.baizhi.auction.entity.Auction;
import com.baizhi.auction.service.AuctionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("auctservice")
public class AuctionServiceImpl implements AuctionService {

    @Autowired
    public AuctionDao auctionDao;




    //查询全部
    @Override
    public List<Auction> selectAll(Auction auction) {
        // TODO 自动生成的方法存根

        if(auction!=null){
			/*System.out.println("name   "+auction.getAuction_name().length()+"    name "+auction.getAuction_name());
				System.out.println("name   "+auction.getAuction_desc().length()+"    name "+auction.getAuction_desc());*/
			if(auction.getAuction_name()==""){
				auction.setAuction_name(null);
			}
			if(auction.getAuction_desc()==""){
				auction.setAuction_desc(null);
			}

        }
        List<Auction> list=auctionDao.selectAll(auction);


        return list;
    }

    //添加
    @Override
    public void insertAuction(Auction auction) {
        // TODO 自动生成的方法存根
        auctionDao.insertAuction(auction);
    }
    @Override
    public Auction selectOne(int auction_id) {
        // TODO 自动生成的方法存根

        return auctionDao.selectOne(auction_id);
    }
    @Override
    public void update(Auction auction) {
        // TODO 自动生成的方法存根
        auctionDao.update(auction);
    }
    @Override
    public void delete(int auction_id) {
        // TODO 自动生成的方法存根
        auctionDao.delete(auction_id);

    }





}

