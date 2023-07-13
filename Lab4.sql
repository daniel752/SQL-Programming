/*Lab4*/
/*a*/
select avg(speed)
from pc;

/*b*/
select avg(speed)
from laptop
where price > 2500;

/*c*/
select avg(price)
from pc
where model in
    (select model
    from products
    where maker = 'A');
    
/*d*/
select avg(price)
from pc
where model in
    (select model
    from products
    where maker = 'D')
union
select avg(price)
from laptop
where model in
    (select model
    from products
    where maker = 'D');

/*e*/
select speed,avg(price)
from pc
group by speed;

/*f*/
select p.maker,avg(l.screen)
from products p,laptop l
where p.model = l.model
group by maker;

/*g*/
select maker,count(pc.model)
from products p,pc
where p.model = pc.model
group by maker
having count(pc.model) > 2;

/*h*/
select maker,max(pc.price)
from products p,pc
where p.model = pc.model
group by maker;

/*i*/
select speed,avg(price)
from pc
where speed > 150
group by speed;

/*j*/
select avg(hd),p.maker
from pc,
    (select distinct p1.maker,p1.model
    from products p1,products p2
    where p1.maker = p2.maker and p1.type= 'PC' and p2.type = 'PRINTER')p
where pc.model = p.model
group by p.maker;
