SELECT bumoren,LENGTH（bumoren) changdu FROM testdatafive;
CREATE TABLE bianliangbiao(bianliang VARCHAR);--出错提示"missing left parenthesis"缺失左括号。因为VARCHAR类型必须得赋予变量长度，这个变量长度只是变量的最大长度而非实际赋值长度，且不用空格填充
CREATE TABLE bianliangbiao(bianliang VARCHAR(4001));--出错提示"specified length too long for its datatype"指定的长度对于数据类型而言过长。因为VARCHAR类型的变量长度不可超过4000
CREATE TABLE bianliangbiao(bianliang VARCHAR(2),bianliang2 VARCHAR(200),bianliang3 VARCHAR(4000));--创建一个变量表
INSERT INTO bianliangbiao(bianliang) values ('nihao'); --出错提示"value too large for column %s (actual: %s, maximum: %s)"列"TBSUSER"."BIANLIANGBIAO"."BIANLIANG"的值太大（实际值：5，最大值：2）
INSERT INTO bianliangbiao(bianliang,bianliang2) VALUES ('n','ihao');
SELECT bianliang,LENGTH(bianliang),bianliang2,LENGTH(bianliang2)FROM bianliangbiao;--发现VARCHAR不用空格填充