Create User newusernew Identified By password1;
Grant Connect to newusernew;
Grant Resource to newusernew;
Grant dba to newusernew;
revoke resource,dba from newusernew;
revoke resource from newusernew;
Alter user newusernew default tablespace mytbs;
select * from account;
select grantee,privilege from dba_sys_privs where grantee='RESOURCE' OR GRANTEE LIKE 'CONNECT%'--�Ƚ�connect��resource��ɫ��Ȩ�޲��
select * from database_properties where property_name like 'DEFAULT%';--�鿴ϵͳ��default
Select * From dba_objects Where OWNER = 'tbsuser';
Select * From SYSTEM_PRIVILEGE_MAP;--Oracle�е�ϵͳȨ��
Select * from newusernew.newtab;
Insert into newusernew.newtab(tname) Values('cbd');
drop user newusernew cascade;--cascade��ɾ����������û����������
Create Table newusernew.nta(tna varchar(10));
Insert into newusernew.nta(tna) values('cnc');
create table newnew.nta(ttna varchar(10));
insert into newnew.nta(ttna) values('cn');
Alter user newnew default tablespace mytbs;
select * from dba_ts_quotas;
Alter User newusernew Quota UNLIMITED On mytbs;
alter user newnew quota unlimited on mytbs;--�����֡��Ա�ռ� 'MYTBS' ��Ȩ�ޡ��Ĵ���ʱ�����ȸ������
show user;--��ʾ��ǰ�û�
Select * from role_sys_privs;--��ɫӵ�е�ϵͳȨ��
Select * from role_tab_privs; --��ɫӵ�еĶ���Ȩ��




