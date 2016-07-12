CREATE TABLE bills(name CHAR(30),amount NUMBER,account_id NUMBER);--创建一个表bills，有三个字段name，amount，account_id
CREATE TABLE bills(name CHAR(30));--出错，提示"name is already used by an existing object"名称已由现有对象使用，因当前表空间中已存在一个bills表，表名不可重复且不可与保留字相同
CREATE TABLE billsbillsbillsbillsbillsbillsbills(name CHAR(30));--出错，提示"identifier is too long"标识符过长，因为表名不可超过30个字符
CREATE TABLE _biss(name CHAR(30));--出错，提示"invalid table name"表名无效，因为表名第一个字符必须是字母
CREATE TABLE bill_#$testw(name CHAR(30));--可以使用_,#,$这三个字符作为表名称
CREATE TABLE testdatathr(zifuchuan CHAR(511));--可以超过255个字符
SELECT worth,CHR(worth) from collection ;--回忆之前学过的字符函数CHR

