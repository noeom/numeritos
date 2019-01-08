<nav class="navbar navbar-light bg-light border-bottom border-primary">

    <a href="<?= site_url('modules/profile');?>" title="Mis datos">
        <i class="text-primary fas fa-lg fa-user-graduate m-1"></i><?= $this->session->user->name ?>
    </a>

    <a href="<?= site_url('modules/my_stats');?>">
        <i class="tex-primary fas fa-lg fa-chart-bar m-1" title="Mis estadísticas"></i>
    </a>

    <a href="<?= site_url('modules/select_module');?>">
        <i class="text-primary fas fa-lg fa-play m-1" title="Hacer ejercicios"></i>
    </a>

    <?php if($this->session->user->isadmin) { ?>
        <a href="<?= site_url('admin');?>">
            <i class="text-dark fas fa-user-tie fa-lg m-1" title="Administración"></i>
        </a>
    <?php } ?>

    <a href="<?= site_url('logout');?>">
        <i class="text-danger fas fa-power-off fa-lg m-1" title="Salir"></i>
    </a>

</nav>
