//1.引入express 模块
const express = require("express");
//2.使用express 路由对象
const router = express.Router();
const pool = require('../pool');

//3.向路由器router中加入所有自身模块下的路由
router.get("/",(req,res)=>{
    res.send('This is home');
});
// var sql ='SELECT id,img_url,tag,img_sort FROM index_image';
router.get('/banner',(req,res)=>{
    sql ='SELECT id,img_url,tag,img_sort ,sub_tag FROM index_image WHERE img_sort ="banner" ';
    pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:result});
    });
});

router.get('/icon',(req,res)=>{
    sql = 'SELECT id,img_url,tag,img_sort,sub_tag FROM index_image WHERE img_sort ="icon"';
    pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:result});
    });
});

router.get('/subbanner',(req,res)=>{
    sql ='SELECT id,img_url,tag,img_sort,sub_tag FROM index_image WHERE img_sort = "subbanner"';
    pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        res.send({ code:1,msg:result});
    });
});

router.get('/shoplist',(req,res)=>{
    sql=`SELECT sid,sh_name,sh_logo,sold_month,distance,star,min_price,is_fengniao,is_grt,is_reciept,is_ad,is_newshop,is_first_dsc,is_dsc,is_manjian,is_brand,shop_note,sh_bg,shop_banner FROM index_shop`;
    // sql =`SELECT sid,sh_name,sh_logo,sold_month,distance,star,min_price,is_fengniao,is_grt,is_reciept,is_ad,is_newshop,is_first_dsc,is_dsc,is_manjian,is_brand,shop_note,sh_bg,shop_banner FROM index_shop WHERE sid=?`;
    pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:result});
    });
});
module.exports = router;