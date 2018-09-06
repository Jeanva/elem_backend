const express = require("express");
const router = express.Router();
const pool = require('../pool');

router.get('/',(req,res)=>{
    sql ='SELECT uid , phone_num,upwd,uname FROM el_user WHERE phone_num=? AND upwd=?';
    var {phone_num,upwd}=req.query;
    // console.log('phone_num',phone_num,'upwd',upwd)
    pool.query(sql,[phone_num,upwd],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:result});
        }
    });
    
});
module.exports = router;