<?php echo form_open('modules/equations_transposition/check'); ?>

<div class="container mt-2">

    <h5 class="card-title">Resuelve la ecuación</h5>

    <!-- Visible on all screens larguer than or equal to md (medium size) -->
    <div class="form-group text-center mt-2 d-none d-md-block" id="mathDiv">
        $$ \Large{ <?= $this->session->exercise->statement; ?> } $$
    </div>

    <!-- Visible only on sm (small) screens -->
    <div class="form-group text-center mt-2 d-none d-sm-block d-md-none" id="mathDiv">
        $$ \large{ <?= $this->session->exercise->statement; ?> } $$
    </div>

    <!-- Visible only on xs screens -->
    <div class="form-group text-center mt-2 d-block d-sm-none" id="mathDiv">
        $$ <?= $this->session->exercise->statement; ?> $$
    </div>

    <div class="form-group">
        <div class="input-group">
            <div class="input-group-prepend">
                <div class="input-group-text">\( \Large{x=} \)</div>
            </div>
            <input class="form-control" type="number" name="solution" required autofocus>
            <div class="input-group-append">
                <button type="submit" class="btn btn-primary"><i class="fas fa-question" title="Comprobar solución"></i></button>
            </div>
        </div>
    </div>

</div>

<?php echo form_close(); ?>

<!-- Do some mathjax and show it -->
<script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/latest.js?config=TeX-MML-AM_CHTML' async></script>

