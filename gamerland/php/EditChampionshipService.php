<?php
// $msg="success";
// $status=true;
// $records = array();

// try {
	include_once("dbconn.php");

// 	$query = "INSERT INTO ImagesTable (
// 			imgId,
// 			images,
// 			gameName,
// 			platform,
// 			gamePrice,
// 			until,
// 			purchasePrize,
// 			gameType,
// 			UserRegistered,
// 			TotalRounds
// 			) 
// 			VALUES (  )";
	
// 	$rs = $conn->query("INSERT INTO ImagesTable ");

// 	if( !isset($rs) ) {
// 		throw new Exception('Technical issue#1');
// 	}

// 	if (!($rs instanceof mysqli_result)) {
// 		throw new Exception('Technical issue#2');
// 	}

// 	while($row = mysqli_fetch_row ( $rs )) {
// 		$c1 = $row[0];
// 		$c2 = $row[1];
// 		$c3 = $row[2];
// 		$c4 = $row[3];
// 		$c5 = $row[4];
// 		$c6 = $row[5];
		
// 		array_push( $records, array( 'c1'=>$c1, 'c2'=>$c2 , 'c3'=>$c3 
// 		, 'c4'=>$c4 , 'c5'=>$c5 , 'c6'=>$c6 ) );
// 	}
	
// } catch(Exception $e) {
// 	$msg=$e->getMessage();
// 	$state=false;
// }
// $conn->close();

// $result = array('data'=>array('msg'=>$msg,'status'=>$status, 'details'=>$records));

//echo json_encode($result);

$data = json_decode(file_get_contents("php://input"));

$images = $data->images;
$gameName = $data->gameName;
$platform = $data->platform;
$gamePrice = $data->gamePrice;
$until = $data->until;
$purchasePrize = $data->purchasePrize;
$gameType = $data->gameType;
$UserRegistered = $data->UserRegistered;
$TotalRounds = $data->TotalRounds;

 	$query = "INSERT INTO ImagesTable (
			images, gameName,platform,gamePrice,until,
			purchasePrize,gameType,UserRegistered,TotalRounds
			) VALUES ( 
			'$images','$gameName','$platform','$gamePrice','$until',
			'$purchasePrize', '$gameType', '$UserRegistered', '$TotalRounds')";

 	if( $conn->query($query) ) {
 		$msg = "success";
 	} else {
 		$msg = $conn->error . $query;
 	}

 	$conn->close();
//$msg = $data->gameName;

echo json_encode(array('HATIM'=>$msg));