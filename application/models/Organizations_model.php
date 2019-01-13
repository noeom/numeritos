<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Organizations_model extends CI_Model {

    public function getAllOrganizations()
    {
        $query = $this->db->query('SELECT * FROM organizations');
        return $query->result();
    }

    public function getOrganizationById($org_id)
    {
        $query = $this->db->query('SELECT * FROM organizations WHERE id = ?', array($org_id));
        return $query->row();
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