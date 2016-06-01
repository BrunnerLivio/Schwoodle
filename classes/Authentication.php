<?php
class Authentication extends DBConnect{
	public function __construct(){
		session_start();
		parent::__construct();
	}
	
	public function Authenticate($username, $password){
		$result = mysqli_query($this->conn, "SELECT Id, Username, Password FROM user WHERE Username = '$username' AND Password = '$password'");
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