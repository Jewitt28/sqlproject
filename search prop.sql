USE estateagents;
DELIMITER //

CREATE PROCEDURE find_prop(
  IN p_postcode VARCHAR(9), 
  IN p_min_price INT,
  IN p_max_price INT
)
BEGIN
  SELECT * FROM properties
  WHERE postcode = p_postcode AND price BETWEEN p_min_price AND p_max_price
  ORDER BY price DESC;

  SELECT COUNT(*) AS prop_matches FROM properties
  WHERE postcode = p_postcode AND price BETWEEN p_min_price AND p_max_price;

END; //

DELIMITER ;