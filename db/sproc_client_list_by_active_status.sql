-- stored procedure to list active or inactive clients

delimiter //
DROP PROCEDURE IF EXISTS sproc_client_list_by_active_status//

delimiter //
CREATE PROCEDURE sproc_client_list_by_active_status(
IN iparam_client_status tinyint,

OUT oparam_err_flag int,
OUT oparam_err_step varchar(100),
OUT oparam_err_msg varchar(1000)
)
BEGIN 

/********************************************************************************
-- use this code to test your client listing stored procedure:
set @iparam_client_status = 0;

call sproc_client_list_by_active_status
(@iparam_client_status

,@oparam_err_flag 
,@oparam_err_step 
,@oparam_err_msg);

select @oparam_err_flag, @oparam_err_step, @oparam_err_msg;
**********************************************************************************/

-- step 10
-- declare variables
declare  v_step_number int;

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
-- initialize
set v_step_number = 20;
set oparam_err_flag = 0;

 -- step 30
-- list clients by applying client status filter
set v_step_number = 30;

select client_name
	,mobile_phone
    ,email_address
    ,city
	-- ,client_status
	,client_id
from client
where client_status  = iparam_client_status
order by client_name
;

END // 
DELIMITER ;


-- use this if u want to provide execute access to other mysql user id
-- GRANT EXECUTE ON PROCEDURE sproc_client_list_by_active_status to '<my sql user id>';	
