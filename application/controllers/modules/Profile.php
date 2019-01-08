<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Profile extends MY_Controller {

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
	    // Verificar sesión
        $this->check_session();

        $this->loadModularView('mod_profile');
	}

	public function change_password()
    {
        // Verificar sesión
        $this->check_session();

        $new_password = $this->input->post('password');

        $this->load->model('users_model');
        $this->users_model->changePassword($this->session->user->id, $new_password);

        $data['disp_success'] = 'Se ha cambiado la contraseña.';
        $this->loadModularView('mod_profile', $data);
    }
}
