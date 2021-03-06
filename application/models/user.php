<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Model
{
	public function get_all_users()
	{
		return $this->db->query("SELECT u.id, u.first_name, u.last_name, u.email, u.level AS level_id, CASE u.level WHEN 9 THEN 'Admin' WHEN 5 THEN 'Host' WHEN 4 THEN 'User' END AS level, u.description, DATEDIFF(NOW(), u.created_at) AS days, i.file_path FROM users u JOIN images i ON u.image_id = i.id ORDER BY u.id DESC;")->result_array();
	}

	public function register_user($user)
	{
		return $this->db->query("INSERT INTO users (first_name, last_name, email, password, level, created_at, updated_at) VALUES (?,?,?,?,?,NOW(),NOW());", array($user['first_name'], $user['last_name'], $user['email'], $user['password'], $user['level']));
	}

	public function login_user($user_email)
	{
		return $this->db->query("SELECT id, first_name, last_name, email, password, CASE level WHEN 9 THEN 'Admin' WHEN 5 THEN 'Host' WHEN 4 THEN 'User' END AS level FROM users WHERE email=?;", array($user_email))->row_array();
	}

	public function get_user_by_id($id)
	{
		return $this->db->query("SELECT u.id, u.first_name, u.last_name, u.email, CASE u.level WHEN 9 THEN 'Admin' WHEN 5 THEN 'Host' WHEN 4 THEN 'User' END AS level, u.description, DATEDIFF(NOW(), u.created_at) AS days, i.file_path FROM users u JOIN images i ON u.image_id = i.id WHERE u.id = ?;", array($id))->row_array();
	}

	public function upload_picture($upload)
	{
		$this->db->query("INSERT INTO images (image, file_path, created_at) VALUES (?, ?, NOW());", array($upload['file_name'], '/uploads/'.$upload['file_name']));

		$this->set_image($upload);
	}

	public function set_image($upload)
	{
		return $this->db->query("UPDATE users SET image_id=? WHERE id=?;", array($this->db->insert_id(), $upload['id']));
	}

	public function update_user($user)
	{
		return $this->db->query("UPDATE users SET first_name=?, last_name=?, email=?, description=?, updated_at=NOW() WHERE id=?;", array($user['first_name'], $user['last_name'], $user['email'], $user['description'], $user['id']));
	}

	public function update_privilege($user)
	{
		return $this->db->query("UPDATE users SET level=? WHERE id=?;", array($user['level'], $user['id']));
	}

	public function match_name($username)
	{
		return $this->db->query("SELECT id FROM users WHERE CONCAT_WS(' ', first_name, last_name) = ?;", array($username))->row_array();
	}

	public function get_admin()
	{
		return $this->db->query("SELECT id FROM users WHERE level = 9 LIMIT 1;")->row_array();
	}
}

?>