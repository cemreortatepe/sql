--select
select * from order_details
select id, name from addresses 

--orderBy
select * from products order by stock;
select * from products order by stock desc;
select * from brands order by name asc;

--where
select * from brands where type='spor';
select * from payments where count >'50000';
select * from discount where type='%20';

-- where IN()
select * from sellers where follower_count in(400,500);
select * from sellers where name in('Zara Aş','nike.aş');
select * from sellers where rating in ('7','8.5','9');

--between
select * from sellers where follower_count between 500 and 1000;
select * from shopping_cart where quantity >=7 and quantity<=15

--and, or, not
select * from brands where type='spor'and name='adidas';
select * from discount where type='%30' or value='100';
select * from discount where not id>4;

--like(%j%)
select * from sellers where name like('%ar%');
select * from sellers where rating like('%8%');
select * from sellers where LOWER(name) like('%za%');
select * from sellers where UPPER(name) like('%A');

--join
select * from products p
     inner join order_details od
     on p.id= od.product_id
     inner join orders o
     on o.id=od.order_id

select od.order_id,s.name from order_details od
     inner join shippers s
	 on od.shipper_id=s.id

select * from countries c
     left join cities ci
	 on c.id=ci.country_id
	 
select * from countries c
     right join cities ci
	 on c.id=ci.country_id
	 
select * from countries c
     full outer join cities ci
	 on c.id=ci.country_id
	 
select s.id,s.name satıcı,p.name ürün_adı,p.stock stok from sellers s
     inner join products_sellers ps
	 on s.id= ps.seller_id
	 inner join products p
	 on p.id=ps.product_id
	 
select p.id,p.name ürün,sc.total_price toplam_fiyat, sc.quantity adet from products p
      inner join shopping_cart_products scp
	  on p.id= scp.products_id
	  inner join shopping_cart sc
	  on scp.shopping_cart_id=sc.id
	 
select c.id,c.name İSİM ,c.surname SOYİSİM,a.name adres,o.quantity miktar from customers c
       left join addresses a
	   on c.id=a.customer_id
	   left join orders o
	   on o.customer_id=c.id
	   
select order_details.order_id siparişId,products.name UrunAdı, customers.name MusteriAdı,
	customers.surname MusteriSoyadı,orders.order_time SiparişTarihi,shippers.name from shippers
		inner join order_details on shippers.id=order_details.shipper_id
		inner join products on order_details.product_id=products.id
		inner join orders on order_details.order_id=orders.id
		inner join customers on orders.customer_id=customers.id

select discount.type indirimOrani,products.name Urun, products.unit_price urunFiyatı from discount
	inner join orders on discount.id=orders.discount_id
	inner join customers on orders.customer_id=customers.id
	inner join order_details on order_details.order_id=orders.id
	inner join products on order_details.product_id=products.id







