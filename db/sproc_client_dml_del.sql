-- stored procedure for client delete

delimiter //
DROP PROCEDURE IF EXISTS sproc_client_dml_del//

delimiter //
CREATE PROCEDURE sproc_client_dml_del(
IN iparam_client_id int,

OUT oparam_err_flag int,
OUT oparam_err_step varchar(100),
OUT oparam_err_msg varchar(1000))

BEGIN 

/********************************************************************************
-- use this code to test your client delete stored procedure:
set @iparam_client_id = 3;

call sproc_client_dml_del
(@iparam_client_id

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

-- step 30
-- depending on your business logic, you might want to physically delete the client or you can set it to inactive
-- you wont be able to physical delete if you have a corresponding client row in sales table

-- step to de-activate the client
SET v_step_number = 30.1;
update client
set client_status =0
	,modified_date = now()
where client_id = iparam_client_id
;

/*
-- step to physically delete the client
SET v_step_number = 30.2;
delete from client
where client_id = iparam_client_id
;
*/
-- =====================================
COMMIT;
-- =====================================

END // 
DELIMITER ;

-- use this if u want to provide execute access to other mysql user id
-- GRANT EXECUTE ON PROCEDURE sproc_client_dml_del to '<my sql user id>';	