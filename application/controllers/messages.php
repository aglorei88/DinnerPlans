<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Messages extends CI_Controller
{
	public function send($id)
	{
		// set validation rules
		$this->form_validation->set_rules('to', 'to', 'trim|required');
		$this->form_validation->set_rules('message', 'message', 'required|max_length[1000]');

		// query database for matching user name
		$this->load->model('user');
		$to = $this->user->match_name($this->input->post('to'));

		// if form fails to validate or user does not exist
		if (!$this->form_validation->run() || !$to)
		{
			// error collection
			$errors = array(
				'to' => '<label class="text-danger">There are no users by that name.</label>',
				'message' => form_error('message')
			);
			$this->session->set_flashdata('errors', $errors);

			// field entry collection
			$errors_input = array(
				'to' => $this->input->post('to'),
				'message' => $this->input->post('message')
			);
			$this->session->set_flashdata('errors_input', $errors_input);
		}
		else
		{
			// field entry collection
			$mail = array(
				'to_user_id' => $to,
				'from_user_id' => $id,
				'message' => $this->input->post('message')
			);

			// load message model and send mail
			$this->load->model('message');
			$this->message->send($mail);
		}

		$this->session->set_flashdata('tab', 'messages');
		$this->session->set_flashdata('message_controls', $this->session->flashdata('message_controls'));
		redirect('/account');
	}

	public function host_apply()
	{
		if (!$this->session->userdata('level'))
		{
			$errors['register'] = 'Please register as a user first.';
			$this->session->set_flashdata('errors', $errors);
			redirect('/');
		}
		else
		{
			// load user model and get first admin
			$this->load->model('user');
			$admin = $this->user->get_admin();

			// set message
			$message = $this->session->userdata('first_name').' '.$this->session->userdata('last_name').' wants to apply to be a host! What do you think?';

			// field entry collection
			$mail = array(
				'to_user_id' => $admin['id'],
				'from_user_id' => $this->session->userdata('id'),
				'message' => $message
			);

			// load message model and send message
			$this->load->model('message');
			$this->message->send($mail);
		}
			$this->session->set_flashdata('tab', 'myListings');
			redirect('/account');
	}

}