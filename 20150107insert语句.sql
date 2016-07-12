select * from collection;
Insert into collection values('supermans cape',250,'tugged on it');--insert values语句不需要写清哪一列，sql会把数据添入相应的列号中
insert into collection values('diyilie','','disanlie');--数据不能为空，可以为''，引号间没有空格
insert into collection values('first',null,'third');--或者直接用null表示
insert into collection values('',200,'shishi');--第一列设置为NOT NULL，则在插入时若赋予空值，提示"cannot insert NULL into (%s)"
select * from collection where worth is null;--可通过is null检索出刚刚插入的那条记录
insert into collection values('supermans cape',260,'hug');--item列设置里唯一项的约束条件，所以当插入重复数据时会提示违反唯一约束条件"unique constraint (%s.%s) violated"
if not exists(select * from collection where item = 'supermans cape') insert into collections values('supermans cape',260,'hug');--oracle 并不支持此语句，提示未知的命令
insert into blank(column1) select item from collection;--对于已经创建的blank表，将collection表中的item列插入到其char类型列
insert into blank(column2) select item from collection;--可以将number列插入到char类型列，但反之出错："invalid number"
update collection set worth = 220 where item = 'first';--update基本语法。其中char类型必须有''，而number类型不需要