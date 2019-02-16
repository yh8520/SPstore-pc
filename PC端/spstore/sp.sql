SET NAMES UTF8;
DROP DATABASE IF EXISTS sp;
CREATE DATABASE sp CHARSET=UTF8;
drop DATABASE if EXISTS spsp;
USE sp;

/**型号家族**/
CREATE TABLE sp_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

/**商品**/
CREATE TABLE sp_pro(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  f_id INT,              #所属型号家族编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  price DECIMAL(10,2),        #价格
  promise VARCHAR(64),        #服务承诺
  spec VARCHAR(64),           #规格/颜色

  brand VARCHAR(32),          #品牌
  lname VARCHAR(32),          #商品名称
  lname_id VARCHAR(32),       #商品编号
  weight_note VARCHAR(32),    #商品重量
  place VARCHAR(32),          #产地
  details VARCHAR(1024),      #产品详细说明

  
  shelf_time BIGINT,          #上架时间
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);

/**图片**/
CREATE TABLE sp_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  sp_id INT,                  #编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);
-- input框搜索
CREATE TABLE sp_inputText(
  id int primary key auto_increment,
  name VARCHAR(128)
);
/**用户信息**/
CREATE TABLE sp_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),

  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);

/**收货地址信息**/
CREATE TABLE sp_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  u_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

/**购物车条目**/
CREATE TABLE sp_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  u_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);

/**用户订单**/
CREATE TABLE sp_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  u_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE sp_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);

/****首页轮播广告商品****/
CREATE TABLE sp_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);

/****首页商品****/
CREATE TABLE sp_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  old_price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);
-- input框搜索
INSERT into sp_inputText VALUES
(null,"进口美食"),
(NULL,"三只松鼠"),
(NULL,"良品铺子"),
(NULL,"vivo手机");
/*******************/
/******数据导入******/
/*******************/
/**笔记本电脑型号家族**/
INSERT INTO sp_family VALUES
(NULL,'生鲜水果'),
(NULL,'家具家居'),
(NULL,'百威啤酒'),
(NULL,'家庭洗漱'),
(NULL,'休闲食品'),
(NULL,'优质家电'),
(NULL,'皮肤护理'),
(NULL,'母婴玩具'),
(NULL,'精美图书');

/**笔记本电脑**/
INSERT INTO sp_pro VALUES
(1,1,'多力甾醇玉米油5L 非转基因食用油 含维生素e','多力甾醇玉米油5L 非转基因食用油 含维生素e',6988,'支持      满86元免基础生鲜商品运费(50kg内)     准时达     211限时达','澳橙 6个 装','京东生鲜','澳大利亚进口脐橙 澳橙12个装 单果重约150kg','15999924','2.3kg','澳大利亚','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,true),
(2,1,'多力甾醇橄榄油5L 非转基因食用油 含维生素e','多力甾醇玉米油5L 非转基因食用油 含维生素e',6988,'支持      满86元免基础生鲜商品运费(50kg内)     准时达     211限时达','澳橙 12个 装','京东生鲜','澳大利亚进口脐橙 澳橙12个装 单果重约150kg','15999924','2.3kg','澳大利亚','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(3,1,'多力甾醇橄榄油5L 非转基因食用油 含维生素edfdf','多力甾醇玉米油5L 非转基因食用油 含维生素e',6988,'支持      满86元免基础生鲜商品运费(50kg内)     准时达     211限时达','澳橙 32个 装','京东生鲜','澳大利亚进口脐橙 澳橙12个装 单果重约150kg','15999924','2.3kg','澳大利亚','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(4,1,'多力甾醇橄榄油5L 非转基因食用油 含维生素e','多力甾醇玉米油5L 非转基因食用油 含维生素e',6988,'支持      满86元免基础生鲜商品运费(50kg内)     准时达     211限时达','澳橙 32个 一代装','京东生鲜','澳大利亚进口脐橙 澳橙12个装 单果重约150kg','15111124','2.3kg','澳大利亚','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(5,2,'好巧（haoqiao） 免手洗平板拖把 懒人拖布旋转地拖家','好巧（haoqiao） 免手洗平板拖把 懒人拖布旋转地拖家',4999,'支持      满86元免基础生鲜商品运费(50kg内)     准时达     211限时达','拖把 32个 一代装','家具家居','国产拖把','15555524','3.2kg','中国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(6,2,'（haoqiao） 免手洗平板拖把 懒人拖布旋转地拖家','好巧（haoqiao） 免手洗平板拖把 懒人拖布旋转地拖家',4999,'支持      满86元免基础生鲜商品运费(50kg内)     准时达     211限时达','拖把 32个 一代装','家居物品','国产拖把','15888824','3.2kg','美国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(7,2,'（haoqiao）懒人拖布旋转地拖家','好巧（haoqiao） 免手洗平板拖把 懒人拖布旋转地拖家',4999,'支持      满86元免基础生鲜商品运费(50kg内)     准时达     211限时达','拖把 32个 一代装','家居物品','国产拖把','15666624','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(8,2,'（haoqiao）懒人拖布旋转地拖家','好巧（haoqiao） 免手洗平板拖把 懒人拖布旋转地拖家',4999,'支持      满86元免基础生鲜商品运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(9,3,'百威啤酒','百威啤酒',999,'支持      满86元免基础生鲜商品运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(10,3,'百威啤酒1','百威啤酒',999,'支持      满86元免基础生鲜商品运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(11,3,'百威啤酒12','百威啤酒23',999,'支持      满86元免基础生鲜商品运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(12,3,'百威啤酒134','百威啤酒34',999,'支持      满86元免基础生鲜商品运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(13,4,'家庭洗漱','家庭洗漱',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(14,4,'家庭洗漱','家庭洗漱',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(15,4,'家庭洗漱435','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(16,4,'家庭洗地方漱435','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(17,5,'家庭洗地方漱435','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(18,6,'休闲食品地方','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(19,6,'休闲食品地发广告方','家庭洗漱法 的 地方国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(20,6,'休闲食品 法国个Greg特奥菲地方','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(21,6,'休打发打发地方地方闲食品地方','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(22,6,'休闲食打法品地方','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家居物品','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(23,6,'休闲食品地方','家庭洗漱法国',258,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家居物品','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(24,7,'皮肤护理的司法的覅地方就','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(25,7,'皮肤护理的司法的覅地方就','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(26,7,'皮肤护理的司法的覅地方就','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(27,7,'皮肤护理的司法的覅地方就','家庭洗漱法国',56,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15252524','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(28,7,'皮肤护理的司法的覅地方就','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(29,7,'皮肤护理的司法的覅地方就','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(30,7,'皮肤护理的司法的覅地方就','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(31,7,'皮肤护理的司法的覅地方就','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(32,7,'皮肤护理的司法的覅地方就','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(33,8,'湖南永兴冰糖橙 精选特级果2.5kg装 单果100g-150g 甜橙子 新鲜水果','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(34,8,'云南哀牢山冰糖橙 精选优级果2.5kg装 单果约115-165g 甜橙子 新鲜水果','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(35,9,'母婴玩具的覅地方就','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(36,9,'母婴玩具的退热贴司法的覅地方就','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(37,9,'母婴玩具的司儿童法的覅地方就','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(38,10,'进美图皮埃纳的司儿童法的覅地方就','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(39,10,'电脑uve具的司儿童法的覅地方就','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(40,10,'web全段的司儿童法的覅地方就','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(41,10,'鱼嘴余罪的司儿童法的覅地方就','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(42,10,'白夜行的司儿童法的覅地方就','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false),
(43,10,'道明寺司儿童法的覅地方就','家庭洗漱法国',999,'支持      满86元免基础家庭洗漱运费(50kg内)     准时达     211限时达','拖把 12个 一代装','家具家居','国产拖把','15777724','3.2kg','法国','<div class="kuai my_top"> <p><img src="img/456.jpg" alt=""></p> <p><img src="img/7895.jpg" alt=""></p>
<p><img src="img/b15.jpg" alt=""></p> <p><img src="img/456456.jpg" alt=""></p>
<p><img src="img/123123.jpg" alt=""></p> <p><img src="img/258jpg.jpg" alt=""></p>
<p><img src="img/e6.jpg" alt=""></p> <p><img src="img/2323.jpg" alt=""></p> </div>',150123456789,268,false);

/**笔记本电脑图片**/
INSERT INTO sp_pic VALUES
(NULL, 1, 'http://127.0.0.1:5500/yhd_img/jly.jpg',                                             'http://127.0.0.1:5500/yhd_img/jly.jpg',                                               ''),
(NULL, 1, 'http://127.0.0.1:5500/image/35.jpg',
'http://127.0.0.1:5500/image/35.jpg',
''),
(NULL, 1, 'http://127.0.0.1:5500/yhd_img/jly.jpg',
'http://127.0.0.1:5500/yhd_img/jly.jpg',
''),
(NULL, 1, 'http://127.0.0.1:5500/yhd_img/jly.jpg',
'http://127.0.0.1:5500/yhd_img/jly.jpg',''),


(NULL, 2, 'http://127.0.0.1:5500/image/35.jpg','http://127.0.0.1:5500/image/35.jpg',
''),
(NULL, 2, 'http://127.0.0.1:5500/img/5c038c07Nb8af17ce.jpg!cc_230x230.jpg','http://127.0.0.1:5500/img/5c038c07Nb8af17ce.jpg!cc_230x230.jpg',
''),
(NULL, 2, 'http://127.0.0.1:5500/img/5bf4a96eN023ba971.jpg','http://127.0.0.1:5500/img/5bf4a96eN023ba971.jpg',
''),


(NULL, 3, 'http://127.0.0.1:5500/img/5bfbb35dN1e63aebb.jpg!cc_230x230.jpg','http://127.0.0.1:5500/img/5bfbb35dN1e63aebb.jpg!cc_230x230.jpg',
''),
(NULL, 3, 'http://127.0.0.1:5500/img/1145bb8153baf65f.jpg','http://127.0.0.1:5500/img/1145bb8153baf65f.jpg',
''),
(NULL, 3, 'http://127.0.0.1:5500/img/1145bb8153baf65f.jpg','http://127.0.0.1:5500/img/1145bb8153baf65f.jpg',
''),

(NULL, 4, 'http://127.0.0.1:5500/img/f9b56b161a77d9fb.jpg!cc_230x230.jpg','http://127.0.0.1:5500/img/f9b56b161a77d9fb.jpg!cc_230x230.jpg',
''),
(NULL, 4, 'http://127.0.0.1:5500/img/0580227a5dce410d.png!cc_230x230.jpg','http://127.0.0.1:5500/img/0580227a5dce410d.png!cc_230x230.jpg',
''),
(NULL, 4, 'http://127.0.0.1:5500/img/0580227a5dce410d.png!cc_230x230.jpg','http://127.0.0.1:5500/img/0580227a5dce410d.png!cc_230x230.jpg',
''),


(NULL, 5, 'http://127.0.0.1:5500/image/676eec37ff1d6d04.jpg!cc_230x230.jpg','http://127.0.0.1:5500/image/676eec37ff1d6d04.jpg!cc_230x230.jpg',
''),
(NULL, 5, 'http://127.0.0.1:5500/image/5afb7b71Ne5d25371.jpg!cc_230x230.jpg','http://127.0.0.1:5500/image/5afb7b71Ne5d25371.jpg!cc_230x230.jpg',
''),
(NULL, 5, 'http://127.0.0.1:5500/image/5bc6941eNbf2137cb.jpg!cc_230x230.jpg','http://127.0.0.1:5500/image/5bc6941eNbf2137cb.jpg!cc_230x230.jpg',
''),
(NULL, 5, 'http://127.0.0.1:5500/image/5bc83b65Nbd5189e2.jpg!cc_230x230.jpg','http://127.0.0.1:5500/image/5bc83b65Nbd5189e2.jpg!cc_230x230.jpg',
''),
(NULL, 5, 'http://127.0.0.1:5500/image/5b8f2968N141aedc3.jpg!cc_230x230.jpg','http://127.0.0.1:5500/image/5b8f2968N141aedc3.jpg!cc_230x230.jpg',
''),
(NULL, 5, 'http://127.0.0.1:5500/image/592eb0a0Nb7e29b31.jpg!cc_230x230.jpg','http://127.0.0.1:5500/image/592eb0a0Nb7e29b31.jpg!cc_230x230.jpg',
''),
(NULL, 5, 'http://127.0.0.1:5500/image/5bc43df3Nad527546.jpg!cc_230x230.jpg','http://127.0.0.1:5500/image/5bc43df3Nad527546.jpg!cc_230x230.jpg',
''),



(NULL, 6, 'http://127.0.0.1:5500/image/57550c7c2eb0210c.jpg!cc_230x230.jpg','http://127.0.0.1:5500/image/57550c7c2eb0210c.jpg!cc_230x230.jpg',
''),
(NULL, 6, 'http://127.0.0.1:5500/image/5b811121N2c293f74.jpg!cc_230x230.jpg','http://127.0.0.1:5500/image/5b811121N2c293f74.jpg!cc_230x230.jpg',
''),
(NULL, 6, 'http://127.0.0.1:5500/image/5bf37246N71228d5c.jpg!cc_230x230.jpg','http://127.0.0.1:5500/image/5bf37246N71228d5c.jpg!cc_230x230.jpg',''),
(NULL, 6, 'http://127.0.0.1:5500/image/5af00126N0b7b98a0.jpg!cc_230x230.jpg','http://127.0.0.1:5500/image/5af00126N0b7b98a0.jpg!cc_230x230.jpg',''),
(NULL, 6, 'http://127.0.0.1:5500/image/7118024d6aa700e9.jpg!cc_230x230.jpg','http://127.0.0.1:5500/image/7118024d6aa700e9.jpg!cc_230x230.jpg',''),
(NULL, 6, 'http://127.0.0.1:5500/image/398084ec5fc95650.jpg!cc_230x230.jpg','http://127.0.0.1:5500/image/398084ec5fc95650.jpg!cc_230x230.jpg',''),
(NULL, 6, 'http://127.0.0.1:5500/image/e8dd7f8f4126cfa9.jpg!cc_230x230.jpg','http://127.0.0.1:5500/image/e8dd7f8f4126cfa9.jpg!cc_230x230.jpg',''),


(NULL, 7, 'http://127.0.0.1:5500/image/b2bf387008bc076a.jpg!cc_230x230.jpg','http://127.0.0.1:5500/image/b2bf387008bc076a.jpg!cc_230x230.jpg',''),
(NULL, 7, 'http://127.0.0.1:5500/image/u=797817012,261253863&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=797817012,261253863&fm=15&gp=0.jpg',''),
(NULL, 7, 'http://127.0.0.1:5500/image/u=973315449,802064877&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=973315449,802064877&fm=15&gp=0.jpg',''),
(NULL, 7, 'http://127.0.0.1:5500/image/u=1136082363,3838987513&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=1136082363,3838987513&fm=26&gp=0.jpg',''),
(NULL, 7, 'http://127.0.0.1:5500/image/u=1990728442,3967729630&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=1990728442,3967729630&fm=15&gp=0.jpg',''),
(NULL, 7, 'http://127.0.0.1:5500/image/u=1153585440,218714059&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=1153585440,218714059&fm=15&gp=0.jpg',''),
(NULL, 7, 'http://127.0.0.1:5500/image/u=4035134594,2767798226&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=4035134594,2767798226&fm=26&gp=0.jpg',''),

(NULL, 8, 'http://127.0.0.1:5500/image/u=2240764149,3721208897&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=2240764149,3721208897&fm=26&gp=0.jpg',''),
(NULL, 8, 'http://127.0.0.1:5500/image/u=797817012,261253863&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=797817012,261253863&fm=15&gp=0.jpg',''),
(NULL, 8, 'http://127.0.0.1:5500/image/u=1714443514,880870164&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=1714443514,880870164&fm=15&gp=0.jpg',''),
(NULL, 8, 'http://127.0.0.1:5500/image/b2bf387008bc076a.jpg!cc_230x230.jpg','http://127.0.0.1:5500/image/b2bf387008bc076a.jpg!cc_230x230.jpg',''),
(NULL, 8, 'http://127.0.0.1:5500/image/u=4071080502,1270164538&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=4071080502,1270164538&fm=15&gp=0.jpg',''),
(NULL, 8, 'http://127.0.0.1:5500/image/u=4035134594,2767798226&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=4035134594,2767798226&fm=26&gp=0.jpg',''),
(NULL, 8, 'http://127.0.0.1:5500/image/u=2114991901,1559409666&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=2114991901,1559409666&fm=26&gp=0.jpg',''),



(NULL, 9, 'http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg','http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg',''),
(NULL, 9, 'http://127.0.0.1:5500/image/584b567dNd9c58341.jpg','http://127.0.0.1:5500/image/584b567dNd9c58341.jpg',''),
(NULL, 9, 'http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg','http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg',''),
(NULL, 9, 'http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg','http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg',''),
(NULL, 9, 'http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg','http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg',''),
(NULL, 9, 'http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg','http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg',''),
(NULL, 9, 'http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg','http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg',''),
(NULL, 9, 'http://127.0.0.1:5500/image/5819a133N03021b26.jpg','http://127.0.0.1:5500/image/5819a133N03021b26.jpg',''),
(NULL, 10, 'http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg','http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg',''),
(NULL, 10, 'http://127.0.0.1:5500/image/584b567dNd9c58341.jpg','http://127.0.0.1:5500/image/584b567dNd9c58341.jpg',''),
(NULL, 10, 'http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg','http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg',''),
(NULL, 10, 'http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg','http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg',''),
(NULL, 10, 'http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg','http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg',''),
(NULL, 10, 'http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg','http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg',''),
(NULL, 10, 'http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg','http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg',''),
(NULL, 10, 'http://127.0.0.1:5500/image/5819a133N03021b26.jpg','http://127.0.0.1:5500/image/5819a133N03021b26.jpg',''),
(NULL, 11, 'http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg','http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg',''),
(NULL, 11, 'http://127.0.0.1:5500/image/584b567dNd9c58341.jpg','http://127.0.0.1:5500/image/584b567dNd9c58341.jpg',''),
(NULL, 11, 'http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg','http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg',''),
(NULL, 11, 'http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg','http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg',''),
(NULL, 11, 'http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg','http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg',''),
(NULL, 11, 'http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg','http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg',''),
(NULL, 11, 'http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg','http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg',''),
(NULL, 11, 'http://127.0.0.1:5500/image/5819a133N03021b26.jpg','http://127.0.0.1:5500/image/5819a133N03021b26.jpg',''),
(NULL, 12, 'http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg','http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg',''),
(NULL, 12, 'http://127.0.0.1:5500/image/584b567dNd9c58341.jpg','http://127.0.0.1:5500/image/584b567dNd9c58341.jpg',''),
(NULL, 12, 'http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg','http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg',''),
(NULL, 12, 'http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg','http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg',''),
(NULL, 12, 'http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg','http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg',''),
(NULL, 12, 'http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg','http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg',''),
(NULL, 12, 'http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg','http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg',''),
(NULL, 12, 'http://127.0.0.1:5500/image/5819a133N03021b26.jpg','http://127.0.0.1:5500/image/5819a133N03021b26.jpg',''),
(NULL, 13, 'http://127.0.0.1:5500/image/590a98f9N8039f132.jpg','http://127.0.0.1:5500/image/590a98f9N8039f132.jpg',''),
(NULL, 13, 'http://127.0.0.1:5500/image/58f46de7N0dafbae3.jpg','http://127.0.0.1:5500/image/58f46de7N0dafbae3.jpg',''),
(NULL, 13, 'http://127.0.0.1:5500/image/58e5c226N4836a223.jpg','http://127.0.0.1:5500/image/58e5c226N4836a223.jpg',''),
(NULL, 13, 'http://127.0.0.1:5500/image/58dc76d5N8a0947a3.jpg','http://127.0.0.1:5500/image/58dc76d5N8a0947a3.jpg',''),
(NULL, 13, 'http://127.0.0.1:5500/image/58fd9c54Nec723d68.jpg','http://127.0.0.1:5500/image/58fd9c54Nec723d68.jpg',''),
(NULL, 13, 'http://127.0.0.1:5500/image/58bfc2afNd44b4135.jpg','http://127.0.0.1:5500/image/58bfc2afNd44b4135.jpg',''),
(NULL, 14, 'http://127.0.0.1:5500/image/590a98f9N8039f132.jpg','http://127.0.0.1:5500/image/590a98f9N8039f132.jpg',''),
(NULL, 14, 'http://127.0.0.1:5500/image/58f46de7N0dafbae3.jpg','http://127.0.0.1:5500/image/58f46de7N0dafbae3.jpg',''),

(NULL, 14, 'http://127.0.0.1:5500/image/58e5c226N4836a223.jpg','http://127.0.0.1:5500/image/58e5c226N4836a223.jpg',''),
(NULL, 14, 'http://127.0.0.1:5500/image/58dc76d5N8a0947a3.jpg','http://127.0.0.1:5500/image/58dc76d5N8a0947a3.jpg',''),
(NULL, 14, 'http://127.0.0.1:5500/image/58fd9c54Nec723d68.jpg','http://127.0.0.1:5500/image/58fd9c54Nec723d68.jpg',''),
(NULL, 14, 'http://127.0.0.1:5500/image/58bfc2afNd44b4135.jpg','http://127.0.0.1:5500/image/58bfc2afNd44b4135.jpg',''),
(NULL, 15, 'http://127.0.0.1:5500/image/590a98f9N8039f132.jpg','http://127.0.0.1:5500/image/590a98f9N8039f132.jpg',''),
(NULL, 15, 'http://127.0.0.1:5500/image/58f46de7N0dafbae3.jpg','http://127.0.0.1:5500/image/58f46de7N0dafbae3.jpg',''),
(NULL, 15, 'http://127.0.0.1:5500/image/58e5c226N4836a223.jpg','http://127.0.0.1:5500/image/58e5c226N4836a223.jpg',''),
(NULL, 15, 'http://127.0.0.1:5500/image/58dc76d5N8a0947a3.jpg','http://127.0.0.1:5500/image/58dc76d5N8a0947a3.jpg',''),
(NULL, 15, 'http://127.0.0.1:5500/image/58fd9c54Nec723d68.jpg','http://127.0.0.1:5500/image/58fd9c54Nec723d68.jpg',''),
(NULL, 15, 'http://127.0.0.1:5500/image/58bfc2afNd44b4135.jpg','http://127.0.0.1:5500/image/58bfc2afNd44b4135.jpg',''),
(NULL, 16, 'http://127.0.0.1:5500/image/590a98f9N8039f132.jpg','http://127.0.0.1:5500/image/590a98f9N8039f132.jpg',''),
(NULL, 16, 'http://127.0.0.1:5500/image/58f46de7N0dafbae3.jpg','http://127.0.0.1:5500/image/58f46de7N0dafbae3.jpg',''),
(NULL, 16, 'http://127.0.0.1:5500/image/58e5c226N4836a223.jpg','http://127.0.0.1:5500/image/58e5c226N4836a223.jpg',''),
(NULL, 16, 'http://127.0.0.1:5500/image/58dc76d5N8a0947a3.jpg','http://127.0.0.1:5500/image/58dc76d5N8a0947a3.jpg',''),
(NULL, 16, 'http://127.0.0.1:5500/image/58fd9c54Nec723d68.jpg','http://127.0.0.1:5500/image/58fd9c54Nec723d68.jpg',''),
(NULL, 16, 'http://127.0.0.1:5500/image/58bfc2afNd44b4135.jpg','http://127.0.0.1:5500/image/58bfc2afNd44b4135.jpg',''),
(NULL, 17, 'http://127.0.0.1:5500/image/587f476aNcfbf7869.jpg','http://127.0.0.1:5500/image/587f476aNcfbf7869.jpg',''),
(NULL, 17, 'http://127.0.0.1:5500/image/57871083Nefe2d3d6.jpg','http://127.0.0.1:5500/image/57871083Nefe2d3d6.jpg',''),
(NULL, 17, 'http://127.0.0.1:5500/image/57871086N86c8f0ab.jpg','http://127.0.0.1:5500/image/57871086N86c8f0ab.jpg',''),
(NULL, 17, 'http://127.0.0.1:5500/image/5787107bN73d05ad5.jpg','http://127.0.0.1:5500/image/5787107bN73d05ad5.jpg','img/product/lg/5787107bN73d05ad5.jpg'),
(NULL, 17, 'http://127.0.0.1:5500/image/5787109cNaf26e3b0.jpg','http://127.0.0.1:5500/image/5787109cNaf26e3b0.jpg','img/product/lg/5787109cNaf26e3b0.jpg'),
(NULL, 17, 'http://127.0.0.1:5500/image/578710a0N07795fe5.jpg','http://127.0.0.1:5500/image/578710a0N07795fe5.jpg','img/product/lg/578710a0N07795fe5.jpg'),
(NULL, 17, 'http://127.0.0.1:5500/image/578710a3Nc498e3ea.jpg','http://127.0.0.1:5500/image/578710a3Nc498e3ea.jpg','img/product/lg/578710a3Nc498e3ea.jpg'),
(NULL, 18, 'http://127.0.0.1:5500/image/587f476aNcfbf7869.jpg','http://127.0.0.1:5500/image/587f476aNcfbf7869.jpg','img/product/lg/587f476aNcfbf7869.jpg'),
(NULL, 18, 'http://127.0.0.1:5500/image/57871083Nefe2d3d6.jpg','http://127.0.0.1:5500/image/57871083Nefe2d3d6.jpg','img/product/lg/57871083Nefe2d3d6.jpg'),
(NULL, 18, 'http://127.0.0.1:5500/image/57871086N86c8f0ab.jpg','http://127.0.0.1:5500/image/57871086N86c8f0ab.jpg','img/product/lg/57871086N86c8f0ab.jpg'),
(NULL, 18, 'http://127.0.0.1:5500/image/5787107bN73d05ad5.jpg','http://127.0.0.1:5500/image/5787107bN73d05ad5.jpg','img/product/lg/5787107bN73d05ad5.jpg'),
(NULL, 18, 'http://127.0.0.1:5500/image/5787109cNaf26e3b0.jpg','http://127.0.0.1:5500/image/5787109cNaf26e3b0.jpg','img/product/lg/5787109cNaf26e3b0.jpg'),
(NULL, 18, 'http://127.0.0.1:5500/image/578710a0N07795fe5.jpg','http://127.0.0.1:5500/image/578710a0N07795fe5.jpg','img/product/lg/578710a0N07795fe5.jpg'),
(NULL, 18, 'http://127.0.0.1:5500/image/578710a3Nc498e3ea.jpg','http://127.0.0.1:5500/image/578710a3Nc498e3ea.jpg','img/product/lg/578710a3Nc498e3ea.jpg'),
(NULL, 19, 'http://127.0.0.1:5500/image/57bbc38eN9def8042.jpg','http://127.0.0.1:5500/image/57bbc38eN9def8042.jpg','img/product/lg/57bbc38eN9def8042.jpg'),
(NULL, 19, 'http://127.0.0.1:5500/image/57ba6a27Nbb8d2dcf.jpg','http://127.0.0.1:5500/image/57ba6a27Nbb8d2dcf.jpg','img/product/lg/57ba6a27Nbb8d2dcf.jpg'),
(NULL, 19, 'http://127.0.0.1:5500/image/57ba6a38N4f4670bd.jpg','http://127.0.0.1:5500/image/57ba6a38N4f4670bd.jpg','img/product/lg/57ba6a38N4f4670bd.jpg'),
(NULL, 19, 'http://127.0.0.1:5500/image/57ba6a3dN54779e6a.jpg','http://127.0.0.1:5500/image/57ba6a3dN54779e6a.jpg','img/product/lg/57ba6a3dN54779e6a.jpg'),
(NULL, 19, 'http://127.0.0.1:5500/image/57ba6a47N19af9c97.jpg','http://127.0.0.1:5500/image/57ba6a47N19af9c97.jpg','img/product/lg/57ba6a47N19af9c97.jpg'),
(NULL, 19, 'http://127.0.0.1:5500/image/57ba6a4cNb83e292a.jpg','http://127.0.0.1:5500/image/57ba6a4cNb83e292a.jpg','img/product/lg/57ba6a4cNb83e292a.jpg'),
(NULL, 19, 'http://127.0.0.1:5500/image/57ba6a56N1e3e3d63.jpg','http://127.0.0.1:5500/image/57ba6a56N1e3e3d63.jpg','img/product/lg/57ba6a56N1e3e3d63.jpg'),
(NULL, 20, 'http://127.0.0.1:5500/image/57bbc38eN9def8042.jpg','http://127.0.0.1:5500/image/57bbc38eN9def8042.jpg','img/product/lg/57bbc38eN9def8042.jpg'),
(NULL, 20, 'http://127.0.0.1:5500/image/57ba6a27Nbb8d2dcf.jpg','http://127.0.0.1:5500/image/57ba6a27Nbb8d2dcf.jpg','img/product/lg/57ba6a27Nbb8d2dcf.jpg'),
(NULL, 20, 'http://127.0.0.1:5500/image/57ba6a38N4f4670bd.jpg','http://127.0.0.1:5500/image/57ba6a38N4f4670bd.jpg','img/product/lg/57ba6a38N4f4670bd.jpg'),
(NULL, 20, 'http://127.0.0.1:5500/image/57ba6a3dN54779e6a.jpg','http://127.0.0.1:5500/image/57ba6a3dN54779e6a.jpg','img/product/lg/57ba6a3dN54779e6a.jpg'),
(NULL, 20, 'http://127.0.0.1:5500/image/57ba6a47N19af9c97.jpg','http://127.0.0.1:5500/image/57ba6a47N19af9c97.jpg','img/product/lg/57ba6a47N19af9c97.jpg'),
(NULL, 20, 'http://127.0.0.1:5500/image/57ba6a4cNb83e292a.jpg','http://127.0.0.1:5500/image/57ba6a4cNb83e292a.jpg','img/product/lg/57ba6a4cNb83e292a.jpg'),
(NULL, 20, 'http://127.0.0.1:5500/image/57ba6a56N1e3e3d63.jpg','http://127.0.0.1:5500/image/57ba6a56N1e3e3d63.jpg','img/product/lg/57ba6a56N1e3e3d63.jpg'),
(NULL, 21, 'http://127.0.0.1:5500/image/57bbc38eN9def8042.jpg','http://127.0.0.1:5500/image/57bbc38eN9def8042.jpg','img/product/lg/57bbc38eN9def8042.jpg'),
(NULL, 21, 'http://127.0.0.1:5500/image/57ba6a27Nbb8d2dcf.jpg','http://127.0.0.1:5500/image/57ba6a27Nbb8d2dcf.jpg','img/product/lg/57ba6a27Nbb8d2dcf.jpg'),
(NULL, 21, 'http://127.0.0.1:5500/image/57ba6a38N4f4670bd.jpg','http://127.0.0.1:5500/image/57ba6a38N4f4670bd.jpg','img/product/lg/57ba6a38N4f4670bd.jpg'),
(NULL, 21, 'http://127.0.0.1:5500/image/57ba6a3dN54779e6a.jpg','http://127.0.0.1:5500/image/57ba6a3dN54779e6a.jpg','img/product/lg/57ba6a3dN54779e6a.jpg'),
(NULL, 21, 'http://127.0.0.1:5500/image/57ba6a47N19af9c97.jpg','http://127.0.0.1:5500/image/57ba6a47N19af9c97.jpg','img/product/lg/57ba6a47N19af9c97.jpg'),
(NULL, 21, 'http://127.0.0.1:5500/image/57ba6a4cNb83e292a.jpg','http://127.0.0.1:5500/image/57ba6a4cNb83e292a.jpg','img/product/lg/57ba6a4cNb83e292a.jpg'),
(NULL, 21, 'http://127.0.0.1:5500/image/57ba6a56N1e3e3d63.jpg','http://127.0.0.1:5500/image/57ba6a56N1e3e3d63.jpg','img/product/lg/57ba6a56N1e3e3d63.jpg'),
(NULL, 22, 'http://127.0.0.1:5500/image/5913f8ffN49fa143c.jpg','http://127.0.0.1:5500/image/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 22, 'http://127.0.0.1:5500/image/5913f903Nbffaa4fd.jpg','http://127.0.0.1:5500/image/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 22, 'http://127.0.0.1:5500/image/5913f907Ncbc65469.jpg','http://127.0.0.1:5500/image/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 22, 'http://127.0.0.1:5500/image/5913f90bN1b563f42.jpg','http://127.0.0.1:5500/image/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 22, 'http://127.0.0.1:5500/image/5913f90fN99370675.jpg','http://127.0.0.1:5500/image/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 22, 'http://127.0.0.1:5500/image/5913f93bNe4d2b3e5.jpg','http://127.0.0.1:5500/image/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 22, 'http://127.0.0.1:5500/image/5913f93fNfd79b4fc.jpg','http://127.0.0.1:5500/image/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 23, 'http://127.0.0.1:5500/image/5913f8ffN49fa143c.jpg','http://127.0.0.1:5500/image/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 23, 'http://127.0.0.1:5500/image/5913f903Nbffaa4fd.jpg','http://127.0.0.1:5500/image/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 23, 'http://127.0.0.1:5500/image/5913f907Ncbc65469.jpg','http://127.0.0.1:5500/image/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 23, 'http://127.0.0.1:5500/image/5913f90bN1b563f42.jpg','http://127.0.0.1:5500/image/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 23, 'http://127.0.0.1:5500/image/5913f90fN99370675.jpg','http://127.0.0.1:5500/image/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 23, 'http://127.0.0.1:5500/image/5913f93bNe4d2b3e5.jpg','http://127.0.0.1:5500/image/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 23, 'http://127.0.0.1:5500/image/5913f93fNfd79b4fc.jpg','http://127.0.0.1:5500/image/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 24, 'http://127.0.0.1:5500/image/5913f8ffN49fa143c.jpg','http://127.0.0.1:5500/image/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 24, 'http://127.0.0.1:5500/image/5913f903Nbffaa4fd.jpg','http://127.0.0.1:5500/image/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 24, 'http://127.0.0.1:5500/image/5913f907Ncbc65469.jpg','http://127.0.0.1:5500/image/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 24, 'http://127.0.0.1:5500/image/5913f90bN1b563f42.jpg','http://127.0.0.1:5500/image/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 24, 'http://127.0.0.1:5500/image/5913f90fN99370675.jpg','http://127.0.0.1:5500/image/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 24, 'http://127.0.0.1:5500/image/5913f93bNe4d2b3e5.jpg','http://127.0.0.1:5500/image/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 24, 'http://127.0.0.1:5500/image/5913f93fNfd79b4fc.jpg','http://127.0.0.1:5500/image/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 25, 'http://127.0.0.1:5500/image/5913f8ffN49fa143c.jpg','http://127.0.0.1:5500/image/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 25, 'http://127.0.0.1:5500/image/5913f903Nbffaa4fd.jpg','http://127.0.0.1:5500/image/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 25, 'http://127.0.0.1:5500/image/5913f907Ncbc65469.jpg','http://127.0.0.1:5500/image/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 25, 'http://127.0.0.1:5500/image/5913f90bN1b563f42.jpg','http://127.0.0.1:5500/image/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 25, 'http://127.0.0.1:5500/image/5913f90fN99370675.jpg','http://127.0.0.1:5500/image/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 25, 'http://127.0.0.1:5500/image/5913f93bNe4d2b3e5.jpg','http://127.0.0.1:5500/image/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 25, 'http://127.0.0.1:5500/image/5913f93fNfd79b4fc.jpg','http://127.0.0.1:5500/image/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 26, 'http://127.0.0.1:5500/image/5913f8ffN49fa143c.jpg','http://127.0.0.1:5500/image/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 26, 'http://127.0.0.1:5500/image/5913f903Nbffaa4fd.jpg','http://127.0.0.1:5500/image/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 26, 'http://127.0.0.1:5500/image/5913f907Ncbc65469.jpg','http://127.0.0.1:5500/image/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 26, 'http://127.0.0.1:5500/image/5913f90bN1b563f42.jpg','http://127.0.0.1:5500/image/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 26, 'http://127.0.0.1:5500/image/5913f90fN99370675.jpg','http://127.0.0.1:5500/image/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 26, 'http://127.0.0.1:5500/image/5913f93bNe4d2b3e5.jpg','http://127.0.0.1:5500/image/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 26, 'http://127.0.0.1:5500/image/5913f93fNfd79b4fc.jpg','http://127.0.0.1:5500/image/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 27, 'http://127.0.0.1:5500/image/5913f8ffN49fa143c.jpg','http://127.0.0.1:5500/image/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 27, 'http://127.0.0.1:5500/image/5913f903Nbffaa4fd.jpg','http://127.0.0.1:5500/image/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 27, 'http://127.0.0.1:5500/image/5913f907Ncbc65469.jpg','http://127.0.0.1:5500/image/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 27, 'http://127.0.0.1:5500/image/5913f90bN1b563f42.jpg','http://127.0.0.1:5500/image/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 27, 'http://127.0.0.1:5500/image/5913f90fN99370675.jpg','http://127.0.0.1:5500/image/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 27, 'http://127.0.0.1:5500/image/5913f93bNe4d2b3e5.jpg','http://127.0.0.1:5500/image/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 27, 'http://127.0.0.1:5500/image/5913f93fNfd79b4fc.jpg','http://127.0.0.1:5500/image/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 28, 'http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg','http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 28, 'http://127.0.0.1:5500/image/584b567dNd9c58341.jpg','http://127.0.0.1:5500/image/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 28, 'http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg','http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 28, 'http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg','http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 28, 'http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg','http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 28, 'http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg','http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 28, 'http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg','http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 28, 'http://127.0.0.1:5500/image/5819a133N03021b26.jpg','http://127.0.0.1:5500/image/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 29, 'http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg','http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 29, 'http://127.0.0.1:5500/image/584b567dNd9c58341.jpg','http://127.0.0.1:5500/image/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 29, 'http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg','http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 29, 'http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg','http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 29, 'http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg','http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 29, 'http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg','http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 29, 'http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg','http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 29, 'http://127.0.0.1:5500/image/5819a133N03021b26.jpg','http://127.0.0.1:5500/image/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 30, 'http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg','http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 30, 'http://127.0.0.1:5500/image/584b567dNd9c58341.jpg','http://127.0.0.1:5500/image/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 30, 'http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg','http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 30, 'http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg','http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 30, 'http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg','http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 30, 'http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg','http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 30, 'http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg','http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 30, 'http://127.0.0.1:5500/image/5819a133N03021b26.jpg','http://127.0.0.1:5500/image/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 31, 'http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg','http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 31, 'http://127.0.0.1:5500/image/584b567dNd9c58341.jpg','http://127.0.0.1:5500/image/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 31, 'http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg','http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 31, 'http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg','http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 31, 'http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg','http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 31, 'http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg','http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 31, 'http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg','http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 31, 'http://127.0.0.1:5500/image/5819a133N03021b26.jpg','http://127.0.0.1:5500/image/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 32, 'http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg','http://127.0.0.1:5500/image/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 32, 'http://127.0.0.1:5500/image/584b567dNd9c58341.jpg','http://127.0.0.1:5500/image/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 32, 'http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg','http://127.0.0.1:5500/image/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 32, 'http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg','http://127.0.0.1:5500/image/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 32, 'http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg','http://127.0.0.1:5500/image/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 32, 'http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg','http://127.0.0.1:5500/image/5819a10fNd0f96a03.jpg',''),
(NULL, 32, 'http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg','http://127.0.0.1:5500/image/5819a114Ne0cd75db.jpg',''),
(NULL, 32, 'http://127.0.0.1:5500/image/5819a133N03021b26.jpg','http://127.0.0.1:5500/image/5819a133N03021b26.jpg',''),

(NULL, 33, 'http://127.0.0.1:5500/img/7.jpg',
'http://127.0.0.1:5500/img/7.jpg',''),
(NULL, 33, 'http://127.0.0.1:5500/img/7.jpg',
'http://127.0.0.1:5500/img/7.jpg',''),
(NULL, 33, 'http://127.0.0.1:5500/img/9.jpg',
'http://127.0.0.1:5500/img/9.jpg',''),
(NULL, 33, 'http://127.0.0.1:5500/img/6.jpg',
'http://127.0.0.1:5500/img/6.jpg',''),
(NULL, 33, 'http://127.0.0.1:5500/img/577a.jpg',
'http://127.0.0.1:5500/img/577a.jpg',''),
(NULL, 33, 'http://127.0.0.1:5500/img/6.jpg',
'http://127.0.0.1:5500/img/6.jpg',''),



(NULL, 34, 'http://127.0.0.1:5500/img/6.jpg',
'http://127.0.0.1:5500/img/6.jpg',''),
(NULL, 34, 'http://127.0.0.1:5500/img/7.jpg',
'http://127.0.0.1:5500/img/7.jpg',''),
(NULL, 34, 'http://127.0.0.1:5500/img/9.jpg',
'http://127.0.0.1:5500/img/9.jpg',''),
(NULL, 34, 'http://127.0.0.1:5500/img/12.jpg',
'http://127.0.0.1:5500/img/12.jpg',''),
(NULL, 34, 'http://127.0.0.1:5500/img/577a.jpg',
'http://127.0.0.1:5500/img/577a.jpg',''),
(NULL, 34, 'http://127.0.0.1:5500/img/6.jpg',
'http://127.0.0.1:5500/img/6.jpg',''),


(NULL, 35, 'http://127.0.0.1:5500/image/58985861N615a3581.jpg','http://127.0.0.1:5500/image/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 35, 'http://127.0.0.1:5500/image/58985867Nf8909d49.jpg','http://127.0.0.1:5500/image/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 35, 'http://127.0.0.1:5500/image/5898586cNe235284b.jpg','http://127.0.0.1:5500/image/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 35, 'http://127.0.0.1:5500/image/58985881N0a78dea2.jpg','http://127.0.0.1:5500/image/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 35, 'http://127.0.0.1:5500/image/58985883Nd4aec745.jpg','http://127.0.0.1:5500/image/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 35, 'http://127.0.0.1:5500/image/5836b979N85c3852b.jpg','http://127.0.0.1:5500/image/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 35, 'http://127.0.0.1:5500/image/5836b981Nd60fd02a.jpg','http://127.0.0.1:5500/image/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),
(NULL, 36, 'http://127.0.0.1:5500/image/58985861N615a3581.jpg','http://127.0.0.1:5500/image/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 36, 'http://127.0.0.1:5500/image/58985867Nf8909d49.jpg','http://127.0.0.1:5500/image/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 36, 'http://127.0.0.1:5500/image/5898586cNe235284b.jpg','http://127.0.0.1:5500/image/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 36, 'http://127.0.0.1:5500/image/58985881N0a78dea2.jpg','http://127.0.0.1:5500/image/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 36, 'http://127.0.0.1:5500/image/58985883Nd4aec745.jpg','http://127.0.0.1:5500/image/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 36, 'http://127.0.0.1:5500/image/5836b979N85c3852b.jpg','http://127.0.0.1:5500/image/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 36, 'http://127.0.0.1:5500/image/5836b981Nd60fd02a.jpg','http://127.0.0.1:5500/image/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),
(NULL, 37, 'http://127.0.0.1:5500/image/58985861N615a3581.jpg','http://127.0.0.1:5500/image/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 37, 'http://127.0.0.1:5500/image/58985867Nf8909d49.jpg','http://127.0.0.1:5500/image/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 37, 'http://127.0.0.1:5500/image/5898586cNe235284b.jpg','http://127.0.0.1:5500/image/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 37, 'http://127.0.0.1:5500/image/58985881N0a78dea2.jpg','http://127.0.0.1:5500/image/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 37, 'http://127.0.0.1:5500/image/58985883Nd4aec745.jpg','http://127.0.0.1:5500/image/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 37, 'http://127.0.0.1:5500/image/5836b979N85c3852b.jpg','http://127.0.0.1:5500/image/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 37, 'http://127.0.0.1:5500/image/5836b981Nd60fd02a.jpg','http://127.0.0.1:5500/image/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),



(NULL, 38, 'http://127.0.0.1:5500/image/u=1999292852,3171620107&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=1999292852,3171620107&fm=15&gp=0.jpg',''),

(NULL, 38, 'http://127.0.0.1:5500/image/u=2426146035,2372167793&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=2426146035,2372167793&fm=15&gp=0.jpg',''),

(NULL, 38, 'http://127.0.0.1:5500/image/u=2873660262,3715907881&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=2873660262,3715907881&fm=15&gp=0.jpg',''),
(NULL, 38, 'http://127.0.0.1:5500/image/u=1370495463,3730888881&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=1370495463,3730888881&fm=15&gp=0.jpg',''),
(NULL, 38, 'http://127.0.0.1:5500/image/u=1436243696,3081999352&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=1436243696,3081999352&fm=15&gp=0.jpg',''),
(NULL, 38, 'http://127.0.0.1:5500/image/u=1064684568,3364751128&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=1064684568,3364751128&fm=26&gp=0.jpg',''),
(NULL, 38, 'http://127.0.0.1:5500/image/u=946197217,3797082489&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=946197217,3797082489&fm=26&gp=0.jpg',''),
(NULL, 38, 'http://127.0.0.1:5500/image/u=1370495463,3730888881&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=1370495463,3730888881&fm=15&gp=0.jpg',''),

(NULL, 39, 'http://127.0.0.1:5500/image/u=1183138689,4023802261&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=1183138689,4023802261&fm=15&gp=0.jpg',''),
(NULL, 39, 'http://127.0.0.1:5500/image/u=1201257715,2390246937&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=1201257715,2390246937&fm=26&gp=0.jpg',''),
(NULL, 39, 'http://127.0.0.1:5500/image/u=2028596811,1048728587&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=2028596811,1048728587&fm=26&gp=0.jpg',''),


(NULL, 40, 'http://127.0.0.1:5500/image/u=1188830957,119439436&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=1188830957,119439436&fm=15&gp=0.jpg',''),
(NULL, 40, 'http://127.0.0.1:5500/image/u=1206291340,3014273082&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=1206291340,3014273082&fm=15&gp=0.jpg',''),
(NULL, 40, 'http://127.0.0.1:5500/image/u=1614731859,1669021681&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=1614731859,1669021681&fm=15&gp=0.jpg',''),
(NULL, 40, 'http://127.0.0.1:5500/image/u=2762317845,614865283&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=2762317845,614865283&fm=15&gp=0.jpg',''),
(NULL, 40, 'http://127.0.0.1:5500/image/u=1629876721,3273319788&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=1629876721,3273319788&fm=26&gp=0.jpg',''),
(NULL, 40, 'http://127.0.0.1:5500/image/u=1614731859,1669021681&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=1614731859,1669021681&fm=15&gp=0.jpg',''),


(NULL, 41, 'http://127.0.0.1:5500/image/u=2162096706,4289237085&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=2162096706,4289237085&fm=26&gp=0.jpg',''),
(NULL, 41, 'http://127.0.0.1:5500/image/u=2596568146,1143310492&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=2596568146,1143310492&fm=26&gp=0.jpg',''),
(NULL, 41, 'http://127.0.0.1:5500/image/u=2337967356,1325955165&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=2337967356,1325955165&fm=15&gp=0.jpg',''),
(NULL, 41, 'http://127.0.0.1:5500/image/u=2783439918,3906520964&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=2783439918,3906520964&fm=26&gp=0.jpg',''),
(NULL, 41, 'http://127.0.0.1:5500/image/u=2842022874,2296599141&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=2842022874,2296599141&fm=26&gp=0.jpg',''),
(NULL, 41, 'http://127.0.0.1:5500/image/u=2309406706,3901927391&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=2309406706,3901927391&fm=15&gp=0.jpg',''),
(NULL, 41, 'http://127.0.0.1:5500/image/u=3744335782,2771465987&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=3744335782,2771465987&fm=26&gp=0.jpg',''),
(NULL, 41, 'http://127.0.0.1:5500/image/u=3659760975,2252277906&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=3659760975,2252277906&fm=15&gp=0.jpg',''),

(NULL, 42, 'http://127.0.0.1:5500/image/u=354180067,3541691402&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=354180067,3541691402&fm=26&gp=0.jpg',''),
(NULL, 42, 'http://127.0.0.1:5500/image/u=1188830957,119439436&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=1188830957,119439436&fm=15&gp=0.jpg',''),
(NULL, 42, 'http://127.0.0.1:5500/image/u=1206291340,3014273082&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=1206291340,3014273082&fm=15&gp=0.jpg',''),
(NULL, 42, 'http://127.0.0.1:5500/image/u=1499507268,2920351219&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=1499507268,2920351219&fm=15&gp=0.jpg',''),
(NULL, 42, 'http://127.0.0.1:5500/image/u=1449969654,1504597550&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=1449969654,1504597550&fm=26&gp=0.jpg',''),
(NULL, 42, 'http://127.0.0.1:5500/image/u=2492098328,4030799371&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=2492098328,4030799371&fm=26&gp=0.jpg',''),
(NULL, 42, 'http://127.0.0.1:5500/image/u=2762317845,614865283&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=2762317845,614865283&fm=15&gp=0.jpg',''),
(NULL, 42, 'http://127.0.0.1:5500/image/u=1488150201,1995849552&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=1488150201,1995849552&fm=15&gp=0.jpg',''),

(NULL, 43, 'http://127.0.0.1:5500/img/1145bb8153baf65f.jpg','http://127.0.0.1:5500/img/1145bb8153baf65f.jpg',''),
(NULL, 43, 'http://127.0.0.1:5500/image/u=416721615,1712494049&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=416721615,1712494049&fm=26&gp=0.jpg',''),
(NULL, 43, 'http://127.0.0.1:5500/image/u=2666154355,1063329639&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=2666154355,1063329639&fm=26&gp=0.jpg',''),
(NULL, 43, 'http://127.0.0.1:5500/image/u=2649712040,317450264&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=2649712040,317450264&fm=15&gp=0.jpg',''),
(NULL, 43, 'http://127.0.0.1:5500/image/u=2681668306,1010131899&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=2681668306,1010131899&fm=26&gp=0.jpg',''),
(NULL, 43, 'http://127.0.0.1:5500/image/u=2028379125,2702157130&fm=15&gp=0.jpg','http://127.0.0.1:5500/image/u=2028379125,2702157130&fm=15&gp=0.jpg',''),
(NULL, 43, 'http://127.0.0.1:5500/image/u=1315115991,3816114718&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=1315115991,3816114718&fm=26&gp=0.jpg',''),
(NULL, 43, 'http://127.0.0.1:5500/image/u=337982253,1055368362&fm=26&gp=0.jpg','http://127.0.0.1:5500/image/u=337982253,1055368362&fm=26&gp=0.jpg','');

/**用户信息**/
INSERT INTO sp_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1'),
(NULL, '', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');

/****首页轮播广告商品****/
INSERT INTO sp_index_carousel VALUES
(NULL,'http://127.0.0.1:5500/yhd_img/banner1.jpg','百威啤酒','http://127.0.0.1:5500/details.html?lid=22'),
(NULL,'http://127.0.0.1:5500/yhd_img/banner2.jpg','家庭洗漱','http://127.0.0.1:5500/details.html?lid=13'),
(NULL,'http://127.0.0.1:5500/yhd_img/banner3.jpg','休闲食品','http://127.0.0.1:5500/details.html?lid=31'),
(NULL,'http://127.0.0.1:5500/yhd_img/banner4.jpg','优质家电','http://127.0.0.1:5500/details.html?lid=23'),
(NULL,'http://127.0.0.1:5500/yhd_img/banner5.jpg','皮肤护理','http://127.0.0.1:5500/details.html?lid=11');

/****首页商品****/
INSERT INTO sp_index_product VALUES
(NULL, '','多力甾醇玉米油5L 非转基因食用油 含维生素e', 'http://127.0.0.1:5500/yhd_img/jly.jpg', 60,120, 'http://127.0.0.1:5500/details.html?lid=1', 1, 1, 1),
(NULL, '', '好巧（haoqiao） 免手洗平板拖把 懒人拖布旋转地拖家', 'http://127.0.0.1:5500/img/5bf4a96eN023ba971.jpg', 30,50, 'http://127.0.0.1:5500/details.html?lid=5', 2, 2, 2),
(NULL, '', '超能 超值洗衣液套装13.12斤：时尚炫彩', 'http://127.0.0.1:5500/img/1145bb8153baf65f.jpg', 99,110, 'http://127.0.0.1:5500/details.html?lid=43', 3, 3, 3),
(NULL, '', '新西兰原装进口儿童牛奶 安佳（Anchor）金装儿', 'http://127.0.0.1:5500/img/586b746aN24203ea2.jpg', 46,60, 'http://127.0.0.1:5500/details.html?lid=11', 4, 4, 4),
(NULL, '', '水星家纺 大提花四件套 英伦轻奢床单被罩被套床上用品套件 萨里伯爵 加大双人1.8米床', 'http://127.0.0.1:5500/img/5a3a0930N8cb606d9.jpg', 99,300, 'http://127.0.0.1:5500/details.html?lid=5', 5, 5, 5),
(NULL, '', '安怡金装高钙低脂配方奶粉800g罐装 进口成人奶粉 补钙 ', 'http://127.0.0.1:5500/img/58049062N4653ab82.jpg', 19,100, 'http://127.0.0.1:5500/details.html?lid=6', 6, 6, 6),
(NULL, '', '抽纸整箱face可湿水纸巾母婴儿3层20包餐巾纸面巾纸抽擦手卫生纸批发家用', 'http://127.0.0.1:5500/img/5bf77aa5Nddb9413d.jpg', 79,90, 'http://127.0.0.1:5500/details.html?lid=7', 0, 0, 0),
(NULL, '', '云南哀牢山冰糖橙 精选优级果2.5kg装 单果约115-165g 甜橙子 新鲜水果', 'http://127.0.0.1:5500/img/7.jpg', 19,100, 'http://127.0.0.1:5500/details.html?lid=34', 6, 6, 6),
(NULL, '', '抽纸整箱face可湿水纸巾母婴儿3层20包餐巾纸面巾纸抽擦手卫生纸批发家用', 'http://127.0.0.1:5500/image/2.jpg', 79,90, 'http://127.0.0.1:5500/details.html?lid=9', 0, 0, 0);

CREATE TABLE sp_index_super(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  lid int,
  title VARCHAR(64),
  bg VARCHAR(128),
  aattr VARCHAR(128),
  pic VARCHAR(128),
  img1 VARCHAR(128),
  img2 VARCHAR(128),
  img3 VARCHAR(128),
  href VARCHAR(128)
);

INSERT INTO sp_index_super VALUES
(NULL,1,"雀巢","http://127.0.0.1:5500/yhd_img/11111.png","满199减100",'http://127.0.0.1:5500/yhd_img/que.jpg','http://127.0.0.1:5500/image/14.jpg', 'http://127.0.0.1:5500/img/19.jpg','http://127.0.0.1:5500/img/7.jpg',""),

(NULL,1,"苏泊尔","http://127.0.0.1:5500/yhd_img/333333.png","爆款直降",'http://127.0.0.1:5500/yhd_img/su.jpg','http://127.0.0.1:5500/image/14.jpg', 'http://127.0.0.1:5500/img/19.jpg','http://127.0.0.1:5500/img/7.jpg',""),

(NULL,3,"酒饮冲调","http://127.0.0.1:5500/yhd_img/444444.png","爆款直降",'','http://127.0.0.1:5500/image/14.jpg', 'http://127.0.0.1:5500/img/19.jpg','http://127.0.0.1:5500/img/7.jpg',""),

(NULL,8,"母婴玩具","http://127.0.0.1:5500/yhd_img/22222.png","低至5折",'','http://127.0.0.1:5500/image/14.jpg', 'http://127.0.0.1:5500/img/19.jpg','http://127.0.0.1:5500/img/7.jpg',"");


-- CREATE TABLE sp_index_goods(
--   gid int primary key auto_increment,
--   img VARCHAR

-- )