<?php
class HomeController extends Controller {
	public function __construct(){
		parent::__construct();
	}
	public function Map(){
		$this->router->map( 'GET', '/', function() {
			if(Auth::IsAuthenticated()){
				if(Auth::IsSchüler()){
					$this->redirect('schueler');
				} else {
					
				}
			} else {
				$this->redirect('login');
			}
		});
	}
}
?>