<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ModEquationsTransposition_model extends CI_Model {

    public function getExerciseById($id)
    {
        $query = $this->db->query('SELECT * FROM mod_equations_transposition WHERE id=?', array($id));
        return $query->row();
    }

    public function getNumExercises()
    {
        $query = $this->db->query('SELECT COUNT(*) as total FROM mod_equations_transposition');
        return $query->row()->total;
    }
}