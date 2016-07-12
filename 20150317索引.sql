--Oracle的索引有点搞不懂，待学习
Create Unique Index id_index ON bills(account_id asc,amount asc);--创建一个索引，但为什么不以accountid的排序显示？？？
Select * From bills;
Drop Index id_index;
Select * From user_indexes;
Select * From user_segments;