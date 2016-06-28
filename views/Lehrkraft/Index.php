<div class="col-md-6">
  <?php include 'components/note-form.php'; ?>
</div>
<div class="col-md-6">
  <div class="panel box-v2">
    <div class="panel-heading padding-0">
      <img src="http://ibn.ch/HomePageSchule/Schule/GIBZ/GIBZ_Bild.jpg" class="box-v2-cover img-responsive" />
      <div class="box-v2-detail">
        <img src="http://www.rolf-hirschi.ch/public/100/rolf_hirschi_2015.png" class="img-responsive" />
        <h4><?php echo Auth::GetUser()["Vorname"]; ?> <?php echo Auth::GetUser()["Name"]; ?></h4>
      </div>
    </div>
    <div class="panel-body">
      <div class="col-md-12 padding-0 text-center">
        <div class="col-md-12 padding-0">
          <h3><?php echo $model["EingetrageneAbsenzen"];?></h3>
          <p>Eingetragene Absenzen</p>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="col-md-6">
  <?php include 'components/persoenlichedaten-form.php'; ?>
</div>

<div class="col-md-6">
  <?php include 'components/absenz-form.php'; ?>
</div>