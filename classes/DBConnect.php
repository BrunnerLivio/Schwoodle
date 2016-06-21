<?php
abstract class DBConnect{
	protected $conn;
	public function __construct(){
		$config = AppSettings::GetConfig()->database;
		$this->conn = odbc_connect("DRIVER={MySQL ODBC 5.3 Unicode Driver};Server=localhost;Database=schwoodle","root",""); 
	}
}


?>