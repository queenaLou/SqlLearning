--Oracle�������е�㲻������ѧϰ
Create Unique Index id_index ON bills(account_id asc,amount asc);--����һ����������Ϊʲô����accountid��������ʾ������
Select * From bills;
Drop Index id_index;
Select * From user_indexes;
Select * From user_segments;