<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MY_Controller extends CI_Controller {

	public function check_session()
    {
        if (!$this->session->has_userdata('user'))
        {
            redirect('/init');
        }
    }

    public function check_admin()
    {
        // Check session first.
        $this->check_session();

        // Not an admin. Load default module.
        if (!$this->session->user->isadmin)
        {
            $this->loadDefaultModule();
        }
    }

    public function is_admin()
    {
        if (!$this->session->has_userdata('user')) return false;
        return $this->session->user->isadmin;
    }

    public function destroy_session()
    {
        $this->session->sess_destroy();
    }

    public function loadModularView($module_view, $data = null)
    {
        $this->load->view('modules/snippets/header', $data);
        $this->load->view('modules/snippets/navbar', $data);
        $this->load->view('modules/'.$module_view, $data);
        $this->load->view('modules/snippets/footer', $data);
    }

    public function loadAdminModularView($module_view, $data = null)
    {
        $this->load->view('modules/snippets/header_admin', $data);
        $this->load->view('modules/snippets/navbar', $data);
        $this->load->view('modules/'.$module_view, $data);
        $this->load->view('modules/snippets/footer_admin', $data);
    }

    public function loadDefaultModule()
    {
        // Cargar y transferir control al módulo por defecto.
        $this->load->model('modules_model');

        $default_module = $this->modules_model->getModuleById($this->session->user->default_module);

        $this->session->default_module = $default_module;

        redirect('/modules/'.$default_module->controller);
    }
}
