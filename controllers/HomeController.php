<?php
class HomeController extends Controller {
	public function __construct(){
		parent::__construct();
	}
	public function Map(){
		$this->router->map( 'GET', '/', function() {
			$this->redirect('home');
		});
		$this->router->map( 'GET', '/home', function() {
			ViewStart::render('/views/Home/Index.php', 'Home');
		});
	}
}
?>