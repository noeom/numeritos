<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends MY_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
        // Check user is admin.
        $this->check_admin();

        // No data needed. Lots and lots of AJAX in /admin.

        // Get organizations.
        //$this->load->model('organizations_model');
        //$data['orgs'] = $this->organizations_model->getAllOrganizations();

        // Show!
	    $this->loadAdminModularView("admin/admin_console");
	}

    public function add_org()
    {
        // Check user is admin.
        $this->check_admin();

        // Load model.
        $this->load->model('organizations_model');

        // Get POST data.
        $org_name = $this->input->post('org_name');

        // Add organization.
        $this->organizations_model->addOrganization($org_name);

        $data['disp_success'] = 'Se ha añadido la organización '.$org_name;

        // Get organizations.
        $data['orgs'] = $this->organizations_model->getAllOrganizations();

        // Show!
        $this->loadModularView("admin/manage_orgs", $data);
    }

    public function remove_org($org_id)
    {
        // Check user is admin.
        $this->check_admin();

        // Load model.
        $this->load->model('organizations_model');

        // Remove organization.
        $this->organizations_model->deleteOrganization($org_id);

        $data['disp_success'] = 'Se ha eliminado la organización y sus usuarios asociados.';

        // Get organizations.
        $data['orgs'] = $this->organizations_model->getAllOrganizations();

        // Show!
        $this->loadModularView("admin/manage_orgs", $data);
    }

    public function ajax_groups_table()
    {
        // Check user is admin.
        $this->check_admin();

        // Load model.
        $this->load->model('groups_model');

        // Load groups from the current organization
        $data['groups'] = $this->groups_model->getGroupsByOrgId($this->input->post('org_id'));

        $this->load->view("modules/admin/ajax/ajax_groups_table", $data);
    }
}
