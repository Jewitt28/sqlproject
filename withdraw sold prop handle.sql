
 DELIMITER //


CREATE PROCEDURE withdrawSoldProp(IN paramID INT)
BEGIN
  DECLARE pstatus VARCHAR(50); -- Declare a variable to store property status
     DECLARE checkExist INT;
  SELECT COUNT(*) INTO checkExist FROM properties WHERE property_ID = paramID;
     -- Get property status
     SELECT property_status INTO pstatus FROM properties WHERE property_id = paramID;

 IF checkExist = 1 THEN
 IF pstatus = 'SOLD' THEN
   SELECT 'Property is already sold' AS 'Reason', 406 AS 'Status' FROM properties WHERE  property_id = paramID;
 ELSE
 UPDATE properties 
 SET 
     property_status = 'WITHDRAWN'
 WHERE
     property_id = paramID; 
     END IF;
  ELSE
               -- SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This property does not exist.';
       SELECT 'Property does not exist' AS 'Reason', 406 AS 'Status';

      END IF; 


 END //

 DELIMITER ;
