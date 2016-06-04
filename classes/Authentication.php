<?php
class Authentication extends DBConnect{
	public function __construct(){
		session_start();
		parent::__construct();
	}
	
	public function Authenticate($email, $password){
		$result = mysqli_query($this->conn, "SELECT Id, Email, Passwort FROM person WHERE Email = '$email' AND Passwort = '$password'");
		$user = mysqli_fetch_all ($result);
		if(count($user) == 1){
			$_SESSION["user"] = serialize($user[0]);
			return  true;
		}
		else 
		{
			return false;
		}
		
	}
	public function IsAuthenticated(){
		return isset($_SESSION["user"]);
	}
	public function Logout(){
		session_destroy();
	}
	public function GetSchülerId(){
		$user = $this->GetUserFromSession();
		$userId = intval($user["0"]);
		$result = mysqli_query($this->conn, 'SELECT Id FROM schüler WHERE Person_Id = '.$userId);
		$schüler = mysqli_fetch_all($result, MYSQLI_ASSOC);
		if($result && count($schüler) > 0){
			return intval($schüler[0]["Id"]);
		} else {
			return false;
		}
	}
	private function GetUserFromSession(){
		return unserialize($_SESSION["user"]);
	}
}
?>