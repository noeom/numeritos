<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class UserModuleIndex_model extends CI_Model {

    public function getUserModuleData($user_id, $module_id)
    {
        $query = $this->db->query('SELECT * FROM user_module_index WHERE user_id=? AND module_id=?', array($user_id, $module_id));
        return $query->row();
    }

    public function addUserModuleData($user_id, $module_id, $start_index)
    {
        $params = array($user_id, $module_id, $start_index, $start_index);
        return $this->db->query('INSERT INTO user_module_index(user_id, module_id, start_index, current_index) VALUES (?, ?, ?, ?)', $params);
    }

    public function updateUserModuleData($user_id, $module_id, $current_index)
    {
        $params = array($current_index, $user_id, $module_id);
        return $this->db->query('UPDATE user_module_index SET current_index = ? WHERE user_id = ? AND module_id = ?', $params);
    }
}