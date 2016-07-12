update collection set item = 'check',worth = 200 where item = 'supermans cape';--更改一个记录的多个字段
update collection set worth = 200;--若没有where语句，那这个字段的所有数据都被更新掉。一定要注意
delete from collection where worth < 199;--没有确认删除的提示，直接就删除了；
delete from blank;--若不使用where语句，所有记录被删除
insert into collection values('chia pet',5,'wedding gift');
insert into collection values('trs model III',50,'first computer');
insert into blank(column1,column2,column3) select item,worth,remarks from collection;
update blank set column2 = 6 where column1 = 'chia pet';
update blank set column2 = 66 where column1 = 'trs model III';
insert into collection select * from blank;--在原来的数据里顺序插入，若与原来数据重复且设置了unique属性，会弹出错误。若blank里的列小于collection的列弹出错误："not enough values"
drop table blank;--删除表
create table blank(column1 char(100),column2 number,column3 char(100));--创建表
insert into collection select * from collection;--出错，INSERT 语句中的表不能与 FROM 中的表相同
delete * from collection;--加一个*号，出错，提示"invalid table name"
rollback;--撤销上一次操作
update collection set item = 'howw' set worth = 300;--两个set，出错，提示"SQL command not properly ended"
insert into collection(item) values('23');--赋予一个不对应的数据类型，提示："SQL command not properly ended"

--下面进入创建数据库的学习
CREATE DATABASE mydatabase;--出错，提示“数据库已装载”，原因正在查找



