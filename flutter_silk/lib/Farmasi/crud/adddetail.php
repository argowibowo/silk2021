<?php

include 'conn.php';

$id_resep = $_POST['id_resep'];
$kode_obat = $_POST['kode_obat'];
$harga = $_POST['harga'];
$jumlah_beli = $_POST['jumlah_beli'];

$connect->query("INSERT INTO detil_resep (id_resep,kode_obat,harga,jumlah_beli) VALUES ('".$id_resep."','".$kode_obat."','".$harga."','".$jumlah_beli."') ")

?>