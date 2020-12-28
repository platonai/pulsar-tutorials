-- noinspection SqlNoDataSourceInspectionForFile

-- noinspection SqlDialectInspectionForFile

CREATE TABLE `asin_sync` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    -- the url of the page
  `url` varchar(2046) NOT NULL COMMENT '',
  `category` varchar(255) DEFAULT NULL COMMENT '所属分类nodeID',
    -- the product title
  `img` text COMMENT '主图URL',
  `imgsrc` text COMMENT '主图URL',
  `dynamicimgsrcs` text COMMENT '主图URL',
  `rank` text COMMENT '小类排名',
  `rank2` text COMMENT '小类排名',
  `smallrank` text COMMENT '小类排名',
  `bigrank` text COMMENT '大类排名',
  `title` text COMMENT '商品标题',
  `featurebullets` text COMMENT '商品描述',
  `desc` text COMMENT '商品描述',
  `asin` varchar(255) DEFAULT NULL COMMENT '商品asin编码',
  `pasin` varchar(255) DEFAULT NULL COMMENT '商品asin编码',
  `totalvariations` varchar(64) DEFAULT NULL COMMENT '商品asin编码',
  `jsVariables` text COMMENT 'All available javascript variables',
  `brand` varchar(1024) DEFAULT NULL COMMENT '品牌',
  `soldby` text COMMENT '卖家',
  `shipsfrom` text COMMENT '',
  `quantity` varchar(255) DEFAULT NULL COMMENT 'quantity',
  `globaldeliverto` varchar(255) DEFAULT NULL COMMENT 'the destination to deliver to',
  `deliverto` varchar(255) DEFAULT NULL COMMENT 'the destination to deliver to',
  `price` text COMMENT '价格',
  `buyboxprice` text COMMENT '价格',
  `instock` varchar(1024) DEFAULT NULL COMMENT '是否缺货 0 不缺货  1  缺货',
  `isaddcart` tinyint(1) DEFAULT NULL COMMENT '加入购物车按钮',
  `isbuy` tinyint(1) DEFAULT NULL COMMENT '直接购买按钮',
  `isac` tinyint(1) DEFAULT NULL COMMENT '是否amazon精选推荐',
  `isbs` tinyint(1) DEFAULT NULL COMMENT '释放amazon热卖推荐',
  `iscoupon` tinyint(1) DEFAULT NULL COMMENT 'is coupon',
  `isprime` varchar(255) DEFAULT NULL COMMENT 'is prime',
  `isdeal` tinyint(1) DEFAULT NULL COMMENT 'is deal',
  `withdeal` varchar(255) DEFAULT NULL COMMENT 'You save',
  `yousave` varchar(255) DEFAULT NULL COMMENT 'You save',
  `detailimgs` text COMMENT 'all src of detail imgs',
  `detailvideos` text COMMENT 'all source of videos in product detail section',
  `isa` int(11) DEFAULT NULL COMMENT '是否A+页面',
  `boughttogethermetadata` text COMMENT 'all source of videos in product detail section',
  `boughttogetherimgs` text COMMENT 'all source of videos in product detail section',
  `boughttogether` text COMMENT 'all source of videos in product detail section',
  `othersellernum` int(11) DEFAULT NULL COMMENT '跟卖数量',
  `qanum` int(11) DEFAULT NULL COMMENT 'QA问题数',
  `stock_status` tinyint(4) DEFAULT '0' COMMENT '库存状态',
  `score` float DEFAULT NULL COMMENT '平均评星数',
  `reviews` int(11) DEFAULT NULL COMMENT '评论总数',
  `starnum` int(11) DEFAULT NULL COMMENT '评星总数',
  `score5percent` varchar(16) DEFAULT NULL COMMENT '5星级占比',
  `score4percent` varchar(16) DEFAULT NULL COMMENT '4星级占比',
  `score3percent` varchar(16) DEFAULT NULL COMMENT '3星级占比',
  `score2percent` varchar(16) DEFAULT NULL COMMENT '2星级占比',
  `score1percent` varchar(16) DEFAULT NULL COMMENT '1星级占比',
  `scoresbyfeature` varchar(16) DEFAULT NULL COMMENT 'Scores by feature',
  `weight` varchar(64) DEFAULT NULL COMMENT '重量',
  `volume` varchar(64) DEFAULT NULL COMMENT '体积',
  `isad` tinyint(1) DEFAULT NULL COMMENT '是否列表广告推广',
  `adposition` varchar(64) DEFAULT NULL COMMENT '列表广告位置',
  `commenttime` varchar(64) DEFAULT NULL COMMENT '第一条评论时间',
  `reviewsmention` text COMMENT '高频评论词',
  `onsaletime` varchar(64) DEFAULT NULL COMMENT '上架时间',
  `feedbackurl` text COMMENT '打开feedback页面的URL',
  `sellerID` text COMMENT 'sellerID',
  `marketplaceID` text COMMENT 'marketplaceID',
  `reviewsurl` text COMMENT '打开所有评论页面的URL',
  `sellsameurl` text COMMENT '打开跟卖信息页面的URL',
  `fba_fee` float DEFAULT NULL COMMENT 'FBA运费',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `isvalid` tinyint(1) DEFAULT '1' COMMENT 'valid',
  `categorylevel` text COMMENT '各级分类nodeID',
  `categorypath` text COMMENT '分类路径',
  `categorypathlevel` text COMMENT '各级分类路径',
  `categoryname` text COMMENT '分类名称',
  `categorynamelevel` text COMMENT '各级分类名称',
  `ranklevel` varchar(255) DEFAULT NULL COMMENT '各级排名',
  `brandlink` text COMMENT '品牌链接',
  `listprice` varchar(255) DEFAULT NULL COMMENT '挂牌价格',
  `gallery` text COMMENT '图库',
  `referer` text COMMENT 'The url which the url comes from',
  `numchars` varchar(16) DEFAULT NULL COMMENT 'Total number of text characters in this page',
  `numlinks` varchar(16) DEFAULT NULL COMMENT 'Total number of links in this page',
  `numimgs` varchar(16) DEFAULT NULL COMMENT 'Total number of images in this page',
  `height` varchar(16) DEFAULT NULL COMMENT 'Total number of images in this page',
  `is_sync` varchar(16) DEFAULT '0' COMMENT '是否同步 0 否 1 是',
  `source` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3174716 DEFAULT CHARSET=utf8mb4 COMMENT='商品表-美国';