<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ModSimpleInts_model extends CI_Model {

    public function getExerciseById($id)
    {
        $query = $this->db->query('SELECT * FROM mod_simple_ints WHERE id=?', array($id));
        return $query->row();
    }

    public function getNumExercises()
    {
        $query = $this->db->query('SELECT COUNT(*) as total FROM mod_simple_ints');
        return $query->row()->total;
    }
}