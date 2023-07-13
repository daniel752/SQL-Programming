/*Targil 3*/

/*1*/
select *
from pc
where PRICE > 1600 AND HD between 10 AND 20;

/*2*/
DROP TABLE Expensive_PC;
CREATE TABLE Expensive_PC
(
Model NUMBER(4) PRIMARY KEY,
Megahertz NUMBER(4),
Ram NUMBER(3),
Gigabytes NUMBER(2),
Price NUMBER(4) NOT NULL
)

INSERT INTO expensive_pc
SELECT *
FROM pc
WHERE price > 1600;

/*3*/
SELECT DISTINCT maker
FROM products
WHERE TYPE = 'PC';

/*4*/
select *
from laptop
where price > 2000 and (screen >= 14 or ram >= 64);

/*5*/
select DISTINCT maker,speed
from products p,laptop l
where p.model = l.model and l.hd > 1;

/*6*/
select p1.model
from pc p1,pc p2
where p1.speed > p2.speed and p2.model = 1001;

/*7*/
select p.model,price
from products p,pc
where p.model = pc.model and p.maker = 'A'
union
select p.model,price
from products p,laptop l
where p.model = l.model and p.maker = 'A'
union
select p.model,price
from products p,printer pr
where p.model = pr.model and p.maker = 'A';

/*8*/
select DISTINCT p1.maker,p1.model
from products p1,products p2
where p1.maker = p2.maker and (p1.type = 'PC' and p2.type = 'LAPTOP')
INTERSECT
select model
from pc
where price > 2000 and speed > 100
union
select model
from laptop
where price > 2000 and speed > 100;

/*9*/
create table copy_dept
(
deptno number(2),
ename varchar2(10),
sal number(4)
)
insert into copy_dept
select deptno,ename,sal
from emp
where deptno = 30 or deptno = 40;

/*10*/
select DISTINCT maker
from products
where type = 'LAPTOP'
minus
select maker
from products
where type = 'PC';

/*11*/
select max(p1.hd)
from pc p1,pc p2
where p1.hd = p2.hd;

/*12*/
select distinct MODEL ,
SPEED ,
RAM ,
HD ,
PRICE 
from pc p1,pc p2
inner join pc p2 on p1.speed = p2.speed and p1.ram = p2.ram; 