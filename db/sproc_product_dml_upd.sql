-- stored procedure for product update

delimiter //
DROP PROCEDURE IF EXISTS sproc_product_dml_upd//

delimiter //
CREATE PROCEDURE sproc_product_dml_upd(
IN iparam_product_id int,
IN iparam_product_name varchar(100),
IN iparam_product_status tinyint,

OUT oparam_err_flag int,
OUT oparam_err_step varchar(100),
OUT oparam_err_msg varchar(1000))

BEGIN 

/********************************************************************************
-- use this code to test your update product stored procedure:
set @iparam_product_id = 1;
set @iparam_product_name = 'Python for Dummies';
set @iparam_product_status = 0;

call sproc_product_dml_upd
(@iparam_product_id
,@iparam_product_name
,@iparam_product_status

,@oparam_err_flag 
,@oparam_err_step 
,@oparam_err_msg);

select @oparam_err_flag, @oparam_err_step, @oparam_err_msg;
**********************************************************************************/ 

-- step 10
-- declare local variables
declare v_step_number int;

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

-- step 30
-- update existing product
SET v_step_number = 30;
update product
set product_name = iparam_product_name
    ,product_status = iparam_product_status
    ,modified_date = now()
where product_id =	iparam_product_id
;

-- =====================================
COMMIT;
-- =====================================

END // 
DELIMITER ;

-- use this if u want to provide execute access to other mysql user id
-- GRANT EXECUTE ON PROCEDURE sproc_product_dml_upd to '<my sql user id>';	