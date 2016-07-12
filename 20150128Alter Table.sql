Alter Table testdatathr Add numberlie Number;--给Table添加一个字段
Insert into testdatathr(numberlie) Values (33);--添加一行数据
Alter Table testdatathr modify numberlie Char(3);--出错提示"column to be modified must be empty to change datatype"要更改数据类型则要修改的列必须为空
Delete From testdatathr where numberlie is not null;--删除numberlie不空的行
Alter Table testdatathr modify numberlie Char(3);--numberlie数据类型由number更改成char
Insert Into testdatathr(zifuchuan,numberlie) Values(null,333);--添加一行数据，其中zifuchuan列为空
Alter Table testdatathr modify numberlie Char(2);--出错提示"cannot decrease column length because some value is too big"无法减小列长度因为一些值过大，当已有数据大于要变的长度时更改不成功
Alter Table testdatathr Modify zifuchuan Not Null;--出错提示"cannot enable (%s.%s) - null values found"无法启用-找到空值。当将此列由null改成not null时，不能有空值
Alter Table testdatathr Modify numberlie Not Null;--没有空值，成功将null改成了not null
Drop Table newtable3;--删除一个表，无提示也无法撤销

