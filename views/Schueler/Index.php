<div class="panel">
    <div class="panel-body">
        <div class="col-md-6 col-sm-12">
            <h3 class="animated fadeInLeft"><?php echo Title::GetSubtitle(); ?></h3>

        </div>
    </div>
</div>

<div class="col-md-12">
    <div class="panel">
        <div class="panel-heading-white panel-heading">
            <h4>Absenzen</h4>
        </div>
        <div class="panel-body">
            <div class="col-md-12">
                <canvas class="line-chart"></canvas>
            </div>
        </div>
    </div>
</div>
<div class="col-md-6">
    <div class="panel">
        <div class="panel-heading-white panel-heading">
            Persönliche Daten
        </div>
        <div class="panel-body">
            <form role="form">

                <div class="form-group">
                    <label>Nachname</label>
                    <input class="form-control">
                </div>
                <div class="form-group">
                    <label>Vorname</label>
                    <input class="form-control">
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control">
                </div>
            </form>
        </div>
    </div>
</div>
<div class="col-md-6">
    <div class="panel">
        <div class="panel-heading-white panel-heading">
            Noten
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Fach</th>
                            <th>Wert</th>
                            <th>Punkte</th>
                            <th>Datum</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($model["noten"] as $note) { ?>
                        <tr>
                            <td>
                                <?php echo $note["Bezeichnung"] ?>
                            </td>
                            <td>
                                <?php echo $note["Wert"] ?>
                            </td>
                            <td>
                                <?php echo $note["ErreichtePunkte"] ?> / <?php echo $note["MaximalPunkte"] ?>
                            </td>
                            <td>
                                <?php echo date('d.m.Y h:i', strtotime($note["Erstellungsdatum"])) ?>
                            </td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var lineChartData = {
        labels: ["Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "Oktober", "September", "November", "Dezember"],
        datasets: [{
            label: "My First dataset",
            fillColor: "rgba(21,186,103,0.5)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: <?php echo json_encode($model["absenzenChartData"]); ?>
        }]
    };
    window.onload = function() {
        var ctx3 = $(".line-chart")[0].getContext("2d");
        ctx3.canvas.height = 50;
        window.myLine = new Chart(ctx3).Line(lineChartData, {
            responsive: true,
            showTooltips: true
        });
        
    };
</script>
