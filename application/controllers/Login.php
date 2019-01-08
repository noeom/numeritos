<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller {

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
	    // Extraer campos necesarios
        $username = $this->input->post('username');
        $password = $this->input->post('password');

	    // Buscar usuario.
		$this->load->model('users_model');
		$user = $this->users_model->getUserByUsername($username);

		if (is_null($user))
        {
            $data['disp_error'] = 'El usuario '.$username.' no existe en el sistema.';
            return $this->load->view('login', $data);
        }

        if (!password_verify($password, $user->password_hash))
        {
            $data['disp_error'] = 'La contraseña es incorrecta.';
            return $this->load->view('login', $data);
        }

        // Escribir valores en la sesión
        $this->session->user = $user;

        $this->loadDefaultModule();
	}
}
