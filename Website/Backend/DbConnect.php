<?php
/**
 * Created by Wojciech Tyziniec
 * User: wtznc
 * Date: 21/02/18
 * Time: 9:25 PM
 */

class DbConnect{
	private $conn;
	function __construct(){}
	/**
	 * Establishing database connection
	 * @return database connection handler
	 */
	function connect(){
		require_once 'Constants.php';

		// Connecting to MySQL database
		$this->conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);

		// Check for database connection error
		if(mysqli_connect_errno()){
			echo "Failed to connect to MySQL: ".mysqli_connect_error();
		}

		return $this->conn;
	}
}



?>