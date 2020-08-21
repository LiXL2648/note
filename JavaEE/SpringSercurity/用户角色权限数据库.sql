/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.7.30 : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `test`;

/*Table structure for table `role_menu` */

DROP TABLE IF EXISTS `role_menu`;

CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色权限表主键ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `role_menu` */

insert  into `role_menu`(`id`,`role_id`,`menu_id`) values (1,1,17),(2,1,18),(3,1,19),(4,1,20),(5,1,21),(6,1,22),(7,1,23),(8,2,17);

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单/权限表主键ID',
  `menu_pid` int(11) DEFAULT NULL COMMENT '父节点ID',
  `menu_pids` int(11) DEFAULT NULL COMMENT '所有父节点ID',
  `is_leaf` tinyint(1) NOT NULL COMMENT '是否是叶节点，0：否；1：是',
  `menu_name` varchar(32) NOT NULL COMMENT '菜单/权限名称',
  `url` varchar(64) DEFAULT NULL COMMENT '路由地址',
  `icon` varchar(32) DEFAULT NULL COMMENT '菜单字体图标',
  `icon_color` varchar(16) DEFAULT NULL COMMENT '菜单字体图标颜色',
  `sort` tinyint(1) NOT NULL COMMENT '相对于父节点的排序',
  `level` tinyint(1) NOT NULL COMMENT '对应的层级',
  `status` tinyint(1) NOT NULL COMMENT '是否可用，0：否；1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`menu_pid`,`menu_pids`,`is_leaf`,`menu_name`,`url`,`icon`,`icon_color`,`sort`,`level`,`status`) values (1,NULL,NULL,0,'系统管理','',NULL,NULL,1,1,1),(2,NULL,NULL,0,'系统监控','',NULL,NULL,2,1,1),(3,NULL,NULL,0,'系统工具','',NULL,NULL,3,1,1),(4,1,1,0,'用户管理','',NULL,NULL,1,2,1),(5,1,1,0,'角色管理','',NULL,NULL,2,2,1),(6,1,1,0,'菜单管理','',NULL,NULL,3,2,1),(7,1,1,0,'部门管理','',NULL,NULL,4,2,1),(8,1,1,0,'岗位管理','',NULL,NULL,5,2,1),(9,1,1,0,'字典管理','',NULL,NULL,6,2,1),(10,1,1,0,'参数管理','',NULL,NULL,7,2,1),(11,1,1,0,'通知管理','',NULL,NULL,8,2,1),(12,1,1,0,'日志管理','',NULL,NULL,9,2,1),(13,2,2,0,'在线用户','',NULL,NULL,1,2,1),(14,2,2,0,'定时任务','',NULL,NULL,2,2,1),(15,2,2,0,'数据监控','',NULL,NULL,3,2,1),(16,2,2,0,'服务监控','',NULL,NULL,4,2,1),(17,4,1,1,'用户查询','',NULL,NULL,1,3,1),(18,4,1,1,'用户新增','',NULL,NULL,2,3,1),(19,4,1,1,'用户修改','',NULL,NULL,3,3,1),(20,4,1,1,'用户删除','',NULL,NULL,4,3,1),(21,4,1,1,'用户导出','',NULL,NULL,5,3,1),(22,4,1,1,'用户导入','',NULL,NULL,6,3,1),(23,4,1,1,'重置密码','',NULL,NULL,7,3,1);

/*Table structure for table `sys_org` */

DROP TABLE IF EXISTS `sys_org`;

CREATE TABLE `sys_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统组织结构表主键ID',
  `org_pid` int(11) DEFAULT NULL COMMENT '父节点ID',
  `org_pids` varchar(64) DEFAULT NULL COMMENT '所有父节点ID',
  `is_leaf` tinyint(1) NOT NULL COMMENT '是否是叶节点，0：否；1：是',
  `org_name` varchar(32) NOT NULL COMMENT '组织名',
  `address` varchar(64) DEFAULT NULL COMMENT '地址',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(20) DEFAULT NULL COMMENT '联系邮箱',
  `sort` tinyint(1) NOT NULL COMMENT '相对于父节点的排序',
  `level` tinyint(1) NOT NULL COMMENT '对应的层级',
  `status` tinyint(1) NOT NULL COMMENT '是否可用，0：否；1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_org` */

insert  into `sys_org`(`id`,`org_pid`,`org_pids`,`is_leaf`,`org_name`,`address`,`phone`,`email`,`sort`,`level`,`status`) values (1,NULL,NULL,0,'LiXLKeYD',NULL,NULL,NULL,1,1,1),(2,1,'1',0,'总裁办',NULL,NULL,NULL,1,2,1),(3,1,'1',0,'研发部',NULL,NULL,NULL,2,2,1),(4,1,'1',0,'财务部',NULL,NULL,NULL,3,2,1),(5,1,'1',0,'行政部',NULL,NULL,NULL,4,2,1),(6,1,'1',0,'人事部',NULL,NULL,NULL,5,2,1),(7,3,'1,3',1,'java组',NULL,NULL,NULL,1,3,1),(8,3,'1,3',1,'c/c++组',NULL,NULL,NULL,2,3,1),(9,3,'1,3',1,'Linux/运维组',NULL,NULL,NULL,3,3,1),(10,4,'1,4',1,'会计组',NULL,NULL,NULL,1,3,1),(11,4,'1,4',1,'出纳组',NULL,NULL,NULL,2,3,1);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统角色表主键ID',
  `role_name` varchar(32) NOT NULL COMMENT '角色名称(中文)',
  `role_code` varchar(32) NOT NULL COMMENT '角色名称(英文)',
  `role_desc` varchar(100) DEFAULT NULL COMMENT '角色描述',
  `sort` tinyint(1) NOT NULL COMMENT '角色顺序',
  `status` tinyint(1) NOT NULL COMMENT '是否可用，0：否；1：是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '角色的创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`role_name`,`role_code`,`role_desc`,`sort`,`status`,`create_time`) values (1,'超级管理员','admin','具备系统所有权限',1,1,'2020-08-19 15:52:40'),(2,'普通用户','common','具备系统少量权限',2,1,'2020-08-19 15:53:33');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户信息表主键ID',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(20) DEFAULT NULL COMMENT '联系邮箱',
  `enabled` tinyint(1) NOT NULL COMMENT '是否可用，0：否；1：是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
  `org_id` int(11) NOT NULL COMMENT '组织id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`username`,`password`,`phone`,`email`,`enabled`,`create_time`,`org_id`) values (1,'admin','2648',NULL,NULL,1,'2020-08-19 16:03:53',1),(2,'LiXL','0504','13480303706','1634491328@qq.com',1,'2020-08-19 16:06:50',7),(3,'YuCX','0829','13423531695',NULL,1,'2020-08-19 16:07:25',5),(4,'LiXY','0906',NULL,NULL,1,'2020-08-19 16:08:01',2),(5,'LiXC','1127','13480873007',NULL,1,'2020-08-19 16:08:35',6),(6,'LiLX','0730',NULL,NULL,1,'2020-08-19 16:09:46',4);

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户角色表主键ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`user_id`,`role_id`) values (1,1,1),(2,2,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
