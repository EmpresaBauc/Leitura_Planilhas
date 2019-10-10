<?php
include("conexao.php");

require 'vendor/autoload.php';

use  PhpOffice\PhpSpreadsheet\Spreadsheet; //classe responsável pela manipulação da planilha

function readData($arquivo){

	$reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader("Xlsx");

	$spreadsheet = $reader->load($arquivo);

	$sheet = $spreadsheet->getActiveSheet();

	//Coluna - Retira o título(2)

	echo '<table border="1" cellpadding="8" style="margin-left:100px;">';
	foreach ($sheet->getRowIterator(1) as $row) {
    	$cellInterator = $row->getCellIterator();
    	$cellInterator->setIterateOnlyExistingCells(false);

	    echo '<tr>';
    	//Linha
    	foreach ($cellInterator as $cell) {
        	if(!is_null($cell)){
            	$value = $cell->getCalculatedValue();
            	echo "<td> $value </td>";
        	}
    	}
    echo '</tr>';
	}
echo "</table>";
}

$dados = $_FILES['arquivo'];

//var_dump($dados);


$route = $_FILES['arquivo']['tmp_name'];
readData($route);
//$route = 'spreadsheet1.xlsx';
if(!empty($route)){


}else{
    echo "null";
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
