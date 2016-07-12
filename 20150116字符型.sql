CREATE TABLE testdatafour(zifuchuan CHAR(2001));--出错，提示"specified length too long for its datatype"指定的长度对于数据类型而言过长。对于CHAR和RAW类型，长度不大于2000.其他的长度不大于4000
CREATE TABLE testdatafive(zifuchuan CHAR,bumoren CHAR(2000));--当不指定CHAR的长度时，默认长度为1.故zifuchuan列长度为1
SELECT zifuchuan,LENGTH(zifuchuan) changdu FROM testdatafive;--回顾，显示字符串类型的长度
SELECT bumoren,LENGTH(bumoren) changdu FROM testdatafive;--回顾，对于长度为2000的，不显示字符函数这一列，为什么？
SELECT bumoren,SUBSTR(bumoren,-1999),SUBSTR(bumoren,-2),SUBSTR(bumoren,2) FROM testdatafive;
SELECT zifuchuan,LPAD(zifuchuan,5,'#'),RPAD(zifuchuan,6,'*') FROM testdatafive;--回顾之前学过的字符函数，左填补右填补
SELECT bumoren,LPAD(bumoren,2001,'#'),RPAD(bumoren,2002,'*') FROM testdatafive;--对于已经是2000长度的CHAR来讲，只显示这一列且不填充显示为原值，LPAD和RPAD不显示，为什么？
SELECT zifuchuan,LPAD(zifuchuan,2001,'#'),RPAD(zifuchuan,2002,'*') FROM testdatafive;--填充为所指定的长度并显示
