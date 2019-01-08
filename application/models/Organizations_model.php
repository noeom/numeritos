<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Organizations_model extends CI_Model {

    public function getAllOrganizations()
    {
        $query = $this->db->query('SELECT * FROM organizations');
        return $query->result();
    }

    public function addOrganization($name)
    {
        return $this->db->query('INSERT INTO organizations(name) VALUES (?)', array($name));
    }

    public function deleteOrganization($org_id)
    {
        return $this->db->query('DELETE FROM organizations WHERE id = ?', array($org_id));
    }
}