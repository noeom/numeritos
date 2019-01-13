<div class="text-center mt-3">
    <h5 class="text-primary"><?= $this->session->user->name.' '.$this->session->user->surname ?></h5>
</div>

<div class="text-center mt-3">
    <i class="fas fa-university"></i> <?= $org_name ?>
    <i class="fas fa-users ml-3"></i> <?= $group_name ?>
</div>

<?php include 'snippets/display_messages.php'; ?>

<div class="card mt-3">
    <div class="card-body">
        <?php echo form_open('modules/profile/change_password'); ?>
        <h6 class="card-title">Cambiar contraseña</h6>

        <div class="input-group mt-3">
            <div class="input-group-prepend">
                <div class="input-group-text"><i class="fas fa-key"></i></div>
            </div>
            <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña nueva" required>
            <div class="input-group-append">
                <a class="btn btn-outline-warning" onclick="tooglePasswordVisibility()"><i class="fas fa-eye" id="eyeicon"></i></a>
            </div>
        </div>

        <div class="text-center mt-3">
            <button type="submit" class="btn btn-primary">Cambiar contraseña</button>
        </div>
        <?php echo form_close(); ?>
    </div>
</div>

<script type="text/javascript">
    function tooglePasswordVisibility() {
        var textbox = document.getElementById("password");
        if (textbox.type === "password") {textbox.type = "text";} else {textbox.type = "password";}

        var icon = document.getElementById("eyeicon");
        if (icon.className=="fas fa-eye") {icon.className="fas fa-eye-slash";} else {icon.className="fas fa-eye";}

    }
</script>