CREATE TABLE bills(name CHAR(30),amount NUMBER,account_id NUMBER);--����һ����bills���������ֶ�name��amount��account_id
CREATE TABLE bills(name CHAR(30));--������ʾ"name is already used by an existing object"�����������ж���ʹ�ã���ǰ��ռ����Ѵ���һ��bills�����������ظ��Ҳ����뱣������ͬ
CREATE TABLE billsbillsbillsbillsbillsbillsbills(name CHAR(30));--������ʾ"identifier is too long"��ʶ����������Ϊ�������ɳ���30���ַ�
CREATE TABLE _biss(name CHAR(30));--������ʾ"invalid table name"������Ч����Ϊ������һ���ַ���������ĸ
CREATE TABLE bill_#$testw(name CHAR(30));--����ʹ��_,#,$�������ַ���Ϊ������
CREATE TABLE testdatathr(zifuchuan CHAR(511));--���Գ���255���ַ�
SELECT worth,CHR(worth) from collection ;--����֮ǰѧ�����ַ�����CHR

