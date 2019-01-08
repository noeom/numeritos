<!-- Show messages if neccessary -->
<?php $this->load->view('modules/snippets/display_messages.php'); ?>

<div class="mt-3">
    <!-- Navigation tabs -->
    <?php $this->load->view('modules/admin/console/navigation_tabs'); ?>

    <!-- Panels -->
    <div class="tab-content" id="myTabContent">
        <!-- Stats tab panel -->
        <?php $this->load->view('modules/admin/console/stats_tab_panel'); ?>
        <!-- Orgs tab panel -->
        <?php $this->load->view('modules/admin/console/orgs_tab_panel'); ?>
        <!-- Groups tab panel -->
        <?php $this->load->view('modules/admin/console/groups_tab_panel'); ?>
        <!-- Users tab panel -->
        <?php $this->load->view('modules/admin/console/users_tab_panel'); ?>
    </div>
</div>
