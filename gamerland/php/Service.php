<?php

$output = array();

//Check the request method
$method = $_SERVER['REQUEST_METHOD'];
echo "METHOD - $method";
if( !(strtolower($method) == 'post') ) {
	$output = array( 'success'=>false, 'message'=>'Invalid request type. $method'  );
	goto SERVICE_END; 
}


$conn = mysqli_connect( '208.91.198.197', 'championship', 'championship@123' , 'Championship');
$data = json_decode(file_get_contents("php://input"));

$service = $data->service;
if( !isset($service) ) {
	$output = array( 'success'=>false, 'message'=>'No service requested.'  );
	goto SERVICE_END;	
}

$func = $data->method;
if( !isset($func) ) {
	$output = array( 'success'=>false, 'message'=>'No method specified.'  );
	goto SERVICE_END;
}


if( !is_file( "$service.php" ) ) {
	$output = array( 'success'=>false, 'message'=>'Service not found.'  );
	goto SERVICE_END;
}

require_once "$service.php";
$srvObj = new $service;

if( !isset( $srvObj ) ) {
		$output = array( 'success'=>false, 'message'=>'Service not initialized.'  );
		goto SERVICE_END;
}

if( !method_exists($srvObj , $func) ) {
	$output = array( 'success'=>false, 'message'=>'Function does not exist.'  );
	goto SERVICE_END;	
}

$output = $srvObj->$func;

SERVICE_END:
echo json_encode($output);