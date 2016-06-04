<?php
class Authentication extends DBConnect{
	public function __construct(){
		session_start();
		parent::__construct();
	}
	
	public function Authenticate($email, $password){
		$result = mysqli_query($this->conn, "SELECT Id, Email, Passwort FROM Person WHERE Email = '$email' AND Passwort = '$password'");
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
}
?>