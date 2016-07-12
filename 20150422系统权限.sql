Select * from session_roles;--查询当前用户拥有的角色
Select * From session_privs;--查询当前用户拥有的权限
Select * From system_privilege_map;--查询所有的系统权限

Select * From dba_users where username = 'SCOTT';--在用户表里发现SCOTT用户已经被默认创建

--创建用户备用
Create User newusernew Identified By password1 Default Tablespace mytbs;
Create User robinson Identified By lion Default Tablespace mytbs;

--给newusernew赋予权限
Grant Create Session,Create Table To newusernew;--赋予这两个
Grant Execute Any Procedure To newusernew With Admin Option;--此权限可再赋予他人

--使用系统权限
--在SQL PLUS中连接newusernew，创建table。当插入一行时出现“对表空间‘mytbs’无权限”，则为其分配配额
Alter User newusernew Quota Unlimited On mytbs;
--继续在sqlplus中操作，使用Alter Table添加一列，并再插入一行。（由此可见有Create Table权限的用户也可以使用Alter Table语句）
--当赋予robinson，create session的权限时，提示，权限不足
--赋予robinson，execute any procedure权限

--查看系统权限
Select * From dba_sys_privs;--在sqlplus中查询此句，提示：表或视图不存在。其实存在，只是没有权限而已
Select * From user_sys_privs;--在sqlplus中查询此句，显示当前用户的privs。

--回收系统权限
Revoke Execute Any Procedure From newusernew;--回收newusernew的Execute Any Procedure权限，系统并不会回收robinson的。
Select * From dba_sys_privs Where grantee = 'NEWUSERNEW';--newusernew的Execute Any Procedure权限被回收
Select * From dba_sys_privs Where grantee = 'ROBINSON';--robinson的Execute Any Procedure依然存在

Drop User newusernew cascade;--删除用户
Drop User robinson cascade;--删除用户



