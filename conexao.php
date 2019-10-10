<?php
$conexao = new PDO("mysql:host=127.0.0.1;dbname=teste", "root", "",
			  array(
			                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, 
			                PDO::ATTR_PERSISTENT => false,
			                PDO::ATTR_EMULATE_PREPARES => false,
			                PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
			        )
		); 
?>