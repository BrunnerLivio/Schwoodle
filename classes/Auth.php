<?php
class Auth {
	private static $Authentication;
	private static $user;
	private static $schülerId;
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
	public static function GetSchülerId(){
		if(self::$schülerId == null){
			self::$schülerId = self::$Authentication->GetSchülerId();
		} 
		return self::$schülerId;
	}
	public static function Logout(){
		self::$Authentication->Logout();
	}
}
?>