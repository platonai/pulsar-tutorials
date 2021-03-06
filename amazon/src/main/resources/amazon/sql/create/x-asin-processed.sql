CREATE TABLE `asin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `asin` varchar(20) NOT NULL DEFAULT '0' COMMENT 'asin编码',
  `sync_id` int(20) DEFAULT '0' COMMENT '同步ID',
  `category` varchar(20) DEFAULT '0' COMMENT 'asin 所属 最小自然分类nodeID',
  `img` varchar(500) DEFAULT '0' COMMENT 'asin 主图URL',
  `title` varchar(500) DEFAULT '0' COMMENT 'asin 标题',
  `price` float DEFAULT '0' COMMENT 'asin 价格',
  `score` float DEFAULT '0' COMMENT '产品 评星',
  `starnum` int(11) DEFAULT '0' COMMENT '产品 评星总数',
  `seo_rank_valid` tinyint(4) DEFAULT '0' COMMENT '自然最小类目是否在我们总类目中',
  `seo_rank` int(11) DEFAULT '0' COMMENT 'asin 自然排名',
  `page` int(10) DEFAULT '0' COMMENT 'asin 所在页码',
  `row` int(10) DEFAULT '0' COMMENT 'asin 所在行',
  `follow_type` tinyint(4) DEFAULT '0' COMMENT '进入心愿排行榜时间 ',
  `follow_num` int(10) DEFAULT '0' COMMENT 'asin 跟卖数量',
  `follow_price` float DEFAULT '0' COMMENT 'asin 跟卖平均价格',
  `is_in_bs_time` tinyint(4) DEFAULT '0' COMMENT '进入热卖排行榜时间',
  `is_in_new_time` tinyint(4) DEFAULT '0' COMMENT '进入新品排行榜时间 ',
  `is_in_wished_time` tinyint(4) DEFAULT '0' COMMENT '进入心愿排行榜时间 ',
  `is_in_mover_time` tinyint(4) DEFAULT '0' COMMENT '进入潜力排行榜时间',
  `you_save` float DEFAULT '0' COMMENT '优惠力度',
  `shipby` varchar(50) DEFAULT '0' COMMENT '产品  物流',
  `shipway` tinyint(4) DEFAULT '0' COMMENT ' 0  FBA   1 FBM  2  AMZ  3  None',
  `quantity` int(10) DEFAULT '0' COMMENT '库存数',
  `instock` tinyint(4) DEFAULT '0' COMMENT 'asin 是否缺货 0 不缺货  1  缺货  2 即将缺货 ',
  `stock_status` tinyint(4) DEFAULT '0' COMMENT '是否缺货 0 不缺货  1  缺货  2 即将缺货 ',
  `is_out_stock_time` tinyint(4) DEFAULT '0' COMMENT 'asin 即将缺货提醒时间',
  `left_stock` int(11) DEFAULT '0' COMMENT '剩余库存',
  `on_my_way` tinyint(4) DEFAULT '0' COMMENT '是否即将缺货正在备货',
  `coming_stock_time` tinyint(4) DEFAULT '0' COMMENT '即将到货提醒时间',
  `prev_out_stock_time` int(11) DEFAULT '0' COMMENT '上次缺货时间',
  `no_coming_stock` tinyint(4) DEFAULT '0' COMMENT '是否在即将售罄时有备货',
  `title_hash` bigint(20) DEFAULT '0' COMMENT '商品标题hash',
  `isbs` tinyint(4) DEFAULT '0' COMMENT 'asin 是否amazon热卖推荐',
  `isac` tinyint(4) DEFAULT '0' COMMENT 'asin 是否amazon精选推荐',
  `isprime` tinyint(4) DEFAULT '0' COMMENT 'asin 是否amazon prime',
  `iscoupon` tinyint(4) DEFAULT '0' COMMENT 'asin 是否在优惠券促销',
  `isdeal` tinyint(4) DEFAULT '0' COMMENT ' 是否在秒杀 ',
  `insale` tinyint(4) DEFAULT '0' COMMENT '是否在售',
  `deal_type` tinyint(4) DEFAULT '0' COMMENT ' 0  无   1   秒杀类型 BD，best deal （周秒杀） 2 LD，lighting deal （限时秒杀） 3 Deal OF The Day',
  `holiday_type` tinyint(4) DEFAULT '0' COMMENT '节日类型   0  无  1 Amazon 会员日  2 黑五 ／网络一 【感恩节前后】  3  返校季  4  holiday deals ',
  `high_rating_rate` float DEFAULT '0' COMMENT '好评率',
  `low_rating_rate` float DEFAULT '0' COMMENT '差评率',
  `node_id` varchar(20) DEFAULT '0' COMMENT '商品URL中解析出来的热卖排行榜的ID',
  `is_detail_update_time` tinyint(4) DEFAULT '0' COMMENT '是否更新自详情  优先级 1 ',
  `is_category_update_time` tinyint(4) DEFAULT '0' COMMENT '是否更新自列表 优先级 2 ',
  `is_rank_update_time` tinyint(4) DEFAULT '0' COMMENT '是否更新自排行榜 优先级 3 ',
  `is_valid` tinyint(4) DEFAULT '0' COMMENT '是否在电商平台无效',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '是否数据无效',
  `change_num` int(11) DEFAULT '0' COMMENT '最新更新事件变化数量',
  `updatetime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新入库日期',
  `update_ymd_view` timestamp NULL DEFAULT NULL COMMENT '更新入库日期',
  `update_ymd` int(11) DEFAULT '0' COMMENT '任务日期',
  `asin_index` bigint(20) DEFAULT '0' COMMENT 'asin 的int 索引',
  `operate_status` tinyint(4) DEFAULT '0' COMMENT '运营状态',
  `month` int(11) DEFAULT '0' COMMENT '更新月份',
  `category_score` float DEFAULT '0' COMMENT '市场权重',
  `seo_score` float DEFAULT '0' COMMENT '自然权重',
  `operate_score` float DEFAULT '0' COMMENT '运营权重',
  `ad_score` float DEFAULT '0' COMMENT '广告权重',
  `asin_weight_score` float DEFAULT '0' COMMENT 'ASIN权重',
  `is_down_time` tinyint(4) DEFAULT '0' COMMENT '今天被标记为下架',
  `restore` tinyint(4) DEFAULT '0' COMMENT '是否恢复上架',
  `review_empty_timestamp` int(11) DEFAULT '0' COMMENT '被清空评论时间',
  `review_empty_score` float DEFAULT '0' COMMENT '删除评论前平均分数',
  `review_empty_reviews` float DEFAULT '0' COMMENT '删除评论前评论数',
  `review_empty_starnum` float DEFAULT '0' COMMENT '删除评论前评分总数',
  `is_operate` tinyint(4) DEFAULT '0',
  `ads_out_time` int(11) DEFAULT '0' COMMENT '上次广告撤出时间',
  `ads_status` tinyint(4) DEFAULT '0' COMMENT '广告状态 1 正在广告  2 撤出广告  3 恢复广告 ',
  `ads_num` int(11) DEFAULT '0' COMMENT '广告次数',
  `ad_days` int(11) DEFAULT '0' COMMENT '广告天数',
  `avg_ad_days` float DEFAULT '0' COMMENT '平均广告天数',
  `update_days` int(11) DEFAULT '0' COMMENT '广告持续天数',
  `ad_zhouqi` float DEFAULT '0' COMMENT '平均广告天数',
  `rank_inc_days` int(11) DEFAULT '0' COMMENT '排名持续增长',
  `ad_type` tinyint(4) DEFAULT '0' COMMENT '广告状态 1 正在广告  2 撤出广告  3 恢复广告 ',
  `ad_update_days` int(11) DEFAULT '0' COMMENT '广告总天数',
  `starnum_change_rate` float DEFAULT '0' COMMENT '评分数增长率',
  `avg_starnum_change` int(10) DEFAULT '0' COMMENT '平均增长数',
  `recently_ad_time` int(11) DEFAULT '0' COMMENT '最近一次的广告时间',
  `is_title_change` tinyint(4) DEFAULT '0' COMMENT '是否改过标题',
  `is_img_change` tinyint(4) DEFAULT '0' COMMENT '是否改过主图',
  `follow_diff_price_rate` float DEFAULT '0' COMMENT '被跟卖差价率：（被跟Listing定价-跟卖最低价）/被跟Listing定价',
  `is_best_follow_asin` tinyint(4) DEFAULT '0' COMMENT '跟卖王者-当日评分数增长环比前10与评分数增长前10的Asin，取两个并集',
  `starnum_chain_change_rate` float DEFAULT '0' COMMENT ' 增长同比 ',
  `ad_large` tinyint(4) DEFAULT '0' COMMENT '广告大量',
  `union_index` bigint(20) DEFAULT '0' COMMENT 'asin 和  category 组合在一起的 的int 索引',
  PRIMARY KEY (`id`),
  KEY `category` (`category`,`update_ymd`,`asin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='商品基础小字段表';
