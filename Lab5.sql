/*Lab5*/
/*1*/
select distinct maker
from products p
where type = 'PC' and maker not in
(
    select maker
    from products
    where model in
    (
        select model
        from pc
        where speed < 1200
    )
);

/*2*/
select model,price
from printer
where price >= any (select avg(price) from printer);

/*3*/
select model,price
from pc
where price < all (select price from laptop);

/*4*/
select maker
from products p1
where type = 'LAPTOP' and  not exists
(
    select p2.model
    from laptop l,products p2
    where p2.model = l.model 
    and p1.maker = p2.maker
    and price > 2500
    union
    select p2.model
    from pc,products p2
    where p2.model = pc.model
    and p2.maker = p1.maker
    and price > 2500
    union
    select p2.model
    from printer p,products p2
    where p2.model = p.model
    and p1.maker = p2.maker
    and price > 2500
);

/*5*/
select *
from laptop
where speed < any (select speed from pc);
