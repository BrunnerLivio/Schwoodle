<?php
require 'vendor/AltoRouter.php';
abstract class Controller{
	protected $router;
	public function __construct(){
		$this->router = new AltoRouter();
		$this->router->setBasePath(AppSettings::GetConfig()->baseUrl);
	}
	public function Apply(){
		$match = $this->router->match();
		if( $match && is_callable( $match['target'] ) ) {
			call_user_func_array( $match['target'], $match['params'] ); 
		} 
	}
	protected function redirect($path){
		header('Location: '. AppSettings::GetConfig()->baseUrl .'/'.$path);
	}
}
?>