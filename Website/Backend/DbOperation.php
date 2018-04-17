<<<<<<< HEAD
<?php
/**
 * Created by Wojciech Tyziniec
 * User: wtznc
 * Date: 21/02/18
 * Time: 10:13 PM
 */

class DbOperation{
	private $conn;
	//Constructor
	function __construct(){
		require_once dirname(__FILE__) . '/Constants.php';
		require_once dirname(__FILE__). '/DbConnect.php';

		//Opening new db connection
		$db = new DbConnect();
		$this->conn = $db->connect();
	}

	public function createUser($username, $pass, $email){
		if(!$this ->doesUserExist($username, $email)){
			$password = md5($pass);
			$stmt = $this ->conn->prepare("INSERT INTO users (username, password, email) VALUES (?, ?, ?)");
			$stmt->bind_param("sss", $username, $password, $email);
			if($stmt -> execute()){
				return USER_CREATED;
			} else {
				return USER_NOT_CREATED;
			}
		} else {
			return USER_ALREADY_EXIST;
		}
	}

	private function doesUserExist($username, $email){
		$stmt = $this->conn->prepare("SELECT id FROM users WHERE username = ? OR email = ?");
		$stmt->bind_param("ss", $username, $email);
		$stmt->execute();
		$stmt->store_result();
		return $stmt->num_rows > 0;
	}

	public function login($username, $pass){
		$password = md5($pass);
		$stmt = $this->conn->prepare("SELECT id FROM users WHERE username = ? AND password = ?");
		$stmt->bind_param("ss", $username, $password);
		$stmt->execute();
		$stmt->store_result();
		if($stmt->num_rows > 0){
			return LOGIN_SUCCESSFUL;
		} else {
			return LOGIN_UNSUCCESSFUL;
		}
	}
}


=======
<?php
/**
 * Created by Wojciech Tyziniec
 * User: wtznc
 * Date: 21/02/18
 * Time: 10:13 PM
 */

class DbOperation{
	private $conn;
	//Constructor
	function __construct(){
		require_once dirname(__FILE__) . '/Constants.php';
		require_once dirname(__FILE__). '/DbConnect.php';

		//Opening new db connection
		$db = new DbConnect();
		$this->conn = $db->connect();
	}

	public function createUser($username, $pass, $email){
		if(!$this ->doesUserExist($username, $email)){
			$password = md5($pass);
			$stmt = $this ->conn->prepare("INSERT INTO users (username, password, email) VALUES (?, ?, ?)");
			$stmt->bind_param("sss", $username, $password, $email);
			if($stmt -> execute()){
				return USER_CREATED;
			} else {
				return USER_NOT_CREATED;
			}
		} else {
			return USER_ALREADY_EXIST;
		}
	}

	private function doesUserExist($username, $email){
		$stmt = $this->conn->prepare("SELECT id FROM users WHERE username = ? OR email = ?");
		$stmt->bind_param("ss", $username, $email);
		$stmt->execute();
		$stmt->store_result();
		return $stmt->num_rows > 0;
	}

	public function login($username, $pass){
		$password = md5($pass);
		$stmt = $this->conn->prepare("SELECT id FROM users WHERE username = ? AND password = ?");
		$stmt->bind_param("ss", $username, $password);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($colID);
		$stmt->fetch();
		if($stmt->num_rows > 0){
			//echo $colID;
			//return LOGIN_SUCCESSFUL;
			return array(LOGIN_SUCCESSFUL, $colID);
		} else {
			return LOGIN_UNSUCCESSFUL;
		}
	}

	public function addNewProduct($id_owner, $name, $quantity, $type, $source, $target, $date_processed){
		$stmt = $this->conn->prepare("INSERT INTO products (id_owner, name, quantity, type, source, target, date_processed) VALUES (?, ?, ?, ?, ?, ?, ?)");
		$stmt->bind_param("sssssss", $id_owner, $name, $quantity, $type, $source, $target, $date_processed);
		if($stmt -> execute()){
			$stmt->store_result();
			$last_id = $stmt->insert_id;
			return array(PRODUCT_ADDED, $last_id);
		} else {
			return PRODUCT_NOT_ADDED;
		}
	}
}


>>>>>>> b983218504a404fd35dde66b2b7ee18471d1ce5d
?>