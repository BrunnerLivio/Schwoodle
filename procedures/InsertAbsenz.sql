CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertAbsenz`(IN schuelerId INT(4), IN lehrerId INT(4), IN fachId INT(4), IN datum timestamp)
BEGIN

    Set @LehrerPersonId = (Select Person_Id From lehrkraft Where Id = lehrerId);
    Set @ErstellerMail = (Select Email From person Where Id = @LehrerPersonId);
    Set @Jetzgrad = NOW();
    
	INSERT INTO metadaten (Erstellungsdatum, ErstellerEmail)
	VALUES (@Jetzgrad, @ErstellerMail);
    
    Set @MetadatenIdMAX = (SELECT max(id) FROM metadaten);
    
    INSERT INTO absenz (Fach_Id, Metadaten_Id, Schüler_Id)
    Values (fachId, @MetadatenIdMAX, schuelerId);
    
END