ALTER TABLE testdatatwo ADD testpre NUMBER(39,6);--出错提示 "numeric precision specifier is out of range (1 to 38)"数字精度说明符超出范围（1到38）
ALTER TABLE testdatatwo ADD testnumber NUMBER;--往testdatatwo表里增加一列testnumber，数字类型，最多可显示40个有效数字（精度不是38吗，为什么？），不限定小数点右边位数
INSERT INTO testdatatwo(testnumber) values (6.3);--完全保存
INSERT INTO testdatatwo(testnumber) values (123456789123456789.123456789123456789123456789123456789123);--但保存到数据库里是四舍五入123456789123456789.1234567891234567891235共40个数字
SELECT LENGTH(testnumber) FROM testdatatwo;--显示长度分别为3和40，为何6.3的长度是3呢？
ALTER TABLE testdatatwo ADD testprecision NUMBER(3);--当限定值只有一个条件时，此条件为精度，而小数点右边位数默认为0
INSERT INTO testdatatwo(testprecision) values(1234.56);--出错提示"value larger than specified precision allowed for this column"值大于为此列指定的允许精度
INSERT INTO testdatatwo(testprecision) values(123.456);--保存到数据库里是123
INSERT INTO testdatatwo(testprecision) values(12.3);--保存到数据库里是12
ALTER TABLE testdatatwo ADD testpre NUMBER(3,-2);--精度为3，将数字取舍到小数点左边的第二位
INSERT INTO testdatatwo(testpre) values(123.4);--保存到数据库是100
INSERT INTO testdatatwo(testpre) values(254.56);--保存到数据库是300


