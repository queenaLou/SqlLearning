--����Ȩ��
--�����û�����
Create User newusernew Identified By password1 Default Tablespace mytbs;
Create User robinson Identified By lion Default Tablespace mytbs;

--�������Ȩ��
--������ϵͳȨ��Create Session��ͨ��SqlPlus����
Grant Create Session To newusernew;
--������account���selectȨ��
Grant Select ON account To newusernew With Grant Option;
--��newusernew��½SqlPlus��ʹ�ö���Ȩ��
Select * From account;--��ʾ�������ͼ�����ڡ�
Select * From tbsuser.account;--OK���ɴ˿ɼ�����ʹ����select��Ȩ�ޣ��ڶ���ǰҲ�ü��϶���ӵ����
--��sqlplus�︳��robinson�Զ���account��selectȨ��
Grant Select On tbsuser.account To robinson;--�ǵü��϶���ӵ����
Grant Select��name) On tbsuser.account To robinson;--selectȨ�޲���ָ���У���ʾ��ȱʧON�ؼ���

Grant Update(name) On account To newusernew With Grant Option;--Ϊnewusernew����update account���name��
--��sqlplus�︳��robinson�Զ���account��selectȨ��
Grant Update(name) On tbsuser.account To robinson;



--�������
Drop User newusernew cascade;
Drop User robinson cascade;


