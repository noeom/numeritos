<?php echo form_open('modules/simple_fracs/check'); ?>

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
            <input class="form-control" name="solution" required autofocus>
            <div class="input-group-append">
                <button type="submit" class="btn btn-primary"><i class="fas fa-question" title="Comprobar solución"></i></button>
            </div>
        </div>
    </div>

    <ul>
        <li>Introduce las fracciones usando la barra inclinada. Por ejemplo, \( \frac{3}{2} \) se escribe 3/2</li>
        <li>Si una fracción es negativa, pon el negativo en el numerador. Por ejemplo, \( \frac{-5}{3} \) se escribe -5/3</li>
        <li>Simplifica. Si el resultado es un entero, escribe sólo el número entero. Por ejemplo, \( \frac{-8}{4} \) se escribe -2</li>
    </ul>
</div>

<?php echo form_close(); ?>

<!-- Do some mathjax and show it -->
<script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/latest.js?config=TeX-MML-AM_CHTML' async></script>

