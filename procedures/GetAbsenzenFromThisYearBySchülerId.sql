CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAbsenzenFromThisYearBySchülerId`(IN schuelerId INT(4))
BEGIN
SELECT fach.Bezeichnung, metadaten.ErstellungsDatum FROM absenz
		INNER JOIN fach
		ON absenz.Fach_Id = fach.Id
		INNER JOIN metadaten
		ON absenz.Metadaten_Id = metadaten.Id
		WHERE absenz.Schüler_Id = schuelerId
		AND YEAR(metadaten.ErstellungsDatum) = YEAR(CURDATE());
END