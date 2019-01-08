<div class="tab-pane p-3 fade" id="orgs" role="tabpanel" aria-labelledby="orgs-tab">

    Añadir organización
    <div class="input-group my-3">
        <div class="input-group-prepend">
            <div class="input-group-text"><i class="fas fa-university"></i></div>
        </div>
        <input type="text" class="form-control" id="orgAddTextbox" placeholder="Nombre de la organización" required>
        <div class="input-group-append">
            <button type="button" class="btn btn-primary" onclick="ajaxAddOrg()">
                <i class="fas fa-plus"></i> Añadir
            </button>
        </div>
    </div>

    <select
            id="testSelect"
            class="form-control"
            name="org_id"
            data-source="<?= site_url("adminAjax/get_orgs_json") ?>"
            data-valueKey="id"
            data-displayKey="name"
            org-select
    ></select>

    <table class="table table-striped">
        <thead>
        <tr class="text-center">
            <th>Organización</th>
            <th>Grupos</th>
            <th>Usuarios</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>

        </tr>

        <?php foreach($orgs as $org) { ?>
            <?= form_open('admin/remove_org/'.$org->id); ?>
            <tr>
                <td><?= $org->name; ?></td>
                <td class="text-center">12</td>
                <td class="text-center">1234</td>
                <td>
                    <button type="submit" class="btn btn-danger btn-sm">
                        <i class="fas fa-lg fa-meteor"></i> Eliminar
                    </button>

                    <div class="form-check form-check-inline ml-3">
                        <input type="checkbox" class="form-check-input" id="dangerCheck1" required>
                        <label class="form-check-label" for="dangerCheck1">
                            <i class="fas fa-skull-crossbones text-danger"></i>
                        </label>
                    </div>

                    <div class="form-check form-check-inline">
                        <input type="checkbox" class="form-check-input" id="dangerCheck1" required>
                        <label class="form-check-label" for="dangerCheck1">
                            <i class="fas fa-exclamation text-danger"></i>
                        </label>
                    </div>
                </td>
            </tr>
            <?= form_close(); ?>
        <?php } ?>
        </tbody>
    </table>
</div>