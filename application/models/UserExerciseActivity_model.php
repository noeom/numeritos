<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class UserExerciseActivity_model extends CI_Model {

    public function addUserExerciseActivity($user_id, $module_id, $exercise_id, $raw_answer, $result = true)
    {
        return $this->db->query('INSERT INTO user_exercise_activity(user_id, module_id, exercise_id, result, raw_answer) values (?, ?,?,?,?)',
            array($user_id, $module_id, $exercise_id, $result, $raw_answer));
    }

    public function getUserActivityByModuleLastHours($user_id, $module_id, $num_hours)
    {
        $params = array($user_id, $module_id, $user_id, $module_id, $num_hours);
        $query = $this->db->query('SELECT '.
        'SUM(user_id = ? AND module_id = ? AND result = 1) AS ok, '.
        'SUM(user_id = ? AND module_id = ? AND result = 0) AS wrong '.
        'FROM user_exercise_activity '.
        'WHERE time >= DATE_SUB(NOW(),INTERVAL ? HOUR);', $params);
        return $query->row();
    }

    public function getUserActivityByModuleOverall($user_id, $module_id)
    {
        $params = array($user_id, $module_id, $user_id, $module_id);
        $query = $this->db->query('SELECT '.
            'SUM(user_id = ? AND module_id = ? AND result = 1) AS ok, '.
            'SUM(user_id = ? AND module_id = ? AND result = 0) AS wrong '.
            'FROM user_exercise_activity;', $params);
        return $query->row();
    }

    public function getInvolvedModulesByUser($user_id)
    {
        $query = $this->db->query('SELECT DISTINCT(module_id) FROM user_exercise_activity WHERE user_id = ?', array($user_id));
        return $query->result();
    }
}