<nav class="navbar navbar-default header navbar-fixed-top">
    <div class="col-md-12 nav-wrapper">
        <div class="navbar-header" style="width:100%;">
            <div class="opener-left-menu is-open">
                <span class="top"></span>
                <span class="middle"></span>
                <span class="bottom"></span>
            </div>
            <a href="index.html" class="navbar-brand">
                <b><?php echo Title::GetTitle() ?></b>
            </a>
            <ul class="nav navbar-nav navbar-right user-nav">
                <?php if (Auth::IsAuthenticated()) { ?>
                	<li class="user-name"><span><?php echo Auth::GetUser()["Vorname"]; ?> <?php echo Auth::GetUser()["Name"]; ?></span></li>
                <?php } ?>
                <li class="dropdown avatar-dropdown">
                    <img src="vendor/miminium/asset/img/avatar.jpg" class="img-circle avatar" alt="user name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" />
                    <ul class="dropdown-menu user-dropdown">
                        <li><a href="<?php echo $base; ?>"><span class="fa fa-user"></span>Dashboard</a></li>
                        <li class="more">
                            <ul>
                                <li><a href="<?php echo $base ?>/logout"><span class="fa fa-power-off "></span></a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>