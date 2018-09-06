//1.加载mysql模块
const mysql = require('mysql');
//2.创建连接池对象
var pool = mysql.createPool({
    host:'127.0.0.1',
    user:'root',
    password:'',
    database:'my_elem',
    port:3306,
    connectionLimit:10  //活动连接数
});
//3.导出
module.exports = pool;