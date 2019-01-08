<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Modules_model extends CI_Model {

    public function getModuleById($id)
    {
        $query = $this->db->query('SELECT * FROM modules WHERE id=?', array($id));
        return $query->row();
    }

    public function getModuleByKey($name)
    {
        $query = $this->db->query('SELECT * FROM modules WHERE idkey=?', array($name));
        return $query->row();
    }

    public function getAllModules()
    {
        $query = $this->db->query('SELECT * FROM modules');
        return $query->result();
    }
}