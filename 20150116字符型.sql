CREATE TABLE testdatafour(zifuchuan CHAR(2001));--������ʾ"specified length too long for its datatype"ָ���ĳ��ȶ����������Ͷ��Թ���������CHAR��RAW���ͣ����Ȳ�����2000.�����ĳ��Ȳ�����4000
CREATE TABLE testdatafive(zifuchuan CHAR,bumoren CHAR(2000));--����ָ��CHAR�ĳ���ʱ��Ĭ�ϳ���Ϊ1.��zifuchuan�г���Ϊ1
SELECT zifuchuan,LENGTH(zifuchuan) changdu FROM testdatafive;--�عˣ���ʾ�ַ������͵ĳ���
SELECT bumoren,LENGTH(bumoren) changdu FROM testdatafive;--�عˣ����ڳ���Ϊ2000�ģ�����ʾ�ַ�������һ�У�Ϊʲô��
SELECT bumoren,SUBSTR(bumoren,-1999),SUBSTR(bumoren,-2),SUBSTR(bumoren,2) FROM testdatafive;
SELECT zifuchuan,LPAD(zifuchuan,5,'#'),RPAD(zifuchuan,6,'*') FROM testdatafive;--�ع�֮ǰѧ�����ַ�������������
SELECT bumoren,LPAD(bumoren,2001,'#'),RPAD(bumoren,2002,'*') FROM testdatafive;--�����Ѿ���2000���ȵ�CHAR������ֻ��ʾ��һ���Ҳ������ʾΪԭֵ��LPAD��RPAD����ʾ��Ϊʲô��
SELECT zifuchuan,LPAD(zifuchuan,2001,'#'),RPAD(zifuchuan,2002,'*') FROM testdatafive;--���Ϊ��ָ���ĳ��Ȳ���ʾ
