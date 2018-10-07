const express = require("express");
const router = express.Router();

const bodyParser = require("body-parser");
const querystring = require("querystring");

const pool = require("../pool");

router.post("/",(req,res)=>{
    req.on("data",(buf)=>{
        var str = buf.toString();
        var obj = querystring.parse(str);
        // console.log('obj.p_num',obj.p_num,"obj.upwd",obj.upwd);
        var {p_num,upwd} =obj;
        
        var sql ='SELECT phone_num,upwd,uname FROM el_user WHERE phone_num=? AND upwd=?';
        pool.query(sql,[p_num,upwd],(err,result)=>{

            if(err) throw err;
            console.log(obj);
            if(result.length>0){
                //如果已经存在，就返回查找结果
                res.send({code:0,msg:result});
            }
            else{  
                //如果数据库中没有当前号码，则添加成新用户
                sql ="INSERT INTO el_user VALUES(NULL,?,?,NULL,NULL)";
                pool.query(sql,[p_num,upwd],(err,result)=>{
                    if(err){
                        throw err;
                    }
                    obj['text']='成功';
                    res.send({code:1,msg:result});
                }); 
            }
        }); 
        
        // 问题1：为何此处取不到 req.body的值？
        // res.send(obj,"--",req.body);      
    });
});
module.exports = router;