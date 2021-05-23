<?php
include 'conn.php';
$kode_obat=$_POST['kode_obat'];
$connect->query("DELETE FROM obat WHERE kode_obat=".$kode_obat);

?>