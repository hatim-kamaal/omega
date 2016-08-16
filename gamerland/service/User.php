<?php


class User {
	
	private $data;
	private $conn;
	
	function __construct() {
		global $data, $conn;
		$this->data = $data;
		$this->conn = $conn;
	}
	
	function signin() {
		$email = $this->data->email;
		$code = $this->data->code;
		
		if( $email === 'hatim' && $code === 'hatim' ) {
			return array( 'success'=>true, 'message'=>'Success.');
		}
		
		throw new Exception('Invalid userid or password.');		
	}
	
	
	function tableExample() {
		sleep(10);
		$result = array();
		array_push($result, array('age'=>1, 'name'=>'Hatim', 'location'=>'Chennai'));
		array_push($result, array('age'=>2, 'name'=>'Zainab', 'location'=>'Chennai'));
		array_push($result, array('age'=>3, 'name'=>'Zahra', 'location'=>'Chennai'));
		array_push($result, array('age'=>4, 'name'=>'Mariyah', 'location'=>'Chennai'));
		array_push($result, array('age'=>5, 'name'=>'Abdulla', 'location'=>'Chennai'));
		
		return array( 'success'=>true, 'message'=>'Success.', 'data'=>$result);
	}
}