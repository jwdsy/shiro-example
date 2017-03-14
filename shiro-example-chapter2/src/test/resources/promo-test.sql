/*
SQLyog Ultimate v8.71 
MySQL - 5.6.16-log : Database - newmiao
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`newmiao` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `newmiao`;

/*Table structure for table `pro_activity` */

DROP TABLE IF EXISTS `pro_activity`;

CREATE TABLE `pro_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `appid` bigint(20) NOT NULL DEFAULT '1',
  `title` varchar(255) DEFAULT NULL COMMENT '活动标题',
  `logo` varchar(255) DEFAULT NULL COMMENT '活动背景图',
  `content` text COMMENT '活动内容。html格式',
  `type` int(11) DEFAULT '1' COMMENT '活动类型1.资讯 2.首单奖励 3.达成奖励 4.排名奖励',
  `reward_name` varchar(255) DEFAULT NULL COMMENT '奖励名称',
  `start_time` bigint(20) DEFAULT NULL COMMENT '活动开始时间',
  `end_time` bigint(20) DEFAULT NULL COMMENT '活动结束时间',
  `is_top` int(11) DEFAULT '1' COMMENT '是否置顶 1.不置顶 2.置顶',
  `status` int(11) DEFAULT '1' COMMENT '状态1.上线 2.下线 -1.删除',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_issue_bonus` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否发放奖励 1否 2是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Table structure for table `pro_activity_cashback` */

DROP TABLE IF EXISTS `pro_activity_cashback`;

CREATE TABLE `pro_activity_cashback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `activity_id` bigint(20) DEFAULT NULL COMMENT '活动id',
  `activity_title` varchar(255) DEFAULT NULL COMMENT '活动标题',
  `reward_name` varchar(255) DEFAULT NULL COMMENT '奖励名称',
  `employee` varchar(255) DEFAULT NULL COMMENT '员工姓名',
  `bank_card` varchar(255) DEFAULT NULL COMMENT '银行卡号',
  `id_card` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `company` varchar(255) DEFAULT NULL COMMENT '公司',
  `store` varchar(255) DEFAULT NULL COMMENT '门店',
  `mobile` varchar(255) DEFAULT NULL COMMENT '电话',
  `status` int(11) DEFAULT '1' COMMENT '1待打款，2已打款，3已发红包',
  `bonus` int(11) DEFAULT NULL COMMENT '奖金（单位：分）',
  `profile_id` bigint(20) DEFAULT NULL COMMENT '用户属性id',
  `pay_time` bigint(20) DEFAULT NULL COMMENT '打款时间',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `pro_activity_plan_relation` */

DROP TABLE IF EXISTS `pro_activity_plan_relation`;

CREATE TABLE `pro_activity_plan_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `activity_id` bigint(20) DEFAULT NULL COMMENT '活动id',
  `promo_plan_id` int(20) DEFAULT NULL COMMENT '推广计划id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Table structure for table `pro_activity_rank` */

DROP TABLE IF EXISTS `pro_activity_rank`;

CREATE TABLE `pro_activity_rank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `activity_id` bigint(20) DEFAULT NULL COMMENT '活动id',
  `finish_count` int(11) DEFAULT '1' COMMENT '完成数量',
  `profile_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `pro_activity_record` */

DROP TABLE IF EXISTS `pro_activity_record`;

CREATE TABLE `pro_activity_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `activity_id` bigint(20) DEFAULT NULL COMMENT '活动id',
  `activity_type` int(11) DEFAULT NULL COMMENT '活动类型',
  `activity_title` varchar(255) DEFAULT NULL COMMENT '活动标题',
  `reward_name` varchar(255) DEFAULT NULL COMMENT '奖励名称',
  `profile_id` bigint(20) DEFAULT NULL COMMENT '用户属性id',
  `user_name` varchar(50) DEFAULT NULL,
  `promo_code` varchar(50) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Table structure for table `pro_gift_record` */

DROP TABLE IF EXISTS `pro_gift_record`;

CREATE TABLE `pro_gift_record` (
  `id` char(32) NOT NULL COMMENT '主键 MD5（profile_id + “_”+appid + “_”+ gift_id）',
  `appid` bigint(20) DEFAULT NULL COMMENT '应用ID',
  `profile_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `gift_id` bigint(20) DEFAULT NULL COMMENT '礼包id',
  `gift_name` varchar(50) DEFAULT NULL COMMENT '礼包名称',
  `award_ids` varchar(50) DEFAULT NULL COMMENT '礼包奖励内容(卷id，根据#分割)',
  `award_names` varchar(255) DEFAULT NULL COMMENT '奖励名称，根据逗号分隔',
  `profile_name` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `profile_mobile` varchar(50) DEFAULT NULL COMMENT '用户电话',
  `status` int(11) DEFAULT '0' COMMENT '是否领取  0 未领取 1已获得 2已领取',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pro_grade` */

DROP TABLE IF EXISTS `pro_grade`;

CREATE TABLE `pro_grade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `appid` bigint(20) DEFAULT NULL COMMENT '应用ID',
  `name` varchar(50) DEFAULT NULL COMMENT '等级名称',
  `arrived_exp` int(11) DEFAULT '0' COMMENT '到达等级所需经验',
  `update_user` varchar(50) DEFAULT NULL COMMENT '更新用户',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `pro_grade_gift` */

DROP TABLE IF EXISTS `pro_grade_gift`;

CREATE TABLE `pro_grade_gift` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `appid` bigint(20) DEFAULT NULL COMMENT '应用id',
  `name` varchar(50) DEFAULT NULL COMMENT '礼包名称',
  `grade_id` int(11) DEFAULT NULL COMMENT '等级表(pro_grade)的id',
  `grade_name` varchar(50) DEFAULT NULL COMMENT '等级名称',
  `des` varchar(200) DEFAULT NULL COMMENT '礼包描述',
  `img` varchar(200) DEFAULT NULL COMMENT '礼包缩略图',
  `award_ids` varchar(50) DEFAULT NULL COMMENT '奖励内容(卷id，根据#分割)',
  `award_names` varchar(255) DEFAULT NULL COMMENT '奖励名称，根据逗号分隔',
  `update_user` varchar(50) DEFAULT NULL COMMENT '更新用户',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `pro_reward_rule` */

DROP TABLE IF EXISTS `pro_reward_rule`;

CREATE TABLE `pro_reward_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `activity_id` bigint(20) DEFAULT NULL COMMENT '活动id',
  `target` int(11) DEFAULT NULL COMMENT '目标数',
  `bonus` int(11) DEFAULT NULL COMMENT '奖金（单位：分）',
  `type` int(11) DEFAULT '1' COMMENT '活动类型2.首单奖励 3.达成奖励 4.排名奖励',
  `reward_name` varchar(255) DEFAULT NULL COMMENT '奖励名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Table structure for table `pro_sign` */

DROP TABLE IF EXISTS `pro_sign`;

CREATE TABLE `pro_sign` (
  `id` char(32) NOT NULL COMMENT '主键 MD5（profile_id + “_”+appid + “_”+ gift_id）',
  `appid` bigint(20) DEFAULT NULL COMMENT '应用ID',
  `sign_date` varchar(10) DEFAULT NULL COMMENT '日期、格式：2012-01-01',
  `profile_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `promo_code` varchar(20) DEFAULT NULL COMMENT '用户code',
  `current_exp` int(11) DEFAULT '0' COMMENT '奖励前经验',
  `after_exp` int(11) DEFAULT '0' COMMENT '奖励后经验',
  `add_exp` int(11) DEFAULT '0' COMMENT '奖励经验',
  `award_times` decimal(10,2) DEFAULT '0.00' COMMENT '奖励倍数',
  `grade` varchar(20) DEFAULT NULL COMMENT '奖励前等级名称',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pro_sign_award` */

DROP TABLE IF EXISTS `pro_sign_award`;

CREATE TABLE `pro_sign_award` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `appid` bigint(20) DEFAULT NULL COMMENT '应用id',
  `name` varchar(50) DEFAULT NULL COMMENT '奖励名称',
  `sign_number` int(11) DEFAULT '0' COMMENT '触发条件（连续签到N天）',
  `award_times` decimal(10,3) DEFAULT '0.000' COMMENT '奖励倍数',
  `exp` int(11) DEFAULT '0' COMMENT '奖励经验',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '更新人员',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `promo_bank_card` */

DROP TABLE IF EXISTS `promo_bank_card`;

CREATE TABLE `promo_bank_card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `profile_id` bigint(20) DEFAULT NULL COMMENT '用户属性id',
  `id_card` varchar(20) DEFAULT NULL COMMENT '用户身份证号',
  `true_name` varchar(50) DEFAULT NULL COMMENT '用户真实姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '用户银行预留手机号',
  `card_no` varchar(20) DEFAULT NULL COMMENT '银行卡号',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '开户行名称',
  `bank_logo` varchar(255) DEFAULT NULL COMMENT '银行logo图片url地址',
  `card_type` varchar(50) DEFAULT NULL COMMENT '银行卡类型（例如储蓄卡）',
  `out_money` int(11) DEFAULT NULL COMMENT '最大可转出金额（单位：分）',
  `bind_status` int(11) DEFAULT '1' COMMENT '绑定状态（1：绑定成功，2：绑定失败，3：解绑）',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的银行卡';

/*Table structure for table `promo_cashback_pay` */

DROP TABLE IF EXISTS `promo_cashback_pay`;

CREATE TABLE `promo_cashback_pay` (
  `id` char(32) NOT NULL COMMENT '主键',
  `appid` bigint(20) NOT NULL COMMENT '应用标识',
  `promo_code` varchar(50) NOT NULL COMMENT '推广码',
  `cashback` int(11) NOT NULL DEFAULT '0' COMMENT '返现金额',
  `promocode_name` varchar(50) DEFAULT NULL COMMENT '员工姓名',
  `promocode_bank` varchar(100) DEFAULT NULL COMMENT '银行及开户行',
  `promocode_cardno` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `promocode_serial_number` varchar(50) DEFAULT NULL COMMENT '身份证',
  `promocode_pname` varchar(50) DEFAULT NULL COMMENT '所在门店',
  `promocode_mobile` varchar(50) DEFAULT NULL COMMENT '员工电话',
  `cashback_status` int(11) NOT NULL DEFAULT '1' COMMENT '返现状态：1.正在打款，2,已打款',
  `create_time` bigint(20) NOT NULL COMMENT '创建日期',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广码返现打款记录';

/*Table structure for table `promo_code` */

DROP TABLE IF EXISTS `promo_code`;

CREATE TABLE `promo_code` (
  `promo_code` varchar(50) NOT NULL COMMENT '推广码',
  `pcode` varchar(50) NOT NULL COMMENT '上级代码，0代表顶级代码',
  `pname` varchar(50) DEFAULT NULL COMMENT '上级机构名称',
  `serial_number` varchar(50) DEFAULT NULL COMMENT '机构编码或员工号，由第三方提供，不唯一',
  `name` varchar(50) DEFAULT NULL COMMENT '机构或人员名称',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '类型：1为员工，2为机构',
  `mobile` varchar(100) DEFAULT NULL COMMENT '电话',
  `card_no` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `bank` varchar(100) DEFAULT NULL COMMENT '开户行',
  `promocode_status` int(11) NOT NULL DEFAULT '1' COMMENT '推广码状态：1正常，-1无效',
  `create_time` bigint(20) NOT NULL COMMENT '创建日期',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `total_cashback` int(11) DEFAULT '0' COMMENT '总返利金额',
  `be_cashback` int(11) DEFAULT '0' COMMENT '待返利',
  `total_order` int(11) DEFAULT '0' COMMENT '订单总数',
  `refund_amount` int(11) DEFAULT '0' COMMENT '退款订单数量',
  `trader_password` char(32) DEFAULT NULL COMMENT '交易密码',
  `current_amount` int(11) DEFAULT NULL COMMENT '可提现金额',
  `left_amount` int(11) DEFAULT '0' COMMENT '账户余额',
  `continue_day` int(11) DEFAULT '0' COMMENT '连续签到天数',
  `max_continue_day` int(11) DEFAULT '0' COMMENT '最大连续签到天数',
  `all_day` int(11) DEFAULT '0' COMMENT '累计签到天数',
  `finally_sign_time` bigint(20) DEFAULT '0' COMMENT '最后签到时间',
  `exp` int(11) DEFAULT '0' COMMENT '用户获得经验',
  `grade_name` varchar(50) DEFAULT NULL COMMENT '用户等级',
  `award_times` decimal(10,2) DEFAULT '0.00' COMMENT '奖励倍数',
  PRIMARY KEY (`promo_code`),
  UNIQUE KEY `serial_number` (`serial_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `promo_code_ext` */

DROP TABLE IF EXISTS `promo_code_ext`;

CREATE TABLE `promo_code_ext` (
  `id` char(32) NOT NULL COMMENT '主键md5(推广码+_+appid)',
  `promo_code` varchar(50) NOT NULL COMMENT '推广码',
  `appid` bigint(20) NOT NULL COMMENT '应用标识',
  `profile_id` bigint(20) DEFAULT NULL COMMENT '用户属性id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广码扩展表';

/*Table structure for table `promo_count_day` */

DROP TABLE IF EXISTS `promo_count_day`;

CREATE TABLE `promo_count_day` (
  `id` char(32) NOT NULL COMMENT 'MD5(推广码+appid+day)',
  `promo_code` varchar(50) NOT NULL COMMENT '推广码',
  `appid` bigint(20) NOT NULL COMMENT '应用标识',
  `day` varchar(10) NOT NULL COMMENT '日期（yyyyMMdd）',
  `commodity_num` int(11) DEFAULT '0' COMMENT '当日销量',
  `order_num` int(11) DEFAULT '0' COMMENT '当日订单量',
  `refund_num` int(11) DEFAULT '0' COMMENT '当日退货量',
  `refund_order` int(11) DEFAULT '0' COMMENT '当日退货订单量',
  `cashback` int(11) DEFAULT '0' COMMENT '当日返利金额',
  `create_time` bigint(20) NOT NULL COMMENT '创建日期',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广码日统计表';

/*Table structure for table `promo_detail` */

DROP TABLE IF EXISTS `promo_detail`;

CREATE TABLE `promo_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_sn` varchar(50) DEFAULT NULL COMMENT '订单号',
  `promo_code` varchar(50) DEFAULT NULL COMMENT '推广码',
  `profile_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `commodity_sn` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `commodity_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `base_cashback` double(11,2) DEFAULT '0.00' COMMENT '基础返现',
  `ext_cashback` double(11,2) DEFAULT '0.00' COMMENT '额外返现',
  `cashback` double(11,2) DEFAULT '0.00' COMMENT '返现金额',
  `gid` varchar(100) DEFAULT NULL COMMENT '设备唯一标识',
  `appid` bigint(20) DEFAULT NULL COMMENT '应用标识',
  `pn` varchar(50) DEFAULT NULL COMMENT '渠道',
  `plat` int(11) DEFAULT NULL COMMENT '平台号',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '订单状态：1正常，-1作废',
  `create_time` bigint(20) NOT NULL COMMENT '创建日期',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期 ',
  `playmoney_status` int(11) DEFAULT '1' COMMENT '结算状态：1为未结算，2为已结算',
  `playmoney_time` bigint(20) DEFAULT NULL COMMENT '结算时间',
  `commodity_amount` int(11) DEFAULT NULL COMMENT '订单商品数量',
  `sale_price` int(11) DEFAULT NULL COMMENT '订单金额',
  `pay_price` int(11) DEFAULT NULL COMMENT '支付金额',
  `promocode_serial_number` varchar(50) DEFAULT NULL COMMENT '身份证号 ',
  `promocode_name` varchar(50) DEFAULT NULL COMMENT '人员名称',
  `promocode_mobile` varchar(20) DEFAULT NULL COMMENT '电话',
  `promocode_card_no` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `promocode_bank` varchar(100) DEFAULT NULL COMMENT '开户行',
  `promocode_pcode` varchar(50) DEFAULT NULL COMMENT '推广码上级代码',
  `promocode_pname` varchar(50) DEFAULT NULL COMMENT '推广码上级机构名称',
  `delivery_code` varchar(50) DEFAULT NULL COMMENT '提货码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='推广码使用明细表';

/*Table structure for table `promo_plan` */

DROP TABLE IF EXISTS `promo_plan`;

CREATE TABLE `promo_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `promo_plan` int(11) NOT NULL COMMENT '推广计划',
  `appid` bigint(20) NOT NULL COMMENT '应用标识',
  `commodity_sn` varchar(50) DEFAULT NULL COMMENT '商品编号',
  `commodity_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `rule_id` int(11) NOT NULL COMMENT '规则ID',
  `amount` varchar(2000) NOT NULL COMMENT '减免或返现的金额（可以为json串）',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态：1正常，-1无效',
  `create_time` bigint(20) NOT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8 COMMENT='推广计划扩展表';

/*Table structure for table `promo_plan_code` */

DROP TABLE IF EXISTS `promo_plan_code`;

CREATE TABLE `promo_plan_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `promo_plan` int(11) NOT NULL COMMENT '推广计划ID',
  `promo_code` varchar(50) NOT NULL COMMENT '推广码',
  `rel_status` int(11) NOT NULL COMMENT '状态：1正常，-1删除',
  `create_time` bigint(20) NOT NULL COMMENT '创建日期',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1389 DEFAULT CHARSET=utf8 COMMENT='推广计划推广码关联表';

/*Table structure for table `promo_plan_main` */

DROP TABLE IF EXISTS `promo_plan_main`;

CREATE TABLE `promo_plan_main` (
  `promo_plan` int(11) NOT NULL AUTO_INCREMENT COMMENT '推广计划ID',
  `plan_name` varchar(50) NOT NULL COMMENT '计划名称',
  `plan_desc` varchar(2000) NOT NULL COMMENT '计划描述',
  `plan_type` int(11) DEFAULT '1' COMMENT '计划类别',
  `total_value` int(11) DEFAULT NULL COMMENT '总价',
  `grant_num` int(11) DEFAULT NULL COMMENT '发放量',
  `plan_logo` varchar(200) DEFAULT NULL COMMENT 'logo图片',
  `start_time` bigint(20) NOT NULL COMMENT '有效时间起',
  `end_time` bigint(20) NOT NULL COMMENT '有效时间止',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态：1正常，-1无效',
  `create_time` bigint(20) NOT NULL COMMENT '创建日期',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`promo_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='推广计划主表';

/*Table structure for table `promo_trade_detail` */

DROP TABLE IF EXISTS `promo_trade_detail`;

CREATE TABLE `promo_trade_detail` (
  `id` varchar(50) NOT NULL COMMENT '主键，MD5(profile_id+order_no)',
  `order_no` varchar(50) DEFAULT NULL COMMENT '本地交易订单号',
  `third_order_no` varchar(50) DEFAULT NULL COMMENT '第三方交易订单号',
  `profile_id` bigint(20) DEFAULT NULL COMMENT '用户属性id',
  `trade_name` varchar(50) DEFAULT NULL COMMENT '交易名称',
  `trade_amount` int(11) DEFAULT '0' COMMENT '交易金额（单位：分）',
  `trade_type` int(11) DEFAULT '1' COMMENT '交易类型（1：入账，2：提现，3：红包，4：红包入账，红包入账表示钱虽然已经入账到钱包，但是不会在可提现金额中显示）',
  `trade_date` varchar(20) DEFAULT NULL COMMENT '交易日期',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '银行名称',
  `card_no` varchar(20) DEFAULT NULL COMMENT '银行卡号',
  `arrive_date` varchar(20) DEFAULT NULL COMMENT '预计到账日期',
  `trade_status` int(11) DEFAULT '1' COMMENT '交易状态（1：交易成功，2：交易失败，3：待交易）',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='钱包交易明细';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
