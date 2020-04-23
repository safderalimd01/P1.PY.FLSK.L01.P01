-- stored procedure for client update

delimiter //
DROP PROCEDURE IF EXISTS sproc_client_dml_upd//

delimiter //
CREATE PROCEDURE sproc_client_dml_upd(
IN iparam_client_id int,
IN iparam_client_name varchar(100),
IN iparam_client_status tinyint,
IN iparam_mobile_phone bigint,
IN iparam_email_address varchar(100),
IN iparam_city varchar(100),

OUT oparam_err_flag int,
OUT oparam_err_step varchar(100),
OUT oparam_err_msg varchar(1000))

BEGIN 

/********************************************************************************
-- use this code to test your update client stored procedure:
set @iparam_client_id = 1;
set @iparam_client_name = 'Bill Gates';
set @iparam_client_status = 0;
set @iparam_mobile_phone =1234567890;
set @iparam_email_address ='me@me.com';
set @iparam_city = 'New York';

call sproc_client_dml_upd
(@iparam_client_id
,@iparam_client_name
,@iparam_client_status
,@iparam_mobile_phone
,@iparam_email_address
,@iparam_city

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
-- update existing client
SET v_step_number = 30;
update `client`
set client_name = iparam_client_name
    ,client_status = iparam_client_status
    ,mobile_phone = iparam_mobile_phone
    ,email_address = iparam_email_address
    ,city = iparam_city
    ,modified_date = now()
where client_id =	iparam_client_id
;


-- =====================================
COMMIT;
-- =====================================

END // 
DELIMITER ;

-- use this if u want to provide execute access to other mysql user id
-- GRANT EXECUTE ON PROCEDURE sproc_client_dml_upd to '<my sql user id>';	