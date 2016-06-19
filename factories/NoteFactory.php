<?php 
class NoteFactory extends RESTItem {
    public function __construct() {
        parent::__construct("note");
    }
    public function InsertNote($wert, $wertung, $erreichtePunkte, $maximalPunkte, $schuelerId, $lehrkraftId, $fachId) {
        echo "CALL InsertNote(".$wert.",".$wertung.",".$erreichtePunkte.",".$maximalPunkte.",". $schuelerId .",". $fachId .")";
        $res = mysqli_multi_query($this->conn, "CALL InsertNote(".$wert.",".$wertung.",".$erreichtePunkte.",".$maximalPunkte.",". $schuelerId .",".$lehrkraftId.",". $fachId .")");
        do {
            if ($result = mysqli_store_result($this->conn)) {
                $result->close();
            }
        } while (mysqli_next_result($this->conn));
    }
}
?>