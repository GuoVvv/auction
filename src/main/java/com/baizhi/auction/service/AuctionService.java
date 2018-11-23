package com.baizhi.auction.service;


import com.baizhi.auction.entity.Auction;

import java.util.List;

public interface AuctionService {


    /*查询全部*/
    List<Auction> selectAll(Auction auction);

    /*添加商品*/
    void insertAuction(Auction auction);

    /*查询单个*/
    Auction selectOne(int auction_id);

    /*修改*/
    void update(Auction auction);

    /*删除*/
    void delete(int auction_id);
}
