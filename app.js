const express = require("express");

const home = require('./router/home');
const login = require('./router/login');
const shop = require('./router/shop');
const foodlist =require('./router/foodlist');
const register = require("./router/register");
const orderlist = require("./router/orderlist");
const cors = require('cors');

var app =express();
app.listen(3001,(req,res)=>{
    console.log("服务器3001已启动");
});

app.use(express.static(__dirname+'/public'));
app.use(cors({
    origin:[
        "http://127.0.0.1:8080",
        "http://localhost:8080",
        "http://127.0.0.1:8081",
        "http://127.0.0.1:8081"
    ],
    credentials:true
}));
app.use('/home',home);
app.use('/login',login);
app.use('/shop',shop);
app.use('/foodlist',foodlist);
app.use("/register",register);
app.use("/orderlist",orderlist);
