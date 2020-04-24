-- stored procedure to list all products

delimiter //
DROP PROCEDURE IF EXISTS sproc_product_list//

delimiter //
CREATE PROCEDURE sproc_product_list(
)
BEGIN 

/********************************************************************************
-- use this code to test your product listing stored procedure:

call sproc_product_list()

**********************************************************************************/ 
-- list all products
select product_name
	,product_status
	,product_id
from product
order by product_name
;

END // 
DELIMITER ;

-- use this if u want to provide execute access to other mysql user id
-- GRANT EXECUTE ON PROCEDURE sproc_product_list to '<my sql user id>';	
