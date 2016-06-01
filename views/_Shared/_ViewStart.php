<?php 
class ViewStart{
	public static function render($view, $title, $model = null){
		Title::SetSubtitle($title);
		$base = AppSettings::GetConfig()->baseUrl;
		?>
		<html>
			<head>
				<title>
					<?php Title::Render(); ?>
				</title>
				<script src="<?php echo $base; ?>/bower_components/jquery/dist/jquery.min.js"></script>
				<script src="<?php echo $base; ?>/bower_components/bootstrap/js/tooltip.js"></script>
				<script src="<?php echo $base; ?>/js/main.js"></script>
				<link rel="stylesheet" href="<?php echo $base; ?>/css/main.css"/>
				<link rel="stylesheet" href="<?php echo $base; ?>/bower_components/bootstrap/dist/css/bootstrap.css"/>
			</head>
			<body>
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