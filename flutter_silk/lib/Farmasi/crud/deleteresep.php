<?php
include 'conn.php';
$id_resep=$_POST['id_resep'];
$connect->query("DELETE FROM resep WHERE id_resep=".$id_resep);

?>