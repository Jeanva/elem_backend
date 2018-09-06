const express = require('express');
const router = express.Router();
const pool = require('../pool');

router.get('/',(req,res)=>{
    sql =`SELECT sid,sh_name,sh_logo,sold_month,distance,star,min_price,is_fengniao,is_grt,is_reciept,is_ad,is_newshop,is_first_dsc,is_dsc,is_manjian,is_brand,shop_note,sh_bg,shop_banner FROM index_shop WHERE sid=?`;
    pool.query(sql,[req.query.id],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:result});
    })
});
module.exports =router;