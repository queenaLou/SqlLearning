ALTER TABLE testdatatwo ADD testpre NUMBER(39,6);--������ʾ "numeric precision specifier is out of range (1 to 38)"���־���˵����������Χ��1��38��
ALTER TABLE testdatatwo ADD testnumber NUMBER;--��testdatatwo��������һ��testnumber���������ͣ�������ʾ40����Ч���֣����Ȳ���38��Ϊʲô���������޶�С�����ұ�λ��
INSERT INTO testdatatwo(testnumber) values (6.3);--��ȫ����
INSERT INTO testdatatwo(testnumber) values (123456789123456789.123456789123456789123456789123456789123);--�����浽���ݿ�������������123456789123456789.1234567891234567891235��40������
SELECT LENGTH(testnumber) FROM testdatatwo;--��ʾ���ȷֱ�Ϊ3��40��Ϊ��6.3�ĳ�����3�أ�
ALTER TABLE testdatatwo ADD testprecision NUMBER(3);--���޶�ֵֻ��һ������ʱ��������Ϊ���ȣ���С�����ұ�λ��Ĭ��Ϊ0
INSERT INTO testdatatwo(testprecision) values(1234.56);--������ʾ"value larger than specified precision allowed for this column"ֵ����Ϊ����ָ����������
INSERT INTO testdatatwo(testprecision) values(123.456);--���浽���ݿ�����123
INSERT INTO testdatatwo(testprecision) values(12.3);--���浽���ݿ�����12
ALTER TABLE testdatatwo ADD testpre NUMBER(3,-2);--����Ϊ3��������ȡ�ᵽС������ߵĵڶ�λ
INSERT INTO testdatatwo(testpre) values(123.4);--���浽���ݿ���100
INSERT INTO testdatatwo(testpre) values(254.56);--���浽���ݿ���300


