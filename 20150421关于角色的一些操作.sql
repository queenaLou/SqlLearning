Create User newusernew Identified By password1;
Grant Connect to newusernew;
Grant Resource to newusernew;
Grant dba to newusernew;
revoke resource,dba from newusernew;
revoke resource from newusernew;
Alter user newusernew default tablespace mytbs;
select * from account;
select grantee,privilege from dba_sys_privs where grantee='RESOURCE' OR GRANTEE LIKE 'CONNECT%'--比较connect和resource角色的权限差别
select * from database_properties where property_name like 'DEFAULT%';--查看系统的default
Select * From dba_objects Where OWNER = 'tbsuser';
Select * From SYSTEM_PRIVILEGE_MAP;--Oracle中的系统权限
Select * from newusernew.newtab;
Insert into newusernew.newtab(tname) Values('cbd');
drop user newusernew cascade;--cascade将删除所有与该用户关联测对象
Create Table newusernew.nta(tna varchar(10));
Insert into newusernew.nta(tna) values('cnc');
create table newnew.nta(ttna varchar(10));
insert into newnew.nta(ttna) values('cn');
Alter user newnew default tablespace mytbs;
select * from dba_ts_quotas;
Alter User newusernew Quota UNLIMITED On mytbs;
alter user newnew quota unlimited on mytbs;--当出现“对表空间 'MYTBS' 无权限”的错误时，就先更改配额
show user;--显示当前用户
Select * from role_sys_privs;--角色拥有的系统权限
Select * from role_tab_privs; --角色拥有的对象权限




