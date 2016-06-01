<?php
abstract class RESTItem extends DBConnect {
	private $tablename;
	public function __construct($tablename){
		parent::__construct();
		$this->tablename = $tablename;
	}
	public function LoadAll(){
		$result = mysqli_query($this->conn, "SELECT * FROM ". $this->tablename);
		return mysqli_fetch_all ($result, MYSQLI_ASSOC);
	}
	public function LoadWhere($where){
		$result = mysqli_query($this->conn, "SELECT * FROM ". $this->tablename ." WHERE ". $where);
		return mysqli_fetch_all ($result, MYSQLI_ASSOC);
	}
	public function Save($obj){
		$keyString = "";
		$valueString = "";
		$counter = 0;
		
		while ($value = current($obj)) {
			$key = key($obj);
			$keyString .= $key;
			$valueString .= "'". $value ."'";
			if($counter < count($obj) - 1){
				$keyString .= ", ";
				$valueString .= ", ";
			}
			$counter++;
			next($obj);
		}
		
		$result = mysqli_query($this->conn, "INSERT INTO ". $this->tablename ." (". $keyString .") VALUES (". $valueString. ")");
		return $result;
	}
	public function GetById($id){
		$result = mysqli_query($this->conn, "SELECT * FROM ". $this->tablename ." WHERE Id = $id");
		return mysqli_fetch_all ($result, MYSQLI_ASSOC)[0];
	}
	public function Delete($id){
		mysqli_query($this->conn, "DELETE FROM ". $this->tablename ." WHERE Id = $id");
	}
}
?>