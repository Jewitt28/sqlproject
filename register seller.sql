USE estateagents;
DELIMITER //

CREATE PROCEDURE register_seller(
IN p_first_name VARCHAR(50) ,
IN p_last_name VARCHAR(50) 

) 
BEGIN   
DECLARE name_exists INT;    

SELECT COUNT(*) INTO name_exists   FROM seller   WHERE first_name = p_first_name AND last_name = p_last_name;    
IF name_exists = 0
THEN
	INSERT INTO seller (first_name, last_name)     
     VALUES (p_first_name, p_last_name);   
     ELSE     
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You seem to already have a seller account.';   
     
     END IF; 

     
     END // 

DELIMITER ;