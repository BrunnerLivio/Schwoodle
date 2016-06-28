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