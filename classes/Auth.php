<?php
class Auth {
	private static $Authentication;
	private static $user;
	public static function Init(){
		self::$Authentication = new Authentication();
		if(isset($_SESSION["user"])){
			self::$user = unserialize($_SESSION["user"]);
		}
		
	}
	
	public static function Authenticate($username, $password){
		return self::$Authentication->Authenticate($username, $password);
	}
	public static function IsAuthenticated(){
		return self::$Authentication->IsAuthenticated();
	}
	public static function GetUserId(){;
		return self::$user[0];
	}
	public static function Logout(){
		self::$Authentication->Logout();
	}
}
?>