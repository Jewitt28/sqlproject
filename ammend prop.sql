DELIMITER //
CREATE PROCEDURE amend_prop(
    IN p_prop_id INT,
    IN p_status ENUM('FOR SALE', 'SOLD', 'WITHDRAWN'),
     IN p_postcode VARCHAR(9), 
  IN p_price INT,
  IN p_address varchar (80)
)
BEGIN
    DECLARE checkExist INT;
    DECLARE pstatus ENUM('FOR SALE', 'SOLD', 'WITHDRAWN');
    
    -- Check if property exists
    SELECT COUNT(*) INTO checkExist FROM properties WHERE prop_id = p_prop_id;
    
    -- Get property status
    SELECT status INTO p_status FROM properties WHERE property_id = p_prop_id;

    IF checkExist = 1 THEN
        IF pstatus = 'FOR SALE' THEN
            UPDATE properties SET 
            address = p_address,
            postcode = p_postcode,
            price=p_price
		WHERE prop_id = p_prop_id;
        
        
    END IF; 
    END IF;
END;
//
DELIMITER ;