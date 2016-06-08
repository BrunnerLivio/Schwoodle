<?php 
class LehrkraftController extends Controller {
    public function __construct() {
        parent::__construct();
    }
    public function Map() {
        $this->router->map('GET', '/lehrkraft', function() {
            ViewStart::render('/views/Lehrkraft/Index.php', 'Lehrkraft - Home');
        });
    }
}
?>