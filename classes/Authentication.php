<?php 
class Authentication extends DBConnect {
    public function __construct() {
        session_start();
        parent::__construct();
    }

    public function Authenticate($email, $password) {
        $result = odbc_exec($this->conn, "SELECT Id, Email, Name, Vorname, Passwort FROM person WHERE Email = '$email' AND Passwort = '$password'");
        $user = odbc_fecht_all($result, MYSQL_ASSOC);
        if (count($user) == 1) {
            $_SESSION["user"] = json_encode($user[0]);
            return true;
        } else {
            return false;
        }

    }
    public function IsAuthenticated() {
        return isset($_SESSION["user"]);
    }
    public function Logout() {
        session_destroy();
    }
    public function GetSchülerId() {
        $user = $this->GetUserFromSession();
        $userId = $user->Id;
        $result = odbc_exec($this->conn, 'SELECT Id FROM schüler WHERE Person_Id = '.$userId);
        $schüler = odbc_fecht_all($result, MYSQLI_ASSOC);
        if ($result && count($schüler) > 0) {
            return intval($schüler[0]["Id"]);
        } else {
            return false;
        }
    }
    public function GetLehrkraftId() {
        $user = $this->GetUserFromSession();
        $userId = $user->Id;
        $result = odbc_exec($this->conn, 'SELECT Id FROM lehrkraft WHERE Person_Id = '.$userId);
        $lehrkraft = odbc_fecht_all($result, MYSQLI_ASSOC);
        if ($result && count($lehrkraft) > 0) {
            return intval($lehrkraft[0]["Id"]);
        } else {
            return false;
        }
    }
    public function GetUserFromSession() {
        return json_decode($_SESSION["user"]);
    }
    public function GetUser() {
        $result = odbc_exec($this->conn, "SELECT Id, Email, Name, Vorname, Passwort FROM person WHERE Id = ".$this->GetUserFromSession()->Id);
        $user = odbc_fecht_all($result, MYSQL_ASSOC);
        return $user[0];
    }

}
?>