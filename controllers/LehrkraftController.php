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
        $this->router->map('POST', '/lehrkraft/insertabsenz', function() {
            $absenzFactory = new AbsenzFactory();
            $lektionen = intval($_POST["lektionen"]);
            for ($lektion = 0; $lektion < $lektionen; $lektion++) {
                $absenzFactory->InsertAbsenz($_POST["schüler"], Auth::GetLehrkraftId(), $_POST["fach"],$_POST["datum"]);
            }
            // Nachricht
            TempData::Set(["Message" => "Die Absenzen wurden erfolgreich im System eingetragen", "Type" => 1]);
            
            //$this->redirect('lehrkraft');
        });
    }
}
?>