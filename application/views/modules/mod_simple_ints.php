<?php echo form_open('modules/simple_ints/check'); ?>

<div class="container mt-2">

    <h5 class="card-title">Calcula</h5>

    <div class="form-group text-center m-2" id="mathDiv">
        $$ \Large{ <?= $this->session->exercise->statement; ?> } $$
    </div>

    <div class="form-group">
        <div class="input-group">
            <div class="input-group-prepend">
                <div class="input-group-text"><i class="fas fa-pen"></i></div>
            </div>
            <input class="form-control" type="text" name="solution" required autofocus>
            <div class="input-group-append">
                <button type="submit" class="btn btn-primary"><i class="fas fa-question" title="Comprobar solución"></i></button>
            </div>
        </div>
    </div>
</div>

<?php echo form_close(); ?>

<!-- Do some mathjax and show it -->
<script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/latest.js?config=TeX-MML-AM_CHTML' async></script>

