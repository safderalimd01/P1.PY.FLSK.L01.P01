-- stored procedure for client insert

delimiter //
DROP PROCEDURE IF EXISTS sproc_client_dml_ins//

delimiter //
CREATE PROCEDURE sproc_client_dml_ins(

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
-- use this code to test your client insert stored procedure:
set @iparam_client_name = 'Bush Senior';
set @iparam_client_status = 1;
set @iparam_mobile_phone =1234567899;
set @iparam_email_address ='me.bush@me.com';
set @iparam_city = 'Dallas';

call sproc_client_dml_ins
(@iparam_client_name
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
-- add/insert new client
SET v_step_number = 30;
insert into client
	(client_name
    ,client_status
    ,mobile_phone
    ,email_address
    ,city)
values (
	iparam_client_name
    , iparam_client_status
    ,iparam_mobile_phone
    ,iparam_email_address
    ,iparam_city)
;
-- =====================================
COMMIT;
-- =====================================

END // 
DELIMITER ;

-- use this if u want to provide execute access to other mysql user id
-- GRANT EXECUTE ON PROCEDURE sproc_client_dml_ins to '<my sql user id>';	