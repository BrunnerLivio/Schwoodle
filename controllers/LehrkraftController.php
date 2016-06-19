<?php 
class LehrkraftController extends Controller {
    public function __construct() {
        parent::__construct();
    }
    public function Map() {
        $this->router->map('GET', '/lehrkraft', function() {
            $FachFactory = new FachFactory();
            $SchülerFactory = new SchülerFactory();
            $model = ["fächer" => $FachFactory->LoadAll(), "schüler" => $SchülerFactory->LoadAll()];
            ViewStart::render('/views/Lehrkraft/Index.php', 'Lehrkraft - Home', $model);
        });
    }
}
?>