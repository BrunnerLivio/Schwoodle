<div class="panel">
    <div class="panel-heading-white panel-heading">
        Note erfassen
    </div>
    <div class="panel-body">
        <form role="form" action="<?php echo $base; ?>/lehrkraft/insertnote" method="POST">
            <div class="col-md-12">
                <div class="form-group col-md-12" style="margin-top:10px;">
                    <label class="col-sm-2 control-label text-right">Fach</label>
                    <div class="col-sm-10">
                        <select name="fachId">
                            <?php foreach($model["fächer"] as $fach) { ?>
                            <option value="<?php echo $fach["Id"] ?>"><?php echo $fach["Bezeichnung"] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group col-md-12">
                    <label class="col-sm-2 control-label text-right">Schüler</label>
                    <div class="col-sm-10">
                        <select name="schuelerId">
                            <?php foreach($model["schüler"] as $schüler) { ?>
                            <option value="<?php echo $schüler["Id"] ?>"><?php echo $schüler["Vorname"]." ".$schüler["Name"] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group col-md-12" style="margin-top:10px;">
                    <label class="col-sm-2 control-label text-right">Wert</label>
                    <div class="col-sm-10">
                        <input min="0" max="6" class="form-control" type="number" step="0.01" name="wert" />
                    </div>
                </div>
                <div class="form-group col-md-12" style="margin-top:10px;">
                    <label class="col-sm-2 control-label text-right">Wertung</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="number"  name="wertung" max="100" min="0" />
                    </div>
                </div>
                <div class="form-group col-md-12" style="margin-top:10px;">
                    <label class="col-sm-2 control-label text-right">Punkte</label>
                    <div class="col-sm-4">
                        <input class="form-control" type="number"  name="erreichtePunkte" min="0" />
                    </div>
                    <label class="col-sm-2" style="text-align:center;font-size:26px;">
                    /
                    </label>
                    <div class="col-sm-4">
                        <input class="form-control" type="number"  name="maximalPunkte" min="0" />
                    </div>
                </div>
                <br />
                <div class="col-md-2 col-md-offset-10" style="margin-top:10px;">
                    <input type="submit" class="btn btn-primary" value="Eintragen" />
                </div>
            </div>
        </form>
    </div>
</div>