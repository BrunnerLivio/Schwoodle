<?php 
class NoteFactory extends RESTItem {
    public function __construct() {
        parent::__construct("note");
    }
    public function InsertNote($wert, $wertung, $erreichtePunkte, $maximalPunkte, $schuelerId, $lehrkraftId, $fachId) {
        echo "CALL InsertNote(".$wert.",".$wertung.",".$erreichtePunkte.",".$maximalPunkte.",". $schuelerId .",". $fachId .")";
        $res = odbc_multi_query($this->conn, "CALL InsertNote(".$wert.",".$wertung.",".$erreichtePunkte.",".$maximalPunkte.",". $schuelerId .",".$lehrkraftId.",". $fachId .")");
        do {
            if ($result = odbc_store_result($this->conn)) {
                $result->close();
            }
        } while (odbc_next_result($this->conn));
    }
}
?>