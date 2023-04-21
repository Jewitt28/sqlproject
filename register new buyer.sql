USE estateagents;
DELIMITER //

CREATE PROCEDURE register_buyer(
IN p_name VARCHAR(50) 

) 
BEGIN   
DECLARE name_exists INT;    

SELECT COUNT(*) INTO name_exists   FROM buyer   WHERE name = p_name;    
IF name_exists = 0
THEN
	INSERT INTO buyer (name)     
     VALUES (p_name);   
     ELSE     
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You seem to already have a buyer account.';   
     
     END IF; 

     
     END // 

DELIMITER ;