<?php 
class SchülerFactory extends RESTItem {
    public function __construct() {
        parent::__construct("schüler");
    }
    public function GetNotenBySchülerId($schülerId) {
        $res = mysqli_multi_query($this->conn, "CALL GetNotenBySchülerId(".$schülerId.")");
        echo mysqli_error($this->conn);
        do {
            if ($result = mysqli_store_result($this->conn)) {

                $noten = mysqli_fetch_all($result, MYSQL_ASSOC);
                $result->close();
            }
        } while (mysqli_next_result($this->conn));
        return $noten;
    }
    public function GetAbsenzenFromThisYearBySchülerId($schülerId) {
        $res = mysqli_multi_query($this->conn, "CALL GetNotenBySchülerId(".$schülerId.")");
        echo mysqli_error($this->conn);
        do {
            if ($result = mysqli_store_result($this->conn)) {

                $absenzen = mysqli_fetch_all($result, MYSQL_ASSOC);
                $result->close();
            }
        } while (mysqli_next_result($this->conn));
        return $absenzen;
    }
}
?>