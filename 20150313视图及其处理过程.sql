Create Table bills(name Char(30) Not Null,amount Number,account_ID Number Not Null);--����bills��
Create Table bank_accounts(account_ID Number Not Null,account_type Char(30),balance Number,bank Char(30));--����bank_accounts��
Create Table company(name Char(30) Not Null,address Char(50),city Char(30),state Char(2));--����company��
Insert Into bills Values('Debtors Credit Card',35,4);--��bills�����һЩֵ
Insert Into bank_accounts Values(1,'Checking',500,'FirstFederal');--��bank_accounts�����һЩֵ
Insert Into company Values('Debtors Credit Card','115 2nd Avenue','Newark','NJ');--��company�����һЩֵ
Create View bills AS Select * from bills;--��ͼ������������ظ���������ʾ"name is already used by an existing object"�����������ж���ʹ��
Create View debts AS Select * From bills;--������ͼdebts
Select * From debts;
Create View debtsone As Select * From bills where account_ID = 4;--ʹ��Where��䴴����ͼdebtsone
Select * From debtsone;
Create View debtstwo(name1,amount1) As Select name,amount From debts;--����������ͼdebtstwo����������
Select * From debtstwo;
Drop View debts;--ɾ��һ����ͼdebts�������ͼdebtstwo������
Select * From debtstwo;--��ʱ����"%s has errors"��ͼdebtstwo�д���
Create View debts AS Select * From bills;--�ٴδ�����ͼdebts
Create View debtsthr(name,amount) As Select From bills;--����"missing expression"ȱʧ���ʽ��Oracle��֧���Զ����һ����е��ֶ�
Create View company_info(name,fulladdress) AS Select name,address || ' ' || city ||',' || state From company;--����||���ӷ����ַ������ӵ�һ���ֶ���
Select * From company_info;


Select b.NAME,b.AMOUNT,ba.BALANCE,ba.BANK From bills b,bank_accounts ba where b.ACCOUNT_ID = ba.ACCOUNT_ID;--����ͨ��SQL��ѯ�����ϲ���������ѯʱÿ�ζ�����ô�ϲ�
Create View bills_due(name,amount,balance,bank) AS Select b.NAME,b.AMOUNT,ba.BALANCE,ba.BANK From bills b,bank_accounts ba where b.ACCOUNT_ID = ba.ACCOUNT_ID;--�ȴ��������⼸���ֶε���ͼ
Select * From bills_due Where balance > 500;--Ȼ��ֱ�Ӳ�ѯ��ͼ���ɡ�ʵ����ϵͳ�Ȳ��ҽ�bills_due��table��û�ҵ���Ȼ���ҵ�bills_due��view������ִ��Select b.NAME,b.AMOUNT,ba.BALANCE,ba.BANK From bills b,bank_accounts ba where b.ACCOUNT_ID = ba.ACCOUNT_ID And ba.BALANCE > 500;�ʵ�����������ݱ仯ʱ��������Create��ͼ�������Զ�����


--����һ����ͼ����ʾ������Ҫ�����˵����ݣ�ͬʱҪ����ʾÿ���ݵ��˵�����������˵���������
Select Distinct state From company;--��ʾ�˵���Ҫ���͵���
Select Distinct c.state,Count(*) From company c,bills b Where c.name = b.name Group By c.state;--��ʾҪ��������ݵ��˵�����
--Select * From company c,bills b Where c.name = b.name;--�������������֤�Ͼ��count��������Ƿ���ȷ
Select Distinct c.state,Count(b.name),Sum(b.amount) From company c,bills b Where c.name = b.name Group by c.state;--����sum������ʾҪ��������ݵĽ������
Create View example(state,total_bills,total_amount) As Select Distinct c.state,Count(b.name),Sum(b.amount) From company c,bills b Where c.name = b.name Group by c.state;--���Create View������Ӽ���

Select Distinct c.state,Count(b.name),Sum(b.amount) From company c,bills b Group by c.state Having c.name = b.name;--���ﲻ����Having��䣬��Ϊ�����û�л��ܺ���������Oracle����"not a GROUP BY expression"����GroupBy���ʽ





