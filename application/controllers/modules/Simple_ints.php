<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Simple_ints extends MY_Controller {

    public function index()
    {
        // Check session
        $this->check_session();

        $this->init();
    }

    public function init()
    {
        // Check session.
        $this->check_session();

        // Find my own module id.
        $this->load->model('modules_model');
        $module = $this->modules_model->getModuleByKey("SIMPLE_INTS");
        $this->session->current_module_id = $module->id;

        // Find user id.
        $user_id = $this->session->user->id;

        // Update user default module id
        $this->load->model('users_model');
        $this->users_model->changeDefaultModule($user_id, $module->id);

        // Find how many exercises the module has.
        $this->load->model('modSimpleInts_model');
        $num_exercises = $this->modSimpleInts_model->getNumExercises();

        // Check whether user has a record for this module
        $this->load->model('userModuleIndex_model');
        $module_record = $this->userModuleIndex_model->getUserModuleData($user_id, $module->id);

        if (is_null($module_record))
        {
            // User has no record. Create one.
            // First, select a random one to start with.
            $exercise_index = rand(1, $num_exercises);

            // Create a record for the user
            $this->userModuleIndex_model->addUserModuleData($user_id, $module->id, $exercise_index);
        } else {
            // User has a record. Use it.
            $exercise_index = $module_record->current_index;
        }

        $this->session->current_exercise_index = $exercise_index;
        $this->session->max_exercises = $num_exercises;

        // Module is ready. It's showtime!
        redirect('modules/simple_ints/show');
    }

    public function show()
    {
        // Check session.
        $this->check_session();

        // Load current exercise into session.
        $this->load->model('modSimpleInts_model');
        $this->session->exercise = $this->modSimpleInts_model->getExerciseById($this->session->current_exercise_index);

        // Show view.
        $this->loadModularView('mod_simple_ints');
    }

    public function check()
    {
        // Get solution from request
        $solution = $this->input->post('solution');

        // Check it.
        $isRight = ($solution == $this->session->exercise->solution);

        // Get exercise index.
        $curr_index = $this->session->current_exercise_index;

        // Register it.
        $this->load->model('userExerciseActivity_model');
        $this->userExerciseActivity_model->addUserExerciseActivity($this->session->user->id,
            $this->session->current_module_id, $curr_index, $solution, $isRight);

        // Update index to point to next exercise.
        $curr_index++;
        if ($curr_index > $this->session->max_exercises) $curr_index = 1;
        $this->session->current_exercise_index = $curr_index;

        // Upudate index on database.
        $this->load->model('userModuleIndex_model');
        $this->userModuleIndex_model->updateUserModuleData($this->session->user->id, $this->session->current_module_id, $curr_index);

        // What to do after showing the result (show another exercise, what else?).
        $data['action'] = 'modules/simple_ints/show';

        // Show operation
        $data['message'] = '$$ \Large{'.$this->session->exercise->statement.'='.$this->session->exercise->solution.'} $$';

        // Show result.
        $this->loadModularView($isRight ? 'common/answer_right': 'common/answer_wrong', $data);
    }
}
