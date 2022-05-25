use ContosoRetailDW;

/*
	Using an innerjoin, select the following information:
		productkey,
		unitprice,
		salesquantity,
		salesamount,
		promotionname,
		discountpercent,
		discountquantity,
		discountamount,
		datekey
	for only those sales with a discount amount greater than zero.
*/

select * from factsales 
where DiscountAmount > 0


select 
	t.productname,
	f.unitprice,
	f.salesquantity,
	f.salesamount,
	p.promotionname,
	p.discountpercent,
	f.discountquantity,
	f.discountamount,
	f.datekey
from dimpromotion p, factsales f, dimproduct t
where f.promotionkey = p.promotionkey
and t.productkey = f.productkey
and discountamount > 0

/* Change the select above by using sub-queries for product name, 
	promotion name and discount percent.
*/


select 
	(select t.productname 
	from dimproduct t 
	where t.productkey = f.productkey) as prod,
	f.unitprice,
	f.salesquantity,
	f.salesamount,
	(select p.promotionname from dimpromotion p where p.promotionkey = f.promotionkey) as promo,
	(select p.discountpercent from dimpromotion p where p.promotionkey = f.promotionkey) as disc,
	f.discountquantity,
	f.discountamount,
	f.datekey
from factsales f
where discountamount > 0