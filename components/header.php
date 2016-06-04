
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="<?php echo $base; ?>/"><?php echo Title::GetTitle() ?></a>
		</div>
	
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li <?php if(Title::GetSubtitle() == "Schüler - Home") { ?> class="active"<?php } ?>><a href="<?php echo $base; ?>/">Startseite <span class="sr-only">(current)</span></a></li>
			<?php if(Auth::IsAuthenticated()){ ?>
			<li><a href="<?php echo $base; ?>/logout">Ausloggen</a></li>
			<?php
			} else {
			?>
			<li <?php if(Title::GetSubtitle() == "Login") { ?> class="active" <?php } ?>><a href="<?php echo $base; ?>/login">Login</a></li>
			<?php 
			}
			?>
		</ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>