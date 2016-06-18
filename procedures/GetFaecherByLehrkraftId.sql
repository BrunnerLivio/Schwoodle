CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFaecherByLehrkraftId`(IN LehrkraftId INT(4))
BEGIN
	SELECT Bezeichnung FROM fach
    WHERE Id = (SELECT Fach_Id FROM lehrkraft_fach WHERE Lehrkraft_Id = LehrkraftId);
END