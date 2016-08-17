<?php

$name = "0";

if ( !empty( $_FILES ) ) {
	if( isset($_FILES[ $name ]) ) {
		$tempPath = $_FILES[ $name ][ 'tmp_name' ];
		$fileName = $_FILES[ $name ][ 'name' ];
		$uploadPath = "../uploads/$fileName";
		move_uploaded_file( $tempPath, $uploadPath );
		$answer = array( 'success' => true, 'message' => $fileName );
		$json = json_encode( $answer );
		echo $json;
	} else {
		echo json_encode( array( 'success' => false, 'message' => 'Invalid file variable' ) );
	}
} else {
	echo json_encode( array( 'success' => false, 'message' => 'NO file recieved.' ) );
}