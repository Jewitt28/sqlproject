USE estateagents;
DELIMITER //

CREATE PROCEDURE add_prop(
IN p_address VARCHAR(255), 
IN p_postcode VARCHAR(9), 
IN p_seller_id INT
) 
BEGIN   
DECLARE address_exists INT;    

SELECT COUNT(*) INTO address_exists   FROM properties   WHERE address = p_address AND postcode = p_postcode;    
IF address_exists = 0
THEN
	INSERT INTO properties (address, postcode, seller_id)     
     VALUES (p_address, p_postcode, p_seller_id);   
     ELSE     
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The property with this address already exists.';   
     
     END IF; 

     
     END // 

DELIMITER;
