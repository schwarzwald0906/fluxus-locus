show databases;
create database mydb;
show databases;

use mydb;

show tables;

CREATE TABLE `categories` (
  `category_id` varchar(64) not null,
  `large_category_id` varchar(64) not null,
  `category_titie` varchar(256) not null, 
  `category_description` varchar(256) not null, 
  `category_name` varchar(64) not null, 
  `created_at` date not null,
  `updated_at` date not null,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY (`category_id`,`category_titie`,`category_description`, `category_name` )
);

CREATE TABLE `blogs_categories` (
  `blog_id` varchar(64) not null,
  `category_id` varchar(64) not null,
  `created_at` date not null,
  `updated_at` date not null,
  PRIMARY KEY (`blog_id`, `category_id`),
  UNIQUE KEY (`blog_id`, `category_id`)
);

CREATE TABLE `tmp_blogs_categories` (
  `blog_id` varchar(64) not null,
  `category_id` varchar(64) not null,
  `created_at` date not null,
  `updated_at` date not null,
  PRIMARY KEY (`blog_id`, `category_id`),
  UNIQUE KEY (`blog_id`, `category_id`)
);

CREATE TABLE `blogs` (
  `blog_id` varchar(64) not null,
  `blog_title` varchar(64) not null,
  `blog_content` text not null,
  `picture_url` varchar(256) not null,
  `created_at` date not null,
  `updated_at` date not null,
  PRIMARY KEY (`blog_id`),
  UNIQUE KEY (`blog_id`)
);

CREATE TABLE `tmp_blogs` (
  `blog_id` varchar(64) not null,
  `blog_title` varchar(64) null,
  `blog_content` text null,
  `picture_url` varchar(256) null,
  `created_at` date not null,
  `updated_at` date not null,
  PRIMARY KEY (`blog_id`),
  UNIQUE KEY (`blog_id`)
);

CREATE TABLE `user` (
  `user_id` varchar(64) not null,
  `user_mail` varchar(64) not null,
  `password` varchar(64) not null,
  `created_at` date not null,
  `updated_at` date not null,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY (`user_id`,`user_mail`)
);
show tables;

create user 'myuser'@'%' identified by 'password';
grant select,insert,update,delete on mydb.* to 'myuser'@'%';
