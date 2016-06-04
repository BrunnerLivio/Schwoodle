<?php
class SchülerFactory extends RESTItem {
	public function __construct(){
		parent::__construct("schüler");
	}
	public function GetNotenBySchülerId($schülerId){
		$result = mysqli_query($this->conn, 'SELECT note.Id, note.Wert, note.ErreichtePunkte, note.MaximalPunkte, fach.Bezeichnung, metadaten.Erstellungsdatum FROM note'
		.' INNER JOIN fach'
		.' ON note.Fach_Id = fach.Id'
		.' INNER JOIN metadaten'
		.' ON note.Metadaten_Id = metadaten.Id'
		.' WHERE Schüler_Id = '.$schülerId);
		echo mysqli_error($this->conn);
		$noten = mysqli_fetch_all($result, MYSQLI_ASSOC);
		return $noten;
	}
}
?>