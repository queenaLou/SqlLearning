Create View late_payment As Select * From bills;--因推迟付款导致你的债权人（债主）增加了10%服务费，故创建一个视图
Update late_payment Set amount = amount * 1.1;--并更新费用
Select * From late_payment;
Select * From bills;--注意更改了视图，基表中的数据也变化了
Insert Into late_payment values('hook',60,3);--在视图中插入一行
Delete From late_payment where name = 'hook';--在视图中删除一行

Create View multiple_table As Select b.name,b.amount,ba.balance,ba.account_type From bills b,bank_accounts ba Where b.account_id = ba.ACCOUNT_ID;--创建一个多表视图
Select * From multiple_table;
Delete From multiple_table Where name = 'hook';--多表视图不能使用delete语句，提示"cannot delete from view without exactly one key-preserved table"不能从没有一个键值保存表的视图中删除
Update multiple_table Set balance = balance + 1,amount = amount + 1;--更新的数据不在同一个物理表，提示"cannot modify a column which maps to a non key-preserved table"无法修改与非键值保存表对应的列
Update multiple_table Set balance = balance + 1,account_type = account_type || 'a';--更新的数据在同一个物理表，但仍提示“无法修改与非键值保存表对应的列”

Create View dis_view As Select Distinct b.name,b.amount,ba.account_type From bills b,bank_accounts ba;--创建一个使用distinct的view
Update dis_view Set amount = amount + 1;--如果在创建视图时使用了Distinct子句，则不能插入和更新这个视图的记录。提示"data manipulation operation not legal on this view"此视图的数据操纵操作非法

--找出所有发往弗洛里达州的账单金额少于100美元的银行的名字
Select b.name,b.amount,c.state,ba.bank From bills b,company c,bank_accounts ba Where b.amount < 100 and c.state = 'FL' and b.name = c.name and b.account_id = ba.account_id;--按照以前的方式直接查询
Create View bills1(name,amount,account_id) As Select bills.* From bills,company where bills.name = company.name and company.state = 'FL';--先找出所有发往FL的账单
Select * From bills1;
Create View bills2 As Select * From bills where amount < 100;--再找出账单中金额小于100美元的记录
Select * From bills2;
Create View bills3 As Select * From bills2 Where name IN(Select name From bills1);--用IN查找出发往FL且账单少于100美元的记录
Select * From bills3;
Create View banks_in_FL(name,amount,bank) As Select b3.name,b3.amount,ba.bank From bank_accounts ba,bills3 b3 Where ba.account_id = b3.account_id;--联合bank_accounts和bills3即可得出
Select * From banks_in_FL;--视图banks_in_FL即为最终的结果

Create View companyview As Select * From company;
Drop View companyview;--删除视图Drop View
