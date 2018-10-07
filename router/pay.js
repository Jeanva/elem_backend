const express = require("express");
const router = express.Router();
// const bodyParser = require("body-parser");
const querystring = require("querystring");
const pool = require("../pool");

router.post("/",(req,res)=>{
    req.on("data",(buf)=>{
        
        console.log('接收到数据');
        var str = buf.toString();
        var obj = querystring.parse(str);   //将字符串序列化一个对象
        console.log(obj);
        var {cart_list,uid,o_date} = obj;
        var cart_list = obj.cart_list;
        // var sql ='INSERT INTO order_list VALUES(NULL,NULL,NULL,NULL,0,?,?,?,?)';
        // pool.query(sql,[],(err,result)=>{
        //     if(err) throw err;
        //     obj['text']='成功';
        //     res.send({code:1,msg:result});
        // });
        res.send({code:1,msg:obj});
    });
});
// router.post("/test",(req,res)=>{
//     console.log(req.body.cart_list);
// });
module.exports = router;