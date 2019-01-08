<div class="tab-pane fade" id="groups" role="tabpanel" aria-labelledby="groups-tab">
    <div class="form-group form-inline mt-3">
        <div class="input-group">
            <div class="input-group-prepend">
                <div class="input-group-text"><i class="fas fa-university"></i></div>
            </div>
            <select class="form-control" id="groups_orgs_select">
                <?php foreach($orgs as $org) { ?>
                    <option value="<?= $org->id ?>"><?= $org->name; ?></option>
                <?php } ?>
            </select>
            <div class="input-group-append">
                <button type="button" class="btn btn-primary" onclick="ajaxLoadGroups();">Cargar grupos</button>
            </div>
        </div>
    </div>

    <div id="groupsTableDiv"></div>

</div>