-- stored procedure to list all clients

delimiter //
DROP PROCEDURE IF EXISTS sproc_client_list//

delimiter //
CREATE PROCEDURE sproc_client_list(
)
BEGIN 

/********************************************************************************
-- use this code to test your client listing stored procedure:

call sproc_client_list()

**********************************************************************************/ 
-- list all clients
select client_name
	,mobile_phone
    ,email_address
    ,city
	,client_status
	,client_id
from client
order by client_name
;

END // 
DELIMITER ;

-- use this if u want to provide execute access to other mysql user id
-- GRANT EXECUTE ON PROCEDURE sproc_client_list to '<my sql user id>';	
