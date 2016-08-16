<?php

ini_set('display_startup_errors', 1);
ini_set('display_errors', 1);
error_reporting(1);

$output = array();

try {

	//Check the request method
	$method = $_SERVER["REQUEST_METHOD"];
	if( !(strtolower($method) == 'post') ) {
		throw new Exception('Invalid request type.');
	}

	$conn = mysqli_connect( '208.91.198.197', 'championship', 'championship@123' , 'Championship');
	if( !$conn ) {
		throw new Exception('No database connection.');
	}
	
	$data = json_decode(file_get_contents("php://input"));
	if(!isset($data)) {
		$data = array();
	}
	
	foreach ( $_POST as $key => $val ) {
		//$this->vb->$key = $val;
		$data[$key] = $val;
	}
	//$data = json_decode(file_get_contents("php://input"));
	//array_push($data , json_decode(file_get_contents("php://input")));
	//array_merge($data , json_decode(file_get_contents("php://input")));
	
// 	if( !isset($data) ) {
// 		throw new Exception('No data found.');
// 	}
	if( empty($data) ) throw new Exception('No data found.');
	
	$service = $data->service;
	//$service = $data["service"];
	if( !isset($service) ) {
		throw new Exception('No service requested.');
	}

	$func = $data->method;
	if( !isset($func) ) {
		throw new Exception('No method specified.');
	}


	if( !is_file( "$service.php" ) ) {
		throw new Exception('Service not found.');
	}

	require_once "$service.php";
	$srvObj = new $service;

	if( !isset( $srvObj ) ) {
		throw new Exception('Service not initialized.');
	}

	if( !method_exists($srvObj , $func) ) {
		throw new Exception('Function does not exist.');
	}

	$output = $srvObj->$func();


} catch(Exception $e) {
	$output = array( 'success'=>false, 'message'=> $e->getMessage()  );
}

echo json_encode($output);