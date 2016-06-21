<?php 
class SchülerFactory extends RESTItem {
    public function __construct() {
        parent::__construct("schüler");
    }
    public function GetNotenBySchülerId($schülerId) {
        $res = odbc_multi_query($this->conn, "CALL GetNotenBySchülerId(".$schülerId.")");
        echo odbc_error($this->conn);
        do {
            if ($result = odbc_store_result($this->conn)) {

                $noten = odbc_fetch_all($result, MYSQL_ASSOC);
                $result->close();
            }
        } while (odbc_next_result($this->conn));
        return $noten;
    }
    public function GetAbsenzenFromThisYearBySchülerId($schülerId) {
        $res = odbc_multi_query($this->conn, "CALL GetAbsenzenFromThisYearBySchülerId(".$schülerId.")");
        echo odbc_error($this->conn);
        do {
            if ($result = odbc_store_result($this->conn)) {

                $absenzen = odbc_fetch_all($result, MYSQL_ASSOC);
                $result->close();
            }
        } while (odbc_next_result($this->conn));
        return $absenzen;
    }
	public function LoadAll() {
		$res = odbc_multi_query($this->conn, "CALL GetSchüler()");
        echo odbc_error($this->conn);
        do {
            if ($result = odbc_store_result($this->conn)) {

                $schüler = odbc_fetch_all($result, MYSQL_ASSOC);
                $result->close();
            }
        } while (odbc_next_result($this->conn));
        return $schüler;
	}
}
?>