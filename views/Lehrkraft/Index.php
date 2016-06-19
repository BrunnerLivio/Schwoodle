<div class="panel">
    <div class="panel-body">
        <div class="col-md-6 col-sm-12">
            <h3 class="animated fadeInLeft"><?php echo Title::GetSubtitle(); ?></h3>
        </div>
    </div>
</div>
<div class="col-md-6">
    <div class="panel">
        <div class="panel-heading-white panel-heading">
            Absenzen
        </div>
        <div class="panel-body">
            <form role="form" action="<?php echo $base; ?>/lehrkraft/insertabsenz" method="POST">
                <div class="form-group" style="margin-top:10px;">
                    <label class="col-sm-2 control-label text-right">Fach</label>
                    <div class="col-sm-10">
                        <select name="fach">
                            <?php foreach($model["fächer"] as $fach) { ?>
                            <option value="<?php echo $fach["Id"] ?>"><?php echo $fach["Bezeichnung"] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label text-right">Schüler</label>
                    <div class="col-sm-10">
                        <select name="schüler">
                            <?php foreach($model["schüler"] as $schüler) { ?>
                            <option value="<?php echo $schüler["Id"] ?>"><?php echo $schüler["Vorname"]." ".$schüler["Name"] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group" style="margin-top:10px;">
                    <label class="col-sm-2 control-label text-right">Anzahl Lektionen</label>
                    <div class="col-sm-10">
                        <input type="text" name="lektionen" />
                    </div>
                </div>
                <div class="col-md-2 col-md-offset-10" style="margin-top:10px;">
                    <input type="submit" class="btn btn-primary" value="Eintrag" />
                </div>
            </form>
        </div>
    </div>
</div>