<?php foreach($results as $result) {?>
    <div class="card mt-3">
        <div class="card-body">
            <div class="row text-center">
                <div class="col">
                    <h6 class="card-title text-primary"><?= $result->module_name; ?></h6>
                </div>
            </div>

            <div class="row text-center">
                <div class="col font-weight-bold">
                    <i class="far fa-clock"></i> 24 horas
                </div>
                <div class="col font-weight-bold">
                    <i class="far fa-calendar-alt"></i> 7 días
                </div>
                <div class="col font-weight-bold">
                    <i class="fas fa-history"></i> Total
                </div>
            </div>

            <?php
                $day_total = $result->day->ok + $result->day->wrong;
                if ($day_total > 0)
                {
                    $day_ok_rate = round($result->day->ok / $day_total * 100);
                    $day_wrong_rate = 100 - $day_ok_rate;
                }

                $week_total = $result->week->ok + $result->week->wrong;
                if ($week_total > 0)
                {
                    $week_ok_rate = round($result->week->ok / $week_total * 100);
                    $week_wrong_rate = 100 - $week_ok_rate;
                }
                $all_total = $result->all->ok + $result->all->wrong;
                if ($all_total > 0)
                {
                    $all_ok_rate = round($result->all->ok / $all_total * 100);
                    $all_wrong_rate = 100 - $all_ok_rate;
                }
            ?>

            <div class="row text-center">
                <div class="col">
                    <?php if($day_total > 0) { ?>
                        <text class="text-success"><i class="fas fa-check-circle"></i> <?= $result->day->ok; ?></text>
                        <text class="text-danger"><i class="fas fa-times-circle"></i>  <?= $result->day->wrong; ?></text>
                    <?php } else { ?>
                        <text>Sin actividad</text>
                    <?php } ?>
                </div>
                <div class="col">
                    <?php if($week_total > 0) { ?>
                        <text class="text-success"><i class="fas fa-check-circle"></i> <?= $result->week->ok; ?></text>
                        <text class="text-danger"><i class="fas fa-times-circle"></i>  <?= $result->week->wrong; ?></text>
                    <?php } else { ?>
                        <text>Sin actividad</text>
                    <?php } ?>
                </div>
                <div class="col">
                    <text class="text-success"><i class="fas fa-check-circle"></i> <?= $result->all->ok; ?></text>
                    <text class="text-danger"><i class="fas fa-times-circle"></i>  <?= $result->all->wrong; ?></text>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <?php if($day_total > 0) { ?>
                        <div class="progress">
                            <div class="progress-bar bg-success" style="width: <?= $day_ok_rate; ?>%" role="progressbar" aria-valuenow="<?= $day_ok_rate; ?>" aria-valuemin="0" aria-valuemax="100"></div>
                            <div class="progress-bar bg-danger" style="width: <?= $day_wrong_rate; ?>%" role="progressbar" aria-valuenow="<?= $day_wrong_rate; ?>" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    <?php } ?>
                </div>
                <div class="col">
                    <?php if($week_total > 0) { ?>
                        <div class="progress">
                            <div class="progress-bar bg-success" style="width: <?= $week_ok_rate; ?>%" role="progressbar" aria-valuenow="<?= $week_ok_rate; ?>" aria-valuemin="0" aria-valuemax="100"></div>
                            <div class="progress-bar bg-danger" style="width: <?= $week_wrong_rate; ?>%" role="progressbar" aria-valuenow="<?= $week_wrong_rate; ?>" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    <?php } ?>
                </div>
                <div class="col">
                    <div class="progress">
                        <div class="progress-bar bg-success" style="width: <?= $all_ok_rate; ?>%" role="progressbar" aria-valuenow="<?= $all_ok_rate; ?>" aria-valuemin="0" aria-valuemax="100"></div>
                        <div class="progress-bar bg-danger" style="width: <?= $all_wrong_rate; ?>%" role="progressbar" aria-valuenow="<?= $all_wrong_rate; ?>" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
            </div>

        </div>
    </div>
<?php } ?>