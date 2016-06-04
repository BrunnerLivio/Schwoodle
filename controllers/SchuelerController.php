<?php
class SchuelerController extends Controller {
	public function __construct(){
		parent::__construct();
	}
	public function Map(){
		$this->router->map( 'GET', '/schueler', function() {
			ViewStart::render('/views/Schueler/Index.php', 'Schüler - Home');
		});
	}
}
?>