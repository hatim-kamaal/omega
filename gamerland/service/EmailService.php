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
	
	function getAllTemplates() {
		$result = array();
		array_push($result, array('id'=>1, 'event'=>'On user registration', 'status'=>true,'template'=>'entire content here' ));
		array_push($result, array('id'=>2, 'event'=>'On password change', 'status'=>true));
		array_push($result, array('id'=>3, 'event'=>'On request forget password', 'status'=>false));
		
		return array( 'success'=>true, 'message'=>'Success.', 'data'=>$result);
	}
	
	
}