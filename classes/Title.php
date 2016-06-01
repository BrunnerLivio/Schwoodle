<?php 
class Title{
	private static $subtitle;
	private static $title;
	
	public static function GetSubtitle(){
		return self::$subtitle;
	}
	public static function SetSubtitle($subtitle){
		self::$subtitle = $subtitle;
	}
	public static function Render(){
		echo AppSettings::GetConfig()->title . (self::$subtitle != "" ? " - ". self::$subtitle : "");
	}
	public static function GetTitle(){
		return AppSettings::GetConfig()->title;
	}
}
?>