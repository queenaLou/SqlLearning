--事务
--在数据库里创建
Create Table account(name Varchar(30),balance Number);--创建一个table
Insert into account Values('a',10000);--插入两行数据
Insert into account Values('b',20000);

--在sqlplus中查看autocommit的状态
Show autocommit;--若为off，则是手动控制事务提交；若为immediate，则在sqlplus中每写一行按一下enter都会自动commit
--在sqlplus中设置autocommit的状态
Set autocommit off;--或者set autocommit on；或者set autocommit 0/1；注意没有等号

--如在sqlplus中a给b转账
Set Transaction isolation level read committed;--开始一个事务，设置事务等级为read committed。在oracle中set transaction得有一个参数，如read only，isolation level read committed等
Update account Set balance = balance - 100 Where name = 'a';
Update account Set balance = balance + 100 Where name = 'b';
Commit;--事务结束。当有一条执行失败，则两条语句都不执行。

--在sqlplus中使用只读事务，是不能增删改的
Set Transaction Read Only;
Update account Set balance = balance - 100 Where name = 'a';
Update account Set balance = balance + 100 Where name = 'b';
Commit;--将这个事务提交后，提示"may not perform insert/delete/update operation inside a READ ONLY transaction"不能再READ ONLY事务处理中执行插入/删除/更新操作

--在sqlplus中若写错数据，想撤销，则在最后一句使用Rollback回滚
Set Transaction isolation level read committed;
Update account Set balance = balance - 100 Where name = 'a';
Update account Set balance = balance + 100 Where name = 'b';
Rollback;--回滚。两条语句都不执行

--sqlplus，在事务中使用保存点，必须commit
Set Transaction Isolation Level Read Committed;
Insert Into account Values('d',21000);
Savepoint sp;
Rollback to Savepoint sp;--注：Rollback和Commit都是事务的结束语句，但Rollback To Savepoint不是，必须在其后加入Commit或Rollback。
Commit;

