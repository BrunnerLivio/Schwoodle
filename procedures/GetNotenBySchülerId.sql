CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNotenBySchülerId`(IN schuelerId INT(4))
BEGIN
SELECT note.Id, note.Wert, note.ErreichtePunkte, note.MaximalPunkte, fach.Bezeichnung, metadaten.Erstellungsdatum
		FROM note
		INNER JOIN fach
		ON note.Fach_Id = fach.Id
		INNER JOIN metadaten
		ON note.Metadaten_Id = metadaten.Id
		WHERE Schüler_Id = schuelerId;
END