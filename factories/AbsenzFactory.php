<?php 
class AbsenzFactory extends RESTItem {
    public function __construct() {
        parent::__construct("absenz");
    }
    public function InsertAbsenz($schuelerId, $lehrerId, $fachId, $datum) {
        $res = mysqli_multi_query($this->conn, "CALL InsertAbsenz(".$schuelerId.",".$lehrerId.",".$fachId.",'".$datum." 00:00:00')");
        do {
            if ($result = mysqli_store_result($this->conn)) {
                $result->close();
            }
        } while (mysqli_next_result($this->conn));
    }
    public function GetAnzahlAbsenzenByEmail($erstellerEmail){
        $result = mysqli_query($this->conn, "SELECT * FROM absenz INNER JOIN metadaten ON absenz.Metadaten_Id = metadaten.Id WHERE ErstellerEmail = '". $erstellerEmail."'");
        return mysqli_num_rows ($result);
    }
}
?>