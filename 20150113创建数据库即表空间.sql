select username,default_tablespace from user_users;--查询当前用户的表空间
select * from user_role_privs;--查询当前用户的角色
select * from user_tables;--查询当前用户的所有表
create tablespace newtbs datafile 'D:\app\qa-2\product\11.2.0\dbhome_1\oradata\newtbs.dbf' size 50M extent management local uniform size 128k;--创建一个tablespace名为newtbs，大小为50M的表空间
create user newuser identified by NewPassword1 default tablespace newtbs quota 10m on newtbs temporary tablespace temp password expire;--在newtbs下创建新的user,默认表空间是newtbs，空间配额为10M，下次登陆要求修改密码
Grant resource,connect,dba to newuser;--赋予newuser三个权限：resource，connect，dba
select tablespace_name,sum(bytes)/1024/1024 from dba_data_files group by tablespace_name;--查看所有表空间及其大小（表空间可理解为数据库）
