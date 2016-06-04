<?php 
class ViewStart {
    public static

    function render($view, $title, $model = null) {
        Title::SetSubtitle($title);
        $base = AppSettings::GetConfig()->baseUrl;
        ?>
<html>

<head>
    <title>
        <?php Title::Render(); ?>
    </title>

    <link rel="stylesheet" href="<?php echo $base; ?>/css/main.css" />
    <link rel="stylesheet" href="<?php echo $base; ?>/bower_components/bootstrap/dist/css/bootstrap.css" />
    <link href="<?php echo $base; ?>/bower_components/morrisjs/morris.css" rel="stylesheet">
    <link href="<?php echo $base; ?>/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="<?php echo $base; ?>/vendor/miminium/asset/css/style.css" rel="stylesheet">
</head>

<body id="mimin" class="dashboard">
    <script src="<?php echo $base; ?>/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="<?php echo $base; ?>/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="<?php echo $base; ?>/bower_components/morrisjs/morris.min.js"></script>
    <script src="<?php echo $base; ?>/bower_components/raphael/raphael.min.js"></script>
    <script src="<?php echo $base; ?>/vendor/miminium/asset/js/plugins/moment.min.js"></script>
    <script src="<?php echo $base; ?>/vendor/miminium/asset/js/plugins/jquery.nicescroll.js"></script>
    <script src="<?php echo $base; ?>/vendor/miminium/asset/js/plugins/fullcalendar.min.js"></script>
    <script src="<?php echo $base; ?>/vendor/miminium/asset/js/plugins/jquery.vmap.min.js"></script>
    <script src="<?php echo $base; ?>/vendor/miminium/asset/js/plugins/chart.min.js"></script>
    <script src="<?php echo $base; ?>/vendor/miminium/asset/js/main.js"></script>
    <script src="<?php echo $base; ?>/js/main.js"></script>

    <?php include 'components/header.php'; ?>
    <div class="container-fluid mimin-wrapper">

        <?php if (Auth::IsAuthenticated()) {
			include 'components/left-menu.php';
		} ?>
        <div id="content">
            <?php require($view); ?>
        </div>
    </div>


</body>

</html>
<?php 
}
}
?>