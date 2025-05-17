CREATE DATABASE IF NOT EXISTS project_db CHARACTER SET utf8;
USE `project_db`;
DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID',
  `title` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '内容',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '链接',
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '轮播图',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='轮播图';
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID',
  `user_group` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户组',
  `mod_name` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '模块名',
  `table_name` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '表名',
  `page_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '页面标题',
  `path` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '路由路径',
  `parent` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '父级菜单',
  `parent_sort` int(10) NOT NULL DEFAULT '0' COMMENT '父级菜单排序',
  `position` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '位置',
  `mode` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '_blank' COMMENT '跳转方式',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看',
  `field_add` text CHARACTER SET utf8 COMMENT '添加字段',
  `field_set` text CHARACTER SET utf8 COMMENT '修改字段',
  `field_get` text CHARACTER SET utf8 COMMENT '查询字段',
  `table_nav_name` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '跨表导航名称',
  `table_nav` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '跨表导航',
  `option` text CHARACTER SET utf8 COMMENT '配置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户权限管理';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文件上传';
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序',
  `name` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户组';
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题',
  `type` varchar(64) NOT NULL DEFAULT '0' COMMENT '文章分类',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `praise_len` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `source` varchar(255) DEFAULT NULL COMMENT '来源',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签',
  `content` longtext COMMENT '正文',
  `img` varchar(255) DEFAULT NULL COMMENT '封面图',
  `description` text COMMENT '文章描述',
  PRIMARY KEY (`article_id`,`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '临时访问牌',
  `info` text CHARACTER SET utf8 COMMENT '信息',
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','1');
DROP TABLE IF EXISTS `code_token`;
CREATE TABLE `code_token` (
  `code_token_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '验证码ID',
  `token` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '令牌',
  `code` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '验证码',
  `expire_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '失效时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`code_token_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='验证码';
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '标题',
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '封面',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='收藏';
DROP TABLE IF EXISTS `forum_type`;
CREATE TABLE `forum_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `icon` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '分类图标',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='论坛分类';
insert into `forum_type` values ('1','分类一','分类一','/article/list?type_id=1','0',null,'2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
insert into `forum_type` values ('2','分类二','分类二','/article/list?type_id=2','0',null,'2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
insert into `forum_type` values ('3','分类三','分类三','/article/list?type_id=3','0',null,'2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(125) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COMMENT '正文',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='公告';
insert into `notice` values ('1','网站公告','<p>公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。</p>','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
insert into `notice` values ('2','关于我们','<p>       一个网站要取得成功，要有先进的理念、先进的思想，更为重要的是抢占先机，及时行动。网络世界可谓一日千里、 日新月异，一个网站只有把握先机，抓住机遇，才</p><p>可能有更多的机会获得成功，可能处于网络行业发展的致高点，可能创建出成功的网站，才能能获得成功。要知道一种网站新模式在网络上只有保持几天的优势,因为人们很容易“COPY" 和模仿，因此，唯有不</p><p>断创新，不失时机地推出新的服务、新的模式、新的思想，网站才可能长久立于不败之地。</p>','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
insert into `notice` values ('3','联系方式','<h3>网站内容及品牌合作</h3><p>Email：xxxx@qq.com</p><h3>商务合作</h3><p>电话：010-xxxxxxx</p><p>Email：xxxx@qq.com</p><h3><br></h3><h3><br></h3><p><br></p>','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
insert into `notice` values ('4','网站介绍','<p>此处可上传文字、图片、视频、超链接、表格等内容区</p>','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0');
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `icon` text COMMENT '分类图标',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章分类';
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='点赞';
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `forum_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '论坛ID',
  `display` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `nickname` varchar(16) CHARACTER SET utf8 DEFAULT '' COMMENT '昵称',
  `praise_len` int(10) DEFAULT '0' COMMENT '点赞数',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问数',
  `title` varchar(125) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` varchar(125) CHARACTER SET utf8 DEFAULT NULL COMMENT '关键词',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源地址',
  `tag` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '标签',
  `img` text CHARACTER SET utf8 COMMENT '封面图',
  `content` longtext CHARACTER SET utf8 COMMENT '正文',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `avatar` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '发帖人头像',
  `type` varchar(64) NOT NULL DEFAULT '0' COMMENT '论坛分类',
  `istop` int(10) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  PRIMARY KEY (`forum_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='论坛';
insert into `forum` values ('1','100','1','小明','1','150','测试标题','关键字1','描述','#','标签','/upload/forum_1.jpg','<h1>fafgwagbagbwgwag</h1>','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','http://localhost:5000/upload/jingdian (11)_15.jpg','分类二','0');
insert into `forum` values ('2','100','2','小明','0','30','测试标题2','关键字2','dec','#','标签','/upload/forum_2.jpg','<p>测试文章内容2</p>','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','','分类一','0');
insert into `forum` values ('3','100','2','小红','0','42','测试标题3','关键字3','dec2','#','标签','/upload/forum_3.jpg','<p>测试文章内容3</p>','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','','分类二','0');
insert into `forum` values ('4','100','2','小红','0','22','测试标题4','关键字4','dec3','#','标签','/upload/forum_4.jpg','<p>测试文章内容4</p>','2025-04-30 18:21:49.0','2025-04-30 18:21:49.0','','分类三','0');
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户点击';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID',
  `content` longtext CHARACTER SET utf8 COMMENT '内容',
  `nickname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像地址',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='评论';
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：(1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '所在用户组',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间',
  `phone` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号码',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：(0未认证|1审核中|2已认证)',
  `username` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(16) CHARACTER SET utf8 DEFAULT '' COMMENT '昵称',
  `password` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(64) CHARACTER SET utf8 DEFAULT '' COMMENT '邮箱',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：(0未认证|1审核中|2已认证)',
  `avatar` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像地址',
  `open_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '针对获取用户信息字段',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `vip_level` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '会员等级',
  `vip_discount` double(10,2) DEFAULT '0.00' COMMENT '会员折扣',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  `balance` double(10,2) DEFAULT '0.00' COMMENT '余额',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户账户';
insert into `user` values ('1','1','管理员','2025-04-06 17:25:22.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg',null,'2025-04-30 17:35:13.0',null,'0.0','0','0.0');
ALTER TABLE `user` DROP COLUMN balance;
ALTER TABLE `user` DROP COLUMN integral;
ALTER TABLE `user` DROP COLUMN vip_level;
ALTER TABLE `user` DROP COLUMN vip_discount;
UPDATE `user` SET password = 'asd123';
UPDATE user SET avatar = '/api/upload/admin_avatar.jpg';
DROP TABLE IF EXISTS `registered_user`;
CREATE TABLE `registered_user`(registered_user_id int(11) NOT NULL AUTO_INCREMENT COMMENT '注册用户ID',
`user_name` varchar(64) comment '用户姓名',
`user_gender` varchar(64) comment '用户性别',
`user_age` varchar(64) comment '用户年龄',
`contact_information` varchar(16) comment '联系方式',
`educational_background` varchar(64) comment '教育背景',
`work_experience` varchar(64) comment '工作经历',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (registered_user_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '注册用户';
insert into `registered_user` values (1,'用户姓名1','用户性别1','用户年龄1','17264657980','教育背景1','工作经历1','已通过',2,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into user(user_group,username,nickname,password,avatar) values ('注册用户','yonghu1','yonghu1','asd123','/api/upload/default_avatar.jpg');
insert into `registered_user` values (2,'用户姓名2','用户性别2','用户年龄2','17330913541','教育背景2','工作经历2','已通过',3,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into user(user_group,username,nickname,password,avatar) values ('注册用户','yonghu2','yonghu2','asd123','/api/upload/default_avatar.jpg');
insert into `registered_user` values (3,'用户姓名3','用户性别3','用户年龄3','17108607268','教育背景3','工作经历3','已通过',4,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into user(user_group,username,nickname,password,avatar) values ('注册用户','yonghu3','yonghu3','asd123','/api/upload/default_avatar.jpg');

DROP TABLE IF EXISTS `enterprise_users`;
CREATE TABLE `enterprise_users`(enterprise_users_id int(11) NOT NULL AUTO_INCREMENT COMMENT '企业用户ID',
`enterprise_name` varchar(64) comment '企业名称',
`registered_capital` varchar(64) comment '注册资本',
`enterprise_location` varchar(64) comment '企业位置',
`business_license` varchar(255) comment '营业执照',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(255) DEFAULT '' comment '审核回复',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (enterprise_users_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '企业用户';
insert into `enterprise_users` values (1,'企业名称1','注册资本1','企业位置1','','已通过','',5,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into user(user_group,username,nickname,password,avatar) values ('企业用户','yonghu4','yonghu4','asd123','/api/upload/default_avatar.jpg');
insert into `enterprise_users` values (2,'企业名称2','注册资本2','企业位置2','','已通过','',6,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into user(user_group,username,nickname,password,avatar) values ('企业用户','yonghu5','yonghu5','asd123','/api/upload/default_avatar.jpg');
insert into `enterprise_users` values (3,'企业名称3','注册资本3','企业位置3','','已通过','',7,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into user(user_group,username,nickname,password,avatar) values ('企业用户','yonghu6','yonghu6','asd123','/api/upload/default_avatar.jpg');

DROP TABLE IF EXISTS `recruitment_information`;
CREATE TABLE `recruitment_information`(recruitment_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '招聘信息ID',
`recruitment_title` varchar(64) comment '招聘标题',
`enterprise_name` varchar(64) comment '企业名称',
`enterprise_users` int(11) DEFAULT 0 comment '企业用户',
`registered_capital` varchar(64) comment '注册资本',
`job_type` varchar(64) comment '岗位类型',
`cover_photo` varchar(255) comment '封面图片',
`salary_amount` varchar(64) comment '薪资金额',
`professional_requirements` varchar(64) comment '需求专业',
`work_location` varchar(64) comment '工作地点',
`recruitment_positions` varchar(64) comment '招聘职位',
`recruitment_details` longtext comment '招聘详情',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`collect_len` int(11) DEFAULT 0 NOT NULL comment '收藏数',
`comment_len` int(11) DEFAULT 0 NOT NULL comment '评论数',
`resume_information_limit_times` int(8) DEFAULT 0 NOT NULL comment '投放简历限制次数',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (recruitment_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '招聘信息';
insert into `recruitment_information` values (1,'招聘标题1','企业名称1',0,'注册资本1','岗位类型1','/api/upload/1813115814472056832.jpg','薪资金额1','需求专业1','工作地点1','招聘职位1','此处可上传文字、图片、视频、超链接等内容区1',380,448,0,0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `recruitment_information` values (2,'招聘标题2','企业名称2',0,'注册资本2','岗位类型2','/api/upload/1813115149377077248.jpg','薪资金额2','需求专业2','工作地点2','招聘职位2','此处可上传文字、图片、视频、超链接等内容区2',262,511,0,0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `recruitment_information` values (3,'招聘标题3','企业名称3',0,'注册资本3','岗位类型3','/api/upload/1813115211251449857.jpg','薪资金额3','需求专业3','工作地点3','招聘职位3','此处可上传文字、图片、视频、超链接等内容区3',307,22,0,0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `recruitment_information` values (4,'招聘标题4','企业名称4',0,'注册资本4','岗位类型4','/api/upload/1813115573295382528.jpg','薪资金额4','需求专业4','工作地点4','招聘职位4','此处可上传文字、图片、视频、超链接等内容区4',973,943,0,0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `recruitment_information` values (5,'招聘标题5','企业名称5',0,'注册资本5','岗位类型5','/api/upload/1813115633001299968.jpg','薪资金额5','需求专业5','工作地点5','招聘职位5','此处可上传文字、图片、视频、超链接等内容区5',978,192,0,0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `recruitment_information` values (6,'招聘标题6','企业名称6',0,'注册资本6','岗位类型6','/api/upload/1813115687049101313.jpg','薪资金额6','需求专业6','工作地点6','招聘职位6','此处可上传文字、图片、视频、超链接等内容区6',263,497,0,0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `recruitment_information` values (7,'招聘标题7','企业名称7',0,'注册资本7','岗位类型7','/api/upload/1813115516034744321.jpg','薪资金额7','需求专业7','工作地点7','招聘职位7','此处可上传文字、图片、视频、超链接等内容区7',844,301,0,0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `recruitment_information` values (8,'招聘标题8','企业名称8',0,'注册资本8','岗位类型8','/api/upload/1813115329321107456.jpg','薪资金额8','需求专业8','工作地点8','招聘职位8','此处可上传文字、图片、视频、超链接等内容区8',938,575,0,0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `recruitment_information` values (9,'招聘标题9','企业名称9',0,'注册资本9','岗位类型9','/api/upload/1813115436393299968.jpg','薪资金额9','需求专业9','工作地点9','招聘职位9','此处可上传文字、图片、视频、超链接等内容区9',44,746,0,0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `recruitment_information` values (10,'招聘标题10','企业名称10',0,'注册资本10','岗位类型10','/api/upload/1813115386426556417.jpg','薪资金额10','需求专业10','工作地点10','招聘职位10','此处可上传文字、图片、视频、超链接等内容区10',306,629,0,0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `recruitment_information` values (11,'招聘标题11','企业名称11',0,'注册资本11','岗位类型11','/api/upload/1813115261977362432.jpg','薪资金额11','需求专业11','工作地点11','招聘职位11','此处可上传文字、图片、视频、超链接等内容区11',722,265,0,0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `recruitment_information` values (12,'招聘标题12','企业名称12',0,'注册资本12','岗位类型12','/api/upload/1813115074374533120.jpg','薪资金额12','需求专业12','工作地点12','招聘职位12','此处可上传文字、图片、视频、超链接等内容区12',994,821,0,0,'2025-04-24 22:49:47','2025-04-24 22:49:47');

DROP TABLE IF EXISTS `job_type`;
CREATE TABLE `job_type`(job_type_id int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位类型ID',
`job_type` varchar(64) comment '岗位类型',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (job_type_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '岗位类型';
insert into `job_type` values (1,'岗位类型1','2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `job_type` values (2,'岗位类型2','2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `job_type` values (3,'岗位类型3','2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `job_type` values (4,'岗位类型4','2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `job_type` values (5,'岗位类型5','2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `job_type` values (6,'岗位类型6','2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `job_type` values (7,'岗位类型7','2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `job_type` values (8,'岗位类型8','2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `job_type` values (9,'岗位类型9','2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `job_type` values (10,'岗位类型10','2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `job_type` values (11,'岗位类型11','2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `job_type` values (12,'岗位类型12','2025-04-24 22:49:47','2025-04-24 22:49:47');

DROP TABLE IF EXISTS `resume_information`;
CREATE TABLE `resume_information`(resume_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '简历信息ID',
`recruitment_title` varchar(64) comment '招聘标题',
`enterprise_name` varchar(64) comment '企业名称',
`enterprise_users` int(11) DEFAULT 0 comment '企业用户',
`job_type` varchar(64) comment '岗位类型',
`target_users` int(11) DEFAULT 0 comment '投放用户',
`user_name` varchar(64) comment '用户姓名',
`user_gender` varchar(64) comment '用户性别',
`user_age` varchar(64) comment '用户年龄',
`contact_information` varchar(16) comment '联系方式',
`educational_background` varchar(64) comment '教育背景',
`work_experience` varchar(64) comment '工作经历',
`placement_time` datetime comment '投放时间',
`resume_attachment` varchar(255) comment '简历附件',
`reason_for_advertising_placement` varchar(64) comment '投放原因',
`resume_rating` varchar(64) comment '简历评分',
`resume_marking` varchar(64) comment '简历标记',
`posting_remarks` text comment '投放备注',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(255) DEFAULT '' comment '审核回复',
`interview_notice_limit_times` int(8) DEFAULT 0 NOT NULL comment '邀请面试限制次数',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (resume_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '简历信息';
insert into `resume_information` values (1,'招聘标题1','企业名称1',0,'岗位类型1',0,'用户姓名1','用户性别1','用户年龄1','17626890937','教育背景1','工作经历1','2025-04-24 22:49:47','','投放原因1','简历评分1','简历标记1','投放备注1','已通过','',0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `resume_information` values (2,'招聘标题2','企业名称2',0,'岗位类型2',0,'用户姓名2','用户性别2','用户年龄2','15754918336','教育背景2','工作经历2','2025-04-24 22:49:47','','投放原因2','简历评分2','简历标记2','投放备注2','已通过','',0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `resume_information` values (3,'招聘标题3','企业名称3',0,'岗位类型3',0,'用户姓名3','用户性别3','用户年龄3','13577144900','教育背景3','工作经历3','2025-04-24 22:49:47','','投放原因3','简历评分3','简历标记3','投放备注3','已通过','',0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `resume_information` values (4,'招聘标题4','企业名称4',0,'岗位类型4',0,'用户姓名4','用户性别4','用户年龄4','14545676722','教育背景4','工作经历4','2025-04-24 22:49:47','','投放原因4','简历评分4','简历标记4','投放备注4','已通过','',0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `resume_information` values (5,'招聘标题5','企业名称5',0,'岗位类型5',0,'用户姓名5','用户性别5','用户年龄5','17566673254','教育背景5','工作经历5','2025-04-24 22:49:47','','投放原因5','简历评分5','简历标记5','投放备注5','已通过','',0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `resume_information` values (6,'招聘标题6','企业名称6',0,'岗位类型6',0,'用户姓名6','用户性别6','用户年龄6','15247340202','教育背景6','工作经历6','2025-04-24 22:49:47','','投放原因6','简历评分6','简历标记6','投放备注6','已通过','',0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `resume_information` values (7,'招聘标题7','企业名称7',0,'岗位类型7',0,'用户姓名7','用户性别7','用户年龄7','15389359544','教育背景7','工作经历7','2025-04-24 22:49:47','','投放原因7','简历评分7','简历标记7','投放备注7','已通过','',0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `resume_information` values (8,'招聘标题8','企业名称8',0,'岗位类型8',0,'用户姓名8','用户性别8','用户年龄8','17592864256','教育背景8','工作经历8','2025-04-24 22:49:47','','投放原因8','简历评分8','简历标记8','投放备注8','已通过','',0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `resume_information` values (9,'招聘标题9','企业名称9',0,'岗位类型9',0,'用户姓名9','用户性别9','用户年龄9','13386263105','教育背景9','工作经历9','2025-04-24 22:49:47','','投放原因9','简历评分9','简历标记9','投放备注9','已通过','',0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `resume_information` values (10,'招聘标题10','企业名称10',0,'岗位类型10',0,'用户姓名10','用户性别10','用户年龄10','14591541876','教育背景10','工作经历10','2025-04-24 22:49:47','','投放原因10','简历评分10','简历标记10','投放备注10','已通过','',0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `resume_information` values (11,'招聘标题11','企业名称11',0,'岗位类型11',0,'用户姓名11','用户性别11','用户年龄11','13506729427','教育背景11','工作经历11','2025-04-24 22:49:47','','投放原因11','简历评分11','简历标记11','投放备注11','已通过','',0,'2025-04-24 22:49:47','2025-04-24 22:49:47');
insert into `resume_information` values (12,'招聘标题12','企业名称12',0,'岗位类型12',0,'用户姓名12','用户性别12','用户年龄12','17039718843','教育背景12','工作经历12','2025-04-24 22:49:47','','投放原因12','简历评分12','简历标记12','投放备注12','已通过','',0,'2025-04-24 22:49:47','2025-04-24 22:49:47');

DROP TABLE IF EXISTS `interview_notice`;
CREATE TABLE `interview_notice`(interview_notice_id int(11) NOT NULL AUTO_INCREMENT COMMENT '面试通知ID',
`recruitment_title` varchar(64) comment '招聘标题',
`enterprise_name` varchar(64) comment '企业名称',
`enterprise_users` int(11) DEFAULT 0 comment '企业用户',
`job_type` varchar(64) comment '岗位类型',
`target_users` int(11) DEFAULT 0 comment '投放用户',
`user_name` varchar(64) comment '用户姓名',
`invitation_time` datetime comment '邀请时间',
`interview_notice` varchar(64) comment '面试须知',
`interview_location` varchar(64) comment '面试地点',
`interview_status` varchar(64) comment '面试状态',
`interview_score` double(8,2) DEFAULT 0 comment '面试分数',
`interview_comments` text comment '面试评语',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (interview_notice_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 comment '面试通知';
insert into `interview_notice` values (1,'招聘标题1','企业名称1',0,'岗位类型1',0,'用户姓名1','2025-04-24 22:49:48','面试须知1','面试地点1','面试状态1',1,'面试评语1','2025-04-24 22:49:48','2025-04-24 22:49:48');
insert into `interview_notice` values (2,'招聘标题2','企业名称2',0,'岗位类型2',0,'用户姓名2','2025-04-24 22:49:48','面试须知2','面试地点2','面试状态2',2,'面试评语2','2025-04-24 22:49:48','2025-04-24 22:49:48');
insert into `interview_notice` values (3,'招聘标题3','企业名称3',0,'岗位类型3',0,'用户姓名3','2025-04-24 22:49:48','面试须知3','面试地点3','面试状态3',3,'面试评语3','2025-04-24 22:49:48','2025-04-24 22:49:48');
insert into `interview_notice` values (4,'招聘标题4','企业名称4',0,'岗位类型4',0,'用户姓名4','2025-04-24 22:49:48','面试须知4','面试地点4','面试状态4',4,'面试评语4','2025-04-24 22:49:48','2025-04-24 22:49:48');
insert into `interview_notice` values (5,'招聘标题5','企业名称5',0,'岗位类型5',0,'用户姓名5','2025-04-24 22:49:48','面试须知5','面试地点5','面试状态5',5,'面试评语5','2025-04-24 22:49:48','2025-04-24 22:49:48');
insert into `interview_notice` values (6,'招聘标题6','企业名称6',0,'岗位类型6',0,'用户姓名6','2025-04-24 22:49:48','面试须知6','面试地点6','面试状态6',6,'面试评语6','2025-04-24 22:49:48','2025-04-24 22:49:48');
insert into `interview_notice` values (7,'招聘标题7','企业名称7',0,'岗位类型7',0,'用户姓名7','2025-04-24 22:49:48','面试须知7','面试地点7','面试状态7',7,'面试评语7','2025-04-24 22:49:48','2025-04-24 22:49:48');
insert into `interview_notice` values (8,'招聘标题8','企业名称8',0,'岗位类型8',0,'用户姓名8','2025-04-24 22:49:48','面试须知8','面试地点8','面试状态8',8,'面试评语8','2025-04-24 22:49:48','2025-04-24 22:49:48');
insert into `interview_notice` values (9,'招聘标题9','企业名称9',0,'岗位类型9',0,'用户姓名9','2025-04-24 22:49:48','面试须知9','面试地点9','面试状态9',9,'面试评语9','2025-04-24 22:49:48','2025-04-24 22:49:48');
insert into `interview_notice` values (10,'招聘标题10','企业名称10',0,'岗位类型10',0,'用户姓名10','2025-04-24 22:49:48','面试须知10','面试地点10','面试状态10',10,'面试评语10','2025-04-24 22:49:48','2025-04-24 22:49:48');
insert into `interview_notice` values (11,'招聘标题11','企业名称11',0,'岗位类型11',0,'用户姓名11','2025-04-24 22:49:48','面试须知11','面试地点11','面试状态11',11,'面试评语11','2025-04-24 22:49:48','2025-04-24 22:49:48');
insert into `interview_notice` values (12,'招聘标题12','企业名称12',0,'岗位类型12',0,'用户姓名12','2025-04-24 22:49:48','面试须知12','面试地点12','面试状态12',12,'面试评语12','2025-04-24 22:49:48','2025-04-24 22:49:48');

ALTER TABLE `interview_notice` ADD COLUMN source_table varchar(255) comment '来源表', ADD COLUMN source_id int(10) DEFAULT 0 comment '来源ID', ADD COLUMN source_user_id int(10) DEFAULT 0 comment '来源用户';
ALTER TABLE `resume_information` ADD COLUMN source_table varchar(255) comment '来源表', ADD COLUMN source_id int(10) DEFAULT 0 comment '来源ID', ADD COLUMN source_user_id int(10) DEFAULT 0 comment '来源用户';
insert into `auth` values ('1','管理员','注册用户','registered_user','注册用户','/registered_user/table','','0','','_blank','1','1','1','1','user_name,user_gender,user_age,contact_information,educational_background,work_experience','user_name,user_gender,user_age,contact_information,educational_background,work_experience','user_name,user_gender,user_age,contact_information,educational_background,work_experience',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('2','管理员','注册用户','registered_user','用户详情','/registered_user/view','','0','','_blank','1','1','1','1','user_name,user_gender,user_age,contact_information,educational_background,work_experience','user_name,user_gender,user_age,contact_information,educational_background,work_experience','user_name,user_gender,user_age,contact_information,educational_background,work_experience',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('3','管理员','企业用户','enterprise_users','企业用户','/enterprise_users/table','','0','','_blank','1','1','1','1','enterprise_name,registered_capital,enterprise_location,business_license','enterprise_name,registered_capital,enterprise_location,business_license','enterprise_name,registered_capital,enterprise_location,business_license',null,'0','{"examine":true}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('4','管理员','企业用户','enterprise_users','用户详情','/enterprise_users/view','','0','','_blank','1','1','1','1','enterprise_name,registered_capital,enterprise_location,business_license','enterprise_name,registered_capital,enterprise_location,business_license','enterprise_name,registered_capital,enterprise_location,business_license',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('5','管理员','招聘信息','recruitment_information','招聘信息','/recruitment_information/table','','0','','_blank','1','1','1','1','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details',null,'0','{"can_show_comment":true}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('6','管理员','招聘信息','recruitment_information','信息详情','/recruitment_information/view','','0','','_blank','1','1','1','1','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('7','管理员','招聘信息','recruitment_information','招聘信息','/recruitment_information/list','','0','top','_blank','1','1','1','1','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('8','管理员','招聘信息','recruitment_information','信息详情','/recruitment_information/details','','0','','_blank','1','1','1','1','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details',null,'0','{"can_comment":true,"can_show_comment":true}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('9','管理员','岗位类型','job_type','岗位类型','/job_type/table','','0','','_blank','1','1','1','1','job_type','job_type','job_type',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('10','管理员','岗位类型','job_type','类型详情','/job_type/view','','0','','_blank','1','1','1','1','job_type','job_type','job_type',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('11','管理员','简历信息','resume_information','简历信息','/resume_information/table','','0','','_blank','1','1','1','1','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks',null,'0','{"export_db":true,"examine":true,"import_db":true}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('12','管理员','简历信息','resume_information','信息详情','/resume_information/view','','0','','_blank','1','1','1','1','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('13','管理员','简历信息','resume_information','简历信息','/resume_information/edit','','0','','_blank','1','1','1','1','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('14','管理员','面试通知','interview_notice','面试通知','/interview_notice/table','','0','','_blank','1','1','1','1','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('15','管理员','面试通知','interview_notice','通知详情','/interview_notice/view','','0','','_blank','1','1','1','1','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('16','管理员','我的收藏','collect','我的收藏','/collect/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('17','管理员','评论','comment','评论列表','/comment/table','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('18','管理员','评论','comment','评论详情','/comment/view','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('19','管理员','评论','comment','我的评论','/comment/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('20','管理员','评论','comment','评论详情','/comment/details','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('21','管理员','社交论坛','forum','社交论坛','/forum/table','','0','','_blank','1','1','1','1','','','',null,'0','{"print":true,"export_db":true,"import_db":true}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('22','管理员','社交论坛','forum','论坛详情','/forum/view','','0','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('23','管理员','社交论坛','forum','社交论坛','/forum/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('24','管理员','社交论坛','forum','论坛详情','/forum/details','','0','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('25','管理员','论坛分类','forum_type','论坛分类','/forum_type/table','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('26','管理员','论坛分类','forum_type','分类详情','/forum_type/view','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('27','管理员','新闻资讯','article','新闻资讯','/article/table','','0','','_blank','1','1','1','1','','','',null,'0','{"print":true,"export_db":true,"import_db":true}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('28','管理员','新闻资讯','article','资讯详情','/article/view','','0','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('29','管理员','新闻资讯','article','新闻资讯','/article/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('30','管理员','新闻资讯','article','资讯详情','/article/details','','0','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('31','管理员','资讯分类','article_type','资讯分类','/article_type/table','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('32','管理员','资讯分类','article_type','分类详情','/article_type/view','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('33','管理员','公告通知','notice','公告通知','/notice/table','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('34','管理员','公告通知','notice','通知详情','/notice/view','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('35','管理员','公告通知','notice','公告通知','/notice/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('36','管理员','公告通知','notice','通知详情','/notice/details','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('37','游客','注册用户','registered_user','注册用户','/registered_user/table','','0','','_blank','1','0','0','0','user_name,user_gender,user_age,contact_information,educational_background,work_experience','user_name,user_gender,user_age,contact_information,educational_background,work_experience','user_name,user_gender,user_age,contact_information,educational_background,work_experience',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('38','游客','注册用户','registered_user','用户详情','/registered_user/view','','0','','_blank','1','0','0','0','user_name,user_gender,user_age,contact_information,educational_background,work_experience','user_name,user_gender,user_age,contact_information,educational_background,work_experience','user_name,user_gender,user_age,contact_information,educational_background,work_experience',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('39','游客','企业用户','enterprise_users','企业用户','/enterprise_users/table','','0','','_blank','1','0','0','0','enterprise_name,registered_capital,enterprise_location,business_license','enterprise_name,registered_capital,enterprise_location,business_license','enterprise_name,registered_capital,enterprise_location,business_license',null,'0','{"examine":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('40','游客','企业用户','enterprise_users','用户详情','/enterprise_users/view','','0','','_blank','1','0','0','0','enterprise_name,registered_capital,enterprise_location,business_license','enterprise_name,registered_capital,enterprise_location,business_license','enterprise_name,registered_capital,enterprise_location,business_license',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('41','游客','招聘信息','recruitment_information','招聘信息','/recruitment_information/table','','0','','_blank','0','0','0','0','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details',null,'0','{"can_show_comment":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('42','游客','招聘信息','recruitment_information','信息详情','/recruitment_information/view','','0','','_blank','0','0','0','0','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('43','游客','招聘信息','recruitment_information','招聘信息','/recruitment_information/list','','0','top','_blank','0','0','0','1','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('44','游客','招聘信息','recruitment_information','信息详情','/recruitment_information/details','','0','','_blank','0','0','0','1','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details',null,'0','{"can_comment":false,"can_show_comment":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('45','游客','岗位类型','job_type','岗位类型','/job_type/table','','0','','_blank','0','0','0','0','job_type','job_type','job_type',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('46','游客','岗位类型','job_type','类型详情','/job_type/view','','0','','_blank','0','0','0','0','job_type','job_type','job_type',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('47','游客','简历信息','resume_information','简历信息','/resume_information/table','','0','','_blank','0','0','0','0','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks',null,'0','{"export_db":false,"examine":false,"import_db":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('48','游客','简历信息','resume_information','信息详情','/resume_information/view','','0','','_blank','0','0','0','0','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('49','游客','简历信息','resume_information','简历信息','/resume_information/edit','','0','','_blank','0','0','0','0','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('50','游客','面试通知','interview_notice','面试通知','/interview_notice/table','','0','','_blank','0','0','0','0','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('51','游客','面试通知','interview_notice','通知详情','/interview_notice/view','','0','','_blank','0','0','0','0','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('52','游客','我的收藏','collect','我的收藏','/collect/list','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('53','游客','评论','comment','评论列表','/comment/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('54','游客','评论','comment','评论详情','/comment/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('55','游客','评论','comment','我的评论','/comment/list','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('56','游客','评论','comment','评论详情','/comment/details','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('57','游客','社交论坛','forum','社交论坛','/forum/table','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('58','游客','社交论坛','forum','论坛详情','/forum/view','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('59','游客','社交论坛','forum','社交论坛','/forum/list','','0','','_blank','0','0','0','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('60','游客','社交论坛','forum','论坛详情','/forum/details','','0','','_blank','0','0','0','1','','','',null,'0','{"can_comment":false,"can_show_comment":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('61','游客','论坛分类','forum_type','论坛分类','/forum_type/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('62','游客','论坛分类','forum_type','分类详情','/forum_type/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('63','游客','新闻资讯','article','新闻资讯','/article/table','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('64','游客','新闻资讯','article','资讯详情','/article/view','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('65','游客','新闻资讯','article','新闻资讯','/article/list','','0','','_blank','0','0','0','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('66','游客','新闻资讯','article','资讯详情','/article/details','','0','','_blank','0','0','0','1','','','',null,'0','{"can_comment":false,"can_show_comment":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('67','游客','资讯分类','article_type','资讯分类','/article_type/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('68','游客','资讯分类','article_type','分类详情','/article_type/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('69','游客','公告通知','notice','公告通知','/notice/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('70','游客','公告通知','notice','通知详情','/notice/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('71','游客','公告通知','notice','公告通知','/notice/list','','0','','_blank','0','0','0','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('72','游客','公告通知','notice','通知详情','/notice/details','','0','','_blank','0','0','0','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('73','注册用户','注册用户','registered_user','注册用户','/registered_user/table','','0','','_blank','0','0','0','0','user_name,user_gender,user_age,contact_information,educational_background,work_experience','user_name,user_gender,user_age,contact_information,educational_background,work_experience','user_name,user_gender,user_age,contact_information,educational_background,work_experience',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('74','注册用户','注册用户','registered_user','用户详情','/registered_user/view','','0','','_blank','0','0','1','1','user_name,user_gender,user_age,contact_information,educational_background,work_experience','user_name,user_gender,user_age,contact_information,educational_background,work_experience','user_name,user_gender,user_age,contact_information,educational_background,work_experience',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('75','注册用户','企业用户','enterprise_users','企业用户','/enterprise_users/table','','0','','_blank','0','0','0','0','enterprise_name,registered_capital,enterprise_location,business_license','enterprise_name,registered_capital,enterprise_location,business_license','enterprise_name,registered_capital,enterprise_location,business_license',null,'0','{"examine":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('76','注册用户','企业用户','enterprise_users','用户详情','/enterprise_users/view','','0','','_blank','0','0','0','0','enterprise_name,registered_capital,enterprise_location,business_license','enterprise_name,registered_capital,enterprise_location,business_license','enterprise_name,registered_capital,enterprise_location,business_license',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('77','注册用户','招聘信息','recruitment_information','招聘信息','/recruitment_information/table','','0','','_blank','0','0','0','0','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details',null,'0','{"can_show_comment":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('78','注册用户','招聘信息','recruitment_information','信息详情','/recruitment_information/view','','0','','_blank','0','0','0','0','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('79','注册用户','招聘信息','recruitment_information','招聘信息','/recruitment_information/list','','0','top','_blank','1','1','1','1','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('80','注册用户','招聘信息','recruitment_information','信息详情','/recruitment_information/details','','0','','_blank','1','1','1','1','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details',null,'0','{"can_comment":true,"can_show_comment":true}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('81','注册用户','岗位类型','job_type','岗位类型','/job_type/table','','0','','_blank','0','0','0','0','job_type','job_type','job_type',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('82','注册用户','岗位类型','job_type','类型详情','/job_type/view','','0','','_blank','0','0','0','0','job_type','job_type','job_type',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('83','注册用户','简历信息','resume_information','简历信息','/resume_information/table','','0','','_blank','0','0','0','1','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks',null,'0','{"export_db":true,"examine":false,"import_db":true}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('84','注册用户','简历信息','resume_information','信息详情','/resume_information/view','','0','','_blank','0','0','0','1','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('85','注册用户','简历信息','resume_information','简历信息','/resume_information/edit','','0','','_blank','1','1','1','1','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,posting_remarks',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('86','注册用户','面试通知','interview_notice','面试通知','/interview_notice/table','','0','','_blank','0','0','0','1','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('87','注册用户','面试通知','interview_notice','通知详情','/interview_notice/view','','0','','_blank','0','0','0','1','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('88','注册用户','我的收藏','collect','我的收藏','/collect/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('89','注册用户','评论','comment','评论列表','/comment/table','','0','','_blank','0','1','0','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('90','注册用户','评论','comment','评论详情','/comment/view','','0','','_blank','0','1','0','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('91','注册用户','评论','comment','我的评论','/comment/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('92','注册用户','评论','comment','评论详情','/comment/details','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('93','注册用户','社交论坛','forum','社交论坛','/forum/table','','0','','_blank','0','1','0','1','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('94','注册用户','社交论坛','forum','论坛详情','/forum/view','','0','','_blank','0','1','0','1','','','',null,'0','{"print":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('95','注册用户','社交论坛','forum','社交论坛','/forum/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('96','注册用户','社交论坛','forum','论坛详情','/forum/details','','0','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('97','注册用户','论坛分类','forum_type','论坛分类','/forum_type/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('98','注册用户','论坛分类','forum_type','分类详情','/forum_type/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('99','注册用户','新闻资讯','article','新闻资讯','/article/table','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('100','注册用户','新闻资讯','article','资讯详情','/article/view','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('101','注册用户','新闻资讯','article','新闻资讯','/article/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('102','注册用户','新闻资讯','article','资讯详情','/article/details','','0','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('103','注册用户','资讯分类','article_type','资讯分类','/article_type/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('104','注册用户','资讯分类','article_type','分类详情','/article_type/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('105','注册用户','公告通知','notice','公告通知','/notice/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('106','注册用户','公告通知','notice','通知详情','/notice/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('107','注册用户','公告通知','notice','公告通知','/notice/list','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('108','注册用户','公告通知','notice','通知详情','/notice/details','','0','','_blank','1','1','1','1','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('109','企业用户','注册用户','registered_user','注册用户','/registered_user/table','','0','','_blank','0','0','0','0','user_name,user_gender,user_age,contact_information,educational_background,work_experience','user_name,user_gender,user_age,contact_information,educational_background,work_experience','user_name,user_gender,user_age,contact_information,educational_background,work_experience',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('110','企业用户','注册用户','registered_user','用户详情','/registered_user/view','','0','','_blank','0','0','0','0','user_name,user_gender,user_age,contact_information,educational_background,work_experience','user_name,user_gender,user_age,contact_information,educational_background,work_experience','user_name,user_gender,user_age,contact_information,educational_background,work_experience',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('111','企业用户','企业用户','enterprise_users','企业用户','/enterprise_users/table','','0','','_blank','0','0','0','0','enterprise_name,registered_capital,enterprise_location,business_license','enterprise_name,registered_capital,enterprise_location,business_license','enterprise_name,registered_capital,enterprise_location,business_license',null,'0','{"examine":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('112','企业用户','企业用户','enterprise_users','用户详情','/enterprise_users/view','','0','','_blank','0','0','1','1','enterprise_name,registered_capital,enterprise_location,business_license','enterprise_name,registered_capital,enterprise_location,business_license','enterprise_name,registered_capital,enterprise_location,business_license',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('113','企业用户','招聘信息','recruitment_information','招聘信息','/recruitment_information/table','','0','','_blank','1','1','1','1','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details',null,'0','{"can_show_comment":true}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('114','企业用户','招聘信息','recruitment_information','信息详情','/recruitment_information/view','','0','','_blank','1','1','1','1','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('115','企业用户','招聘信息','recruitment_information','招聘信息','/recruitment_information/list','','0','top','_blank','0','0','0','0','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('116','企业用户','招聘信息','recruitment_information','信息详情','/recruitment_information/details','','0','','_blank','0','0','0','0','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details','recruitment_title,enterprise_name,enterprise_users,registered_capital,job_type,cover_photo,salary_amount,professional_requirements,work_location,recruitment_positions,recruitment_details',null,'0','{"can_comment":false,"can_show_comment":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('117','企业用户','岗位类型','job_type','岗位类型','/job_type/table','','0','','_blank','0','0','0','0','job_type','job_type','job_type',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('118','企业用户','岗位类型','job_type','类型详情','/job_type/view','','0','','_blank','0','0','0','0','job_type','job_type','job_type',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('119','企业用户','简历信息','resume_information','简历信息','/resume_information/table','','0','','_blank','0','0','1','1','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','resume_rating,resume_marking','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks',null,'0','{"export_db":true,"examine":true,"import_db":true}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('120','企业用户','简历信息','resume_information','信息详情','/resume_information/view','','0','','_blank','0','0','1','1','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','resume_rating,resume_marking','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('121','企业用户','简历信息','resume_information','简历信息','/resume_information/edit','','0','','_blank','0','0','0','0','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,user_gender,user_age,contact_information,educational_background,work_experience,placement_time,resume_attachment,reason_for_advertising_placement,resume_rating,resume_marking,posting_remarks',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('122','企业用户','面试通知','interview_notice','面试通知','/interview_notice/table','','0','','_blank','1','1','1','1','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('123','企业用户','面试通知','interview_notice','通知详情','/interview_notice/view','','0','','_blank','1','1','1','1','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments','recruitment_title,enterprise_name,enterprise_users,job_type,target_users,user_name,invitation_time,interview_notice,interview_location,interview_status,interview_score,interview_comments',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('124','企业用户','我的收藏','collect','我的收藏','/collect/list','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('125','企业用户','评论','comment','评论列表','/comment/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('126','企业用户','评论','comment','评论详情','/comment/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('127','企业用户','评论','comment','我的评论','/comment/list','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('128','企业用户','评论','comment','评论详情','/comment/details','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('129','企业用户','社交论坛','forum','社交论坛','/forum/table','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('130','企业用户','社交论坛','forum','论坛详情','/forum/view','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('131','企业用户','社交论坛','forum','社交论坛','/forum/list','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('132','企业用户','社交论坛','forum','论坛详情','/forum/details','','0','','_blank','0','0','0','0','','','',null,'0','{"can_comment":false,"can_show_comment":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('133','企业用户','论坛分类','forum_type','论坛分类','/forum_type/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('134','企业用户','论坛分类','forum_type','分类详情','/forum_type/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('135','企业用户','新闻资讯','article','新闻资讯','/article/table','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('136','企业用户','新闻资讯','article','资讯详情','/article/view','','0','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('137','企业用户','新闻资讯','article','新闻资讯','/article/list','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('138','企业用户','新闻资讯','article','资讯详情','/article/details','','0','','_blank','0','0','0','0','','','',null,'0','{"can_comment":false,"can_show_comment":false}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('139','企业用户','资讯分类','article_type','资讯分类','/article_type/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('140','企业用户','资讯分类','article_type','分类详情','/article_type/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('141','企业用户','公告通知','notice','公告通知','/notice/table','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('142','企业用户','公告通知','notice','通知详情','/notice/view','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('143','企业用户','公告通知','notice','公告通知','/notice/list','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `auth` values ('144','企业用户','公告通知','notice','通知详情','/notice/details','','0','','_blank','0','0','0','0','','','',null,'0','{}','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `user_group` values ('3','100','注册用户',null,'registered_user','registered_user_id','0','3','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `user_group` values ('4','100','企业用户',null,'enterprise_users','enterprise_users_id','0','1','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
ALTER TABLE `comment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
ALTER TABLE `collect` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
ALTER TABLE `praise` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/api/upload/1813113578186604544.jpg','943','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/api/upload/1813113508691181569.jpg','937','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/api/upload/1813113635476602880.jpg','321','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');
insert into `article` values ('1','百日千万招聘专项行动推出保险、轻工业、汽车、医疗卫生行业专场招聘','招聘','102','0','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0',null,null,null,'<p>央广网北京7月16日消息（记者 果君）7月15日至7月21日，百日千万招聘专项行动推出保险、轻工业、汽车、医疗卫生行业4个线上招聘专场，共有1.5万余家用人单位参与，招聘需求超50.5万人次。</p><p><br></p><p>保险行业专场由“就业在线”联合中国保险行业协会承办，组织中国平安保险（集团）有限公司、中国大地财产保险股份有限公司、中国人寿保险股份有限公司、新华人寿保险股份有限公司等175家用人单位，提供理赔顾问、保险经纪人、客服、市场拓展、数据分析、人事管理等岗位，招聘需求4600多人次。</p><p>轻工业行业专场由“就业在线”联合中国轻工业联合会承办，组织天津军星管业集团有限公司、浙江亚特电器股份有限公司、江苏亚太轻合金科技股份有限公司、中国照明电器协会等7886家用人单位，提供机械工程师、市场经理、销售、质量监理等岗位，招聘需求超38.6万人次。</p><p>汽车行业专场由猎聘承办，组织中国一汽、长安汽车、比亚迪、理想汽车、蔚来等在内的300多家用人单位，提供算法工程师、电气工程师、产品经理、试验员等岗位，招聘需求4300多人次。</p><p>医疗卫生行业专场由前程无忧承办，国药集团、罗氏制药、药明康德、阿斯利康、辉瑞（中国）等近7000家用人单位参与，提供质量工程师、质检员、制剂研究员、医药学术推广、医药技术研发、化学分析测试员等岗位，招聘需求超11万人次。</p><p>同时，推出金融、机械制造、石油化工等行业专场和高校毕业生等重点群体专场直播带岗活动17场，共提供5430个岗位。</p><p>用人单位和求职者可通过中国公共招聘网、中国国家人才网、就业在线专项行动主会场页面直接进入行业招聘专场，或点击主会场页面下方参与机构LOGO进入分会场参与。</p>','/api/upload/1813116522080501760.jpg',null);
insert into `article` values ('2','蓝领招聘进入新时代','招聘','472','0','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0',null,null,null,'<p>来源：中国经营报</p><p><br></p><p>本报记者 李静 青岛报道</p><p>直播和短视频这种新兴的招聘形式，正在重构庞大的蓝领招聘市场。</p><p>在近日召开的快手快聘2024年度峰会上，对外公布了一组数据：过去一年快手全年招聘类短视频、直播观看达1000亿人次；单月产生近2500万次求职线索，双向工作意向匹配对数月涨幅达到167%。</p><p>青岛职通天下人力资源公司（以下简称“青岛职通公司”）在蓝领招聘领域已经做了12年，该公司新媒体负责人耿晨认为：“蓝领招聘经历最初坐商到行商再到微商，现在已经进入到了‘播商’时代。”</p><p>2020年年初因为疫情原因线下招工出现困境，青岛职通公司开始在快手尝试直播招工时，当时耿晨的团队只有5个人。如今，耿晨的团队人数已经上涨到110人，在快手的总粉丝量达到300多万，日获取百份以上简历的主播达30多位。</p><p>《中国经营报》记者注意到，快手副总裁、快手快聘业务负责人李欢指出，蓝领市场是一个求职者规模庞大的市场，制造业和服务业整体的求职人数规模已经达到4.3亿的体量。但传统的蓝领招聘渠道中，存在人力资源双方信息鸿沟大、沟通效率低的问题，信息的缺乏和不透明也给招聘双方增加了成本和未知风险。</p><p>快手的另一组数据显示，过去一年头部招聘企业在快手的岗位发布数量同比增长43%，同时蓝领用户在线上的求职意向表达也增长了10%，这进一步说明企业和用户也在积极拥抱线上招聘渠道。</p><p><strong>招工成本下降一半</strong></p><p>“从线下招聘会、到线上网站、再到直播带岗，直播招聘是一种更高效的传播媒介。”耿晨透露，“过去在某互联网招聘平台上获取有效简历的成本是100 元/份，现在通过短视频平台只要几块钱。”</p><p>2020年由于疫情的原因，导致线下很难招到人，青岛职通公司在青岛50多家加盟店几乎处于半瘫痪状态，招聘难问题迫在眉睫，于是开始通过boss直聘、前程无忧等线上网站来招工，加上当时直播带货正是走红的时候，青岛职通公司便开始尝试在快手进行直播招工。而在那个时候，快手快聘业务其实还没有正式上线。</p><p>“不试不知道，一试吓一跳，效果非常好，而且费用还低。”耿晨说道，“但当时受到一个非常严峻的挑战，因为快聘没正式上线之前，这个行业可谓鱼龙混杂，有的高价单、套路单，对我们来说想做好人力资源服务确实是比较有难度。”</p><p>2022年，快手正式推出蓝领招聘业务“快聘”，快聘平台构建了以信任为中心的蓝领招聘关系和直播带岗新模式，为蓝领劳动者、大学生、退役军人、残疾人群体等搭建起全新的就业渠道，实现更精准的岗位匹配。</p><p>耿晨表示，做直播招工，对于招聘公司来说，需要投入的运营成本也几乎为零，只需要一部手机。快手快聘跟传统招工形式相比，每场直播下来能收到数百份简历，接触到近50位有效人选，效率是传统招聘的十倍以上。从更广的获客到更精准的匹配，直播的招工效率显著提升，加入快手快聘前后，向用人单位输送蓝领工人的数量同比增加了260%。</p><p>吉林省为农人力创始人杨光是在2023年5月才正式加入人力资源行业。短短一年多的时间，他就在快手快聘入驻了3家企业，公司内矩阵账号粉丝总数已经达到1200万人，截至目前在快聘上的简历收取总数达到300多万份。</p><p>杨光认为，快手快聘最大的优势是用户基数大，并且和传统的网络招聘平台如58、赶集网、智联招聘相比互动性更强，“传统网络招聘平台不如短视频平台有那么强的互动性、传播性和社区建设，也就是无法将流量变成粉丝，无法打造个人IP，所以导致招聘成本高。”</p><p>“过去通过传统招聘网站招到一个工人，总成本约800元。现在通过短视频、直播的招工方式，成本只有一半不到。”耿晨透露。</p><p><strong>蓝领线上求职意向增长10%</strong></p><p>效率和成本之外，通过短视频、直播招聘工人的留存率也有显著改善。因为传统招工模式中存在信息差问题，导致岗位匹配不够精确，这使得工人即便入职，也有很大的概率会很快离职。</p><p>耿晨表示，传统招聘的员工7天流失率高达20%—30%。但通过直播带岗，求职的信息差能够最大化地消除，工人和职位的匹配度更高，流失率更低。“传统招聘只能看到文字，比如说一个工作是打螺丝或者贴标签，以前只能通过文字来了解，但通过直播可以让工友所见即所得，他在线上能用眼睛直观感受到，包括衣食住行、工厂工作情况、餐厅吃饭等情况。”</p><p>在耿晨看来，公司能从0到1突破到有30个主播做矩阵账号的秘籍，其实就是从一开始就真实记录所有的生活，无论和工友的互动，以及面试过程，再到入职、分配宿舍。</p><p>“短视频和直播的招聘形式越来越受用户的喜欢，背后的核心原因就是，短视频和直播是更视觉化的表达方式，它能够实现整个信息的所见即所得，求职者能够直接感受到岗位和企业的真实立体。”李欢指出，当前在快聘的短视频和直播招聘形式上，用户偏好度已经达到17.7%的水平，相较于两年前增长了12.4%，线上撮合平台具有很好的优势，它能够更好地打破时间以及空间的限制，从而带来更显著的网络规模效应。</p><p>无论是蓝领用工的需求端还是供给端，线上化的趋势都比较明显。过去一年头部招聘企业在快手的岗位发布数年同比涨幅43%，同时蓝领用户在线上的求职意向表达也增长了10%。</p><p>在李欢看来，顺应招聘链路，基于海量内容与岗位的结合，搭建求职双方智能化的沟通链路，大幅提升招聘匹配效率是去年快聘核心的三件大事。未来，快手快聘会将内容场域和招聘行业通用的列表形式的中心场域相结合，提供全域招聘解决方案，构建基于内容与算法、视频直播与社交相结合的招聘生态。以快手快聘的智能化语音交互工具为例，在提升招聘双方沟通效率的同时，还能完成自动化职位推荐乃至帮助商家完成投后整个入职的转化。</p><p>据介绍，在内容场与中心场双向互补的机制下，未来一年快手快聘还会提供千亿的流量扶持，其中有20%的流量会明确拿出来倾斜给全域经营商家，确保这类商家在快聘的经营100%可以拿到简历回报。</p><p>杨光认为，短视频、直播招工模式是未来人力资源行业重要的发展方向，“因为成本是招聘行业的重中之重，如何做好降本增效、高效率简历的收取及交付是其中的核心。”</p><p>（编辑：张靖超 审核：李正豪 校对：翟军）</p>','/api/upload/1813116677903089665.jpg',null);
insert into `article` values ('3','青海茫崖：“现场招聘会+政策宣传” 实现服务零距离','招聘','799','0','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0',null,null,null,'<p>近日，茫崖市举办2024年“百日千万专项招聘行动”现场招聘会。</p><p><br></p><p>此次招聘会服务重点面向离校2年内未就业高校毕业生，同时兼顾低保和零就业家庭成员、脱贫人口、城镇灵活就业人员等各类劳动者。此外，招聘现场还设置了政策咨询、职业指导、简历门诊等多个功能区，工作人员为求职者们提供政策解读、职业规划等服务，帮助他们更好地了解就业市场和求职技巧。</p><p><br></p><p>据悉，今年以来，市人力资源和社会保障局线上线下开展“春风行动”专项活动、“大中城市春季高校毕业生专项活动”“民营企业服务月”7余次，共发布来自省内外56家企业的用工信息，涵盖774个岗位，截至目前招聘了161人。</p><p>“人社部门将进一步强化精准意识、主动意识和服务意识，搭建更多充满‘烟火气’的求职新场景，全力促进稳就业各项政策措施落实落地，实现就业有支持，用工有保障，满意有提升，为努力推动实现高质量充分就业发挥积极作用。”茫崖市人力资源和社会保障局党组书记、局长赵生文表示。</p><p>（青海省茫崖市委宣传部 供稿/供图）</p><p>来源：中国网</p><p><br></p><p>	</p>','/api/upload/1813117284873404417.jpg',null);
insert into `article` values ('4','南京一公司招聘骑手还提供车辆？踩坑大学生：KPI完不成，车辆涉嫌改装','招聘','373','0','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0',null,null,null,'<p><span style="color: rgb(0, 0, 0);">近期，《零距离》栏目报道了南京一家中介公司，在招聘外卖骑手时，以所谓免费用车为幌子，实则从事高价出租电动车的情况。暑期里兼职的大学生不少，涉世未深的年轻人们自然最容易踩坑。</span></p><p><br></p><p><span style="color: rgb(0, 0, 0);">小王是南京浦口一所大学的学生，想在暑期勤工俭学。通过网络招聘平台，他找到一份令他心动的送外卖工作：“暑假工日结兼职、时间自由、280一天”。招聘单位还在私信中表示：</span><strong style="color: rgb(9, 103, 89);">公司统一配车，零元入职，公司新人活动免费提供电车。</strong>但是当他来到鼓楼区小市街招聘现场后，对方的说法变了。</p><p><strong style="color: rgb(51, 51, 51);">大学生小王（化姓）：</strong></p><p><span style="color: rgb(51, 51, 51);">第一个月之内完成500单，才会免掉699的月租金。</span></p><p><span style="color: rgb(0, 0, 0);">涉世未深的小王在对方游说之下，签订了先用后付租车合同，并在支付宝免押下单了4513元。但是当他送外卖后，</span><strong style="color: rgb(9, 103, 89);">发现合同中约定的“21天跑够500有效单”实在是“不可能完成的任务”，并且该公司提供的电动车还无牌。</strong></p><p><span style="color: rgb(0, 0, 0);">大学生小李是小王的“同事”，根据小李与对方的微信聊天记录，该招聘公司表示目前主要是做“美团”“饿了么”等平台的外卖日结兼职，公司会在第一个月提供车。但是，当小李前去面试时，对方的说辞也变了，同样要求“21天跑500单”。</span></p><p><span style="color: rgb(0, 0, 0);">在对方游说之下，小李也签订了租车合同。开始工作后，他也发现“免费用车”的工作量确实很难完成。</span></p><p><strong style="color: rgb(51, 51, 51);">大学生小李（化姓）：</strong></p><p><span style="color: rgb(51, 51, 51);">到招聘的店里之后，就给你一个码，下载的是达达骑手版，另外一个外卖平台，不是美团或者饿了么。分配的单也不合理，任务指定完不成，车钱是必交的。</span></p><p><span style="color: rgb(0, 0, 0);">并且，</span><strong style="color: rgb(9, 103, 89);">小李在租到车以后才发现，根本无需从招聘公司租车，自己有车就能跑。</strong></p><p><span style="color: rgb(0, 0, 0);">两位大学生在看过此前《零距离》的报道后，也特意检查了自己的车辆。两人使用的车都涉嫌改装，电池仓涉被做大，电池与电池仓的侧壁间隙远大于国家标准规定的30毫米。其次，电池电压也过大。</span></p><p><span style="color: rgb(0, 0, 0);">近期，根据两位大学生提供的地址，零距离记者也前往了鼓楼区小市街招聘现场。</span></p><p><span style="color: rgb(0, 0, 0);">小王和小李应聘的店家是位于鼓楼区小市街的骑手驿站，面对应聘者，工作人员表示，如果完成一定的跑单量，就提供免费车辆。</span></p><p><strong style="color: rgb(51, 51, 51);">南京市鼓楼区小市街骑手驿站工作人员：</strong></p><p><span style="color: rgb(51, 51, 51);">699元一个月，21天跑满500单，699就免掉，我们是达达的，京东旗下的，跑腿的单子会多一点。</span></p><p><span style="color: rgb(0, 0, 0);">当记者提出，是否可以自己用自己的电动车跑外卖时，该工作人员明确表示不可以，称车辆和平台绑定在一起，骑手多多加入平台，多创造收益，才能免车租。</span></p><p><br></p><p><span style="color: rgb(0, 0, 0);">可记者仔细查看合同后发现，即使跑单量够，也仅是免首月租金，还得付所谓的增值服务费299元。租车合同显示，出租方为雨花台区满程电动车经营部（个体工商户）。</span></p><p><br></p><p><span style="color: rgb(0, 0, 0);">根据企业登记信息，零距离记者在雨花台区明发广场找到了这家单位，恰好看见有一位18岁小伙在面试。</span></p><p><strong style="color: rgb(51, 51, 51);">南京市雨花台区满程电动车经营部（个体工商户）工作人员：</strong></p><p><span style="color: rgb(51, 51, 51);">车加电，月付699元，电池是无限用的。你先去跑单，跑够500单，免去这个699元。</span></p><p><span style="color: rgb(0, 0, 0);">根据相关信息，雨花台区满程电动车经营部（个体工商户）经营范围主要包括电动车销售、维修、租赁等，这样的门店可以从事招聘活动吗？</span></p><p><strong style="color: rgb(51, 51, 51);">南京市雨花台区数据局工作人员：</strong></p><p><span style="color: rgb(51, 51, 51);">招聘应该属于职业中介，如果说招聘人员自用，本公司发招聘信息，那就没有问题，招聘给别人用的，肯定就是职业中介。</span></p><p><span style="color: rgb(0, 0, 0);">该工作人员进一步表示，</span><strong style="color: rgb(9, 103, 89);">从事职业中介活动就得获取行政许可，</strong>但是雨花台区满程电动车经营部（个体工商户）并不具备获取行政许可的条件。</p><p><strong style="color: rgb(51, 51, 51);">南京市雨花台区数据局工作人员：</strong></p><p><span style="color: rgb(51, 51, 51);">首先要办一个有限公司的营业执照，个体工商户的执照不行的，没有法人资质，然后要有三名专职人员，比如人力资源师，从事人力资源岗位。</span></p><p><br></p><p><span style="color: rgb(0, 0, 0);">目前，零距离记者已经将情况向雨花台区劳动保障监察大队进行了反映。</span></p>','/api/upload/1813117522854019073.jpg',null);
insert into `article` values ('5','求职者 轻工业、汽车、医疗卫生等专场招聘来了','招聘','510','0','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0',null,null,null,'<p>百日千万招聘专项行动推出保险、轻工业、汽车、医疗卫生行业<strong style="color: rgb(51, 51, 51);">4个线上招聘专场，共有1.5万余家用人单位参与，招聘需求超50.5万人次。</strong></p><p><br></p><p>百日千万招聘专项行动推出保险、轻工业、汽车、医疗卫生行业专场招聘</p><p><strong style="color: rgb(51, 51, 51);">保险行业专场</strong>提供理赔顾问、保险经纪人、客服、市场拓展、数据分析、人事管理等岗位，<strong style="color: rgb(51, 51, 51);">招聘需求4600多人次。</strong></p><p><strong style="color: rgb(51, 51, 51);">轻工业行业专场</strong>提供机械工程师、市场经理、销售、质量监理等岗位，<strong style="color: rgb(51, 51, 51);">招聘需求超38.6万人次。</strong></p><p><strong style="color: rgb(51, 51, 51);">汽车行业专场</strong>提供算法工程师、电气工程师、产品经理、试验员等岗位，<strong style="color: rgb(51, 51, 51);">招聘需求4300多人次。</strong></p><p><strong style="color: rgb(51, 51, 51);">医疗卫生行业专场</strong>提供质量工程师、质检员、制剂研究员、医药学术推广、医药技术研发、化学分析测试员等岗位，<strong style="color: rgb(51, 51, 51);">招聘需求超11万人次。</strong></p><p>同时，推出<strong style="color: rgb(51, 51, 51);">金融、机械制造、石油化工等</strong>行业专场和<strong style="color: rgb(51, 51, 51);">高校毕业生等重点群体</strong>专场直播带岗活动17场，共<strong style="color: rgb(51, 51, 51);">提供5430个岗位。</strong></p><p>参与方式</p><p>用人单位和求职者可通过中国公共招聘网（http://job.mohrss.gov.cn）、中国国家人才网（https://www.newjobs.com.cn）、就业在线（https://www.jobonline.cn）专项行动主会场页面直接进入行业招聘专场，或点击主会场页面下方参与机构LOGO进入分会场参与。</p>','/api/upload/1813116982824796160.jpg',null);
insert into `article` values ('6','广州理工学院面向海内外公开招聘高层次“帽峰人才”','招聘','824','0','2025-04-24 22:49:48.0','2025-04-24 22:49:48.0',null,null,null,'<p>广州理工学院创建于2000年，是经教育部批准设立的以工学为主，经济、管理、文学、教育、艺术等多学科协调发展的全日制普通本科高校。学校设有15个二级学院，48个本科专业（其中工科专业25个），全日制在校生30000多人，专任教师1500余人，其中副高以上职称教师和博士学位教师600余人。广州校区位于白云区帽峰山风景区南麓，惠州校区位于罗浮山风景区东南麓，校园用地面积约1500亩，校园建筑面积80多万平方米。</p><p><br></p><p><br></p><p>学校围绕广东制造业当家战略，服务大湾区战略性新兴产业和重要支柱产业，坚持校企合作、产教融合，与粤港澳大湾区众多大型龙头骨干企业建立长期稳定的产学研合作关系，正在重点推进政企校合作的科技园区建设，在先进装备制造、人形机器人、新能源汽车、无人机驾驶、人工智能大模型、电气工程、电子信息、物联网、计算机技术、大数据、工业软件、网络信息安全、智慧城市系统、金融科技、市场营销与跨境电商、数字创意等领域开展有组织的重点应用性开发研究和成果转化应用。</p><p>学校为加快科技园区建设、硕士点建设，推进高质量发展，促进新质生产力发展，实施“帽峰人才计划”，现面向海内外公开诚聘高层次人才，携带项目开发和成果应用的人才优先诚聘。</p><p><br></p><p>科技园区：打造四位一体的科技创新与产教融合基地</p><p>广州理工学院科技产业园是学校独立设置和独立运营的产业园区，位于白云校区西侧300米，毗邻广州帽峰山景区南麓。紧邻广河高速公路八斗出口，交通便利，位置优越。科技产业园占地首期130亩，远期规划300亩，将紧密围绕国家、省、市产业发展战略，以战略新兴产业和支柱产业为导向，聚焦产业的高端化、数智化、绿色化，致力于打造一个集科研、教学、产业、创新孵化于一体的科技创新与产教融合基地。</p><p>科技产业园按“统筹规划、分步实施、滚动发展”的原则建设。首期投入15亿元，主要用于土地及基础设施建设，以及建设实验中心、创新大楼、产业中心、学术交流中心等，奠定园区基础设施研发基地和孵化器功能，导入若干示范引领项目；第二期投入10亿元，建立产投基金，主要用于项目产业化基地建设，实施高新技术成果的产业化；远期，创新机制，集聚社会资源，投入30亿元，做强做大一批产业化项目，引导学校、专业建设、科研创新登上应用创新型高水平台阶。</p><p><br></p><p>科技产业园成立8个研究院，聚焦八大领域，重点发展机器人工程和先进装备制造业、新一代电子信息技术、人工智能大模型和数字孪生、新能源汽车、低空无人驾驶飞行器、智能医疗器械、数字创意、美妆美容等产业，建成区域内重要产品研发基地、成果转化基地、实践教学基地和科技创新基地。</p><p><br></p><p>科技园区：帽峰人才享百万年薪+百万安家费</p><p>本次科技园区主要招聘的产业化项目与团队有：人形机器人研发团队，人工智能大模型研究团队，新一代信息技术研究团队，无人驾驶功能车研发团队，低空无人驾驶航空器研发团队，智能医疗健康设备研发团队，数字创意研发团队，功能性美颜化妆品研发团队，其他符合广东省、大湾区需要的战略性新兴产业的产业化项目和团队。</p><p>学历要求博士研究生，需求学科为机械工程、材料科学与工程、信息与通信工程、计算机科学与技术、交通运输工程、航空宇航科学与技术、软件工程、电子信息、人工智能、工商管理、设计学。</p><p>项目资金支持依据项目情况，每个项目支持经费为<strong style="color: rgb(51, 51, 51);">500—3000万元</strong>，如有特殊需要，一事一议，另行协商。</p><p><br></p><p>项目负责人薪酬纳入学校高层次教师引进计划，聘为学校帽峰人才，依据个人和项目情况，<strong style="color: rgb(51, 51, 51);">年薪100—200万元/年</strong>。（详见广州理工学院高层次人才引进招聘公告https://www.gzist.edu.cn/info/1373/14779.htm）</p><p>学校为项目负责人提供三房一厅住房，或者安家费<strong style="color: rgb(51, 51, 51);">100—200万元/人</strong>；缴纳“五险二金”；协助解决配偶工作，子女优惠就读全寄宿制的广州理工实验学校（幼儿园至高中）。享受其他扶持政策，依据需要资助实验室建设和组建团队，根据专业和个人情况、工作任务合同，实行“一人一议”。</p><p>项目要求一是技术具有自主知识产权；二是技术具有独创性且处于发展前沿或具有行业领先地位；三是近期可实现产业化。</p><p><img src="https://pics6.baidu.com/feed/060828381f30e924dc06a61b193f3d081d95f73b.jpeg@f_auto?token=8c5aa46dedbab6371c0b9a433a41714b" width="640"></p><p>高标准高待遇引进硕士点建设负责人与二级学院科技创新常务副院长</p><p>下列二级学院招聘科技创新产教融合常务副院长：智能制造与电气工程、计算机科学与工程、建筑工程、新能源汽车工程、现代航空、工商管理、经济管理、外国语、艺术设计、音乐舞蹈、人文与教育等学院。</p><p>下列学科硕士点招聘建设学科领域带头人（见表）：</p><p><br></p><p>应聘人需满足以下基本条件，遵纪守法、品行端正，爱岗敬业，具备良好的师德师风、职业道德和学术素养，具有创新意识和团队精神；熟悉高等学校学科建设和发展规律，能胜任应聘岗位的工作；具有博士学位、副高以上职称，本人研究领域与学校建设硕士点学科（专业）和重点发展学科（专业）密切相关；一般应全职在岗工作；国家级人才和海外人才可柔性引进。</p><p><br></p><p>应聘学校帽峰领军人才，一般需具备以下条件，近5年主持过国家级重大重点科研项目，或者多项国家级面上项目，或者获得省级以上科技成果奖；具有领导建设国家和省级一流学科专业、科研平台和专业硕士学位点的能力；具备产学研合作和成果转化应用的潜力和优势，一般应为博士生导师，如无博士点则应为硕士生导师，独立指导过多届硕士研究生并有指导博士研究生工作经历，年龄一般不超过45岁。如应聘二级学院科技创新产教融合常务副院长的，应为教授、博士，在原单位具有中层干部工作经历、具有良好的管理能力、沟通能力和组织协调能力，具备丰富的科研管理经验和产学研经历，能够带领本学院开展科技创新和产教融合工作。</p><p><br></p><p>聘期5-8年。聘期考核合格，鼓励长期续聘。待遇与工作条件如下：</p><p>（1）聘为二级学院科技创新产教融合常务副院长的，年薪<strong style="color: rgb(51, 51, 51);">120-200万元</strong>，资助科研启动经费<strong style="color: rgb(51, 51, 51);">80-200万元</strong>，实验室建设经费<strong style="color: rgb(51, 51, 51);">500-2000万元</strong>，组建5-10人的科研团队，提供三房一厅或享受安家费<strong style="color: rgb(51, 51, 51);">100-200万元</strong>；根据学科专业、个人特长、工作任务合同，实行“一人一议”。</p><p>（2）聘为学科硕士点建设学科领域带头人的，年薪<strong style="color: rgb(51, 51, 51);">80-120万元</strong>，资助科研启动经费<strong style="color: rgb(51, 51, 51);">30-50万元</strong>，实验室建设经费<strong style="color: rgb(51, 51, 51);">80-200万元</strong>，组建3-5人的科研团队，提供二房一厅或享受安家费<strong style="color: rgb(51, 51, 51);">80-120万元</strong>；根据学科专业、个人特长、工作任务合同，实行“一人一议”。</p><p>（3）对于柔性引进的国家级人才，或者具有实施产业化项目的高水平特殊人才，或者海外高层次人才，根据专业和个人情况、工作任务合同，在薪酬待遇、工作条件保障、科研团队组建等方面，实行“一人一议”。</p><p>同时，缴纳“五险二金”，协助解决配偶工作，子女优惠就读全寄宿制的广州理工实验学校（幼儿园至高中）。</p><p><br></p><p>链接：岗位招聘渠道</p><p><strong style="color: rgb(51, 51, 51);">1.报名方式</strong></p><p><strong style="color: rgb(51, 51, 51);">方式一：电子邮箱投递</strong></p><p>应聘者填写人才引进报名表（详见附件1），连同个人简历以及学历、职称证明等材料发送至学校人事处电子邮箱<strong style="color: rgb(51, 51, 51);">rsc@gzist.edu.cn</strong>。邮件标题请注明：产业化项目团队+姓名+联系方式。应聘二级学院科技创新产教融合常务副院长，邮件标题请注明：常务副院长+姓名+应聘学院；应聘学科硕士点建设学科领域带头人，邮件标题请注明：硕士点学科带头人+硕士点建设类别+姓名。</p><p>报名以收到学校电子邮箱自动回执为有效。个人简历应全面反映个人的学习经历和工作经历，以及取得的学术专业成果，力求准确、真实。</p><p><br></p><p><strong style="color: rgb(51, 51, 51);">方式二：招聘系统投递简历</strong></p><p>应聘者在广州理工招聘系统上进行简历投递（https://zp.gzist.edu.cn/），填写个人相关信息、上传个人简历及相关佐证资料。</p><p><strong style="color: rgb(51, 51, 51);">2.招聘程序:</strong></p><p>学校人事处对应聘者的基本条件进行初步审核，由学校组织面谈商议。</p>','/api/upload/1813117861426626560.jpg',null);
insert into `article_type` values ('1','100','招聘','0',null,null,null,'2025-04-24 22:49:48.0','2025-04-24 22:49:48.0');

UPDATE forum 
SET img = CONCAT('/api',img);
