<?php 
require 'classes/Controller.php';
require 'classes/DBConnect.php';
require 'classes/RESTItem.php';
require 'classes/Authentication.php';
require 'classes/Auth.php';
require 'classes/Title.php';
require 'classes/AppSettings.php';
AppSettings::init();

foreach (glob("factories/*.php") as $filename)
{
    require $filename;
}

require 'views/_Shared/_ViewStart.php';

Auth::Init();

foreach (glob('controllers/*.php') as $file)
{
    require_once $file;
    $class = basename($file, '.php');
    if (class_exists($class))
    {
        $controller = new $class;
        $controller->Map();
        $controller->Apply();
    }
}





?>

