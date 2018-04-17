<?php
/**
 * Created by Wojciech Tyziniec
 * User: wtznc
 * Date: 04/03/18
 * Time: 23:10 PM
 */

require_once 'DbOperation.php';
$response = array();

if($_SERVER['REQUEST_METHOD'] = 'POST'){
	if(!verifyRequiredParams(array('username', 'password'))){
		$username = $_POST['username'];
		$password = $_POST['password'];

		$db = new DbOperation();
		$result = $db->login($username, $password);
		if($result == LOGIN_SUCCESSFUL){
			$response['error'] = false;
			$response['message'] = 'Login successful';
		} elseif($result == LOGIN_UNSUCCESSFUL){
			$response['error'] = true;
			$response['message'] = 'Login unsuccessful';
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
		if(!isset($request_params[$field]) || strlen(trim($request_params[$field])) <= 0){
			return true;
		}
	}
	return false;
}

echo json_encode($response);

?>