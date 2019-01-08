<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Users_model extends CI_Model {

    public function getUserByUsername($username)
    {
        $query = $this->db->query('SELECT * FROM users WHERE user_name=?', array($username));
        return $query->row();
    }

    public function changeDefaultModule($user_id, $module_id)
    {
        $query = $this->db->query('UPDATE users SET default_module = ? WHERE id = ?', array($module_id, $user_id));
    }

    public function changePassword($user_id, $new_password)
    {
        $hash = password_hash($new_password, PASSWORD_DEFAULT);
        $query = $this->db->query('UPDATE users SET password_hash = ? WHERE id = ?', array($hash, $user_id));
    }
}