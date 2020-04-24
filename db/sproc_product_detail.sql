-- stored procedure to get details of a given product

delimiter //
DROP PROCEDURE IF EXISTS sproc_product_detail//

delimiter //
CREATE PROCEDURE sproc_product_detail(
IN iparam_product_id int,

OUT oparam_err_flag int,
OUT oparam_err_step varchar(100),
OUT oparam_err_msg varchar(1000))

BEGIN 

/********************************************************************************
-- use this code to test your product delete stored procedure:
set @iparam_product_id = 3;

call sproc_product_detail
(@iparam_product_id

,@oparam_err_flag 
,@oparam_err_step 
,@oparam_err_msg);

select @oparam_err_flag, @oparam_err_step, @oparam_err_msg;
**********************************************************************************/ 

-- step 10
-- declare local variables
declare v_step_number decimal(5,2);

-- error handling
DECLARE exit handler for sqlexception , sqlwarning
BEGIN
     
	 ROLLBACK;

	 GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	 @errno = MYSQL_ERRNO, @errtext = MESSAGE_TEXT;

	set oparam_err_flag = 1;

	set oparam_err_step  = concat('error in step: ',v_step_number);

	set oparam_err_msg = @errtext;

END;  


-- step 20
-- initialize variables  
SET v_step_number = 20; 
set oparam_err_flag = 0;

-- =====================================
START TRANSACTION;
-- =====================================

-- get produc details
SET v_step_number = 30;
select product_id
	,product_name
    ,product_status
from product
where product_id = iparam_product_id
;

-- =====================================
COMMIT;
-- =====================================

END // 
DELIMITER ;

-- use this if u want to provide execute access to other mysql user id
-- GRANT EXECUTE ON PROCEDURE sproc_product_detail to '<my sql user id>';	