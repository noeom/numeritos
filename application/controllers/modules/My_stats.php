<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class My_stats extends MY_Controller {

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

        $user_id = $this->session->user->id;

        // Get modules for this user (only modules she has used)
        $this->load->model('userExerciseActivity_model');

        $module_ids = $this->userExerciseActivity_model->getInvolvedModulesByUser($user_id);

        $results = array();
        $this->load->model('modules_model');
        foreach($module_ids as $mod_info)
        {
            $module_id = $mod_info->module_id;
            $result = new stdClass();
            $result->module_name = $this->modules_model->getModuleById($module_id)->name;
            $result->day = $this->userExerciseActivity_model->getUserActivityByModuleLastHours($this->session->user->id, $module_id, 24);
            $result->week = $this->userExerciseActivity_model->getUserActivityByModuleLastHours($this->session->user->id, $module_id, 168);
            $result->all = $this->userExerciseActivity_model->getUserActivityByModuleOverall($this->session->user->id, $module_id);

            $this->nullToZero($result);

            array_push($results, $result);
        }

        $data['results'] = $results;
        $this->loadModularView('mod_my_stats', $data);
	}

	private function nullToZero($result)
    {
        if (is_null($result->day->ok)) $result->day->ok = 0;
        if (is_null($result->day->wrong)) $result->day->wrong = 0;
        if (is_null($result->week->ok)) $result->week->ok = 0;
        if (is_null($result->week->wrong)) $result->week->wrong = 0;
        if (is_null($result->all->ok)) $result->week->ok = 0;
        if (is_null($result->all->wrong)) $result->week->wrong = 0;
    }
}
