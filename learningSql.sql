create table car (
    id BIGSERIAL primary key,
    name varchar(255),
    model varchar(255),
    production_place TEXT,
    production_date DATE,
    price numeric(16,2),
    is_hybrid bool


);

alter table car add column is_new bool;
alter table car rename column model to car_model;
comment on table car is 'This table holds data of car';
comment on column car.model is 'this column is used for model of car';


INSERT INTO car (name, car_model, production_place, production_date, price, is_hybrid,is_new) VALUES
('Toyota', 'Prius', 'Japan', '2020-01-15', 24000.00, true,true),
('Ford', 'Mustang', 'USA', '2019-05-22', 55000.00, false,true),
('Tesla', 'Model S', 'USA', '2021-06-30', 79999.99, true,true);


UPDATE car set name='BMW' where production_place='USA';

select * from car;

select car_model from car;

select price from car where price>30000;

select * from car where price between 25000 and 100000;
delete from car where name='Ford';
select name, car_model from car where price=23000 or car.is_new=true;

select id, name from car order by price desc;
select id, name from car order by price asc ;
INSERT INTO car (name, car_model, production_place, production_date, price, is_hybrid,is_new) VALUES
('Toyota', 'Prius', 'Japan', '2020-01-15', 24000.00, true,true);
select distinct name from car;


select name as n, now() from car;
