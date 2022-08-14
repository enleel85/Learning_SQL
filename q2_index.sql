/* Create indexes in sample_ip database, table ip_address_varchar20 */

-- First 3 characters
CREATE INDEX idx_ip_address_3chars ON sample_ip.ip_address_varchar20 (ip_address(3));
-- First 7 characters (xxx.xxx)
CREATE INDEX idx_ip_address_7chars ON sample_ip.ip_address_varchar20 (ip_address(7));
-- All characters (xxx.xxx.xxx.xxx)
CREATE INDEX idx_ip_address_all_chars ON sample_ip.ip_address_varchar20 (ip_address);

/* Execute using indeces */
-- Execution time: 5 seconds
SELECT *
FROM `sample_ip`.`ip_address_varchar20` 
IGNORE INDEX (`idx_ip_address_3chars`) 
IGNORE INDEX (`idx_ip_address_7chars`) 
IGNORE INDEX (`idx_ip_address_all_chars`)
WHERE 1=1
AND `ip_address_varchar20`.`ip_address` = '123.194.160.219'
;
-- Execution time: 4 seconds
SELECT *
FROM `sample_ip`.`ip_address_varchar20` 
USE INDEX (`idx_ip_address_3chars`)
WHERE 1=1
AND `ip_address_varchar20`.`ip_address` = '123.194.160.219'
;
-- Execution time: 40ms
SELECT *
FROM `sample_ip`.`ip_address_varchar20` 
USE INDEX (`idx_ip_address_7chars`)
WHERE 1=1
AND `ip_address_varchar20`.`ip_address` = '123.194.160.219'
;
-- Execution time: 1ms
SELECT *
FROM `sample_ip`.`ip_address_varchar20` 
USE INDEX (`idx_ip_address_all_chars`)
WHERE 1=1
AND `ip_address_varchar20`.`ip_address` = '123.194.160.219'
;