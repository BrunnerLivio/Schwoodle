<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Noten
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div id="noten"></div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="panel panel-default">
            <div class="panel-heading">
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
        <div class="panel panel-default">
            <div class="panel-heading">
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
                            <?php foreach($model as $note) { ?>
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
</div>
<script type="text/javascript">
    Morris.Area({
        element: 'noten',
        data: <?php echo json_encode($model); ?>,
            xkey: 'Erstellungsdatum',
        ykeys: ['Wert'],
        labels: ['Wert'],
        ymax: 6,
        resize:true
    });
</script>