<?php
/**
 * Created by Wojciech Tyziniec
 * User: wtznc
 * Date: 11/03/18
 * Time: 6:18 PM
 */
include('phpqrcode/qrlib.php');
require_once 'DbOperation.php';
$response = array();

if($_SERVER['REQUEST_METHOD'] == 'POST'){
	if(!verifyRequiredParams(array('id_owner', 'name','quantity','type','source','target','date_processed'))){
		$id_owner = $_POST['id_owner'];
		$name = $_POST['name'];
		$quantity = $_POST['quantity'];
		$type = $_POST['type'];
		$source = $_POST['source'];
		$target = $_POST['target'];
		$date_processed = $_POST['date_processed'];

		$db = new DbOperation();

		// adding new products to db
		$result = $db-> addNewProduct($id_owner, $name, $quantity, $type, $source, $target, $date_processed);
		if($result[0] == PRODUCT_ADDED){
			$response['error'] = false;
			$response['message'] = 'Product added successfully';
			$response['productID'] = $result[1];
			// generate qr code now
			$filename = "qrcodes/".$result[1].".png";
			define('IMAGE_WIDTH',1024);
			define('IMAGE_HEIGHT',1024);
			QRcode::png ($result[1] , $filename, "L", 14,2);


		} elseif($result == PRODUCT_NOT_ADDED){
			$response['error'] = true;
			$response['message'] = 'Product could not be added';
		}
	} else {
		$response['error'] = true;
		$response['message'] = 'Required parameters are missing';
	}
} else {
	$response['error'] = true;
	$response['message'] = 'Invalid request';
}

function verifyRequiredParams($required_fields){
	$request_params = $_REQUEST;
	foreach ($required_fields as $field){
		if(!isset($request_params[$field]) || strlen(trim($request_params[$field])) <= 0) {
			return true;
		}
	}
	return false;
}

echo json_encode($response);


?>