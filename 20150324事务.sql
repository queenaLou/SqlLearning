--����
--�����ݿ��ﴴ��
Create Table account(name Varchar(30),balance Number);--����һ��table
Insert into account Values('a',10000);--������������
Insert into account Values('b',20000);

--��sqlplus�в鿴autocommit��״̬
Show autocommit;--��Ϊoff�������ֶ����������ύ����Ϊimmediate������sqlplus��ÿдһ�а�һ��enter�����Զ�commit
--��sqlplus������autocommit��״̬
Set autocommit off;--����set autocommit on������set autocommit 0/1��ע��û�еȺ�

--����sqlplus��a��bת��
Set Transaction isolation level read committed;--��ʼһ��������������ȼ�Ϊread committed����oracle��set transaction����һ����������read only��isolation level read committed��
Update account Set balance = balance - 100 Where name = 'a';
Update account Set balance = balance + 100 Where name = 'b';
Commit;--�������������һ��ִ��ʧ�ܣ���������䶼��ִ�С�

--��sqlplus��ʹ��ֻ�������ǲ�����ɾ�ĵ�
Set Transaction Read Only;
Update account Set balance = balance - 100 Where name = 'a';
Update account Set balance = balance + 100 Where name = 'b';
Commit;--����������ύ����ʾ"may not perform insert/delete/update operation inside a READ ONLY transaction"������READ ONLY��������ִ�в���/ɾ��/���²���

--��sqlplus����д�����ݣ��볷�����������һ��ʹ��Rollback�ع�
Set Transaction isolation level read committed;
Update account Set balance = balance - 100 Where name = 'a';
Update account Set balance = balance + 100 Where name = 'b';
Rollback;--�ع���������䶼��ִ��

--sqlplus����������ʹ�ñ���㣬����commit
Set Transaction Isolation Level Read Committed;
Insert Into account Values('d',21000);
Savepoint sp;
Rollback to Savepoint sp;--ע��Rollback��Commit��������Ľ�����䣬��Rollback To Savepoint���ǣ�������������Commit��Rollback��
Commit;

