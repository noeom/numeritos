<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Select_module extends MY_Controller {

    public function index()
    {
        $this->load->model('modules_model');

        $data['modules'] = $this->modules_model->getAllModules();
        $this->loadModularView("mod_select_module", $data);
    }
}
