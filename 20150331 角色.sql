Create User nopsw Identified Externally;--����һ����������û�����sql plus�б�����������룬����sql plus���ò���
Alter User nopsw Identified By nopsw;--�����û�����Ϊnopsw����½sql plus���Ǳ��ܣ���ʾ��user NOPSW lacks CREATE SESSION privilege;logon denied
Grant Connect to nopsw;--����Connect��ɫ�����������ӣ�����sql plus������û��������룬��¼��ȥ�ˣ���select * from account���س�����ʾ��ORA-00942:�����ͼ������
Grant Resource to nopsw;--����resource��ɫ���ǳ�������Ĵ�����ʾ��
Grant DBA to nopsw;--���ǳ�������Ĵ�����ʾ������������û��д���������û���ԭ��
Select * From tbsuser.account;--д���˱����ڵ��û����ɡ�ֻ���û���dba�Ľ�ɫ�Ϳ���select��
Revoke Resource From nopsw;--��ȡ��resource��Ȩ�����򿪷���
Select * From user_role_privs;--��sql plus�ϲ�ѯ��ǰnopsw�û���Ȩ�ޣ�������session_privs;�����ѯ��ǰ�û��Ľ�ɫ����session_roles;
Select * From user_users;--�ɲ鵽username,tablespace������
revoke dba from nopsw;
Grant DBA to nopsw;--����DBAȨ�ޣ����ݿ��������δʹ��With Admin Option������nopsw�û����ܽ��˽�ɫ���������û���������ʾ��ORA-01932��ADMIN ѡ��δ��Ȩ����ɫ'DBA'��resource��connectҲ������Ӧ��ʾ
Grant Connect to nopsw With Admin Option;--ʹ��With Admin Option��nopsw���Խ��˽�ɫ���������û�
Create User newusernew Identified By password1;--����һ�û�
--�����û�����connect�Ľ�ɫ���˳���¼���û���Select * From Session_privs;(����������鿴��ǰ�û�ӵ��ʲôȨ�ޣ�
  --ֻ��Create Session
--�����û�����resource��ɫ���ٲ鿴������unlimited tablespace��create table��Ȩ��
--�ٸ���dba��ɫ���ٲ鿴������create user��Ȩ��
Grant DBA to newusernew;--��nopsw��½������newusernew DBA�Ľ�ɫ
Revoke DBA From newusernew;--����newusernew DBA�Ľ�ɫ
Drop User newusernew;--ɾ���û�newusernew
Drop User newnew;

--identified externally
Select * From dba_users;
Alter User nopsw Identified Externally;--�����û����ĳ�externally֮��������sql plus��ǻ�����developer�ﴴ�����Ӷ���֪����ô�ô��û�
Alter User newusernew Identified by password1;

--�鿴resource��connect��ɫ������
select grantee,privilege from dba_sys_privs where grantee='RESOURCE' OR GRANTEE LIKE 'CONNECT%'

--�ڴ���userʱ��ʡ��default tablespace��temporary tablespace������database_properties��Ĳ���������
select * from database_properties where property_name like 'DEFAULT%';

--��ѯ��ǰ�û���ӵ�е�Ȩ�޺ͽ�ɫ
Select * from session_privs;
Select * From session_roles;


--�鿴�û���ռ����
Select * From dba_ts_quotas;--dba_ts_quotas�Ǳ�ռ���û����ı�
Select username,tablespace_name,max_bytes/1024/1024 "Max MB" From dba_ts_quotas Where username = 'NEWUSER';--��ѯnewuser�û��ı�ռ���ע�����ݿ������ִ�Сд��

--�鿴�ض��������û�ӵ�еĶ���
Select * From dba_objects Where owner = 'TBSUSER';--��ѯ�û�TBSUSER��dba_objectsӵ�еĶ���
Select owner,object_name,object_type From dba_objects Where owner = 'TBSUSER';





