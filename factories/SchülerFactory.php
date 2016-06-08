<?php
class SchülerFactory extends RESTItem {
	public function __construct(){
		parent::__construct("schüler");
	}
	public function GetNotenBySchülerId($schülerId){
		$result = mysqli_query($this->conn, 
     		"CALL GetNotenBySchülerId(".$schülerId.")");
		$noten = mysqli_fetch_all($result, MYSQLI_ASSOC);
		return $noten;
	}
	public function GetAbsenzenFromThisYearBySchülerId($schülerId){
		$result = mysqli_query($this->conn,
			"CALL GetAbsenzenFromThisYearBySchülerId(".$schülerId.")");
	    echo mysqli_error($this->conn);
		$absenzen = mysqli_fetch_all($result, MYSQLI_ASSOC);
		return $absenzen;
	}
}
?>