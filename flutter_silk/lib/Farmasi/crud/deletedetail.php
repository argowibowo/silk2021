<?php
include 'conn.php';
$id_detil_resep = $_POST['id_detil_resep'];
$connect->query("DELETE FROM detil_resep WHERE id_detil_resep=".$id_detil_resep);

?>