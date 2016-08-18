<?php

/**
* 
*/
class Championship {

	private $data;
	private $conn;

	function __construct() {
		global $data, $conn;
		$this->data = $data;
		$this->conn = $conn;
	}

	/**
	 *
	 * @throws Exception
	 * @return multitype:boolean string multitype:
	 */
	function get() {
		//return $output = array( 'success'=>true, 'message'=>'Found the record.' );
		//throw new Exception('Technical issue#1');

		$rs = $this->conn->query("SELECT imgId, gameName, images,platform, 
		gamePrice,until,purchasePrize,gameType,UserRegistered,TotalRounds FROM ImagesTable");

		if( !isset($rs) ) {
			throw new Exception('Technical issue#1');
		}

		if (!($rs instanceof mysqli_result)) {
			throw new Exception('Technical issue#2');
		}

		$records = array();

		while($row = mysqli_fetch_row ( $rs )) {
			$c = 0;
			$c0 = $row[$c++];
			$c1 = $row[$c++];
			$c2 = $row[$c++];
			$c3 = $row[$c++];
			$c4 = $row[$c++];
			$c5 = $row[$c++];
			$c6 = $row[$c++];
			$c7 = $row[$c++];
			$c8 = $row[$c++];
			$c9 = $row[$c++];

			array_push( $records, array( 'imgId'=>$c0,'gameName'=>$c1, 'images'=>$c2 , 'platform'=>$c3
			, 'gamePrice'=>$c4 , 'until'=>$c5 , 'purchasePrize'=>$c6 , 'gameType'=>$c7, 'UserRegistered'=>$c8
			, 'TotalRounds'=>$c9) );
		}

		$this->conn->close();

		return array( 'success'=>true, 'message'=>'Found the record.', 'data'=> $records);
	}

	/**
	 * 
	 * @throws Exception
	 * @return multitype:boolean string multitype:unknown
	 */
	function getById() {
		$id = $this->data->id;

		$rs = $this->conn->query("SELECT imgId, gameName, images,platform, 
		gamePrice,until,purchasePrize,gameType,UserRegistered,TotalRounds 
		FROM ImagesTable WHERE imgId=$id");

		if( !isset($rs) ) {
			throw new Exception('Technical issue#1');
		}

		if (!($rs instanceof mysqli_result)) {
			throw new Exception('Technical issue#2');
		}

		$records = array();

		$c = 0;
		$row = mysqli_fetch_row ( $rs );
		$c0 = $row[$c++];
		$c1 = $row[$c++];
		$c2 = $row[$c++];
		$c3 = $row[$c++];
		$c4 = $row[$c++];
		$c5 = $row[$c++];
		$c6 = $row[$c++];
		$c7 = $row[$c++];
		$c8 = $row[$c++];
		$c9 = $row[$c++];

		$records = array( 'gameName'=>$c1, 'images'=>$c2 , 'platform'=>$c3
		, 'gamePrice'=>$c4 , 'until'=>$c5 , 'purchasePrize'=>$c6 , 'gameType'=>$c7, 'UserRegistered'=>$c8
		, 'TotalRounds'=>$c9);

		$this->conn->close();

		return array( 'success'=>true, 'message'=>'Found the record.', 'data'=> $records);
	}

	/**
	 *
	 * @return multitype:boolean string
	 */
	function create() {
		$data = $this->data;

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

		if( $this->conn->query($query) ) {
			$msg = "success";
		} else {
			$msg = $this->conn->error . $query;
		}

		$this->conn->close();

		return $output = array( 'success'=>true, 'message'=>'Record has been updated.');
	}
	
	/**
	 *
	 * @return multitype:boolean string
	 */
	function update() {
		$data = $this->data;
	
		$gameId = $data->gameId;
		$images = $data->images;
		$gameName = $data->gameName;
		$platform = $data->platform;
		$gamePrice = $data->gamePrice;
		$until = $data->until;
		$purchasePrize = $data->purchasePrize;
		$gameType = $data->gameType;
		$UserRegistered = $data->UserRegistered;
		$TotalRounds = $data->TotalRounds;
	
		$query = "UPDATE ImagesTable SET 
		images = '$images', gameName = '$gameName',platform = '$platform',gamePrice = '$gamePrice',until = '$until',
		purchasePrize = '$purchasePrize',gameType = '$gameType',UserRegistered = '$UserRegistered',TotalRounds = '$TotalRounds'
		WHERE imgId=$gameId";
	
		if( $this->conn->query($query) ) {
			$msg = "success";
		} else {
			$msg = $this->conn->error . $query;
		}
	
		$this->conn->close();
	
		return $output = array( 'success'=>true, 'message'=>'Record has been updated.');
	}
	
	function getStats() {
// 		, gameName, images,platform,
// 		gamePrice,until,purchasePrize,gameType,UserRegistered,TotalRounds
		$rs = $this->conn->query("SELECT platform , count(platform)
				FROM ImagesTable GROUP BY platform");
		
		if( !isset($rs) ) {
			throw new Exception('Technical issue#1');
		}

		if (!($rs instanceof mysqli_result)) {
			throw new Exception('Technical issue#2');
		}

		$names = array();
		$counts = array();

		while($row = mysqli_fetch_row ( $rs )) {
			$c0 = $row[0];
			$c1 = $row[1];

			$names[] = $c0;
			$counts[] = $c1;
		//array_push( $names, array( 'name'=>$c0,'count'=>$c1) );
		}

		$records = array('names'=>$names,'counts'=>$counts);
		
		$this->conn->close();

		return array( 'success'=>true, 'message'=>'Found the record.', 'data'=> $records);
	}
	
}