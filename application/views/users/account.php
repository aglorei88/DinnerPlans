<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Dashboard</title>
	<!-- Latest compiled and minified jquery -->
	<script src="/assets/js/jquery-2.1.3.min.js"></script>
	<!-- Latest compiled and minified jquery ui -->
	<script src="/assets//js/jquery-ui.min.js"></script>
	<!-- Latest compiled and minified CSS -->
	<script src="/assets//js/bootstrap.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/assets/css/main.css">
	<link rel="stylesheet" type="text/css" href="/assets/css/account.css">
</head>
<body>
<?php	$this->load->view('partials/header'); ?>
	<div class="container">
		<!-- Tab Selectors -->
		<ul class="nav nav-tabs">
			<li role="presentation" class="active"><a href="#dashboard" data-toggle="tab">Dashboard</a></li>
			<li role="presentation"><a href="#billing" data-toggle="tab">Billing</a></li>
			<li role="presentation"><a href="#messages" data-toggle="tab">Messages</a></li>
			<li role="presentation"><a href="#myListings" data-toggle="tab">My Listings</a></li>
<?php		if ($this->session->userdata['level'] == 'Admin')
			{ ?>
				<li role="presentation"><a href="#myAdminControls" data-toggle="tab">Admin Controls</a></li>
<?php		} ?>
		</ul>
		<!-- Tab Contents -->
		<div class="tab-content">
			<!-- Dashboard -->
			<div class="tab-pane fade in active" id="dashboard">
				<div class="row">
					<!-- Profile Box -->
<?php				$this->load->view('partials/profile_box', $user_info); ?>
					<!-- Bid Controls -->
				</div>
				<!-- Order History -->
			</div>
			<!-- Billing -->
			<div class="tab-pane fade in" id="billing">
				Billing content
			</div>
			<!-- Messages -->
			<div class="tab-pane fade in" id="messages">
				Messages content
			</div>
			<!-- Listings -->
			<div class="tab-pane fade in" id="myListings">
				My Listings content
			</div>
			<!-- Admin Controls (if level == admin) -->
<?php		if ($this->session->userdata['level'] == 'Admin')
			{ ?>
			<div class="tab-pane fade in" id="myAdminControls">
<?php			$this->load->view('partials/admin_controls', $user_info); ?>
			</div>
<?php		} ?>
		</div>
	</div>
</body>
</html>