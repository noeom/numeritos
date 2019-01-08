<?php

if (isset($disp_success)) { ?>
    <div class="alert alert-success border border-success m-2" role="alert">
        <i class="fas fa-check"></i> <?= $disp_success; ?>
    </div>
<?php }

if (isset($disp_warning)) { ?>
    <div class="alert alert-warning border border-warning m-2" role="alert">
        <i class="fas fa-exclamation-triangle"></i> <?= $disp_warning; ?>
    </div>
<?php }

if (isset($disp_error)) { ?>
    <div class="alert alert-danger border border-error m-2" role="alert">
        <i class="fas fa-times-circle"></i> <?= $disp_error; ?>
    </div>
<?php } ?>