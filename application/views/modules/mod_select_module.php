<div class="row">
    <?php foreach($modules as $module) { ?>
        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <div class="card mt-3">
                <div class="card-body">
                    <h6 class="card-title"><?= $module->name; ?></h6>
                    <p class="card-text"><?= $module->description; ?></p>
                    <div class="text-center">
                        <a href="<?= site_url('/modules/'.$module->controller);?>" class="btn btn-sm btn-primary"><i class="fas fa-play"></i> Practicar</a>
                    </div>
                </div>
            </div>
        </div>
    <?php } ?>
</div>