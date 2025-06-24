SELECT * FROM ZeptoSales 
EXEC sp_rename 'dbo.ZeptoSales.Product Name', 'Product_Name', 'column';
EXEC sp_rename 'dbo.ZeptoSales.mrp', 'MRP', 'COLUMN';

 
 
 select * from ZeptoSales;
 
 where MRP IS NULL
 -- to check cout of out of stock ad instock products in which 0 means o ad 1 means yes 
 SELECT 
     OutOfStock,
    COUNT(*) AS CountOfProducts
FROM 
    ZeptoSales
GROUP BY 
    OutOfStock;

	-- to check any product name is used multiple times 
	SELECT 
    Product_Name,
    COUNT(*) AS Occurrences
FROM 
    ZeptoSales
GROUP BY 
    Product_Name
HAVING 
    COUNT(*) > 1;

	--data cleaning
	-- check if there is a product with price = 0
	select * from ZeptoSales 
	where MRP =0 OR discountedSellingPrice = 0;
	--mrp and seliig price are not i rupees so update it
	update ZeptoSales 
	set MRP= MRP/100.0,
	discountedSellingPrice = discountedSellingPrice/100.0

	select * from ZeptoSales;

	--find the best top 10 prodcucts based on MRP
	select top 10 Product_Name,MRP
	from ZeptoSales
	order by MRP DESC;
	 --which products are high in mrp and are outofstock
	 select Product_Name, MRP
	 from ZeptoSales 
	 where outOfStock=1 and MRP> 250; --no product above 250rs is out of stock 
	 select Product_Name,Mrp
	 from ZeptoSales
	 where outOfStock=1 and MRP<250;--but there are 12 products which are below 250 and are out of stock

	 --find the most expensive product or most buyed product
	 select MRP,Product_Name, quantity
	 from ZeptoSales
	 where quantity>1 order by MRP DESC;

