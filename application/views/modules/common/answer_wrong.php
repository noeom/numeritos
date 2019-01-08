<?php echo form_open($action); ?>

<div class="card m-2">
    <div class="card-body  text-center">
        <p class="card-title text-danger display-4"><i class="fas fa-times-circle"></i> No es correcto</p>
        <p><?= $message ?></p>
        <button type="submit" class="btn btn-primary" autofocus>Seguir aprendiendo</button>
    </div>
</div>

<?php echo form_close(); ?>

<!-- Do some mathjax and show it -->
<script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/latest.js?config=TeX-MML-AM_CHTML' async></script>

