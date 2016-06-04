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
    <link rel="stylesheet" href="<?php echo $base; ?>/bower_components/startbootstrap-sb-admin-2/dist/css/sb-admin-2.css" />
    <link rel="stylesheet" href="<?php echo $base; ?>/bower_components/startbootstrap-sb-admin-2/dist/css/timeline.css" />
    <link href="<?php echo $base; ?>/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
    <link href="<?php echo $base; ?>/bower_components/morrisjs/morris.css" rel="stylesheet">
    <link href="<?php echo $base; ?>/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body>
    <script src="<?php echo $base; ?>/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="<?php echo $base; ?>/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="<?php echo $base; ?>/bower_components/metisMenu/dist/metisMenu.min.js"></script>
    <script src="<?php echo $base; ?>/bower_components/raphael/raphael.min.js"></script>
    <script src="<?php echo $base; ?>/bower_components/morrisjs/morris.min.js"></script>
    <script src="<?php echo $base; ?>/bower_components/startbootstrap-sb-admin-2/dist/js/sb-admin-2.js"></script>
    <script src="<?php echo $base; ?>/js/main.js"></script>
    <div class="container">
        <?php include 'components/header.php'; ?>
        <div class="content">

            <div class="page-header">
                <h1>
								<?php 
echo Title::GetSubtitle();
?>
							</h1>
            </div>
            <?php require($view); ?>

        </div>
    </div>



</body>

</html>
<?php 
}
}
?>