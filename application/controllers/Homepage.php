<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Homepage extends MY_Controller {

	public function index()
	{
	    $this->check_session();

	    $this->load->model('modSimpleInts_model');

	    $total = $this->modSimpleInts_model->getNumExercises();

	    $exercise = $this->modSimpleInts_model->getExerciseById(rand(1, $total));

        $data['exercise'] = $exercise;

        $data['disp_success'] = "¡Bien! La solución era \(".$exercise->statement." = ".$exercise->solution."\)";

        $this->loadModularView('mod_test', $data);
	}
}
