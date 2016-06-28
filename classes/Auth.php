<?php
class Auth {
	private static $Authentication;
	private static $user;
	private static $schülerId;
	private static $lehrkraftId;
	public static function Init(){
		self::$Authentication = new Authentication();
		if(isset($_SESSION["user"])){
			self::$user = self::$Authentication->GetUserFromSession();
		}
		
	}
	
	public static function Authenticate($username, $password){
		return self::$Authentication->Authenticate($username, $password);
	}
	public static function IsAuthenticated(){
		return self::$Authentication->IsAuthenticated();
	}
	public static function GetUserEmail(){
		return self::$user->Email;
	}
	public static function GetUserId(){
		return self::$user["Id"];
	}
	public static function GetSchülerId(){
		if(self::$schülerId == null){
			self::$schülerId = self::$Authentication->GetSchülerId();
		} 
		return self::$schülerId;
	}
	public static function GetLehrkraftId(){
		if(self::$lehrkraftId == null){
			self::$lehrkraftId = self::$Authentication->GetLehrkraftId();
		} 
		return self::$lehrkraftId;
	}
	public static function Logout(){
		self::$Authentication->Logout();
	}
	public static function GetUser(){
		return self::$Authentication->GetUser();
	}
}
?>