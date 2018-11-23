package com.baizhi.auction.service.impl;


import com.baizhi.auction.dao.RecordDao;
import com.baizhi.auction.entity.Record;
import com.baizhi.auction.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("recservice")
public class RecordServiceImpl implements RecordService {

    @Autowired
    private RecordDao recordDao;


    @Override
    public List<Record> select(int auction_id) {
        return recordDao.select(auction_id);
    }

    @Override
    public void insert(Record r) {

        r.setAuction_time(new Date());
        recordDao.insert(r);
    }

    @Override
    public void deleteRec(int id) {
        // TODO Auto-generated method stub
        recordDao.deleteRec(id);
    }



}

