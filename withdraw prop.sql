USE estateagents;
DELIMITER //
CREATE PROCEDURE withdraw_prop(
    IN p_prop_id INT,
    IN p_status ENUM('FOR SALE', 'SOLD', 'WITHDRAWN') 
)
BEGIN
    DECLARE checkExist INT;
    DECLARE pstatus ENUM('FOR SALE', 'SOLD', 'WITHDRAWN');
    
    -- Check if property exists
    SELECT COUNT(*) INTO checkExist FROM properties WHERE property_id = p_prop_id;
    
    -- Get property status
    SELECT status INTO pstatus FROM properties WHERE property_id = p_prop_id;

    IF checkExist = 1 THEN
        IF pstatus <> 'SOLD' THEN
            UPDATE properties SET status = 'WITHDRAWN' 
            WHERE property_id = p_prop_id;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot withdraw a property that has been sold.';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Property does not exist.';
    END IF;
END;
//
DELIMITER ;
