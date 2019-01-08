<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Logout extends MY_Controller {

	public function index()
	{
		$this->destroy_session();
		redirect('/init');
	}
}
