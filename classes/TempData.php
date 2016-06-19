<?php
class TempData{
    private static $data;
    public static function Set($obj){
        $_SESSION["TempData"] = json_encode($obj);
    }
    public static function Get(){
        return self::$data;
    }
    public static function Destroy(){
        if (isset($_SESSION["TempData"])) {
            self::$data = json_decode($_SESSION["TempData"]);
            unset($_SESSION["TempData"]);
        }
    }
}
?>