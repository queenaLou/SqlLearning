Create Table bills(name Char(30) Not Null,amount Number,account_ID Number Not Null);--创建bills表
Create Table bank_accounts(account_ID Number Not Null,account_type Char(30),balance Number,bank Char(30));--创建bank_accounts表
Create Table company(name Char(30) Not Null,address Char(50),city Char(30),state Char(2));--创建company表
Insert Into bills Values('Debtors Credit Card',35,4);--给bills表插入一些值
Insert Into bank_accounts Values(1,'Checking',500,'FirstFederal');--给bank_accounts表插入一些值
Insert Into company Values('Debtors Credit Card','115 2nd Avenue','Newark','NJ');--给company表插入一些值
Create View bills AS Select * from bills;--视图名不可与表名重复，出错提示"name is already used by an existing object"名称已由现有对象使用
Create View debts AS Select * From bills;--创建视图debts
Select * From debts;
Create View debtsone As Select * From bills where account_ID = 4;--使用Where语句创建视图debtsone
Select * From debtsone;
Create View debtstwo(name1,amount1) As Select name,amount From debts;--创建二级视图debtstwo并更改列名
Select * From debtstwo;
Drop View debts;--删除一级视图debts则二级视图debtstwo无意义
Select * From debtstwo;--这时出错"%s has errors"视图debtstwo有错误
Create View debts AS Select * From bills;--再次创建视图debts
Create View debtsthr(name,amount) As Select From bills;--出错"missing expression"缺失表达式，Oracle不支持自动查找基表中的字段
Create View company_info(name,fulladdress) AS Select name,address || ' ' || city ||',' || state From company;--可用||连接符将字符串连接到一个字段里
Select * From company_info;


Select b.NAME,b.AMOUNT,ba.BALANCE,ba.BANK From bills b,bank_accounts ba where b.ACCOUNT_ID = ba.ACCOUNT_ID;--用普通的SQL查询方法合并两个表，查询时每次都得这么合并
Create View bills_due(name,amount,balance,bank) AS Select b.NAME,b.AMOUNT,ba.BALANCE,ba.BANK From bills b,bank_accounts ba where b.ACCOUNT_ID = ba.ACCOUNT_ID;--先创建包含这几个字段的视图
Select * From bills_due Where balance > 500;--然后直接查询视图即可。实际上系统先查找叫bills_due的table，没找到，然后找到bills_due的view，重新执行Select b.NAME,b.AMOUNT,ba.BALANCE,ba.BANK From bills b,bank_accounts ba where b.ACCOUNT_ID = ba.ACCOUNT_ID And ba.BALANCE > 500;故当基表里的数据变化时不必重新Create视图，它会自动更新


--创建一个视图以显示所有需要发送账单的州，同时要求显示每个州的账单金额总数和账单的总数。
Select Distinct state From company;--显示账单需要发送的州
Select Distinct c.state,Count(*) From company c,bills b Where c.name = b.name Group By c.state;--显示要发往这个州的账单总数
--Select * From company c,bills b Where c.name = b.name;--可以用这个来验证上句的count函数结果是否正确
Select Distinct c.state,Count(b.name),Sum(b.amount) From company c,bills b Where c.name = b.name Group by c.state;--加入sum函数显示要发往这个州的金额总数
Create View example(state,total_bills,total_amount) As Select Distinct c.state,Count(b.name),Sum(b.amount) From company c,bills b Where c.name = b.name Group by c.state;--最后将Create View语句连接即可

Select Distinct c.state,Count(b.name),Sum(b.amount) From company c,bills b Group by c.state Having c.name = b.name;--这里不可用Having语句，因为语句里没有汇总函数，所以Oracle弹出"not a GROUP BY expression"不是GroupBy表达式





