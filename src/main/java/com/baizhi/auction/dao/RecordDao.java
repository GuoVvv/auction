package com.baizhi.auction.dao;


import com.baizhi.auction.entity.Record;

import java.util.List;

public interface RecordDao {

    //查询
    List<Record> select(int auction_id);

    //添加记录
    void insert(Record r);

    //删除记录
    void deleteRec(int id);
}
