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
    <div class="panel" id="persoenliche-daten">
        <div class="panel-heading-white panel-heading">
            Persönliche Daten
        </div>
        <div class="panel-body">
            <form role="form" action="<?php echo $base; ?>/schueler/updatedata" method="POST">
                <div class="form-group">
                    <label class="col-sm-2 control-label text-right">Nachname</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" value="<?php echo Auth::GetUser()["Name"]; ?>" />

                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label text-right">Vorname</label>
                    <div class="col-sm-10">
                        <input type="text" name="vorname" class="form-control" value="<?php echo Auth::GetUser()["Vorname"]; ?>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label text-right">Email</label>
                    <div class="col-sm-10">
                        <input type="email" name="email" class="form-control" value="<?php echo Auth::GetUser()["Email"]; ?>">
                    </div>
                </div>
                <div class="col-md-2 col-md-offset-10" style="margin-top:10px;">
                    <input type="submit" class="btn btn-primary" value="Speichern" />
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