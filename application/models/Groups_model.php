<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Groups_model extends CI_Model {

    public function getGroupsByOrgId($org_id)
    {
        $query = $this->db->query('SELECT * from user_groups WHERE org_id = ?', array($org_id));
        return $query->result();
    }
}