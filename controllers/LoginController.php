<?php
class LoginController extends Controller {
	public function __construct(){
		parent::__construct();
	}
	public function Map(){
		$this->router->map( 'GET', '/login', function() {
			if(Auth::IsAuthenticated()){
				$this->redirect('home');
			} else {
				ViewStart::render('/views/Login/Index.php', 'Login');
			}
		});
		$this->router->map( 'POST', '/login', function() {	
			
			if(Auth::Authenticate($_POST["email"], $_POST["password"])){
				$this->redirect('home');
			} else {
				$this->redirect('login');
			}
		});
		$this->router->map('GET', '/logout', function(){
			Auth::Logout();
			$this->redirect('home');
		});
	}
}
?>