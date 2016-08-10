<?php
$result = array();
array_push($result, array('age'=>1, 'name'=>'Hatim', 'location'=>'Chennai'));
array_push($result, array('age'=>2, 'name'=>'Zainab', 'location'=>'Chennai'));
array_push($result, array('age'=>3, 'name'=>'Zahra', 'location'=>'Chennai'));
array_push($result, array('age'=>4, 'name'=>'Mariyah', 'location'=>'Chennai'));
array_push($result, array('age'=>5, 'name'=>'Abdulla', 'location'=>'Chennai'));

echo json_encode(array('data'=>$result));