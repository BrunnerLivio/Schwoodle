<?php
abstract class DBConnect{
	protected $conn;
	public function __construct(){
		$config = AppSettings::GetConfig()->database;
		$this->conn = mysqli_connect($config->host, $config->username, $config->password);
		mysqli_set_charset($this->conn, "utf8");
		
		if(mysqli_connect_errno()){
			echo "failed to connect to mysql". mysqli_connect_errno();
		}
		mysqli_select_db($this->conn, "schwoodle");
	}
}


?>