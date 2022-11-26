show databases;

use mydb;

show tables;

CREATE TABLE `categories` (
  `category_id` char(36) not null,
  `large_category_id` varchar(64) not null,
  `category_titie` varchar(256) not null, 
  `category_description` varchar(256) not null, 
  `category_name` varchar(64) not null, 
  `created_at` timestamp not null default current_timestamp,
  `updated_at` timestamp not null,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY (`category_titie`,`category_description`, `category_name` )
);

CREATE TABLE `blogs_categories` (
  `blog_id` char(36) not null,
  `category_id` varchar(64) not null,
  `created_at` timestamp not null default current_timestamp,
  `updated_at` timestamp not null,
  PRIMARY KEY (`blog_id`, `category_id`),
  FOREIGN KEY(`category_id`) REFERENCES `categories`(`category_id`)
);

CREATE TABLE `tmp_blogs_categories` (
  `blog_id` char(36) not null,
  `category_id` varchar(64) not null,
  `created_at` timestamp not null default current_timestamp,
  `updated_at` timestamp not null,
  PRIMARY KEY (`blog_id`, `category_id`),
  FOREIGN KEY(`category_id`) REFERENCES `categories`(`category_id`)
);

CREATE TABLE `blogs` (
  `blog_id` char(36) not null,
  `blog_title` varchar(64) not null,
  `blog_content` text not null,
  `picture_url` varchar(256) not null,
  `created_at` timestamp not null default current_timestamp,
  `updated_at` timestamp not null,
  PRIMARY KEY (`blog_id`),
  FOREIGN KEY(`blog_id`) REFERENCES `blogs_categories`(`blog_id`)
);

CREATE TABLE `tmp_blogs` (
  `blog_id` char(36) not null,
  `blog_title` varchar(64) null,
  `blog_content` text null,
  `picture_url` varchar(256) null,
  `created_at` timestamp not null default current_timestamp,
  `updated_at` timestamp not null,
  PRIMARY KEY (`blog_id`)

);

CREATE TABLE `user` (
  `user_id` char(36) not null,
  `user_mail` varchar(64) not null,
  `password` varchar(64) not null,
  `created_at` timestamp not null default current_timestamp,
  `updated_at` timestamp not null,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY (`user_mail`)
);
show tables;

grant select,insert,update,delete on mydb.* to 'myuser';
