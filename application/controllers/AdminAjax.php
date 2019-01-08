<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class AdminAjax extends MY_Controller {

    public function load_groups_table()
    {
        // Check user is admin.
        $this->check_admin();

        // Load model.
        $this->load->model('groups_model');

        // Load groups from the current organization
        $data['groups'] = $this->groups_model->getGroupsByOrgId($this->input->post('org_id'));

        $this->load->view("modules/admin/ajax/ajax_groups_table", $data);
    }

    private function json_output($array)
    {
        $this->output
            ->set_content_type('application/json')
            ->set_output(json_encode($array));
    }

    public function get_orgs_json()
    {
        // Check user is admin
        if (!$this->is_admin()) return json_encode(array());

        // Load model
        $this->load->model('organizations_model');

        // Return data as JSON
        $this->json_output($this->organizations_model->getAllOrganizations());
    }

    public function add_org()
    {
        // Check user is admin.
        if (!$this->is_admin()) return;

        // Load model.
        $this->load->model('organizations_model');

        // Get POST data.
        $org_name = $this->input->post('org_name');

        // Add organization.
        $this->organizations_model->addOrganization($org_name);
    }
}
