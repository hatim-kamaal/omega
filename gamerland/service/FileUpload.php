<?php

$data = array();

// foreach ( $_GET as $key => $val ) {
// 	//$this->vb->$key = $val;
// 	$data[$key] = $val;
// }
foreach ( $_POST as $key => $val ) {
	//$this->vb->$key = $val;
	$data[$key] = $val;
}

//$data = json_decode(file_get_contents("php://input"));
if( empty($data) ) {
	echo 'No data found.';
}
 else {
	echo $data->model->service;
}

$name = "0";

if ( !empty( $_FILES ) ) {
	if( isset($_FILES[ $name ]) ) {
		$tempPath = $_FILES[ $name ][ 'tmp_name' ];
		//$uploadPath = dirname( __FILE__ ) . DIRECTORY_SEPARATOR . $_FILES[ $name ][ 'name' ];
		$uploadPath = "../uploads/" . $_FILES[ $name ][ 'name' ];
		move_uploaded_file( $tempPath, $uploadPath );
		$answer = array( 'answer' => 'File transfer completed' );
		$json = json_encode( $answer );
		//echo $json;
		echo "file recieved - " . $_POST["gameName"];
	} else {
		echo "oops file is not file";
	}
} else {
	echo 'No files';
}