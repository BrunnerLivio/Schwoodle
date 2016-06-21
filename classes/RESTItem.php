<?php
abstract class RESTItem extends DBConnect {
	private $tablename;
	public function __construct($tablename){
		parent::__construct();
		$this->tablename = $tablename;
	}
	public function LoadAll(){
		$result = odbc_query($this->conn, "SELECT * FROM ". $this->tablename);
		return odbc_fetch_all ($result, odbc_ASSOC);
	}
	public function LoadWhere($where){
		$result = odbc_query($this->conn, "SELECT * FROM ". $this->tablename ." WHERE ". $where);
		return odbc_fetch_all ($result, odbc_ASSOC);
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
		
		$result = odbc_query($this->conn, "INSERT INTO ". $this->tablename ." (". $keyString .") VALUES (". $valueString. ")");
		return $result;
	}
	public function GetById($id){
		$result = odbc_query($this->conn, "SELECT * FROM ". $this->tablename ." WHERE Id = $id");
		return odbc_fetch_all ($result, odbc_ASSOC)[0];
	}
	public function Delete($id){
		odbc_query($this->conn, "DELETE FROM ". $this->tablename ." WHERE Id = $id");
	}
	public function UpdateWhere($where, $obj){
        $attributesAndValues = "";
		$counter = 0;
		while ($counter < count($obj)) {
			$value = $obj[key($obj)];
            $key = key($obj);
			$attributesAndValues .= $key. "='" .$value."'";
			if($counter < count($obj) - 1){
				$attributesAndValues .= ", ";
			}
			$counter++;
			next($obj);
		}
		$result = odbc_query($this->conn, "UPDATE ". $this->tablename ." SET ". $attributesAndValues ." WHERE ". $where);
		echo "UPDATE ". $this->tablename ." SET ". $attributesAndValues ." WHERE ". $where;
		return odbc_insert_id ($this->conn);
    }
}
?>