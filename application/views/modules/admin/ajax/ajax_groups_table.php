<table class="table table-striped">
    <thead>
    <tr class="text-center">
        <th>Grupo</th>
    </tr>
    </thead>
    <tbody>
    <?php foreach($groups as $group) { ?>
        <tr>
            <td>
                <?= $group->name ?>
            </td>
        </tr>

    <?php } ?>
    </tbody>
</table>
