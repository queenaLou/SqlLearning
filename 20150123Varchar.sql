SELECT bumoren,LENGTH��bumoren) changdu FROM testdatafive;
CREATE TABLE bianliangbiao(bianliang VARCHAR);--������ʾ"missing left parenthesis"ȱʧ�����š���ΪVARCHAR���ͱ���ø���������ȣ������������ֻ�Ǳ�������󳤶ȶ���ʵ�ʸ�ֵ���ȣ��Ҳ��ÿո����
CREATE TABLE bianliangbiao(bianliang VARCHAR(4001));--������ʾ"specified length too long for its datatype"ָ���ĳ��ȶ����������Ͷ��Թ�������ΪVARCHAR���͵ı������Ȳ��ɳ���4000
CREATE TABLE bianliangbiao(bianliang VARCHAR(2),bianliang2 VARCHAR(200),bianliang3 VARCHAR(4000));--����һ��������
INSERT INTO bianliangbiao(bianliang) values ('nihao'); --������ʾ"value too large for column %s (actual: %s, maximum: %s)"��"TBSUSER"."BIANLIANGBIAO"."BIANLIANG"��ֵ̫��ʵ��ֵ��5�����ֵ��2��
INSERT INTO bianliangbiao(bianliang,bianliang2) VALUES ('n','ihao');
SELECT bianliang,LENGTH(bianliang),bianliang2,LENGTH(bianliang2)FROM bianliangbiao;--����VARCHAR���ÿո����