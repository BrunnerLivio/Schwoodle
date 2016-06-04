<?php 

class SchuelerController extends Controller {
    public function __construct() {
        parent::__construct();
    }
    public function Map() {
        $this->router->map('GET', '/schueler', function() {
            $schülerFactory = new SchülerFactory();
            $noten = $schülerFactory->GetNotenBySchülerId(Auth::GetSchülerId());
            $absenzen = $schülerFactory->GetAbsenzenFromThisYearBySchülerId(Auth::GetSchülerId());
            $absenzenChartData = create_array(12);
            foreach($absenzen as $absenz) {
                $month = intval(date('m', strtotime($absenz["ErstellungsDatum"]))) - 1;
                if ($absenzenChartData[$month] == null) {
                    $absenzenChartData[$month] = 0;
                }
                $absenzenChartData[$month]++;
            }
            ViewStart::render('/views/Schueler/Index.php', 'Schüler - Home', ["noten" => $noten, "absenzenChartData" => $absenzenChartData]);
        });
		$this->router->map('POST', '/schueler/updatedata', function() {
			$personFactory = new PersonFactory();
			$personFactory->UpdateWhere("Id = ".Auth::GetUser()["Id"], [
				"name" => $_POST["name"],
				"vorname"=> $_POST["vorname"],
				"email"=> $_POST["email"]
			]);
			$this->redirect('schueler');
		});
    }
}
?>