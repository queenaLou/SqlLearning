Select * from session_roles;--��ѯ��ǰ�û�ӵ�еĽ�ɫ
Select * From session_privs;--��ѯ��ǰ�û�ӵ�е�Ȩ��
Select * From system_privilege_map;--��ѯ���е�ϵͳȨ��

Select * From dba_users where username = 'SCOTT';--���û����﷢��SCOTT�û��Ѿ���Ĭ�ϴ���

--�����û�����
Create User newusernew Identified By password1 Default Tablespace mytbs;
Create User robinson Identified By lion Default Tablespace mytbs;

--��newusernew����Ȩ��
Grant Create Session,Create Table To newusernew;--����������
Grant Execute Any Procedure To newusernew With Admin Option;--��Ȩ�޿��ٸ�������

--ʹ��ϵͳȨ��
--��SQL PLUS������newusernew������table��������һ��ʱ���֡��Ա�ռ䡮mytbs����Ȩ�ޡ�����Ϊ��������
Alter User newusernew Quota Unlimited On mytbs;
--������sqlplus�в�����ʹ��Alter Table���һ�У����ٲ���һ�С����ɴ˿ɼ���Create TableȨ�޵��û�Ҳ����ʹ��Alter Table��䣩
--������robinson��create session��Ȩ��ʱ����ʾ��Ȩ�޲���
--����robinson��execute any procedureȨ��

--�鿴ϵͳȨ��
Select * From dba_sys_privs;--��sqlplus�в�ѯ�˾䣬��ʾ�������ͼ�����ڡ���ʵ���ڣ�ֻ��û��Ȩ�޶���
Select * From user_sys_privs;--��sqlplus�в�ѯ�˾䣬��ʾ��ǰ�û���privs��

--����ϵͳȨ��
Revoke Execute Any Procedure From newusernew;--����newusernew��Execute Any ProcedureȨ�ޣ�ϵͳ���������robinson�ġ�
Select * From dba_sys_privs Where grantee = 'NEWUSERNEW';--newusernew��Execute Any ProcedureȨ�ޱ�����
Select * From dba_sys_privs Where grantee = 'ROBINSON';--robinson��Execute Any Procedure��Ȼ����

Drop User newusernew cascade;--ɾ���û�
Drop User robinson cascade;--ɾ���û�



