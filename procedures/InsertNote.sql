CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertNote`(IN wert INT(4), IN wertung INT(4), IN erreichtePunkte INT(4), IN maximalPunkte INT(4), IN schuelerId INT(4), IN lehrkraftId INT(4), IN fachId INT(4))
BEGIN
	Set @LehrerPersonId = (Select Person_Id From lehrkraft Where Id = lehrkraftId);
    Set @ErstellerMail = (Select Email From person Where Id = @LehrerPersonId);
    Set @Jetzgrad = NOW();
    
	INSERT INTO metadaten (Erstellungsdatum, ErstellerEmail)
	VALUES (@Jetzgrad, @ErstellerMail);
    
    Set @MetadatenIdMAX = (SELECT max(id) FROM metadaten);
    
    INSERT INTO note (Wert, Wertung, ErreichtePunkte, MaximalPunkte, Schüler_Id, Metadaten_Id, Fach_Id)
    VALUES (wert, wertung, erreichtePunkte, maximalPunkte, schuelerId, @MetadatenIdMAX, fachId);
END