select * from dictionary;--查询数据字典的所有信息
Select * From DBA_CATALOG;--数据字典中其中一个表的信息
select table_name from dictionary;--查询数据字典中所有的表
select * from user_tables;--查询当前用户拥有的所有表的信息，包括表名/表空间名/簇名等
select index_name from user_indexes;--查询该用户拥有哪些索引
select view_name from user_views;--查询该用户拥有哪些视图
select object_name from user_objects;--查看用户拥有哪些数据库对象
select * from user_users;--查看用户的信息，包括用户名/用户ID/账户状态/默认表空间等
select owner , object_name ,object_type from all_objects;--查询所有对象
select * from dba_data_files;--查询表空间/表空间存储路径等

select * from v$access；
select * from v$session;
select * from v$context;