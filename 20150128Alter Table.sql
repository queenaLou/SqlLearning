Alter Table testdatathr Add numberlie Number;--��Table���һ���ֶ�
Insert into testdatathr(numberlie) Values (33);--���һ������
Alter Table testdatathr modify numberlie Char(3);--������ʾ"column to be modified must be empty to change datatype"Ҫ��������������Ҫ�޸ĵ��б���Ϊ��
Delete From testdatathr where numberlie is not null;--ɾ��numberlie���յ���
Alter Table testdatathr modify numberlie Char(3);--numberlie����������number���ĳ�char
Insert Into testdatathr(zifuchuan,numberlie) Values(null,333);--���һ�����ݣ�����zifuchuan��Ϊ��
Alter Table testdatathr modify numberlie Char(2);--������ʾ"cannot decrease column length because some value is too big"�޷���С�г�����ΪһЩֵ���󣬵��������ݴ���Ҫ��ĳ���ʱ���Ĳ��ɹ�
Alter Table testdatathr Modify zifuchuan Not Null;--������ʾ"cannot enable (%s.%s) - null values found"�޷�����-�ҵ���ֵ������������null�ĳ�not nullʱ�������п�ֵ
Alter Table testdatathr Modify numberlie Not Null;--û�п�ֵ���ɹ���null�ĳ���not null
Drop Table newtable3;--ɾ��һ��������ʾҲ�޷�����

