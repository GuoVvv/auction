package com.baizhi.auction.controller;


import com.baizhi.auction.entity.Auction;
import com.baizhi.auction.service.AuctionService;
import com.baizhi.auction.service.RecordService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class AuctionController {

    @Autowired
    private AuctionService auctservice;
    @Autowired
    private RecordService recservice;
    Logger logger= LoggerFactory.getLogger(AuctionController.class);

    //查询全部
    @RequestMapping("/selectall")
    public String selectAll(Map map, Auction auction, Integer pa){
        logger.debug("多查auction "+auction);
        logger.debug("papappapap   "+pa);

        if(pa==null||pa<1){
            PageHelper.startPage(1,5);

        }else{
            PageHelper.startPage(pa,5);
        }
        List<Auction> list= auctservice.selectAll(auction);
        logger.debug("list    "+list);
        PageInfo<Auction> aa=new PageInfo<>(list);
        logger.debug("aa       "+aa);

        map.put("list", list);
        map.put("pa", pa);
        map.put("page",aa);

        /*map.put("auctionSe", auction);*/
        for (Auction a:list) {
            logger.debug("多查list  "+ a);
        }

        return "forward:/show.jsp";
    }


    //查询单个
    @RequestMapping("/selectonee")
    public String selectOne(int id, Map map){

        logger.debug("查询单个：    "+auctservice.selectOne(id));
        map.put("auction", auctservice.selectOne(id));

        return "forward:/update.jsp";
    }

    //修改
    @RequestMapping("/updatee")
    public String update(HttpServletRequest request, Auction auction, MultipartFile myphoto) throws IllegalStateException, IOException {


        if(!"".equals(myphoto.getOriginalFilename())){
            //获取到上传上来的文件名
            String fileName=myphoto.getOriginalFilename();


            //对文件进行重命名
            fileName=new Date().getTime()+"_"+fileName;

            //路径的问题
            //根据upload文件夹名字，可以获取到它的绝对路径
           // String realPath = request.getRealPath("/photo/");
            String realPath="E:/Photo";

            /*String realPath = request.getSession().getServletContext().getRealPath("upload");*/

            myphoto.transferTo(new File(realPath+"\\"+fileName));
            auction.setAuction_pic(fileName);

        }

        logger.debug("要修改的    "+auction);
        auctservice.update(auction);

        return "redirect:/selectall.action?pa=1";
    }

    @RequestMapping("/insertt")
    public String insert(Auction auction,MultipartFile myphoto,HttpServletRequest request) throws IllegalStateException, IOException{

        //获取到上传上来的文件名
        String fileName=myphoto.getOriginalFilename();


        //对文件进行重命名
        fileName=new Date().getTime()+"_"+fileName;

        //路径的问题
        //根据upload文件夹名字，可以获取到它的绝对路径
       // String realPath = request.getRealPath("/photo/");
        String realPath="E:/Photo";

        /*String realPath = request.getSession().getServletContext().getRealPath("upload");*/

        myphoto.transferTo(new File(realPath+"\\"+fileName));
        auction.setAuction_pic(fileName);

        logger.debug("要添加的    "+auction);
        auctservice.insertAuction(auction);
        return "redirect:/selectall.action?pa=1";
    }

    //删除
    @RequestMapping("/deletee")
    public String delete(int id){
        recservice.deleteRec(id);
        auctservice.delete(id);
        return "redirect:/selectall.action?pa=1";

    }



}
