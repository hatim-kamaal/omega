<?php
$msg="success";
$status=true;
$records = array();

try {
	include_once("dbconn.php");

	$rs = $conn->query("SELECT * FROM `ImagesTable` LIMIT 6");

	if( !isset($rs) ) {
		throw new Exception('Technical issue#1');
	}

	if (!($rs instanceof mysqli_result)) {
		throw new Exception('Technical issue#2');
	}

	while($row = mysqli_fetch_row ( $rs )) {
		$c1 = $row[0];
		$c2 = $row[1];
		$c3 = $row[2];
		$c4 = $row[3];
		$c5 = $row[4];
		$c6 = $row[5];
		
		array_push( $records, array( 'c1'=>$c1, 'c2'=>$c2 , 'c3'=>$c3 
		, 'c4'=>$c4 , 'c5'=>$c5 , 'c6'=>$c6 ) );
	}
	
} catch(Exception $e) {
	$msg=$e->getMessage();
	$state=false;
} finally {
	$conn->close();
}

$result = array('data'=>array('msg'=>$msg,'status'=>$status, 'details'=>$records));

echo json_encode($result);