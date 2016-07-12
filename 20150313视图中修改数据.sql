Create View late_payment As Select * From bills;--���Ƴٸ�������ծȨ�ˣ�ծ����������10%����ѣ��ʴ���һ����ͼ
Update late_payment Set amount = amount * 1.1;--�����·���
Select * From late_payment;
Select * From bills;--ע���������ͼ�������е�����Ҳ�仯��
Insert Into late_payment values('hook',60,3);--����ͼ�в���һ��
Delete From late_payment where name = 'hook';--����ͼ��ɾ��һ��

Create View multiple_table As Select b.name,b.amount,ba.balance,ba.account_type From bills b,bank_accounts ba Where b.account_id = ba.ACCOUNT_ID;--����һ�������ͼ
Select * From multiple_table;
Delete From multiple_table Where name = 'hook';--�����ͼ����ʹ��delete��䣬��ʾ"cannot delete from view without exactly one key-preserved table"���ܴ�û��һ����ֵ��������ͼ��ɾ��
Update multiple_table Set balance = balance + 1,amount = amount + 1;--���µ����ݲ���ͬһ���������ʾ"cannot modify a column which maps to a non key-preserved table"�޷��޸���Ǽ�ֵ������Ӧ����
Update multiple_table Set balance = balance + 1,account_type = account_type || 'a';--���µ�������ͬһ�������������ʾ���޷��޸���Ǽ�ֵ������Ӧ���С�

Create View dis_view As Select Distinct b.name,b.amount,ba.account_type From bills b,bank_accounts ba;--����һ��ʹ��distinct��view
Update dis_view Set amount = amount + 1;--����ڴ�����ͼʱʹ����Distinct�Ӿ䣬���ܲ���͸��������ͼ�ļ�¼����ʾ"data manipulation operation not legal on this view"����ͼ�����ݲ��ݲ����Ƿ�

--�ҳ����з�����������ݵ��˵��������100��Ԫ�����е�����
Select b.name,b.amount,c.state,ba.bank From bills b,company c,bank_accounts ba Where b.amount < 100 and c.state = 'FL' and b.name = c.name and b.account_id = ba.account_id;--������ǰ�ķ�ʽֱ�Ӳ�ѯ
Create View bills1(name,amount,account_id) As Select bills.* From bills,company where bills.name = company.name and company.state = 'FL';--���ҳ����з���FL���˵�
Select * From bills1;
Create View bills2 As Select * From bills where amount < 100;--���ҳ��˵��н��С��100��Ԫ�ļ�¼
Select * From bills2;
Create View bills3 As Select * From bills2 Where name IN(Select name From bills1);--��IN���ҳ�����FL���˵�����100��Ԫ�ļ�¼
Select * From bills3;
Create View banks_in_FL(name,amount,bank) As Select b3.name,b3.amount,ba.bank From bank_accounts ba,bills3 b3 Where ba.account_id = b3.account_id;--����bank_accounts��bills3���ɵó�
Select * From banks_in_FL;--��ͼbanks_in_FL��Ϊ���յĽ��

Create View companyview As Select * From company;
Drop View companyview;--ɾ����ͼDrop View
