<?php 
class AbsenzFactory extends RESTItem {
    public function __construct() {
        parent::__construct("absenz");
    }
    public function InsertAbsenz($schuelerId, $lehrerId, $fachId, $datum) {
        $res = odbc_query($this->conn, "CALL InsertAbsenz(".$schuelerId.",".$lehrerId.",".$fachId.",'".$datum." 00:00:00')");
        do {
            if ($result = odbc_store_result($this->conn)) {
                $result->close();
            }
        } while (odbc_next_result($this->conn));
    }
}
?>