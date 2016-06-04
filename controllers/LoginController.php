<?php
class LoginController extends Controller {
	public function __construct(){
		parent::__construct();
	}
	public function Map(){
		$this->router->map( 'GET', '/login', function() {
			if(Auth::IsAuthenticated()){
				$this->redirect('');
			} else {
				ViewStart::render('/views/Login/Index.php', 'Login');
			}
		});
		$this->router->map( 'POST', '/login', function() {	
			
			if(Auth::Authenticate($_POST["email"], $_POST["password"])){
				if(Auth::IsSchüler()){
					$this->redirect('schueler');
				} else {
					
				}
			} else {
				$this->redirect('login');
			}
		});
		$this->router->map('GET', '/logout', function(){
			Auth::Logout();
			$this->redirect('');
		});
	}
}
?>