# elm 数据库
CREATE DATABASE my_elem CHARSET=UTF8;
USE my_elem;

# 首页图片表
CREATE TABLE index_image(
    id INT PRIMARY KEY AUTO_INCREMENT,
    img_url VARCHAR(255),
    tag VARCHAR(255),
    img_sort VARCHAR(20),
    sub_tag VARCHAR(20)
);
INSERT INTO index_image VALUES(null,"http://127.0.0.1:3001/img/index/banner1.webp","送电影票","banner");
INSERT INTO index_image VALUES(null,'http://127.0.0.1:3001/img/index/banner2.webp','领红包','banner');
INSERT INTO index_image VALUES(null,'http://127.0.0.1:3001/img/index/banner3.webp','中秋送月饼','banner');
INSERT INTO index_image VALUES(null,'http://127.0.0.1:3001/img/index/banner4.webp','周周领红包','banner');
INSERT INTO index_image VALUES(null,'http://127.0.0.1:3001/img/index/banner5.webp','送洗发水','banner');
INSERT INTO index_image VALUES(null,'http://127.0.0.1:3001/img/index/banner6.webp','超值套餐','banner');
#INSERT INTO index_image VALUES(null,'http://127.0.0.1:3001/img/index/icon/icon1.webp',);

INSERT INTO index_image VALUES(null,'http://127.0.0.1:3001/img/index/icon1.webp','美食','icon');
INSERT INTO index_image VALUES(null,'http://127.0.0.1:3001/img/index/icon2.webp','商超便利','icon');
INSERT INTO index_image VALUES(null,'http://127.0.0.1:3001/img/index/icon3.webp','夜宵','icon');
INSERT INTO index_image VALUES(null,'http://127.0.0.1:3001/img/index/icon4.webp','水果','icon');
INSERT INTO index_image VALUES(null,'http://127.0.0.1:3001/img/index/icon5.webp','医药健康','icon');
INSERT INTO index_image VALUES(null,'http://127.0.0.1:3001/img/index/icon6.webp','浪漫鲜花','icon');
INSERT INTO index_image VALUES(null,'http://127.0.0.1:3001/img/index/icon7.webp','厨房生鲜','icon');
INSERT INTO index_image VALUES(null,'http://127.0.0.1:3001/img/index/icon8.webp','跑腿代购','icon');
INSERT INTO index_image VALUES(null,'http://127.0.0.1:3001/img/index/icon9.webp','地方小吃','icon');
INSERT INTO index_image VALUES(null,'http://127.0.0.1:3001/img/index/icon10.webp','麻辣烫','icon');

INSERT INTO index_image VALUES(null,'http://1270.0.01:3001/img/index/md_banner1.webp','','subbanner');
INSERT INTO index_image VALUES(null,'http://1270.0.01:3001/img/index/md_banner2.webp','','subbanner');
#用户表
CREATE TABLE el_user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    phone_num  VARCHAR(11),
    upwd VARCHAR(20),
    uname  VARCHAR(20),
    gender BOOLEAN
);
INSERT INTO el_user VALUES(null,'15000000000','123456','gaga');

#商铺表
-- CREATE TABLE shop_list(
--     sid INT PRIMARY KEY AUTO_INCREMENT,
-- );

#首页推荐商铺
CREATE TABLE index_shop(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    sh_name VARCHAR(20),
    sh_logo VARCHAR(255),
    sold_month INT,         #月售
    distance INT,           #距离
    star    DECIMAL,        
    min_price INT,          #起送价
    is_fengniao BOOLEAN,    #蜂鸟配送
    is_grt  BOOLEAN,        #承保
    is_reciept BOOLEAN,     #提供发票
    is_ad   BOOLEAN,        #是广告
    is_newshop  BOOLEAN,    #新店优惠
    is_first_dsc  BOOLEAN,  #首单优惠
    is_dsc BOOLEAN,         #是否有折扣
    is_manjian BOOLEAN,     #满减
    is_brand BOOLEAN,        #品牌
    shop_note VARCHAR(255),
    sh_bg VARCHAR(255),     #商铺背景图
    shop_banner VARCHAR(244)
);
INSERT INTO index_shop VALUES(
    null,
    '二胖烧烤',
    'http://127.0.0.1:3001/img/index/icon3.webp',
    59,
    123,
    4.2,
    40,
    true,
    false,
    false,
    false,
    true,
    false,
    false,
    true,
    false,
    '',
    '',
    'http://127.0.0.1:3001/img/shop/banner/banner1.webp'
);
INSERT INTO index_shop VALUES(
    null,
    '正新鸡排',
    'http://127.0.0.1:3001/img/index/icon3.webp',
    201,
    600,
    4.4,
    22,
    true,
    false,
    false,
    false,
    true,
    false,
    false,
    true,
    false,
    '',
    '',
    ''
);
INSERT INTO index_shop VALUES(
    null,
    '阿姨奶茶',
    'http://127.0.0.1:3001/img/index/icon3.webp',
    153,
    350,
    4.7,
    20,
    true,
    false,
    false,
    false,
    true,
    false,
    false,
    true,
    false,
    '',
    '',
    ''
);
#添加商铺详情表
CREATE TABLE shop_details(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    sh_name VARCHAR(20),
    sh_logo VARCHAR(255),
    sh_bg VARCHAR(255),
    min_charge  DECIMAL(5,2),    #起送价
    star_rate   DECIMAL(1,1),    #星级
    manjian VARCHAR(255)        #满减
);
INSERT INTO shop_details VALUES(
    null,
    "正新鸡排",
    "",
    "",
    25.00,
    4.8
);
#食品列表
CREATE TABLE food_list(
    fid INT PRIMARY KEY AUTO_INCREMENT,
    f_name   VARCHAR(30),
    f_img_sm  VARCHAR(255),
    f_img_md  VARCHAR(255),
    sid INT,    #外键 index_shop sid
    price DECIMAL,
    sold_count INT,
    is_recom BOOLEAN,   #是否推荐
    is_disct BOOLEAN,   #是否特价
    good_rate  DECIMAL,    #好评率
    summary VARCHAR(20),
    f_desc   VARCHAR(100),
    max_p INT,    #每单限量数
    min_p DECIMAL,  #最低价
    f_sort  VARCHAR(4),
    size INT,
    rest_count INT,  #还剩几份
    old_price DECIMAL   #原价
);
INSERT INTO food_list VALUES(
    null,
    '蛋炒饭',
    'http://127.0.0.1:3001/img/index/icon1.webp',
    'http://127.0.0.1:3001/img/index/icon1.webp',
1,
12,
345,
true,
true,
4.1,
'葱香蛋炒饭，家里的味道',
'本店招牌菜，蜜汁酱汁，吃过绝对赞不绝口',
2,
1,
'炒菜',
1,
20,
18
    );
INSERT INTO food_list VALUES(
    null,
    '生滚鱼片粥',
    'http://127.0.0.1:3001/img/index/icon1.webp',
    'http://127.0.0.1:3001/img/index/icon1.webp',
    1,
    12,
    345,
    true,
    true,
    4.1,
    '鱼片粥，营养又美味',
    '回家吃饭的味道',
    2,
    1,
    '粥',
    1,
    20,
    18
    );
INSERT INTO food_list VALUES(
    null,
    '生滚鱼片粥',
    'http://127.0.0.1:3001/img/index/icon1.webp',
    'http://127.0.0.1:3001/img/index/icon1.webp',
    1,
    12,
    345,
    true,
    true,
    4.1,
    '鱼片粥，营养又美味',
    '回家吃饭的味道',
    2,
    1,
    '粥',
    1,
    20,
    18
    );
INSERT INTO food_list VALUES(
    null,
    '鲜肉生煎',
    'http://127.0.0.1:3001/img/index/icon1.webp',
    'http://127.0.0.1:3001/img/index/icon1.webp',
    1,
    12,
    345,
    true,
    true,
    4.1,
    '鲜肉生煎',
    '精心现做',
    2,
    1,
    '粥',
    1,
    20,
    18
    );

#订单表
CREATE TABLE order_list(
    oid INT PRIMARY KEY AUTO_INCREMENT,
    sh_name VARCHAR(20),
    sh_logo VARCHAR(255),
    o_date Date,
    o_state INT,    # 0配送中，1已送达，2取消
    o_sum INT,
    o_items VARCHAR(255),
    uid
);
INSERT INTO order_list VALUES(
    NULL,
    "阿姨奶茶",
    "http://127.0.0.1:3001/img/logo/zxjp.webp",
    '2018-09-01',
    1,
    24,
    '',
    1
);
INSERT INTO order_list VALUES(
    NULL,
    "二胖烧烤",
    "http://127.0.0.1:3001/img/index/icon3.webp",
    '2018-09-01 20:30',
    1,
    24,
    '',
    1
);