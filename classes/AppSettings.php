<?php
class AppSettings{
	private static $filePath = "app.json";
	private static $fileInfo;
	public function init(){
		$appConfig = fopen(self::$filePath, "r");
		self::$fileInfo = json_decode(fread($appConfig,filesize(self::$filePath)));
		fclose($appConfig);
	}
	public static function GetConfig(){
		return self::$fileInfo;
	}
}
?>