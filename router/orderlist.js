const express = require("express");
const router = express.Router();

const pool = require("../pool");

router.get("/",(req,res)=>{
    sql='SELECT sh_name,sh_logo,o_date,o_state,o_sum,o_items FROM order_list WHERE uid=?';
    var uid=req.query.id;
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:result});
        }
    });
});
module.exports =router;