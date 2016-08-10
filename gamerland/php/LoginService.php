<?php

$msg = "success";
$status = true;

if( !isset($_GET['email']) ) {
	$msg = "Email id is blank";
	$status = false;
	goto return_with_error;
}

if( !isset($_GET['code']) ) {
	$msg = "Password is blank";
	$status = false;
	goto return_with_error;
}

if( $_GET['email'] === 'hatim' && $_GET['code'] === 'hatim' ) {
	goto return_with_error;
} else {
	$msg = "Incorrect userid or password";
	$status = false;
	goto return_with_error;
}

return_with_error:
$result = array('data'=>array('msg'=>$msg,'status'=>$status));

echo json_encode($result, true);
