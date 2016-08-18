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
		$result = array();
		array_push($result, array('age'=>1, 'name'=>'Hatim', 'location'=>'Chennai'));
		array_push($result, array('age'=>2, 'name'=>'Zainab', 'location'=>'Chennai'));
		array_push($result, array('age'=>3, 'name'=>'Zahra', 'location'=>'Chennai'));
		array_push($result, array('age'=>4, 'name'=>'Mariyah', 'location'=>'Chennai'));
		array_push($result, array('age'=>5, 'name'=>'Abdulla', 'location'=>'Chennai'));
		
		return array( 'success'=>true, 'message'=>'Success.', 'data'=>$result);
	}

	function getRegisteredUsers() {
		$rs = $this->conn->query("SELECT user_id,fullname,country,platform,username,language
				profile_pic,email FROM User");

		if( !isset($rs) ) {
			throw new Exception('Technical issue#1');
		}

		if (!($rs instanceof mysqli_result)) {
			throw new Exception('Technical issue#2');
		}

		$records = array();

		while($row = mysqli_fetch_row ( $rs )) {
			$c = 0;
			$user_id = $row[$c++];
			$fullname = $row[$c++];
			$country = $row[$c++];
			$platform = $row[$c++];
			$username = $row[$c++];
			$language = $row[$c++];
			$profile_pic = $row[$c++];
			$email = $row[$c++];

			array_push( $records, array( 'user_id'=>$user_id,'fullname'=>$fullname, 'country'=>$country , 'platform'=>$platform
			, 'username'=>$username , 'language'=>$language , 'profile_pic'=>$profile_pic , 'email'=>$email) );
		}

		$this->conn->close();

		return array( 'success'=>true, 'message'=>'Found the record.', 'data'=> $records);
	}
	
}