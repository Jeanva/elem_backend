const express = require('express');
const router=express.Router();
const pool = require('../pool');

router.get('/',(req,res)=>{
    sql =`SELECT fid, f_name,f_img_sm,f_img_md,sid,price,sold_count,is_recom,is_disct,good_rate,summary,f_desc,max_p,min_p,f_sort,size,rest_count,old_price FROM food_list WHERE sid=?`;
    pool.query(sql,[req.query.id],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:result});
    })
});
module.exports = router;