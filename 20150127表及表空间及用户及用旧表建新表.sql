SELECT 1 || 2 FROM testdatatwo;--||操作符是将字符连接，但Oracle有自动类型转换功能，故数字也可连接
Alter Table testdatatwo Add (dat Date);
select instance_name from  V$instance;--查看实例名（数据库ID）
select tablespace_name,sum(bytes)/1024/1024 from dba_data_files group by tablespace_name;--查看所有表空间及其大小（表空间可理解为数据库）
Select Tablespace_Name,Sum(bytes)/1024/1024 From Dba_Segments Group By Tablespace_Name;
Select username,account_status From dba_users;--查看所有用户名及其被锁状态
select username,default_tablespace from dba_users;--查看所有用户名及其默认表空间
select username,default_tablespace from user_users;--查询当前用户的表空间
Select Segment_Name,Sum(bytes)/1024/1024 From User_Extents Group By Segment_Name;--查看所有表及其大小
Create Table newtable2(field1,field2,field3,field4,field5) As (Select * from testdatatwo where testpre != 300);--用已经存在的表创建一个新表，既有字段又有数据，方便简单
Create Table newtable3(field1,field2) As (Select zifuchuan,testnumber From testdatatwo);--创建一个只有两个字段的新表，数据跟老表一样
