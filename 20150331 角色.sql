Create User nopsw Identified Externally;--创建一不需密码的用户，但sql plus中必须得输入密码，故在sql plus中用不了
Alter User nopsw Identified By nopsw;--更改用户密码为nopsw，登陆sql plus还是被拒，提示“user NOPSW lacks CREATE SESSION privilege;logon denied
Grant Connect to nopsw;--分配Connect角色（基本的连接），用sql plus输入此用户名和密码，登录进去了，但select * from account；回车后提示”ORA-00942:表或视图不存在
Grant Resource to nopsw;--授予resource角色后还是出现上面的错误提示，
Grant DBA to nopsw;--还是出现上面的错误提示，后来发现是没有写明表所在用户的原因
Select * From tbsuser.account;--写明此表所在的用户即可。只有用户有dba的角色就可以select了
Revoke Resource From nopsw;--则取消resource授权（程序开发）
Select * From user_role_privs;--在sql plus上查询当前nopsw用户的权限，或者是session_privs;如果查询当前用户的角色，用session_roles;
Select * From user_users;--可查到username,tablespace等属性
revoke dba from nopsw;
Grant DBA to nopsw;--授予DBA权限（数据库管理），因未使用With Admin Option，所以nopsw用户不能将此角色授予其他用户，否则提示：ORA-01932：ADMIN 选项未授权给角色'DBA'。resource和connect也会有相应提示
Grant Connect to nopsw With Admin Option;--使用With Admin Option后，nopsw可以将此角色授予其它用户
Create User newusernew Identified By password1;--创建一用户
--给此用户赋予connect的角色，退出登录此用户，Select * From Session_privs;(此语句用来查看当前用户拥有什么权限）
  --只有Create Session
--给此用户赋予resource角色，再查看，多了unlimited tablespace和create table等权限
--再赋予dba角色，再查看，多了create user等权限
Grant DBA to newusernew;--以nopsw登陆，赋给newusernew DBA的角色
Revoke DBA From newusernew;--撤销newusernew DBA的角色
Drop User newusernew;--删除用户newusernew
Drop User newnew;

--identified externally
Select * From dba_users;
Alter User nopsw Identified Externally;--将此用户更改成externally之后无论在sql plus里登还是在developer里创建连接都不知道怎么用此用户
Alter User newusernew Identified by password1;

--查看resource和connect角色的区别
select grantee,privilege from dba_sys_privs where grantee='RESOURCE' OR GRANTEE LIKE 'CONNECT%'

--在创建user时若省略default tablespace和temporary tablespace，则由database_properties里的参数来决定
select * from database_properties where property_name like 'DEFAULT%';

--查询当前用户所拥有的权限和角色
Select * from session_privs;
Select * From session_roles;


--查看用户表空间配额
Select * From dba_ts_quotas;--dba_ts_quotas是表空间和用户配额的表
Select username,tablespace_name,max_bytes/1024/1024 "Max MB" From dba_ts_quotas Where username = 'NEWUSER';--查询newuser用户的表空间配额，注意数据库是区分大小写的

--查看特定对象下用户拥有的对象
Select * From dba_objects Where owner = 'TBSUSER';--查询用户TBSUSER在dba_objects拥有的对象
Select owner,object_name,object_type From dba_objects Where owner = 'TBSUSER';





