<?php


class EmailService {
	
	private $data;
	private $conn;
	
	function __construct() {
		global $data, $conn;
		$this->data = $data;
		$this->conn = $conn;
	}
	
	function broadcast() {
		return array( 'success'=>true, 'message'=>'Broadcast sent successfully.');
	}
	
	
	
}