DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSchüler`()
BEGIN
	SELECT person.Name, person.Vorname, schüler.Id 
    From schüler
    INNER JOIN person
    ON schüler.Person_Id = person.Id;
END$$
DELIMITER ;
