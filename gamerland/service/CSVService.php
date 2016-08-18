<?php


class CSVService {
	
	private $fname = "../csv/email.template.csv";
	private $data;
	private $file;
	//private $conn;
	
	function __construct() {
		global $data;//, $conn;
		$this->data = $data;
		$this->file = file($this->fname);
		//$this->conn = $conn;
	}
	
	function getAllContent() {
		$result = array();
		$contents = $this->file;
		$heading = true;
		foreach($contents as $line) {
			if( $heading ) {
				$heading = false;
				continue;
			}
		   $data = explode(",",$line);
		   array_push($result, array('id'=>$data[0], 'event'=>$data[1], 'status'=>$data[2],'template'=>$data[3] ));		   
		}
		
		return array( 'success'=>true, 'message'=>'Success.', 'data'=>$result);
	}
	
	function addContent() {
		$event = $this->data->event;
		$status = $this->data->status;
		$template = $this->data->template;		
		
		return array( 'success'=>true, 'message'=>'Success.', 'data'=>$result);
	}

	function editContent() {
		$id = $this->data->id;
		$event = $this->data->event;
		$status = $this->data->status;
		$template = $this->data->template;		
		
		$csvfile = $this->fname;

		$tempfile = tempnam(".", "tmp"); // produce a temporary file name, in the current directory

		if(!$input = fopen($csvfile,'r')){
			die('could not open existing csv file');
		}
		if(!$output = fopen($tempfile,'w')){
			die('could not open temporary output file');
		}

		while(($data = fgetcsv($input)) !== FALSE){
			if($data[0] == $id){
				$data[1] = $event;
				$data[3] = $template;
			}
			fputcsv($output,$data);
		}

		fclose($input);
		fclose($output);

		unlink($csvfile);
		rename($tempfile,$csvfile);

		//echo 'done';
		
		return array( 'success'=>true, 'message'=>"ID:$id , EVENT:$event , STATUS:$status , TEMPLATE:$template");
	}

	
	function getByRowNumber() {
		$result = array();
		array_push($result, array('id'=>1, 'event'=>'On user registration', 'status'=>true,'template'=>'entire content here' ));
		array_push($result, array('id'=>2, 'event'=>'On password change', 'status'=>true));
		array_push($result, array('id'=>3, 'event'=>'On request forget password', 'status'=>false));
		
		return array( 'success'=>true, 'message'=>'Success.', 'data'=>$result);
	}

	function getByRange() {
		$result = array();
		array_push($result, array('id'=>1, 'event'=>'On user registration', 'status'=>true,'template'=>'entire content here' ));
		array_push($result, array('id'=>2, 'event'=>'On password change', 'status'=>true));
		array_push($result, array('id'=>3, 'event'=>'On request forget password', 'status'=>false));
		
		return array( 'success'=>true, 'message'=>'Success.', 'data'=>$result);
	}
	
	
	
}