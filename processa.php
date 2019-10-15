<?php
date_default_timezone_set('America/Sao_Paulo');
include("conexao.php");

require 'vendor/autoload.php';

use  PhpOffice\PhpSpreadsheet\Spreadsheet; //classe responsável pela manipulação da planilha

function readData($arquivo){
	include("conexao.php");
	$reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader("Xlsx");
	$spreadsheet = $reader->load($arquivo);
	$worksheet = $spreadsheet->getActiveSheet();
	$highestRow = $worksheet->getHighestRow(); // e.g. 10
//	$highestColumn = $worksheet->getHighestColumn(); // e.g 'F'
//	$highestColumnIndex = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::columnIndexFromString($highestColumn); // e.g. 5
	echo '<table  border="1" cellpadding="8" style="margin-left:100px;">' . "\n";
	for ($row = 4; $row <= $highestRow; ++$row) {
    	echo '<tr>' . PHP_EOL; 
       	$value = $worksheet->getCellByColumnAndRow(1, $row)->getValue();
        echo '<td>' . $value . '</td>' . PHP_EOL;
        $value = $worksheet->getCellByColumnAndRow(2, $row)->getValue();
        echo '<td>' . $value . '</td>' . PHP_EOL;
        $value = $worksheet->getCellByColumnAndRow(11, $row)->getValue();
        echo '<td>' . $value . '</td>' . PHP_EOL;
        $value = $worksheet->getCellByColumnAndRow(12, $row)->getValue();
        echo '<td>' . $value . '</td>' . PHP_EOL;
        $value = $worksheet->getCellByColumnAndRow(13, $row)->getValue();
        echo '<td>' . $value . '</td>' . PHP_EOL;
    	$value = $worksheet->getCellByColumnAndRow(15, $row)->getValue();
        echo '<td>' . $value . '</td>' . PHP_EOL;
    	echo '</tr>' . PHP_EOL;
	}
	echo '</table>' . PHP_EOL;
/*$highestRow*/
	for ($row = 4; $row <= $highestRow; ++$row) {

		$id_nome = "null";
		$cnpj = "null";
		$conv_cota_aplic = "null";
		$conv_cota_aplic_util =  "null";
		$conv_cota_aplic_desc = "null";
		$conv_cota_resg = "null";
		$conv_cota_resg_util = "null";
		$conv_cota_resg_desc = "null";
		$objetivo = "null";
		$politica_invest = "null";
    	 
       	try{
       		$at_nome = $worksheet->getCellByColumnAndRow(1, $row)->getValue();
        }catch(Exception $erro){
			echo 'Erro: ' . $erro->getMessage();
		}    
		if($at_nome == null || $at_nome == ""){
			break;
		}else{
			$at_nome = '"'.$at_nome.'"';
		}   

		try{
       		$at_cnpj = $worksheet->getCellByColumnAndRow(2, $row)->getValue();
        }catch(Exception $erro){
			echo 'Erro: ' . $erro->getMessage();
		}
		if($at_cnpj == null || $at_cnpj == ""){
			$at_cnpj = "null";
		}else{
			$at_cnpj = '"'.$at_cnpj.'"';
		}

		try{
       		$conv_cota_aplic = $worksheet->getCellByColumnAndRow(11, $row)->getValue();
        }catch(Exception $erro){
			echo 'Erro: ' . $erro->getMessage();
		}
		if($conv_cota_aplic ==""){
			$conv_cota_aplic = "null";
		}else if($conv_cota_aplic == "Não se aplica" || $conv_cota_aplic == "Não informado"){
			$conv_cota_aplic_desc = '"'.$conv_cota_aplic.'"';
			$conv_cota_aplic = "null";
		}else{
			$aux = explode(" ",$conv_cota_aplic);
			$aux2 = (string)$aux[0];
			$aux2 = explode("+",$aux2);
			$aux3 = (int)($aux2[1]);
			$conv_cota_aplic = $aux3;
			if(count($aux)>1){
				if($aux[1] == "du"){
					$conv_cota_aplic_util = "true";
				}else{
					$conv_cota_aplic_util = "null";
				}
			}
			
		}        

		try{
       		$conv_cota_resg = $worksheet->getCellByColumnAndRow(12, $row)->getValue();
        }catch(Exception $erro){
			echo 'Erro: ' . $erro->getMessage();
		}

		if($conv_cota_resg ==""){
			$conv_cota_resg = "null";
		}else if($conv_cota_resg == "Não se aplica" || $conv_cota_resg == "Não informado"){
			$conv_cota_resg_desc = '"'.$conv_cota_resg.'"';
			$conv_cota_resg = "null";
		}else{
			$aux = explode(" ",$conv_cota_resg);
			if(count($aux)<3){
				$aux2 = (string)$aux[0];
				$aux2 = explode("+",$aux2);
				$aux3 = (int)($aux2[1]);
				$conv_cota_resg = $aux3;
				if(count($aux)>1){
					if($aux[1] == "du")
					{
						$conv_cota_resg_util = "true";
					}else{
						$conv_cota_resg_util = "null";
					}
				}
			}else{
				$conv_cota_resg_desc = '"Verificar Regulamento"';
				$conv_cota_resg = "null";
			}	
		}        


		try{
       		$objetivo = $worksheet->getCellByColumnAndRow(13, $row)->getValue();
        }catch(Exception $erro){
			echo 'Erro: ' . $erro->getMessage();
		}
		if($objetivo==null || $objetivo==""){
			$objetivo = "null";
		}else{
			$objetivo  = '"'.$objetivo.'"';
		}       

		try{
       		$politica_invest = $worksheet->getCellByColumnAndRow(15, $row)->getValue();
        }catch(Exception $erro){
			echo 'Erro: ' . $erro->getMessage();
		}      
		if($politica_invest==null || $politica_invest==""){
			$politica_invest = "null";
		}else{
			$politica_invest = '"'.$politica_invest.'"';
		}       
		 
		
		try{
			$sql = 'INSERT INTO at_nome(nome,data_cad)VALUES('.$at_nome.',now());';
			$stm = $conexao->prepare($sql);
			$retorno = $stm->execute();			
		}catch(Exception $erro){
			echo 'Erro: ' . $erro->getMessage();
		}
		$sql =null;
		$stm = null;
		$retorno = null;
		
		try{
			$sql = 'SELECT id FROM at_nome WHERE nome = '.$at_nome.';';
			$stm = $conexao->prepare($sql);
			$retorno = $stm->execute();	
			$resultado = $stm->fetchAll(PDO::FETCH_NUM);		
		}catch(Exception $erro){
			echo 'Erro: ' . $erro->getMessage();
		}

		if(count($resultado)==1){
			$id_nome = (int)$resultado[0][0];
		}
		$sql =null;
		$stm = null;
		$retorno = null;

		try{
			$sql = 'INSERT INTO ativo(data_cad,cnpj,conv_cota_aplic,conv_cota_aplic_util,conv_cota_aplic_desc,conv_cota_resg,conv_cota_resg_util,conv_cota_resg_desc,objetivo,politica_invest) VALUES(now(),'.$at_cnpj.','.$conv_cota_aplic.','.$conv_cota_aplic_util.','.$conv_cota_aplic_desc.','.$conv_cota_resg.','.$conv_cota_resg_util.','.$conv_cota_resg_desc.','.$objetivo.','.$politica_invest.');';
			$stm = $conexao->prepare($sql);
			$retorno = $stm->execute();	
		}catch(Exception $erro){
			echo 'Erro: ' . $erro->getMessage();
		}

		$sql =null;
		$stm = null;
		$retorno = null;
		
		try{
			$sql = 'SELECT id FROM ativo ORDER BY id DESC limit 1;';
			$stm = $conexao->prepare($sql);
			$retorno = $stm->execute();	
			$resultado = $stm->fetchAll(PDO::FETCH_NUM);		
		}catch(Exception $erro){
			echo 'Erro: ' . $erro->getMessage();
		}

		if(count($resultado)==1){
			$id_ativo = (int)$resultado[0][0];
		}
		$sql =null;
		$stm = null;
		$retorno = null;

		try{
			$sql = 'INSERT INTO at_hist_nome(data_ini,ativo_id,at_nome_id) VALUES(now(),'.$id_ativo.','.$id_nome.');';
			$stm = $conexao->prepare($sql);
			$retorno = $stm->execute();	
		}catch(Exception $erro){
			echo 'Erro: ' . $erro->getMessage();
		}

		$sql =null;
		$stm = null;
		$retorno = null;
	}	
}

$dados = $_FILES['arquivo'];

//var_dump($dados);


$route = $_FILES['arquivo']['tmp_name'];
readData($route);
//$route = 'spreadsheet1.xlsx';
if(!empty($route)){


}else{
    echo null;
}

/*
try{
		
	echo("teste");
//	$sql = 'INSERT INTO limite_mod_enq (descricao)VALUES("Limite Resolução Máximo")';
	$stm = $conexao->prepare($sql);
	$retorno = $stm->execute();			
}catch(Exception $erro){
	echo 'Erro: ' . $erro->getMessage();
}
 */

?>
