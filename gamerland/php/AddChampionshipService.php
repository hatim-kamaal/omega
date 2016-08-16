<?php
include_once("dbconn.php");

//$method = $_SERVER["request_method"];

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

echo json_encode(array('HATIM'=>$msg));