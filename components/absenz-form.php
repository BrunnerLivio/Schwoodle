<div class="panel">
    <div class="panel-heading-white panel-heading">
        Absenzen
    </div>
    <div class="panel-body">
        <form role="form" action="<?php echo $base; ?>/lehrkraft/insertabsenz" method="POST">
            <div class="col-md-12">
                <div class="form-group col-md-12" style="margin-top:10px;">
                    <label class="col-sm-2 control-label text-right">Fach</label>
                    <div class="col-sm-10">
                        <select name="fach">
                            <?php foreach($model["fächer"] as $fach) { ?>
                            <option value="<?php echo $fach["Id"] ?>"><?php echo $fach["Bezeichnung"] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group col-md-12">
                    <label class="col-sm-2 control-label text-right">Schüler</label>
                    <div class="col-sm-10">
                        <select name="schüler">
                            <?php foreach($model["schüler"] as $schüler) { ?>
                            <option value="<?php echo $schüler["Id"] ?>"><?php echo $schüler["Vorname"]." ".$schüler["Name"] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group col-md-12" style="margin-top:10px;">
                    <label class="col-sm-2 control-label text-right">Anzahl Lektionen</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="number" name="lektionen" />
                    </div>
                </div>
                <br />
                <div class="form-group col-md-12" style="margin-top:10px;">
                    <label class="col-sm-2 control-label text-right">Datum</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="date" name="datum" value="<?php echo date("Y-m-d") ?>" />
                    </div>
                </div>
                <div class="col-md-2 col-md-offset-10" style="margin-top:10px;">
                    <input type="submit" class="btn btn-primary" value="Eintrag" />
                </div>
            </div>
        </form>
    </div>
</div>