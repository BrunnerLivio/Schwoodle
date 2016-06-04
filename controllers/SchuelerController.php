<?php 
class SchuelerController extends Controller {
    public function __construct() {
        parent::__construct();
    }
    public function Map() {
        $this->router->map('GET', '/schueler', function() {
            $schülerFactory = new SchülerFactory();
            $noten = $schülerFactory->GetNotenBySchülerId(Auth::GetSchülerId());
            ViewStart::render('/views/Schueler/Index.php', 'Schüler - Home', $noten);
        });
    }
}
?>