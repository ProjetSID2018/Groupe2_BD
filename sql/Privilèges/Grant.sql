base_de_données1_7

CREATE USER 'yolo'@'localhost' 
IDENTIFIED BY 'yolo'


GRANT SELECT, INSERT 
ON base_de_données1_7.* 
TO 'yolo'@'localhost';

GRANT SELECT 
ON TABLE base_de_données1_7.*
TO 'yolo'@'localhost' IDENTIFIED BY 'yolo'

GRANT CREATE ROUTINE, EXECUTE
ON base_de_données1_7.*
TO 'yolo'@'localhost';

GRANT DELETE
ON base_de_données1_7.*
TO 'yolo'@'localhost';

REVOKE DELETE, INSERT
ON base_de_données1_7.*
FROM 'yolo'@'localhost';



GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
GRANT PROXY ON ''@'' TO 'root'@'localhost' WITH GRANT OPTION;
