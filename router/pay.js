const express = require("express");
const router = express.Router();
const bodyParser = require("body-parser");
const querystring = require("querystring");
const pool = require("../pool");

router.post("/",(req,res)=>{
    req.on("data",(buf)=>{
        var str = buf.toString();
        var obj = querystring.parse(str);

        console.log(obj);
        // var {} =obj;
    });
});
module.exports = router;