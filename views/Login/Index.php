<form class="form-signin" method="post">
    <div class="panel periodic-login">
        <div class="panel-body text-center">
            <h1><?php echo Title::GetTitle(); ?></h1>
			<h3>Das bessere Moodle</h3>
			
            <i class="icons icon-arrow-down"></i>
            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                <input type="email" name="email" class="form-text" required>
                <span class="bar"></span>
                <label>Email</label>
            </div>
            <div class="form-group form-animate-text" style="margin-top:40px !important;">
                <input type="password" name="password" class="form-text" required>
                <span class="bar"></span>
                <label>Passwort</label>
            </div>
            <input type="submit" class="btn col-md-12" value="SignIn" />
        </div>
        <div class="text-center" style="padding:5px;">
            <a href="reg.html">Regestrieren</a>
        </div>
    </div>
</form>