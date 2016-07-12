--对象权限
--创建用户备用
Create User newusernew Identified By password1 Default Tablespace mytbs;
Create User robinson Identified By lion Default Tablespace mytbs;

--授予对象权限
--先授予系统权限Create Session以通过SqlPlus连接
Grant Create Session To newusernew;
--再授予account表的select权限
Grant Select ON account To newusernew With Grant Option;
--用newusernew登陆SqlPlus，使用对象权限
Select * From account;--提示“表或视图不存在”
Select * From tbsuser.account;--OK。由此可见，即使有了select的权限，在对象前也得加上对象拥有者
--在sqlplus里赋予robinson对对象account的select权限
Grant Select On tbsuser.account To robinson;--记得加上对象拥有者
Grant Select（name) On tbsuser.account To robinson;--select权限不让指定列，提示，缺失ON关键字

Grant Update(name) On account To newusernew With Grant Option;--为newusernew授予update account表的name列
--在sqlplus里赋予robinson对对象account的select权限
Grant Update(name) On tbsuser.account To robinson;



--清除数据
Drop User newusernew cascade;
Drop User robinson cascade;


